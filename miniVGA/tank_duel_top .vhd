library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tank_duel_top is
  generic(
    -- 全域子彈大小與步長（往下傳給 bullet_*_top -> tank_bullet_*_refine）
    GEN_BULLET_SIZE : integer := 20;
    GEN_BULLET_STEP : integer := 5
  );
  port(
    -- 板子 50MHz 時脈
    CLOCK_50    : in  std_logic;
    -- 全域 reset，active-low（接 KEY0 之類）
    RESET_N     : in  std_logic;

    -- PS/2 鍵盤
    PS2_CLK     : in  std_logic;
    PS2_DAT     : in  std_logic;

    -- VGA 輸出
    VGA_R       : out std_logic_vector(9 downto 0);
    VGA_G       : out std_logic_vector(9 downto 0);
    VGA_B       : out std_logic_vector(9 downto 0);
    VGA_HS      : out std_logic;
    VGA_VS      : out std_logic;
    VGA_BLANK_N : out std_logic;  -- 接 DE2-115 的 VGA_BLANK_N
    VGA_CLK     : out std_logic;  -- 接 DE2-115 的 VGA_CLK

    -- 分數顯示：七段顯示器（active-low）
    HEX_TOP     : out std_logic_vector(6 downto 0); -- top 坦克分數
    HEX_BOTTOM  : out std_logic_vector(6 downto 0)  -- bottom 坦克分數
  );
end entity tank_duel_top;


architecture rtl of tank_duel_top is

  --------------------------------------------------------------------
  -- 小工具：檢查向量裡是否「至少有一個 '1'」
  --------------------------------------------------------------------
  function any_one(slv : std_logic_vector) return std_logic is
    variable r : std_logic := '0';
  begin
    for i in slv'range loop
      if slv(i) = '1' then
        r := '1';
        exit;
      end if;
    end loop;
    return r;
  end function;

  --------------------------------------------------------------------
  -- 參數：子彈數（上下坦克各幾顆）
  --------------------------------------------------------------------
  constant N_BOTTOM_BULLETS : integer := 5;
  constant N_TOP_BULLETS    : integer := 5;

  --------------------------------------------------------------------
  -- Clock / PLL
  --------------------------------------------------------------------
  signal clk_fast   : std_logic;  -- 100 MHz（PLL_clock_top.c0）
  signal move_pulse : std_logic;  -- 由 PLL_clock_top 產生的 50 Hz 節拍

  --------------------------------------------------------------------
  -- VGA sync / pixel 資訊（25 MHz domain）
  --------------------------------------------------------------------
  signal horiz_sync    : std_logic;
  signal verti_sync    : std_logic;
  signal video_on      : std_logic;
  signal video_on_pipe : std_logic;
  signal pixel_clk     : std_logic;  -- pixel clock（給 VGA）
  signal eof           : std_logic;

  signal pixel_row         : std_logic_vector(9 downto 0);
  signal pixel_row_pipe    : std_logic_vector(9 downto 0);
  signal pixel_column      : std_logic_vector(9 downto 0);
  signal pixel_column_pipe : std_logic_vector(9 downto 0);

  --------------------------------------------------------------------
  -- 坦克位置 / 方向（在 clk_fast domain 裡更新）
  --------------------------------------------------------------------
  signal bottom_tank_x : std_logic_vector(9 downto 0);
  signal bottom_tank_y : std_logic_vector(9 downto 0);
  signal top_tank_x    : std_logic_vector(9 downto 0);
  signal top_tank_y    : std_logic_vector(9 downto 0);

  signal bottom_tank_dir : std_logic;
  signal top_tank_dir    : std_logic;

  --------------------------------------------------------------------
  -- keyboard 控制：speed_sel & fire_pulse（在 clk_fast 上解碼）
  --------------------------------------------------------------------
  signal speed_sel_top    : std_logic_vector(1 downto 0);
  signal speed_sel_bottom : std_logic_vector(1 downto 0);
  signal fire_pulse_top   : std_logic;
  signal fire_pulse_bottom: std_logic;

  --------------------------------------------------------------------
  -- 多顆子彈：bottom（在 clk_fast domain）
  --------------------------------------------------------------------
  signal bottom_bullet_active_vec : std_logic_vector(N_BOTTOM_BULLETS-1 downto 0);
  signal bottom_bullet_x_vec      : std_logic_vector(N_BOTTOM_BULLETS*10-1 downto 0);
  signal bottom_bullet_y_vec      : std_logic_vector(N_BOTTOM_BULLETS*10-1 downto 0);
  signal bottom_collision_vec     : std_logic_vector(N_BOTTOM_BULLETS-1 downto 0);

  --------------------------------------------------------------------
  -- 多顆子彈：top（在 clk_fast domain）
  --------------------------------------------------------------------
  signal top_bullet_active_vec : std_logic_vector(N_TOP_BULLETS-1 downto 0);
  signal top_bullet_x_vec      : std_logic_vector(N_TOP_BULLETS*10-1 downto 0);
  signal top_bullet_y_vec      : std_logic_vector(N_TOP_BULLETS*10-1 downto 0);
  signal top_collision_vec     : std_logic_vector(N_TOP_BULLETS-1 downto 0);

  --------------------------------------------------------------------
  -- 由多顆子彈 collision 向量做 OR-reduce，給 scoremodule
  --   top_hit    = top 子彈打到 bottom（增加 top 分數）
  --   bottom_hit = bottom 子彈打到 top（增加 bottom 分數）
  --------------------------------------------------------------------
  signal collision_from_top_bullets    : std_logic;
  signal collision_from_bottom_bullets : std_logic;

  --------------------------------------------------------------------
  -- VGA 顏色（在 pixel_clk domain 根據「當下狀態」畫出來）
  --------------------------------------------------------------------
  signal vga_red   : std_logic_vector(9 downto 0);
  signal vga_green : std_logic_vector(9 downto 0);
  signal vga_blue  : std_logic_vector(9 downto 0);

  --------------------------------------------------------------------
  -- freeze：由分數模組決定，回饋給 PLL_clock_top 停止 move_pulse
  --------------------------------------------------------------------
  signal freeze_all : std_logic;

