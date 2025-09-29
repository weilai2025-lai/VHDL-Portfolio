library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fmax_test_non_pipe is
  port (
    clk_in     : in  std_logic;
    result_out : out std_logic_vector(31 downto 0)
  );
end entity fmax_test_non_pipe;

architecture rtl of fmax_test_non_pipe is
  component mac_int8 is
    generic(acc_width: integer:=32; sat_en: boolean:=true);
    port(clk, rst_n, en, clr :in std_logic;
         a, b   : in  std_logic_vector(7 downto 0);
         acc_in : in  std_logic_vector(acc_width-1 downto 0);
         acc_out: out std_logic_vector(acc_width-1 downto 0));
  end component;

  -- ★ 這裡是「輸入暫存器」，作為 reg→comb→reg 的起點
  signal a_reg, b_reg : std_logic_vector(7 downto 0) := (others => '0');
  signal accin_reg    : std_logic_vector(31 downto 0) := (others => '0');

  signal accout_wire  : std_logic_vector(31 downto 0);
begin
  -- ★ 用時鐘驅動，避免常量折疊，形成起點暫存器
  process(clk_in)
  begin
    if rising_edge(clk_in) then
      -- 簡單讓它「一直變」，不會被當成常數
      a_reg     <= std_logic_vector(unsigned(a_reg) + 1);
      b_reg     <= std_logic_vector(unsigned(b_reg) + 3);
      -- 把上一拍輸出當成下一拍的 acc_in（經過這個 DFF，避免組合回授）
      accin_reg <= accout_wire;
    end if;
  end process;

  UUT: mac_int8
    generic map (acc_width => 32, sat_en => true)
    port map (
      clk     => clk_in,
      rst_n   => '1',
      en      => '1',
      clr     => '0',
      a       => a_reg,          -- ★ 來自輸入暫存器
      b       => b_reg,          -- ★ 來自輸入暫存器
      acc_in  => accin_reg,      -- ★ 來自輸入暫存器
      acc_out => accout_wire
    );

  result_out <= accout_wire;     -- 拉到外面避免被最佳化掉
end architecture;