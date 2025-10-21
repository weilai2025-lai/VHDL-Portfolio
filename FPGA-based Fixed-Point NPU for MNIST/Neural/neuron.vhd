library IEEE;
library STD;
use STD.textio.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use work.nn_config.all;

entity neuron is
  generic(
    layerNo        : integer := 0;
    neuronNo       : integer := 0;
    numWeight      : integer := 784;
    dataWidth      : integer := 16;
    sigmoidSize    : integer := 5;
    weightIntWidth : integer := 1;
    actType        : string  := "sigmoid";
    biasFile       : string  := "b_1_0.mif";
    weightFile     : string  := "w_1_0.mif"
  );
  port(
    clk               : in  std_logic;
    rst               : in  std_logic;
    -- I/O 一律 slv，內部需要再轉型
    myinput           : in  std_logic_vector(dataWidth-1 downto 0);
    myinputValid      : in  std_logic;
    weightValid       : in  std_logic;
    biasValid         : in  std_logic;
    weightValue       : in  std_logic_vector(31 downto 0);
    biasValue         : in  std_logic_vector(31 downto 0);
    config_layer_num  : in  std_logic_vector(31 downto 0);
    config_neuron_num : in  std_logic_vector(31 downto 0);
    output            : out std_logic_vector(dataWidth-1 downto 0);
    outvalid          : out std_logic
  );
end entity neuron;

architecture rtl of neuron is
  -- 讀取 bias 用
  subtype s32 is signed(31 downto 0);
  impure function read_bias(file_name : string) return s32 is
    file f       : text open read_mode is file_name;
    variable l   : line;
    variable slv : std_logic_vector(31 downto 0);
    variable res : s32 := (others => '0');
  begin
    if not endfile(f) then
      readline(f, l);
      read(l, slv);
      res := signed(slv);
    end if;
    return res;
  end function;

  -- ceil(log2(n))
  function clog2(n : positive) return natural is
    variable v : natural := n - 1;
    variable r : natural := 0;
  begin
    while v > 0 loop
      v := v / 2;
      r := r + 1;
    end loop;
    return r;
  end function;

  -- 內部訊號
  constant addressWidth : integer := clog2(numWeight);

  signal wen    : std_logic;
  signal ren    : std_logic;
  signal w_addr : unsigned(addressWidth-1 downto 0);
  signal r_addr : unsigned(addressWidth downto 0);

  signal w_in   : signed(dataWidth-1 downto 0);
  signal w_out  : signed(dataWidth-1 downto 0);
  signal mul    : signed(2*dataWidth-1 downto 0);
  signal sum    : signed(2*dataWidth-1 downto 0);
  signal bias   : signed(2*dataWidth-1 downto 0);

  signal weight_valid : std_logic;
  signal mult_valid   : std_logic;
  signal mux_valid    : std_logic;
  signal muxValid_d   : std_logic;
  signal muxValid_f   : std_logic;

  signal myinputd     : signed(dataWidth-1 downto 0);

  signal comboAdd : signed(2*dataWidth downto 0);
  signal BiasAdd  : signed(2*dataWidth downto 0);

  -- 記憶體介面
  signal wadd_slv : std_logic_vector(addressWidth-1 downto 0);
  signal radd_slv : std_logic_vector(addressWidth-1 downto 0);
  signal win_slv  : std_logic_vector(dataWidth-1 downto 0);
  signal wout_slv : std_logic_vector(dataWidth-1 downto 0);

  -- 啟動函數
  signal sig_x        : std_logic_vector(sigmoidSize-1 downto 0);
  signal act_out_slv  : std_logic_vector(dataWidth-1 downto 0);
  signal act_out      : signed(dataWidth-1 downto 0);

  -- 有效旗標（照你要的寫法：sigValid 先，outvalid_i 延一拍）
  signal sigValid     : std_logic;
  signal outvalid_i   : std_logic;

begin
  ---------------- Bias loading ----------------
  PRETRAINED_BIOS_MODE : if PRETRAINED = true generate
    constant bias_init : signed(31 downto 0) := read_bias(biasFile);
  begin
    process(clk)
    begin
      if rising_edge(clk) then
        bias <= (resize(bias_init(dataWidth-1 downto 0), 2*dataWidth) sll dataWidth);
      end if;
    end process;
  end generate;

  NON_PRETRAINED_BIAS_MODE : if PRETRAINED = false generate
  begin
    process(clk)
    begin
      if rising_edge(clk) then
        if (biasValid = '1')
           and (unsigned(config_layer_num)  = to_unsigned(layerNo, 32))
           and (unsigned(config_neuron_num) = to_unsigned(neuronNo, 32)) then
			  bias <= (resize(signed(biasValue(dataWidth-1 downto 0)), 2*dataWidth) sll dataWidth);
