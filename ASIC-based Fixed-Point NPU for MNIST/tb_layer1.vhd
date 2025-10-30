-- tb_layer1.vhd
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity tb_layer1 is
end entity;

architecture sim of tb_layer1 is
  -- 依你的 nn_config 預設
  constant NN            : integer := 30;
  constant numWeight     : integer := 784;
  constant dataWidth     : integer := 16;
  constant layerNum      : integer := 1;
  constant sigmoidSize   : integer := 10;  
  constant weightIntWidth: integer := 4;

  -- === 你的測試資料（已確認可用的路徑，不動）===
  constant TEST_FILE : string := "C:/VHDL_training/Neural/test_data/test_data_0000.txt";

  signal clk               : std_logic := '0';
  signal rst               : std_logic := '1';

  -- PRETRAINED 模式仍需連線但不會用到
  signal weightValid       : std_logic := '0';
  signal biasValid         : std_logic := '0';
  signal weightValue       : std_logic_vector(31 downto 0) := (others => '0');
  signal biasValue         : std_logic_vector(31 downto 0) := (others => '0');
  signal config_layer_num  : std_logic_vector(31 downto 0) := (others => '0');
  signal config_neuron_num : std_logic_vector(31 downto 0) := (others => '0');

  signal x_valid           : std_logic := '0';
  signal x_in              : std_logic_vector(dataWidth-1 downto 0) := (others => '0');

  signal o_valid           : std_logic_vector(NN-1 downto 0);
  signal x_out             : std_logic_vector(NN*dataWidth-1 downto 0);

  -- 等待所有 neuron 同拍有效
  signal all_valid         : std_logic;

  -- 小工具：SLV 轉 hex（避免相依 to_hstring）
  function slv_to_hstring(slv : std_logic_vector) return string is
    variable L     : natural := slv'length;
    variable N     : natural := (L + 3) / 4;
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
    bits(L-1 downto 0) := slv;
    for i in 0 to N-1 loop
      nib := bits((N-1-i)*4+3 downto (N-1-i)*4);
      res(i+1) := nib2hex(nib);
    end loop;
    return res;
  end function;

begin
  -- Clock 10ns
  clk <= not clk after 5 ns;

  -- 所有 neuron 的 o_valid 同拍都為 '1' 時，拉高一拍
  all_valid <= '1' when o_valid = (o_valid'range => '1') else '0';

  -- DUT
  dut: entity work.Layer_1
    generic map (
      NN             => NN,
      numWeight      => numWeight,
      dataWidth      => dataWidth,
      layerNum       => layerNum,
      sigmoidSize    => sigmoidSize,
      weightIntWidth => weightIntWidth,
      actType        => "sigmoid"
    )
    port map (
      clk               => clk,
      rst               => rst,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      x_valid           => x_valid,
      x_in              => x_in,
      o_valid           => o_valid,
      x_out             => x_out
    );

  -- reset
  p_reset: process
  begin
    rst <= '1';
    wait for 100 ns;
    rst <= '0';
    wait;
  end process;

  -- 餵測資（逐行讀 784 筆；忽略最後一行 label）
  p_stim: process
    file f      : text open read_mode is TEST_FILE;
    variable l  : line;
    variable din: std_logic_vector(dataWidth-1 downto 0);
    variable i  : integer := 0;
    variable tmp: std_logic_vector(dataWidth-1 downto 0);
  begin
    -- 等 reset 解除
    wait until rst = '0';
    wait for 20 ns;

    -- 可選：告訴 DUT 我們是在第 1 層（即使 PRETRAINED 不用）
    config_layer_num  <= std_logic_vector(to_unsigned(layerNum, 32));
    config_neuron_num <= (others => '0');

    -- 送 784 筆
    for i in 0 to numWeight-1 loop
      if endfile(f) then
        assert false report "Input file ended before 784 lines." severity failure;
      end if;
      readline(f, l);
      read(l, din);                   -- 一行是一個 16-bit 二進位字串
      x_in    <= din;
      x_valid <= '1';
      wait until rising_edge(clk);
    end loop;

    -- 停止送資料
    x_valid <= '0';
    x_in    <= (others => '0');

    -- 等所有 neuron 的 o_valid 同拍拉高（同拍抓值）
    wait until rising_edge(clk) and all_valid = '1';

    -- 列印 30 顆 neuron 的輸出（signed 與 hex）
    for i in 0 to NN-1 loop
      tmp := x_out((i+1)*dataWidth-1 downto i*dataWidth);
      report "n_" & integer'image(i) &
             " out = " & integer'image(to_integer(signed(tmp))) &
             " (0x" & slv_to_hstring(tmp) & ")";
    end loop;

    -- 多等一下收尾
    wait for 100 ns;
    assert false report "TB finished." severity note;
    wait;
  end process;

end architecture;