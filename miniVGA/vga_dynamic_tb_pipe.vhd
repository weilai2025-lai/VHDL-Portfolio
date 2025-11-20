library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity vga_dynamic_tb_pipe is
end entity vga_dynamic_tb_pipe;

architecture sim of vga_dynamic_tb_pipe is
  ------------------------------------------------------------------
  -- 1) 基本時脈 / reset
  ------------------------------------------------------------------
  constant T_50         : time   := 20 ns;   -- 50 MHz
  constant TOTAL_FRAMES : integer := 60;     -- 要截多少偵

  signal clock_50   : std_logic := '0';
  signal reset_n    : std_logic := '0';

  ------------------------------------------------------------------
  -- 2) VGA_SYNC / pixel generator 連線
  ------------------------------------------------------------------
  signal horiz_sync   : std_logic;
  signal verti_sync   : std_logic;
  signal vga_clk      : std_logic;  -- pixel clock
  signal video_on     : std_logic;
  signal eof          : std_logic;

  signal pixel_row    : std_logic_vector(9 downto 0);
  signal pixel_column : std_logic_vector(9 downto 0);

  signal vga_red      : std_logic_vector(9 downto 0);
  signal vga_green    : std_logic_vector(9 downto 0);
  signal vga_blue     : std_logic_vector(9 downto 0);
  ----pipeline Alignment訊號-----------------------------
  signal video_on_pipe : std_logic;
  signal pixel_row_pipe : std_logic_vector(9 downto 0);
  signal pixel_column_pipe :std_logic_vector(9 downto 0);
  ------------------------------------------------------------------
  -- 3) tank 相關訊號
  ------------------------------------------------------------------
  -- bottom tank (會動)
  signal bottom_tank_x : std_logic_vector(9 downto 0);
  signal bottom_tank_y : std_logic_vector(9 downto 0);

  -- top tank (會動)
  signal top_tank_x    : std_logic_vector(9 downto 0);
  signal top_tank_y    : std_logic_vector(9 downto 0);

  -- 控制移動
  signal move_pulse    : std_logic := '0';
  signal speed_sel     : std_logic_vector(1 downto 0) := "10";
  signal freeze        : std_logic := '0';

  ------------------------------------------------------------------
  -- bottom bullet 訊號
  ------------------------------------------------------------------
  signal bottom_bullet_active : std_logic;
  signal bottom_bullet_x      : std_logic_vector(9 downto 0);
  signal bottom_bullet_y      : std_logic_vector(9 downto 0);
  signal fire_bottom          : std_logic := '0';
  signal bottom_tank_dir      : std_logic;
  
  -- top bullet 訊號
  ------------------------------------------------------------------
  signal top_bullet_active : std_logic;
  signal top_bullet_x      : std_logic_vector(9 downto 0);
  signal top_bullet_y      : std_logic_vector(9 downto 0);
  signal top_tank_dir      : std_logic;

