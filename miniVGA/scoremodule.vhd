library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity scoremodule is
	port(
		clk, rst_n:in std_logic;
		collision_state_top, collision_state_bottom:in std_logic;
		led_top, led_bottom:out std_logic_vector(6 downto 0);
		freeze:out std_logic
	);
end entity scoremodule;

architecture structure of scoremodule is
	signal score_top, score_bottom:std_logic_vector(3 downto 0);
	signal freeze_top, freeze_bottom:std_logic;
begin
---------------------------------------------
	uscore_t:entity work.score_toptank
	port map(
		clk => clk,
		rst_n => rst_n,
		collision_state_top => collision_state_top,
		score => score_top,
		freeze => freeze_top
	);
	
	uscore_b:entity work.score_bottomtank
	port map(
		clk => clk,
		rst_n => rst_n,
		collision_state_bottom => collision_state_bottom,
		score => score_bottom,
		freeze => freeze_bottom
	);
---------------------------------------------
	uled_t:entity work.leddcd
	port map(
		data_in => score_top,
		segments_out => led_top
	);
	
	uled_b:entity work.leddcd
	port map(
		data_in => score_bottom,
		segments_out => led_bottom
	);
---------------------------------------------
	freeze <= freeze_top or freeze_bottom;
end structure;

