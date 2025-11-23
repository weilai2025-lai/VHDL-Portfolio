library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity tank_duel_tb is
end entity;

architecture sim of tank_duel_tb is

  ------------------------------------------------------------------
  -- 小工具：檢查向量裡是否「至少有一個 '1'」
  ------------------------------------------------------------------
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

  ------------------------------------------------------------------
  -- 小工具：七段顯示 → 整數 (0~15)，對應 leddcd 的編碼
  ------------------------------------------------------------------
  function seg7_to_int(seg : std_logic_vector(6 downto 0)) return integer is
  begin
    case seg is
      when "1000000" => return 0;   -- 0
      when "1111001" => return 1;   -- 1
      when "0100100" => return 2;   -- 2
      when "0110000" => return 3;   -- 3
      when "0011001" => return 4;   -- 4
      when "0010010" => return 5;   -- 5
      when "0000010" => return 6;   -- 6
      when "1111000" => return 7;   -- 7
      when "0000000" => return 8;   -- 8
      when "0011000" => return 9;   -- 9
      when "0001000" => return 10;  -- A
      when "0000011" => return 11;  -- b
      when "0100111" => return 12;  -- C
      when "0100001" => return 13;  -- d
      when "0000110" => return 14;  -- E
      when "0001110" => return 15;  -- F
      when others    => return 0;
    end case;
  end function;

  ------------------------------------------------------------------
  -- 基本時脈 / reset
  ------------------------------------------------------------------
  constant T_CLK_50     : time   := 20 ns;   -- 50 MHz
  constant T_CLK_FAST   : time   := 10 ns;   -- 100 MHz (模擬 PLL 輸出)
  constant TOTAL_FRAMES : integer := 100;    -- 要抓幾偵畫面

  signal clock_50 : std_logic := '0';  -- 給 vga_sync 的 50MHz
  signal clk_fast : std_logic := '0';  -- 模擬 PLL 出來的 100MHz
  signal rst_n    : std_logic := '0';

  ------------------------------------------------------------------
  -- VGA sync 相關訊號（pixel domain）
  ------------------------------------------------------------------
  signal horiz_sync       : std_logic;
  signal verti_sync       : std_logic;
  signal video_on         : std_logic;
  signal video_on_pipe    : std_logic;
  signal vga_clk          : std_logic;  -- pixel clock
  signal eof              : std_logic;
  signal pixel_row        : std_logic_vector(9 downto 0);
  signal pixel_row_pipe   : std_logic_vector(9 downto 0);
  signal pixel_column     : std_logic_vector(9 downto 0);
  signal pixel_column_pipe: std_logic_vector(9 downto 0);

  ------------------------------------------------------------------
  -- 坦克位置 / 方向（fast clock domain）
  ------------------------------------------------------------------
  signal bottom_tank_x : std_logic_vector(9 downto 0);
  signal bottom_tank_y : std_logic_vector(9 downto 0);
  signal top_tank_x    : std_logic_vector(9 downto 0);
  signal top_tank_y    : std_logic_vector(9 downto 0);

  signal bottom_tank_dir : std_logic;
  signal top_tank_dir    : std_logic;

  ------------------------------------------------------------------
  -- move_pulse ＋ freeze（fast clock domain）
  ------------------------------------------------------------------
  signal move_pulse : std_logic;
  signal move_cnt   : unsigned(20 downto 0) := (others => '0');
  -- 100 MHz / (1_999_999+1) = 50 Hz
  constant MOVE_CNT_MAX : unsigned(20 downto 0) := to_unsigned(1999999, 21);
  signal freeze_all : std_logic := '0';

  ------------------------------------------------------------------
  -- 鍵盤控制（TB 直接給 speed_sel / fire_pulse）
  ------------------------------------------------------------------
  signal speed_sel_top    : std_logic_vector(1 downto 0) := "01";
  signal speed_sel_bottom : std_logic_vector(1 downto 0) := "01";
  signal fire_pulse_top   : std_logic := '0';
  signal fire_pulse_bottom: std_logic := '0';

  ------------------------------------------------------------------
  -- 多顆子彈（fast clock domain）
  ------------------------------------------------------------------
  constant N_BOTTOM_BULLETS : integer := 5;
  constant N_TOP_BULLETS    : integer := 5;

  signal bottom_bullet_active_vec : std_logic_vector(N_BOTTOM_BULLETS-1 downto 0);
  signal bottom_bullet_x_vec      : std_logic_vector(N_BOTTOM_BULLETS*10-1 downto 0);
  signal bottom_bullet_y_vec      : std_logic_vector(N_BOTTOM_BULLETS*10-1 downto 0);
  signal bottom_collision_vec     : std_logic_vector(N_BOTTOM_BULLETS-1 downto 0);

  signal top_bullet_active_vec : std_logic_vector(N_TOP_BULLETS-1 downto 0);
  signal top_bullet_x_vec      : std_logic_vector(N_TOP_BULLETS*10-1 downto 0);
  signal top_bullet_y_vec      : std_logic_vector(N_TOP_BULLETS*10-1 downto 0);
  signal top_collision_vec     : std_logic_vector(N_TOP_BULLETS-1 downto 0);

  ------------------------------------------------------------------
  -- 記分 / freeze（由 scoremodule 輸出，fast clock domain）
  ------------------------------------------------------------------
  signal collision_state_top    : std_logic;              -- bottom 子彈打到 top
  signal collision_state_bottom : std_logic;              -- top 子彈打到 bottom
  signal hex_top                : std_logic_vector(6 downto 0);
  signal hex_bottom             : std_logic_vector(6 downto 0);

  ------------------------------------------------------------------
  -- VGA 顏色（pixel domain）
  ------------------------------------------------------------------
  signal vga_red   : std_logic_vector(9 downto 0);
  signal vga_green : std_logic_vector(9 downto 0);
  signal vga_blue  : std_logic_vector(9 downto 0);