begin

  --------------------------------------------------------------------
  -- 0) 子彈 collision OR-reduce → scoremodule 的輸入
  --------------------------------------------------------------------
  collision_from_top_bullets    <= any_one(top_collision_vec);
  collision_from_bottom_bullets <= any_one(bottom_collision_vec);

  --------------------------------------------------------------------
  -- 1) PLL_clock_top：把 50MHz 放大成 100MHz，順便產生 50Hz move_pulse
  --    freeze_all = 1 之後，move_pulse 會停住（凍結遊戲狀態）
  --------------------------------------------------------------------
  u_pll : entity work.PLL_clock_top
    port map(
      clock_50MHz   => CLOCK_50,
      freeze        => freeze_all,
      rst_n         => RESET_N,
      clock_100Mhz  => clk_fast,
      move_pulse    => move_pulse
    );

  --------------------------------------------------------------------
  -- 2) VGA sync 產生器（用 50MHz 產生 pixel_clk ≈ 25MHz）
  --------------------------------------------------------------------
  u_sync : entity work.vga_sync_pipe
    port map(
      clock_50mhz       => CLOCK_50,
      horiz_sync_out    => horiz_sync,
      verti_syn_out     => verti_sync,
      video_on          => video_on,
      video_on_pipe     => video_on_pipe,
      pixel_clock       => pixel_clk,
      eof               => eof,
      pixel_row         => pixel_row,
      pixel_row_pipe    => pixel_row_pipe,
      pixel_column      => pixel_column,
      pixel_column_pipe => pixel_column_pipe
    );

  --------------------------------------------------------------------
  -- 3) keyboard_top：在 clk_fast domain 解 PS/2，產生速度與 fire_pulse
  --------------------------------------------------------------------
  u_kbd : entity work.keyboard_top
    port map(
      keyboard_clk      => PS2_CLK,
      keyboard_data     => PS2_DAT,
      clock_50MHz       => clk_fast,  -- 名字叫 50MHz，但實際接 100MHz 無妨
      reset             => RESET_N,   -- active-low
      speed_sel_top     => speed_sel_top,
      speed_sel_bottom  => speed_sel_bottom,
      fire_pulse_top    => fire_pulse_top,
      fire_pulse_bottom => fire_pulse_bottom
    );

  --------------------------------------------------------------------
  -- 4) bottom tank（clk_fast + move_pulse，遇到 freeze_all=1 停止移動）
  --------------------------------------------------------------------
  u_tank_bottom : entity work.tank_bottom
    generic map(
      SCREEN_WIDTH => 640,
      TANK_WIDTH   => 32,
      WALL_WIDTH   => 5,
      X_INIT       => 10,
      Y_FIXED      => 470,
      INIT_DIR     => '1'
    )
    port map(
      clk        => clk_fast,
      rst_n      => RESET_N,
      move_pulse => move_pulse,
      speed_sel  => speed_sel_bottom,
      freeze     => freeze_all,
      tankx      => bottom_tank_x,
      tanky      => bottom_tank_y,
      tank_dir   => bottom_tank_dir
    );

  --------------------------------------------------------------------
  -- 5) top tank
  --------------------------------------------------------------------
  u_tank_top : entity work.tank_top
    generic map(
      SCREEN_WIDTH => 640,
      TANK_WIDTH   => 32,
      WALL_WIDTH   => 5,
      X_INIT       => 593,
      Y_FIXED      => 0,
      INIT_DIR     => '0'
    )
    port map(
      clk        => clk_fast,
      rst_n      => RESET_N,
      move_pulse => move_pulse,
      speed_sel  => speed_sel_top,
      freeze     => freeze_all,
      tankx      => top_tank_x,
      tanky      => top_tank_y,
      tank_dir   => top_tank_dir
    );

  --------------------------------------------------------------------
  -- 6) bottom bullets（多顆管理，跑在 clk_fast 上）
  --    這裡假設你已經在 bullet_bottom_top entity 加上：
  --      generic( N_BULLETS: integer := 5;
  --               BULLET_SIZE: integer := 5;
  --               STEP_PIXELS: integer := 5 );
  --------------------------------------------------------------------
  u_bullets_bottom : entity work.bullet_bottom_top
    generic map(
      N_BULLETS   => N_BOTTOM_BULLETS,
      BULLET_SIZE => GEN_BULLET_SIZE,
      STEP_PIXELS => GEN_BULLET_STEP
    )
    port map(
      clk                => clk_fast,
      rst_n              => RESET_N,
      move_pulse         => move_pulse,
      fire_pulse         => fire_pulse_bottom,
      enemytankx         => top_tank_x,
      tankx              => bottom_tank_x,
      tanky              => bottom_tank_y,
      tank_dir           => bottom_tank_dir,
      speed_sel          => speed_sel_bottom,
      bullet_active_vec  => bottom_bullet_active_vec,
      bullet_x_vec       => bottom_bullet_x_vec,
      bullet_y_vec       => bottom_bullet_y_vec,
      collision_state_vec=> bottom_collision_vec
    );

  --------------------------------------------------------------------
  -- 7) top bullets（多顆管理）
  --    同樣假設 bullet_top_top entity 也有 BULLET_SIZE / STEP_PIXELS generic
  --------------------------------------------------------------------
  u_bullets_top : entity work.bullet_top_top
    generic map(
      N_BULLETS   => N_TOP_BULLETS,
      BULLET_SIZE => GEN_BULLET_SIZE,
      STEP_PIXELS => GEN_BULLET_STEP
    )
    port map(
      clk                => clk_fast,
      rst_n              => RESET_N,
      move_pulse         => move_pulse,
      fire_pulse         => fire_pulse_top,
      enemytankx         => bottom_tank_x,
      tankx              => top_tank_x,
      tanky              => top_tank_y,
      tank_dir           => top_tank_dir,
      speed_sel          => speed_sel_top,
      bullet_active_vec  => top_bullet_active_vec,
      bullet_x_vec       => top_bullet_x_vec,
      bullet_y_vec       => top_bullet_y_vec,
      collision_state_vec=> top_collision_vec
    );

  --------------------------------------------------------------------
  -- 8) 分數模組：吃 collision + move_pulse（都在 clk_fast domain）
  --    輸出 7-seg + freeze_all，freeze_all 會回饋給 PLL_clock_top
  --------------------------------------------------------------------
  u_score : entity work.scoremodule
    port map(
      clk                  => clk_fast,
      rst_n                => RESET_N,
      collision_state_top    => collision_from_top_bullets,
      collision_state_bottom => collision_from_bottom_bullets,
      led_top              => HEX_TOP,
      led_bottom           => HEX_BOTTOM,
      freeze               => freeze_all
    );

  --------------------------------------------------------------------
  -- 9) pixel generator：畫牆 / 坦克 / 多顆子彈（在 pixel_clk domain）
  --    直接讀取 clk_fast domain 的狀態；因為 move_pulse 只有 50 Hz，
  --    對 VGA 來說這些座標在一段時間內是 quasi-static。
  --------------------------------------------------------------------
  u_pix : entity work.pixelGenerator_dynamicbulletmodule
    generic map(
      N_BOTTOM_BULLETS => N_BOTTOM_BULLETS,
      N_TOP_BULLETS    => N_TOP_BULLETS,
		BULLET_SIZE => GEN_BULLET_SIZE
    )
    port map(
      clk                     => pixel_clk,
      ROM_clk                 => pixel_clk,
      rst_n                   => RESET_N,
      video_on                => video_on,
      pixel_row               => pixel_row,
      pixel_column            => pixel_column,
      bottom_tank_x           => bottom_tank_x,
      bottom_tank_y           => bottom_tank_y,
      top_tank_x              => top_tank_x,
      top_tank_y              => top_tank_y,
      bottom_bullet_active_vec=> bottom_bullet_active_vec,
      bottom_bullet_x_vec     => bottom_bullet_x_vec,
      bottom_bullet_y_vec     => bottom_bullet_y_vec,
      top_bullet_active_vec   => top_bullet_active_vec,
      top_bullet_x_vec        => top_bullet_x_vec,
      top_bullet_y_vec        => top_bullet_y_vec,
      red_out                 => vga_red,
      blue_out                => vga_blue,
      green_out               => vga_green
    );

  --------------------------------------------------------------------
  -- 10) 對應到實際板子 VGA 腳位
  --------------------------------------------------------------------
  VGA_R       <= vga_red;
  VGA_G       <= vga_green;
  VGA_B       <= vga_blue;
  VGA_HS      <= horiz_sync;
  VGA_VS      <= verti_sync;
  VGA_CLK     <= pixel_clk;
  VGA_BLANK_N <= video_on;  -- video_on=1 表示「不 blank」

end architecture rtl;