begin
  ------------------------------------------------------------------
  -- 3) 50MHz system clock 產生器
  ------------------------------------------------------------------
  clk_proc : process
  begin
    clock_50 <= '0';
    wait for T_50/2;
    clock_50 <= '1';
    wait for T_50/2;
  end process;

  ------------------------------------------------------------------
  -- 4) reset_n：一開始先拉低一小段時間
  ------------------------------------------------------------------
  rst_proc : process
  begin
    reset_n <= '0';
    wait for 0 ns;
    reset_n <= '1';
    wait;  -- 之後一直保持 '1'
  end process;

  ------------------------------------------------------------------
  -- 5) 實例化 vga_sync
  ------------------------------------------------------------------
  u_sync : entity work.vga_sync_pipe
    port map(
      clock_50mhz    => clock_50,
      horiz_sync_out => horiz_sync,
      verti_syn_out  => verti_sync,
      video_on       => video_on,
		video_on_pipe  => video_on_pipe,
      pixel_clock    => vga_clk,
      eof            => eof,
      pixel_row      => pixel_row,
		pixel_row_pipe => pixel_row_pipe,
      pixel_column   => pixel_column,
		pixel_column_pipe   => pixel_column_pipe
    );

  ------------------------------------------------------------------
  -- 6) 實例化 bottom tank
  ------------------------------------------------------------------
  u_tank_bottom : entity work.tank_bottom
    generic map(
      SCREEN_WIDTH => 640,
      TANK_WIDTH   => 32,
      WALL_WIDTH   => 5,
      X_INIT       => 10,      -- 一開始貼近左牆
      Y_FIXED      => 470,     -- 靠近底部
      INIT_DIR     => '1'      -- 一開始往右
    )
    port map(
      clk        => vga_clk,
      rst_n      => reset_n,
      move_pulse => move_pulse,
      speed_sel  => speed_sel,
      freeze     => freeze,
      tankx      => bottom_tank_x,
      tanky      => bottom_tank_y,
      tank_dir   => bottom_tank_dir
    );

  ------------------------------------------------------------------
  -- 6b) 實例化 top tank
  ------------------------------------------------------------------
  u_tank_top : entity work.tank_top
    generic map(
      SCREEN_WIDTH => 640,
      TANK_WIDTH   => 32,
      WALL_WIDTH   => 5,
      X_INIT       => 593,     -- 右上角
      Y_FIXED      => 0,
      INIT_DIR     => '0'
    )
    port map(
      clk        => vga_clk,
      rst_n      => reset_n,
      move_pulse => move_pulse,
      speed_sel  => speed_sel,
      freeze     => freeze,
      tankx      => top_tank_x,
      tanky      => top_tank_y,
      tank_dir   => top_tank_dir
    );

  ------------------------------------------------------------------
  -- 6c) 實例化 bottom bullet（只給 bottom tank 用）
  ------------------------------------------------------------------
  u_bullet_bottom : entity work.tank_bullet_bottom_refine
    generic map(
      SCREEN_WIDTH  => 640,
      SCREEN_HEIGHT => 480,
      TANK_W        => 32,
      TANK_H        => 10,
      BULLET_SIZE   => 5,
      DIR_UP        => '1',   -- 往上飛
      STEP_PIXELS   => 20
    )
    port map(
      clk           => vga_clk,
      rst_n         => reset_n,
      move_pulse    => move_pulse,
      fire          => fire_bottom,  -- 下面 dump_proc 只會拉一次
      tankx         => bottom_tank_x,
      tanky         => bottom_tank_y,
		tank_dir      => bottom_tank_dir,
		speed_sel     => speed_sel,
      bullet_active => bottom_bullet_active,
      bullet_x      => bottom_bullet_x,
      bullet_y      => bottom_bullet_y
    );

  -- 6c) 實例化 top bullet（只給 top tank 用）
  ------------------------------------------------------------------
  u_bullet_top : entity work.tank_bullet_top_refine
    generic map(
      SCREEN_WIDTH  => 640,
      SCREEN_HEIGHT => 480,
      TANK_W        => 32,
      TANK_H        => 10,
      BULLET_SIZE   => 5,
      DIR_UP        => '0',   -- 往下飛
      STEP_PIXELS   => 20
    )
    port map(
      clk           => vga_clk,
      rst_n         => reset_n,
      move_pulse    => move_pulse,
      fire          => fire_bottom,  -- 下面 dump_proc 只會拉一次
      tankx         => top_tank_x,
      tanky         => top_tank_y,
		tank_dir      => top_tank_dir,
		speed_sel     => speed_sel,
      bullet_active => top_bullet_active,
      bullet_x      => top_bullet_x,
      bullet_y      => top_bullet_y
    );

  ------------------------------------------------------------------
  -- 7) 實例化 pixelGenerator_dynamicbulletmodule
  ------------------------------------------------------------------
  u_pix : entity work.pixelGenerator_dynamicbulletmodule
    port map(
      clk                  => vga_clk,
      ROM_clk              => vga_clk,
      rst_n                => reset_n,
      video_on             => video_on,
      eof                  => eof,
      pixel_row            => pixel_row,
      pixel_column         => pixel_column,
      bottom_tank_x        => bottom_tank_x,
      bottom_tank_y        => bottom_tank_y,
      top_tank_x           => top_tank_x,
      top_tank_y           => top_tank_y,
      bottom_bullet_active => bottom_bullet_active,
      bottom_bullet_x      => bottom_bullet_x,
      bottom_bullet_y      => bottom_bullet_y,
      top_bullet_active    => top_bullet_active,
      top_bullet_x         => top_bullet_x,
      top_bullet_y         => top_bullet_y,		
      red_out              => vga_red,
      blue_out             => vga_blue,
      green_out            => vga_green
    );

  ------------------------------------------------------------------
  -- 8) Dump 多個 frame 到 frames_dump.txt
  --    並在每一 frame 開頭打一個 move_pulse；
  --    fire_bottom 只在「第 1 frame 開頭」拉一次（只發射一顆子彈）
  ------------------------------------------------------------------
  dump_proc : process
    file f          : text open write_mode is "frames_dump111.txt";
    variable L      : line;
    variable row_i  : integer;
    variable col_i  : integer;
    variable r_i    : integer;
    variable g_i    : integer;
    variable b_i    : integer;

    variable frame_idx : integer := 0;     -- 已經完成的 frame 數
    variable prev_eof  : std_logic := '0'; -- 用來偵測 eof 的 0→1 上升緣
  begin
    -- 主迴圈：一直跑到抓完 TOTAL_FRAMES 偵
    while frame_idx < TOTAL_FRAMES loop
      -- 每個 pixel clock 都進來一次
      wait until rising_edge(vga_clk);

      -- 預設這拍不移動 / 不開火
      move_pulse   <= '0';
      fire_bottom  <= '0';

      -- 偵測 eof 的 0->1 上升緣：代表「新的一偵開始」
      if (prev_eof = '0') and (eof = '1') then
        frame_idx := frame_idx + 1;

        -- 在每一偵開始的那個 pixel clock 打一下 move_pulse
        move_pulse <= '1';

        -- 只在第一個 frame 開始時 fire 一次
        if frame_idx = 1 then
          fire_bottom <= '1';
        end if;

        -- frame header（方便 debug）
        write(L, string'("FRAME "));
        write(L, frame_idx);
        writeline(f, L);
      end if;
      prev_eof := eof;

      -- 只在 video_on = 1 的時候記錄畫面
      if (video_on_pipe = '1') and (frame_idx > 0) then
        -- 把座標轉成整數
        row_i := to_integer(unsigned(pixel_row_pipe));
        col_i := to_integer(unsigned(pixel_column_pipe));
        -- 把顏色強度轉成整數
        r_i   := to_integer(unsigned(vga_red));
        g_i   := to_integer(unsigned(vga_green));
        b_i   := to_integer(unsigned(vga_blue));

        -- 寫一行：frame,row,col : R,G,B
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

    -- 跑到這裡代表抓完 TOTAL_FRAMES 偵了
    report "Captured " & integer'image(frame_idx) & " frames. Simulation stop." severity note;
    assert false report "End of simulation" severity failure;
  end process;

  ------------------------------------------------------------------
  -- Debug：每次 pixel_column 接近邊界時印出真實值
  ------------------------------------------------------------------
  debug_proc : process
  begin
    wait until rising_edge(vga_clk);

    if unsigned(pixel_column) = 639 and video_on = '1' then
      report "DBG  clk  col=" & integer'image(to_integer(unsigned(pixel_column)))
          & "  row=" & integer'image(to_integer(unsigned(pixel_row)))
          & "  video_on=" & std_logic'image(video_on)
          & "  eof=" & std_logic'image(eof);
    end if;
  end process;

end architecture sim;