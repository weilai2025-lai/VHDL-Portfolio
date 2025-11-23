library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pixelGenerator_dynamicbulletmodule is
  generic(
    N_BOTTOM_BULLETS : integer := 5;
    N_TOP_BULLETS    : integer := 5;
	 BULLET_SIZE : integer := 20
  );
  port(
    -- VGA input
    clk, ROM_clk, rst_n, video_on: in  std_logic;
    pixel_row, pixel_column            : in  std_logic_vector(9 downto 0);

    -- two tanks position(upper left)
    bottom_tank_x : in std_logic_vector(9 downto 0);
    bottom_tank_y : in std_logic_vector(9 downto 0);
    top_tank_x    : in std_logic_vector(9 downto 0);
    top_tank_y    : in std_logic_vector(9 downto 0);

    ----------------------------------------------------------------
    -- new：multiple bottom/top bullets information
    -- using bullet_bottom_top / bullet_top_top output
    ----------------------------------------------------------------
    bottom_bullet_active_vec : in std_logic_vector(N_BOTTOM_BULLETS-1 downto 0);
    bottom_bullet_x_vec      : in std_logic_vector(N_BOTTOM_BULLETS*10-1 downto 0);
    bottom_bullet_y_vec      : in std_logic_vector(N_BOTTOM_BULLETS*10-1 downto 0);

    top_bullet_active_vec    : in std_logic_vector(N_TOP_BULLETS-1 downto 0);
    top_bullet_x_vec         : in std_logic_vector(N_TOP_BULLETS*10-1 downto 0);
    top_bullet_y_vec         : in std_logic_vector(N_TOP_BULLETS*10-1 downto 0);

    red_out, blue_out, green_out      : out std_logic_vector(9 downto 0)
  );
end entity pixelGenerator_dynamicbulletmodule;


architecture behavior of pixelGenerator_dynamicbulletmodule is
  ------------------------------------------------------------------
  -- colorROM.mif index
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
  --geometric parameter
  ------------------------------------------------------------------
  constant SCREEN_WIDTH  : integer := 640;
  constant WALL_WIDTH    : integer := 5;    

  constant TANK_W        : integer := 32;   
  constant TANK_H        : integer := 10;   
  --constant BULLET_SIZE   : integer := 5;    

  ------------------------------------------------------------------
  -- colorROM component 宣告
  ------------------------------------------------------------------
  component colorROM is
    port(
      address : in  std_logic_vector(2 downto 0);
      clock   : in  std_logic := '1';
      q       : out std_logic_vector(29 downto 0)
    );
  end component colorROM;

  ------------------------------------------------------------------
  -- internal：color index / color bus / current scanning coordinate
  ------------------------------------------------------------------
  signal color            : std_logic_vector(29 downto 0);
  signal colorAddress     : std_logic_vector(2 downto 0);
  signal pixel_row_int    : integer;
  signal pixel_column_int : integer;