--                       先切片 ↓↓↓↓↓↓↓↓↓↓↓↓   再 signed(...)
        end if;
      end if;
    end process;
  end generate;

  --------------- 權重寫入 ---------------
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        w_addr <= (others => '1');
        wen    <= '0';
      elsif (weightValid = '1')
            and (unsigned(config_layer_num)  = to_unsigned(layerNo, 32))
            and (unsigned(config_neuron_num) = to_unsigned(neuronNo, 32)) then
        w_in   <= resize(signed(weightValue), dataWidth);
        w_addr <= w_addr + 1;
        wen    <= '1';
      else
        wen    <= '0';
      end if;
    end if;
  end process;

  --------------- 讀位址遞增 ---------------
  ren <= myinputValid;
  process(clk)
  begin
    if rising_edge(clk) then
      if (rst = '1') or (outvalid_i = '1') then     -- ★ 用 outvalid_i 清，與 Verilog 等效
        r_addr <= (others => '0');
      elsif (myinputValid = '1') then
        r_addr <= r_addr + 1;
      end if;
    end if;
  end process;

  --------------- 計算路徑 ---------------
  mux_valid <= mult_valid;
  comboAdd  <= resize(mul,  comboAdd'length) + resize(sum,  comboAdd'length);
  BiasAdd   <= resize(bias, BiasAdd'length)  + resize(sum,  BiasAdd'length);

  -- 乘法
  process(clk)
  begin
    if rising_edge(clk) then
      mul <= myinputd * w_out;
    end if;
  end process;

  -- 輸入與 valid 管線（★ 恢復你要的寫法：sigValid 先、outvalid_i <= sigValid）
  process(clk)
  begin
    if rising_edge(clk) then
      myinputd     <= signed(myinput);--第二拍才能使用輸入的值,對齊權重的值(第一拍的時候r_addr為0, 同時第二拍開始的時候r_addr已經從0變成1)
		--若在第四拍的時候我不輸入資料的時候myinput = myinputValid = 0
		--, 那麼mult_valid在第五拍不久後會從1變成0, 也就是說muxValid_d<= mux_valid裡面的mux_valid在第六拍的時候會變成0(但muxValid_d在第六拍的時候仍為1)
		--也就是說在第六拍的時候(not mux_valid) and muxValid_d會成立, 第七拍的時候會開始把bias加進來,第七拍結束的時候已經把bias加到sum裡面了,同時第八拍結束的時候
		--outvalid_i也變成了1, 第九拍結束的時候sum & r_addr都被重置.
      -- valid 管線：myinputValid -> weight_valid -> mult_valid
      weight_valid <= myinputValid;
      mult_valid   <= weight_valid;

      muxValid_d   <= mux_valid;
      muxValid_f   <= (not mux_valid) and muxValid_d;

      if (r_addr = to_unsigned(numWeight, r_addr'length)) and (muxValid_f = '1') then
        sigValid   <= '1';
      else
        sigValid   <= '0';
      end if;
      outvalid_i <= sigValid;  -- ★ 一拍延遲（等效 Verilog 的 non-blocking）
    end if;
  end process;

  -- 飽和與加總
  process(clk)
    variable pos_sat : signed(sum'range);
    variable neg_sat : signed(sum'range);
  begin
    if rising_edge(clk) then
      pos_sat := (others => '1'); pos_sat(pos_sat'high) := '0';
      neg_sat := (others => '0'); neg_sat(neg_sat'high) := '1';

      if (rst = '1') or (outvalid_i = '1') then       -- ★ 用 outvalid_i 清，與 Verilog 等效
        sum <= (others => '0');

      elsif (r_addr = to_unsigned(numWeight, r_addr'length)) and (muxValid_f = '1') then
        if (bias(bias'high) = '0') and (sum(sum'high) = '0') and (BiasAdd(BiasAdd'high) = '1') then
          sum <= pos_sat;
        elsif (bias(bias'high) = '1') and (sum(sum'high) = '1') and (BiasAdd(BiasAdd'high) = '0') then
          sum <= neg_sat;
        else
          sum <= resize(BiasAdd, sum'length);
        end if;

      elsif (mux_valid = '1') then
        if (mul(mul'high) = '0') and (sum(sum'high) = '0') and (comboAdd(comboAdd'high) = '1') then
          sum <= pos_sat;
        elsif (mul(mul'high) = '1') and (sum(sum'high) = '1') and (comboAdd(comboAdd'high) = '0') then
          sum <= neg_sat;
        else
          sum <= resize(comboAdd, sum'length);
        end if;
      end if;
    end if;
  end process;

  -------- 記憶體 --------
  WM : entity work.Weight_Memory
    generic map (
      layerNo      => layerNo,
      neuronNo     => neuronNo,
      numWeight    => numWeight,
      dataWidth    => dataWidth,
      weightFile   => weightFile,
      addressWidth => addressWidth
    )
    port map (
      clk  => clk,
      wen  => wen,
      ren  => ren,
      wadd => wadd_slv,
      radd => radd_slv,
      win  => win_slv,
      wout => wout_slv
    );

  -- 對外 outvalid（等於 Verilog 的 outvalid）
  outvalid <= outvalid_i;

  -------- 啟動函數 --------
  SIGMOID_GEN : if actType = "sigmoid" generate
  begin
    SROM : entity work.Sig_ROM
      generic map(
        inWidth      => sigmoidSize,
        dataWidth    => dataWidth,
        sigmoid_file => "sigContent.mif"
      )
      port map(
        clk    => clk,
        x      => sig_x,
        output => act_out_slv
      );
    act_out <= signed(act_out_slv);
  end generate;

  RELU_GEN : if actType /= "sigmoid" generate
  begin
    RELU_I : entity work.ReLU
      generic map(
        dataWidth      => dataWidth,
        weightIntWidth => weightIntWidth
      )
      port map(
        clk    => clk,
        x      => sum,
        output => act_out
      );
  end generate;

  -- 介面型別轉接
  wadd_slv <= std_logic_vector(w_addr);
  radd_slv <= std_logic_vector(r_addr(addressWidth-1 downto 0));
  win_slv  <= std_logic_vector(w_in);
  w_out    <= signed(wout_slv);

  -- sum[2*dataWidth-1 -: sigmoidSize]
  sig_x   <= std_logic_vector(sum(sum'high downto sum'high - sigmoidSize + 1));

  -- 最終輸出以 slv 對外
  output  <= std_logic_vector(act_out);

end architecture rtl;