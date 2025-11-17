library IEEE;
use IEEE.std_logic_1164.all;

entity VGA_top_level is
	port(
		clock_50:in std_logic;
		reset_n:in std_logic;
		vga_red, vga_blue, vga_green:out std_logic_vector(9 downto 0);
		horiz_sync, verti_sync, vga_blank, vga_clk:out std_logic
	);
end entity VGA_top_level;

architecture structure of VGA_top_level is
	component pixelGenerator is
		port(
		clk, ROM_clk, rst_n, video_on, eof:in std_logic;
		pixel_row, pixel_column: in std_logic_vector(9 downto 0);
		red_out, blue_out, green_out :out std_logic_vector(9 downto 0)
	);
	end component pixelGenerator;
	
	component vga_sync is
	port(
		clock_50mhz :in std_logic;
		horiz_sync_out, verti_syn_out, video_on, pixel_clock, eof :out std_logic;
		pixel_row, pixel_column :out std_logic_vector(9 downto 0)
	);	
	end component vga_sync;
	signal pixel_row, pixel_column:std_logic_vector(9 downto 0);
	signal video_on, vga_clock_int, eof:std_logic;
begin
--------------------------------
	videoGen:pixelGenerator
	port map(
		clk => clock_50, ROM_clk => vga_clock_int, rst_n => reset_n, video_on => video_on, eof => eof,
		pixel_row => pixel_row, pixel_column => pixel_column,
		red_out => vga_red, blue_out => vga_blue, green_out => vga_green
	);
	
	videoSync:vga_sync
	port map(
		clock_50mhz => clock_50, horiz_sync_out => horiz_sync, verti_syn_out => verti_sync,
		video_on => video_on, pixel_clock => vga_clock_int, eof => eof,
		pixel_row => pixel_row, pixel_column => pixel_column
	);
	
	
	vga_blank <= video_on;
	vga_clk <= vga_clock_int;
end architecture structure;