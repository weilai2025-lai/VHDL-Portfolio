LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keyboard_top is
	port(
			keyboard_clk, keyboard_data, clock_50MHz , reset : in std_logic;--, read : in std_logic;
			--output signal--
			speed_sel_top:out std_logic_vector(1 downto 0);
			speed_sel_bottom:out std_logic_vector(1 downto 0);
			fire_pulse_top:out std_logic;
			fire_pulse_bottom:out std_logic		
		);
end entity keyboard_top;


architecture structure of keyboard_top is
	signal scan_code: std_logic_vector(7 downto 0);
	signal scan_ready: std_logic; 
	
begin
-------------------------------------------------
	Ukeycontrol: entity work.keyboard_ctrl
	port map(
		clk => clock_50MHz,
		rst_n => reset,
		scan_code => scan_code,
		scan_ready => scan_ready,
		speed_sel_top => speed_sel_top,
		speed_sel_bottom => speed_sel_bottom,
		fire_pulse_top => fire_pulse_top,
		fire_pulse_bottom => fire_pulse_bottom
	);
-------------------------------------------------
	uPS2: entity work.ps2
	port map(
		keyboard_clk => keyboard_clk,
		keyboard_data => keyboard_data,
		clock_50MHz => clock_50MHz,
		reset => reset,
		scan_code => scan_code,
		scan_readyo => scan_ready,
		hist3          => open,   
		hist2          => open,
		hist1          => open,
		hist0          => open
	);

end architecture structure;