begin
  ------------------------------------------------------------------
  -- 50 MHz 時脈（給 vga_sync）
  ------------------------------------------------------------------
  clk50_gen : process
  begin
    clock_50 <= '0';
    wait for T_CLK_50/2;
    clock_50 <= '1';
    wait for T_CLK_50/2;
  end process;

  ------------------------------------------------------------------
  -- 100 MHz fast clock（模擬 PLL 輸出）
  ------------------------------------------------------------------
  clkfast_gen : process
  begin
    clk_fast <= '0';
    wait for T_CLK_FAST/2;
    clk_fast <= '1';
    wait for T_CLK_FAST/2;
  end process;

  ------------------------------------------------------------------
  -- reset（同步兩個 domain）
  ------------------------------------------------------------------
  rst_proc : process
  begin
    rst_n <= '0';
    wait for 1 us;
    rst_n <= '1';
    wait;
  end process;

  ------------------------------------------------------------------
  -- VGA sync（pixel domain）
  ------------------------------------------------------------------
  u_sync : entity work.vga_sync_pipe
    port map(
      clock_50mhz       => clock_50,
      horiz_sync_out    => horiz_sync,
      verti_syn_out     => verti_sync,
      video_on          => video_on,
      video_on_pipe     => video_on_pipe,
      pixel_clock       => vga_clk,
      eof               => eof,
      pixel_row         => pixel_row,
      pixel_row_pipe    => pixel_row_pipe,
      pixel_column      => pixel_column,
      pixel_column_pipe => pixel_column_pipe
    );

  ------------------------------------------------------------------
  -- move_pulse 產生器（fast clock domain, 約 50 Hz）
  ------------------------------------------------------------------
  move_pulse_gen : process(clk_fast, rst_n)
  begin
    if rst_n = '0' then
      move_cnt   <= (others => '0');
      move_pulse <= '0';
    elsif rising_edge(clk_fast) then
      if freeze_all = '1' then
        move_pulse <= '0';
      else
        if move_cnt = MOVE_CNT_MAX then
          move_cnt   <= (others => '0');
          move_pulse <= '1';
        else
          move_cnt   <= move_cnt + 1;
          move_pulse <= '0';
        end if;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- 坦克 bottom（fast clock domain）
  ------------------------------------------------------------------
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
      rst_n      => rst_n,
      move_pulse => move_pulse,
      speed_sel  => speed_sel_bottom,
      freeze     => freeze_all,
      tankx      => bottom_tank_x,
      tanky      => bottom_tank_y,
      tank_dir   => bottom_tank_dir
    );

  ------------------------------------------------------------------
  -- 坦克 top（fast clock domain）
  ------------------------------------------------------------------
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
      rst_n      => rst_n,
      move_pulse => move_pulse,
      speed_sel  => speed_sel_top,
      freeze     => freeze_all,
      tankx      => top_tank_x,
      tanky      => top_tank_y,
      tank_dir   => top_tank_dir
    );

  ------------------------------------------------------------------
  -- bottom bullets（多顆，fast clock domain）
  ------------------------------------------------------------------
  u_bullets_bottom : entity work.bullet_bottom_top
    generic map(
      N_BULLETS => N_BOTTOM_BULLETS,
		BULLET_SIZE => 20,
		STEP_PIXELS => 20
    )
    port map(
      clk                => clk_fast,
      rst_n              => rst_n,
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

  ------------------------------------------------------------------
  -- top bullets（多顆，fast clock domain）
  ------------------------------------------------------------------
  u_bullets_top : entity work.bullet_top_top
    generic map(
      N_BULLETS => N_TOP_BULLETS,
		BULLET_SIZE => 20,
		STEP_PIXELS => 20
    )
    port map(
      clk                => clk_fast,
      rst_n              => rst_n,
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

  ------------------------------------------------------------------
  -- 記分模組（fast clock domain，跟 top 一樣用 scoremodule）
  -- bottom_collision_vec → collision_state_top（top 被打）
  -- top_collision_vec    → collision_state_bottom（bottom 被打）
  ------------------------------------------------------------------
  collision_state_top    <= any_one(top_collision_vec);
  collision_state_bottom <= any_one(bottom_collision_vec);

  u_score : entity work.scoremodule
    port map(
      clk                  => clk_fast,
      rst_n                => rst_n,
      collision_state_top    => collision_state_top,
      collision_state_bottom => collision_state_bottom,
      led_top              => hex_top,
      led_bottom           => hex_bottom,
      freeze               => freeze_all
    );

  ------------------------------------------------------------------
  -- pixel generator（pixel domain）
  ------------------------------------------------------------------
  u_pix : entity work.pixelGenerator_dynamicbulletmodule
    generic map(
      N_BOTTOM_BULLETS => N_BOTTOM_BULLETS,
      N_TOP_BULLETS    => N_TOP_BULLETS,
		BULLET_SIZE => 20
    )
    port map(
      clk                      => vga_clk,
      ROM_clk                  => vga_clk,
      rst_n                    => rst_n,
      video_on                 => video_on,
      pixel_row                => pixel_row,
      pixel_column             => pixel_column,
      bottom_tank_x            => bottom_tank_x,
      bottom_tank_y            => bottom_tank_y,
      top_tank_x               => top_tank_x,
      top_tank_y               => top_tank_y,
      bottom_bullet_active_vec => bottom_bullet_active_vec,
      bottom_bullet_x_vec      => bottom_bullet_x_vec,
      bottom_bullet_y_vec      => bottom_bullet_y_vec,
      top_bullet_active_vec    => top_bullet_active_vec,
      top_bullet_x_vec         => top_bullet_x_vec,
      top_bullet_y_vec         => top_bullet_y_vec,
      red_out                  => vga_red,
      blue_out                 => vga_blue,
      green_out                => vga_green
    );

  ------------------------------------------------------------------
  -- 連續 4 發子彈（上下各 4 顆），以 move_pulse 為節奏（fast clock domain）
  ------------------------------------------------------------------
  fire_proc : process(clk_fast, rst_n)
    variable top_shots    : integer := 0;
    variable bottom_shots : integer := 0;
  begin
    if rst_n = '0' then
      fire_pulse_top    <= '0';
      fire_pulse_bottom <= '0';
      top_shots         := 0;
      bottom_shots      := 0;
    elsif rising_edge(clk_fast) then
      -- 預設一律拉低，一拍脈衝
      fire_pulse_top    <= '0';
      fire_pulse_bottom <= '0';

      if move_pulse = '1' then
        if top_shots < 4 then
          fire_pulse_top <= '1';
          top_shots      := top_shots + 1;
        end if;
        if bottom_shots < 4 then
          fire_pulse_bottom <= '1';
          bottom_shots      := bottom_shots + 1;
        end if;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- frame dump 到文字檔（pixel domain，跟以前一樣）
  -- FRAME N
  -- N,row,col : R,G,B
  ------------------------------------------------------------------
  dump_proc : process
    file f          : text open write_mode is "frames_dump_multi.txt";
    variable L      : line;
    variable row_i  : integer;
    variable col_i  : integer;
    variable r_i    : integer;
    variable g_i    : integer;
    variable b_i    : integer;

    variable frame_idx : integer := 0;      -- 已完成的 frame 數
    variable prev_eof  : std_logic := '0';  -- 用來抓 eof 的 0→1 上升緣
  begin
    -- 等 reset 放開一下，避免一開始都是 X/U
    wait until rst_n = '1';
    wait until rising_edge(vga_clk);

    -- 主迴圈：跑到抓完 TOTAL_FRAMES 偵為止
    while frame_idx < TOTAL_FRAMES loop

      -- 每個 pixel clock 都進來一次
      wait until rising_edge(vga_clk);

      ----------------------------------------------------------------
      -- 偵測 eof 的 0→1 上升緣，代表「新的一偵開始」
      ----------------------------------------------------------------
      if (prev_eof = '0') and (eof = '1') then
        frame_idx := frame_idx + 1;

        -- 寫 frame header：「FRAME N」
        write(L, string'("FRAME "));
        write(L, frame_idx);
        writeline(f, L);
      end if;
      prev_eof := eof;

      ----------------------------------------------------------------
      -- 真正 dump 畫面：只在 video_on_pipe=1（可見畫面區）
      -- 而且 frame_idx>0（已經進入第一偵以後）
      ----------------------------------------------------------------
      if (video_on_pipe = '1') and (frame_idx > 0) then
        -- 轉成整數
        row_i := to_integer(unsigned(pixel_row_pipe));
        col_i := to_integer(unsigned(pixel_column_pipe));
        r_i   := to_integer(unsigned(vga_red));
        g_i   := to_integer(unsigned(vga_green));
        b_i   := to_integer(unsigned(vga_blue));

        -- 一行的格式：frame,row,col : R,G,B
        write(L, frame_idx);
        write(L, string'(","));
        write(L, row_i);
        write(L, string'(","));
        write(L, col_i);
        write(L, string'(" : "));
        write(L, r_i);
        write(L, string'(","));
        write(L, g_i);
        write(L, string'(","));
        write(L, b_i);
        writeline(f, L);
      end if;

    end loop;

    report "Captured " & integer'image(frame_idx) & " frames. Simulation stop."
      severity note;
    wait;
  end process dump_proc;

  ------------------------------------------------------------------
  -- score.txt：每個 move_pulse 記一次當下分數與 freeze 狀態（fast clock domain）
  ------------------------------------------------------------------
  score_dump_proc : process
    file sf        : text open write_mode is "score.txt";
    variable Ls    : line;
    variable step  : integer := 0;
    variable t_i   : integer;
    variable b_i   : integer;
  begin
    -- 等 reset 放開
    wait until rst_n = '1';

    while true loop
      wait until rising_edge(clk_fast);

      if move_pulse = '1' then
        step := step + 1;
        t_i  := seg7_to_int(hex_top);
        b_i  := seg7_to_int(hex_bottom);

        write(Ls, string'("STEP "));
        write(Ls, step);
        write(Ls, string'(" : TOP="));
        write(Ls, t_i);
        write(Ls, string'(" BOTTOM="));
        write(Ls, b_i);
        write(Ls, string'(" FREEZE="));
        if freeze_all = '1' then
          write(Ls, string'("1"));
        else
          write(Ls, string'("0"));
        end if;
        writeline(sf, Ls);
      end if;
    end loop;
  end process score_dump_proc;

end architecture sim;