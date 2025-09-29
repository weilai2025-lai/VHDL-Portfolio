library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mac_int8tb is
end entity mac_int8tb;

architecture simulation of mac_int8tb is
	component mac_int8 is
	generic(acc_width: integer:=32;
		     sat_en: boolean:=false);
	port(clk, rst_n, en, clr :in std_logic;
		  a, b :in std_logic_vector(7 downto 0);
		  acc_in :in std_logic_vector(acc_width-1 downto 0);
		  acc_out :out std_logic_vector(acc_width-1 downto 0));	
	end component;
	--define wire--
	signal clk_tb :std_logic:='0';
	signal clr_tb :std_logic:='0';
	signal rst_n_tb :std_logic;
	signal en_tb :std_logic;
	signal a_tb :std_logic_vector(7 downto 0);
	signal b_tb :std_logic_vector(7 downto 0);
	signal acc_in_tb :std_logic_vector(31 downto 0);
	signal acc_out_tb :std_logic_vector(31 downto 0);
	-- clock constants--
	constant CLK_PERIOD: time:=10ns;	
begin
UUT: mac_int8
	generic map(acc_width => 32, sat_en => false)
	port map(clk => clk_tb, rst_n => rst_n_tb, en => en_tb, 
	         clr => clr_tb, a => a_tb, b => b_tb, acc_in => acc_in_tb, acc_out => acc_out_tb);
--defeine clock
	clk_tb <= not clk_tb after CLK_PERIOD/2;
--process beginning
stimulus_prcoess: process
begin
 report "Simulation Started";
 
 report "1. Reset";
 rst_n_tb <= '0';
 en_tb <= '0';
 a_tb <= (others => '0');
 b_tb <= (others => '0');
 acc_in_tb <= (others => '0');
 wait for CLK_PERIOD * 2;
 rst_n_tb <= '1';
 wait for CLK_PERIOD;
 
  report "2. testing 5 *10";
  en_tb     <= '1';
  acc_in_tb <= (others => '0');
  a_tb      <= std_logic_vector(to_signed(5, 8));
  b_tb      <= std_logic_vector(to_signed(10, 8));
  wait for CLK_PERIOD;
  
  -- Step 3: Test Case 2: Accumulate with (-3) * 7. Expected: 50 + (-21) = 29
  report "Step 3: Accumulating (-3) * 7";
  en_tb     <= '1';
  acc_in_tb <= acc_out_tb; -- Feedback the previous result
  a_tb      <= std_logic_vector(to_signed(-3, 8));
  b_tb      <= std_logic_vector(to_signed(7, 8));
  wait for CLK_PERIOD;

  -- Step 4: Test Case 3: Test enable = '0'. Expected: 29 (no change)
  report "Step 4: Testing enable = '0'";
  en_tb     <= '0';
  acc_in_tb <= acc_out_tb; -- Feedback the previous result (29)
  a_tb      <= std_logic_vector(to_signed(100, 8)); -- This should be ignored
  b_tb      <= std_logic_vector(to_signed(100, 8)); -- This should be ignored
  wait for CLK_PERIOD;
  report "--- Simulation Finished ---";
  wait; -- Will wait forever
end process;
end architecture simulation;