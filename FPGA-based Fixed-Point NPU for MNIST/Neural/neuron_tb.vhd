library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;
use ieee.std_logic_textio.all;

entity neuron_tb is
end entity;

architecture sim of neuron_tb is
  --------------------------------------------------------------------------
  -- 對齊 Verilog 版本參數
  --------------------------------------------------------------------------
  constant DATA_WIDTH       : integer := 16;
  constant NUM_WEIGHT       : integer := 784;  -- 784 筆像素
  constant SIGMOID_SIZE     : integer := 10;
  constant WEIGHT_INT_WIDTH : integer := 4;

  constant CLK_HALF : time := 5 ns;  -- 100 MHz

  --------------------------------------------------------------------------
  -- DUT 介面訊號
  --------------------------------------------------------------------------
  signal clk               : std_logic := '0';
  signal rst               : std_logic := '1';

  signal myinput           : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal myinputValid      : std_logic := '0';

  -- PRETRAINED 模式下以下皆綁 0（與 Verilog TB 一致）
  signal weightValid       : std_logic := '0';
  signal biasValid         : std_logic := '0';
  signal weightValue       : std_logic_vector(31 downto 0) := (others => '0');
  signal biasValue         : std_logic_vector(31 downto 0) := (others => '0');
  signal config_layer_num  : std_logic_vector(31 downto 0) := (others => '0');
  signal config_neuron_num : std_logic_vector(31 downto 0) := (others => '0');

  signal output_s          : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal outvalid          : std_logic;

  --------------------------------------------------------------------------
  -- 測試資料記憶體：0..783 = 像素，784 = label
  --------------------------------------------------------------------------
  type slv_mem_t is array (0 to NUM_WEIGHT) of std_logic_vector(DATA_WIDTH-1 downto 0);

  --------------------------------------------------------------------------
  -- 工具：把 std_logic_vector 轉成十六進位字串（避免用不到的 to_hstring）
  --------------------------------------------------------------------------
  function slv_to_hstring(slv : std_logic_vector) return string is
    variable L     : natural := slv'length;
    variable N     : natural := (L + 3) / 4;                -- 需要幾個 hex 字元
    variable bits  : std_logic_vector(N*4-1 downto 0);
    variable nib   : std_logic_vector(3 downto 0);
    variable res   : string(1 to N);
    impure function nib2hex(n : std_logic_vector(3 downto 0)) return character is
    begin
      case n is
        when "0000" => return '0';
        when "0001" => return '1';
        when "0010" => return '2';
        when "0011" => return '3';
        when "0100" => return '4';
        when "0101" => return '5';
        when "0110" => return '6';
        when "0111" => return '7';
        when "1000" => return '8';
        when "1001" => return '9';
        when "1010" => return 'A';
        when "1011" => return 'B';
        when "1100" => return 'C';
        when "1101" => return 'D';
        when "1110" => return 'E';
        when "1111" => return 'F';
        when others => return 'X';
      end case;
    end function;
  begin
    bits := (others => '0');
    bits(L-1 downto 0) := slv;                              -- 左邊補 0 到 4 的倍數
    for i in 0 to N-1 loop
      nib := bits((N-1-i)*4+3 downto (N-1-i)*4);
      res(i+1) := nib2hex(nib);
    end loop;
    return res;
  end function;

begin
  --------------------------------------------------------------------------
  -- clock
  --------------------------------------------------------------------------
  clk <= not clk after CLK_HALF;

  --------------------------------------------------------------------------
  -- DUT：VHDL 版 neuron
  -- ★ 路徑維持你修改後的設定，不變更
  --------------------------------------------------------------------------
  dut: entity work.neuron
    generic map(
      layerNo        => 1,
      neuronNo       => 0,
      numWeight      => NUM_WEIGHT,
      dataWidth      => DATA_WIDTH,
      sigmoidSize    => SIGMOID_SIZE,
      weightIntWidth => WEIGHT_INT_WIDTH,
      actType        => "sigmoid",
      biasFile       => "C:/VHDL_training/Neural/b_1_0.mif",
      weightFile     => "C:/VHDL_training/Neural/w_1_0.mif"
    )
    port map(
      clk               => clk,
      rst               => rst,
      myinput           => myinput,
      myinputValid      => myinputValid,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      output            => output_s,
      outvalid          => outvalid
    );

  --------------------------------------------------------------------------
  -- Stimulus：讀檔 → 送 784 筆 → 等 outvalid → 列印結果與標籤
  --------------------------------------------------------------------------
  stim: process
    file fdata                 : text open read_mode is
      "C:/VHDL_training/Neural/test_data/test_data_0000.txt";
    variable L                 : line;
    variable mem               : slv_mem_t; -- 0..784
    variable v                 : std_logic_vector(DATA_WIDTH-1 downto 0);
    variable i                 : integer;
    variable expected_label    : std_logic_vector(DATA_WIDTH-1 downto 0);
  begin
    ------------------------------------------------------------------------
    -- 1) 讀取 785 行（前 784 行像素 + 第 785 行 label），逐行為 16 位元 0/1
    ------------------------------------------------------------------------
    for i in 0 to NUM_WEIGHT loop  -- 0..784
      if endfile(fdata) then
        assert false report "Input file ended before reading 785 lines."
          severity failure;
      end if;
      readline(fdata, L);
      -- 直接用 std_logic_textio.read() 讀 0/1 字串到 16-bit SLV
      read(L, v);
      mem(i) := v;
    end loop;

    expected_label := mem(NUM_WEIGHT);

    ------------------------------------------------------------------------
    -- 2) reset
    ------------------------------------------------------------------------
    rst <= '1';
    myinput      <= (others => '0');
    myinputValid <= '0';
    wait for 5*CLK_HALF*2; -- 5 個 clock 週期
    rst <= '0';
    wait for 2*CLK_HALF*2; -- 再等 2 個 clock 週期

    ------------------------------------------------------------------------
    -- 3) 連續 784 拍送入像素；myinputValid 全程為 '1'
    ------------------------------------------------------------------------
    myinputValid <= '1';
    for i in 0 to NUM_WEIGHT-1 loop          -- 0..783
      myinput <= mem(i);
      wait until rising_edge(clk);
    end loop;
    myinputValid <= '0';
    myinput <= (others => '0');

    ------------------------------------------------------------------------
    -- 4) 等 outvalid，再列印結果與 label，收尾
    ------------------------------------------------------------------------
    wait until outvalid = '1';
    report "NEURON OUT  : " & integer'image(to_integer(signed(output_s)))
      & " (0x" & slv_to_hstring(output_s) & ")";
    report "GT LABEL    : " & integer'image(to_integer(signed(expected_label)))
      & " (0x" & slv_to_hstring(expected_label) & ")";

    wait for 50 ns;
    assert false severity failure;  -- 等效 $finish；若工具不支援可換成 assert false severity failure;
    wait;
  end process;

end architecture;