begin
  ------------------------------------------------------------------
  pixel_row_int    <= to_integer(unsigned(pixel_row));
  pixel_column_int <= to_integer(unsigned(pixel_column));

  ------------------------------------------------------------------
  -- 2) colorROM instance：using colorAddress to map RGB
  ------------------------------------------------------------------
  colors : colorROM
    port map(
      address => colorAddress,
      clock   => ROM_clk,
      q       => color
    );

  ------------------------------------------------------------------
  red_out   <= color(29 downto 20);
  green_out <= color(19 downto 10);
  blue_out  <= color(9 downto 0);

  ------------------------------------------------------------------
  -- 3) Draw region：
  ------------------------------------------------------------------
  pixelDraw : process(clk, rst_n)
    -- tank position (integer)
    variable bot_x, bot_y : integer;
    variable top_x, top_y : integer;

    -- verify whether bullet and tank pixels are overlapping
    variable hit_bottom_bullet : boolean;
    variable hit_top_bullet    : boolean;

    -- register each bullet square region
    variable bx_l, bx_r : integer;
    variable by_t, by_b : integer;

    -------------------------------
    variable next_color : std_logic_vector(2 downto 0);
  begin
    if rst_n = '0' then
      colorAddress <= color_black;

    elsif rising_edge(clk) then
	 
      if video_on = '0' then
        next_color := color_black;

      else
        --------------------------------------------------------------
        -- 3-1) sample tank's coordinate first
        --------------------------------------------------------------
        bot_x := to_integer(unsigned(bottom_tank_x));
        bot_y := to_integer(unsigned(bottom_tank_y));
        top_x := to_integer(unsigned(top_tank_x));
        top_y := to_integer(unsigned(top_tank_y));

        --------------------------------------------------------------
        -- 3-2) verify wall first
        --------------------------------------------------------------
        if (pixel_column_int < WALL_WIDTH) or
           (pixel_column_int >= SCREEN_WIDTH - WALL_WIDTH) then
          next_color := color_red;

        else
          ------------------------------------------------------------
          -- 3-3) I put the priority of bullet hugher than tanks
			 --		check bottom / top bullet，有沒有任何一顆覆蓋到目前 pixel
          ------------------------------------------------------------
          hit_bottom_bullet := false;
          hit_top_bullet    := false;

          -- 3-3-1) bottom 子彈迴圈
          for i in 0 to N_BOTTOM_BULLETS-1 loop
            if (not hit_bottom_bullet) and (bottom_bullet_active_vec(i) = '1') then
              -- 取出第 i 顆 bottom bullet 的座標（扁平化拆段）
              bx_l := to_integer(unsigned(
                         bottom_bullet_x_vec((i+1)*10-1 downto i*10)
                       ));
              by_t := to_integer(unsigned(
                         bottom_bullet_y_vec((i+1)*10-1 downto i*10)
                       ));
              bx_r := bx_l + BULLET_SIZE - 1;
              by_b := by_t + BULLET_SIZE - 1;

              if (pixel_column_int >= bx_l) and (pixel_column_int <= bx_r) and
                 (pixel_row_int    >= by_t) and (pixel_row_int    <= by_b) then
                hit_bottom_bullet := true;
              end if;
            end if;
          end loop;

          -- 3-3-2) top 子彈迴圈
          for j in 0 to N_TOP_BULLETS-1 loop
            if (not hit_top_bullet) and (top_bullet_active_vec(j) = '1') then
              bx_l := to_integer(unsigned(
                         top_bullet_x_vec((j+1)*10-1 downto j*10)
                       ));
              by_t := to_integer(unsigned(
                         top_bullet_y_vec((j+1)*10-1 downto j*10)
                       ));
              bx_r := bx_l + BULLET_SIZE - 1;
              by_b := by_t + BULLET_SIZE - 1;

              if (pixel_column_int >= bx_l) and (pixel_column_int <= bx_r) and
                 (pixel_row_int    >= by_t) and (pixel_row_int    <= by_b) then
                hit_top_bullet := true;
              end if;
            end if;
          end loop;

          ------------------------------------------------------------
          -- 3-4) 依優先順序選顏色：
          --      牆(red) > 子彈(blue) > 坦克(green) > 背景(black)
          --    （牆已經先判過了，所以到這裡牆的情況已排除）
          ------------------------------------------------------------
          if hit_bottom_bullet or hit_top_bullet then
            -- 目前簡單處理：只要被任何一顆子彈蓋到就畫藍色
            next_color := color_blue;

          -- bottom tank（綠色）
          elsif (pixel_column_int >= bot_x) and
                (pixel_column_int <  bot_x + TANK_W) and
                (pixel_row_int    >= bot_y) and
                (pixel_row_int    <  bot_y + TANK_H) then
            next_color := color_green;

          -- top tank（綠色）
          elsif (pixel_column_int >= top_x) and
                (pixel_column_int <  top_x + TANK_W) and
                (pixel_row_int    >= top_y) and
                (pixel_row_int    <  top_y + TANK_H) then
            next_color := color_green;

          else
            next_color := color_black;
          end if;

        end if; -- 牆 else

      end if; -- video_on

      colorAddress <= next_color;
    end if; -- rising_edge
  end process pixelDraw;

end architecture behavior;