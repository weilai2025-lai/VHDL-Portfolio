library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity vga_sync is
	port(
		clock_50mhz :in std_logic;
		horiz_sync_out, verti_syn_out, video_on, pixel_clock, eof :out std_logic;
		pixel_row, pixel_column :out std_logic_vector(9 downto 0)
	);

end entity vga_sync;

architecture behavior of vga_sync is
--------------------------------------------------------------------
	signal horiz_sync, verti_sync :std_logic:='1';
	signal pixel_clock_int:std_logic:='0';
	signal video_on_v, video_on_h :std_logic:='0';
	signal h_count, v_count :unsigned(9 downto 0):=(others => '0');
--------------------------------------------------------------------
	constant h_pixel_visible :natural:=640;
	constant h_sync_low :natural:=664;
	constant h_sync_high :natural:=760;
	constant h_end_count :natural:=800;
---------------------------------------------------------------------
	constant v_pixel_visible :natural:=480;
	constant v_sync_low :natural:=491;
	constant v_sync_high :natural:=493;
	constant v_end_count :natural:=525;	
begin
-----------------------------------------------------------------------
	clock_divide:process(clock_50mhz)
	begin
	if rising_edge(clock_50mhz) then
		pixel_clock_int <= not pixel_clock_int;
	end if;
	end process clock_divide;
---------------combinational logic-------------------------------------
video_on <= video_on_h and video_on_v;
pixel_clock <= pixel_clock_int; 

-----------------------------------------------------------------------

	pixel_process:process(pixel_clock_int)
	begin
	if rising_edge(pixel_clock_int) then
	-----process horizontal block-----------
		if (h_count = h_end_count) then
			h_count <= (others => '0');
		else	
			h_count <= h_count + 1;
		end if;
		
		if (h_count <= h_sync_high) and (h_count >= h_sync_low) then
			horiz_sync <= '0';
		else
			horiz_sync <= '1';
		end if;
	-----process vertical block-----------
		if (v_count >= v_end_count) and (h_count >=  h_sync_low) then
			v_count <= (others => '0');
		elsif (h_count = h_sync_low) then
			v_count <= v_count + 1;
		end if;
		
		if (v_count <= v_sync_high) and (v_count >= v_sync_low) then
			verti_sync <= '0';
		else
			verti_sync <= '1';
		end if;
	-------generate visible pixel----------------
		if (h_count < h_pixel_visible) then
			video_on_h <= '1';
			pixel_column <= std_logic_vector(h_count);
		else
			video_on_h <= '0';
		end if;
		
		if (v_count < v_pixel_visible) then
			video_on_v <= '1';
			pixel_row <= std_logic_vector(v_count);
			eof <= '0';
		else
			video_on_v <= '0';
			eof <= '1';
		end if;		
		horiz_sync_out <= horiz_sync;
		verti_syn_out <= verti_sync;
	end if;
	end process pixel_process;

end architecture behavior;