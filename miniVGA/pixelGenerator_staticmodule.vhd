library IEEE;
use IEEE.std_Logic_1164.all;
use IEEE.numeric_std.all;

entity pixelGenerator_staticmodule is
	port(
		clk, ROM_clk, rst_n, video_on, eof:in std_logic;
		pixel_row, pixel_column: in std_logic_vector(9 downto 0);
		red_out, blue_out, green_out :out std_logic_vector(9 downto 0)
	);

end entity pixelGenerator_staticmodule;

architecture behavior of pixelGenerator_staticmodule is
  ------------------------------------------------------------------
  -- colorROM.mif's color
  ------------------------------------------------------------------
  constant color_red     : std_logic_vector(2 downto 0) := "000";
  constant color_green   : std_logic_vector(2 downto 0) := "001";
  constant color_blue    : std_logic_vector(2 downto 0) := "010";
  constant color_yellow  : std_logic_vector(2 downto 0) := "011";
  constant color_magenta : std_logic_vector(2 downto 0) := "100";
  constant color_cyan    : std_logic_vector(2 downto 0) := "101";
  constant color_black   : std_logic_vector(2 downto 0) := "110";
  constant color_white   : std_logic_vector(2 downto 0) := "111";

  ------------------------------------------------------------------
  -- Geometrics parameters of each module(tank, bullet, wall)
  ------------------------------------------------------------------
  -- 1) wall
  constant WALL_WIDTH      : integer := 5;   -- 例：column = 0~4 / 635~639

  -- 2) tank size
  constant TANK_W          : integer := 32;  -- 32 pixel width
  constant TANK_H          : integer := 10;  -- 10 pixel high

  -- 3) bullet size
  constant BULLET_SIZE     : integer := 5;   -- 2x2 block

  -- 4) tank / bullet position
  --    example for bottom tank：upper left corner (TANK_X_LEFT, BOTTOM_TANK_Y_TOP)
  constant TANK_X_LEFT           : integer := 10;    --initial pos at left side of wall
  constant BOTTOM_TANK_Y_BOTTOM  : integer := 479;
  constant BOTTOM_TANK_Y_TOP     : integer := BOTTOM_TANK_Y_BOTTOM - TANK_H + 1;  -- 470

  constant TOP_TANK_Y_BOTTOM     : integer := 0;        -- 9
  constant TOP_TANK_Y_TOP        : integer := TOP_TANK_Y_BOTTOM + TANK_H - 1;
  

  -- bullet: located at central of tank
  constant BOTTOM_BULLET_X_LEFT  : integer := TANK_X_LEFT + 14; 
  constant BOTTOM_BULLET_X_RIGHT : integer := BOTTOM_BULLET_X_LEFT + BULLET_SIZE - 1;
  constant BOTTOM_BULLET_Y_TOP   : integer := BOTTOM_TANK_Y_TOP - BULLET_SIZE + 1; -- on tank 
  constant BOTTOM_BULLET_Y_BOTTOM: integer := BOTTOM_TANK_Y_TOP;

  constant TOP_BULLET_X_LEFT     : integer := TANK_X_LEFT + 14;
  constant TOP_BULLET_X_RIGHT    : integer := TOP_BULLET_X_LEFT + BULLET_SIZE - 1;
  constant TOP_BULLET_Y_TOP      : integer := TOP_TANK_Y_TOP + BULLET_SIZE - 1;              -- down tank
  constant TOP_BULLET_Y_BOTTOM   : integer := TOP_TANK_Y_TOP;
  --componet-----
  	component colorROM is
		port(
			address:in std_logic_vector(2 downto 0);
			clock: in std_logic:= '1';
			q: out std_logic_vector(29 downto 0)		
		);
	end component colorROM;
  ------------------------------------------------------------------
  -- other signal（colorAddress, color, pixel_row_int, pixel_column_int）
  signal colorAddress: std_logic_vector(2 downto 0);
  signal color: std_logic_vector(29 downto 0);
  signal pixel_row_int, pixel_column_int: natural;
  ------------------------------------------------------------------
begin
----------combinational logics--------- 
  pixel_row_int    <= to_integer(unsigned(pixel_row));
  pixel_column_int <= to_integer(unsigned(pixel_column));
  
  colors: colorROM
  port map(address => colorAddress, clock => ROM_clk, q => color);
	
  red_out <= color(29 downto 20);
  green_out <= color(19 downto 10);
  blue_out <= color(9 downto 0);
--------------------------------------------
  pixelDraw : process(clk)
  begin
    if rising_edge(clk) then
      -- only show image at video_on = '1' 
      if video_on = '0' then
        colorAddress <= color_black; 
      else
        ----------------------------------------------------------------
        -- 1) wall(left / right):red
        ----------------------------------------------------------------
        if (pixel_column_int < WALL_WIDTH) or
           (pixel_column_int >= 640 - WALL_WIDTH) then
          colorAddress <= color_red;

        ----------------------------------------------------------------
        -- 2) bullet（upper / lower）：blue
        ----------------------------------------------------------------
        elsif (pixel_column_int >= BOTTOM_BULLET_X_LEFT) and
              (pixel_column_int <= BOTTOM_BULLET_X_RIGHT) and
              (pixel_row_int >= BOTTOM_BULLET_Y_TOP) and
              (pixel_row_int <= BOTTOM_BULLET_Y_BOTTOM) then
          colorAddress <= color_blue;

        elsif (pixel_column_int >= TOP_BULLET_X_LEFT) and
              (pixel_column_int <= TOP_BULLET_X_RIGHT) and
              (pixel_row_int <= TOP_BULLET_Y_TOP) and
              (pixel_row_int >= TOP_BULLET_Y_BOTTOM) then
          colorAddress <= color_blue;

        ----------------------------------------------------------------
        -- 3) tank（upper / lower）：green
        ----------------------------------------------------------------
        elsif (pixel_column_int >= TANK_X_LEFT) and
              (pixel_column_int <  TANK_X_LEFT + TANK_W) and
              (pixel_row_int    >= BOTTOM_TANK_Y_TOP) and
              (pixel_row_int    <= BOTTOM_TANK_Y_BOTTOM) then
          colorAddress <= color_green;

        elsif (pixel_column_int >= TANK_X_LEFT) and
              (pixel_column_int <  TANK_X_LEFT + TANK_W) and
              (pixel_row_int    <= TOP_TANK_Y_TOP) and
              (pixel_row_int    >= TOP_TANK_Y_BOTTOM) then
          colorAddress <= color_green;

        ----------------------------------------------------------------
        -- 4) other background（black）
        ----------------------------------------------------------------
        else
          colorAddress <= color_black;
        end if;
      end if;
    end if;
  end process pixelDraw;
end architecture behavior;