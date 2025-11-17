library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity vga_dynamic_tb is
end entity vga_dynamic_tb;

architecture sim of vga_dynamic_tb is
  ------------------------------------------------------------------
  -- 1) 基本時脈 / reset
  ------------------------------------------------------------------
  constant T_50       : time   := 20 ns;   -- 50 MHz
  constant TOTAL_FRAMES : integer := 2;   -- 要截多少偵（你可以先改成 5 測試）

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

  ------------------------------------------------------------------
  -- 3) tank 相關訊號
  ------------------------------------------------------------------
  -- bottom tank (會動)
  signal bottom_tank_x : std_logic_vector(9 downto 0);
  signal bottom_tank_y : std_logic_vector(9 downto 0);

  -- top tank (先用固定位置：右上角)
  signal top_tank_x    : std_logic_vector(9 downto 0);
  signal top_tank_y    : std_logic_vector(9 downto 0);

  -- 控制 bottom tank 的移動
  signal move_pulse    : std_logic := '0';
  signal speed_sel     : std_logic_vector(1 downto 0) := "00";  -- 慢速
  signal freeze        : std_logic := '0';

  -- 給 top tank 用的常數（右上角）
  constant SCREEN_WIDTH_C : integer := 640;
  constant WALL_WIDTH_C   : integer := 5;
  constant TANK_WIDTH_C   : integer := 32;
  constant TOP_TANK_X_INT : integer := SCREEN_WIDTH_C - WALL_WIDTH_C - TANK_WIDTH_C;
begin
  ------------------------------------------------------------------
  -- 固定 top tank 的座標（右上角）
  ------------------------------------------------------------------
  top_tank_x <= std_logic_vector(to_unsigned(TOP_TANK_X_INT, 10));
  top_tank_y <= (others => '0');  -- y=0，佔用 0~9 列

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
  u_sync : entity work.vga_sync
    port map(
      clock_50mhz    => clock_50,
      horiz_sync_out => horiz_sync,
      verti_syn_out  => verti_sync,
      video_on       => video_on,
      pixel_clock    => vga_clk,
      eof            => eof,
      pixel_row      => pixel_row,
      pixel_column   => pixel_column
    );

  ------------------------------------------------------------------
  -- 6) 實例化 bottom tank（用你寫好的 tank_bottom）
  --    注意：這裡我讓 tank 的 clk 用 vga_clk，方便用「每偵移動一次」的脈衝
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
      clk       => vga_clk,        -- 注意：這裡用 pixel clock
      rst_n     => reset_n,
      move_pulse=> move_pulse,
      speed_sel => speed_sel,      -- tb 固定 "00"
      freeze    => freeze,         -- tb 固定 '0'
      tankx     => bottom_tank_x,
      tanky     => bottom_tank_y,
      tank_dir  => open            -- 目前沒用到方向
    );

  ------------------------------------------------------------------
  -- 7) 實例化 pixelGenerator_dynamicmodule
  --    clk / ROM_clk 都用 vga_clk，與 pixel_row/column 同步
  ------------------------------------------------------------------
  u_pix : entity work.pixelGenerator_dynamicmodule
    port map(
      clk           => vga_clk,
      ROM_clk       => vga_clk,
      rst_n         => reset_n,
      video_on      => video_on,
      eof           => eof,
      pixel_row     => pixel_row,
      pixel_column  => pixel_column,
      bottom_tank_x => bottom_tank_x,
      bottom_tank_y => bottom_tank_y,
      top_tank_x    => top_tank_x,
      top_tank_y    => top_tank_y,
      red_out       => vga_red,
      blue_out      => vga_blue,
      green_out     => vga_green
    );

  ------------------------------------------------------------------
  -- 8) Dump 多個 frame 到同一個檔案 frames_dump.txt
  --    並且在每一偵的開始打一個 move_pulse，坦克就往前走一步
  ------------------------------------------------------------------
  dump_proc : process
    file f          : text open write_mode is "frames_dump.txt";
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

      -- 預設 move_pulse 為 0，只在偵開始那一個 clock 拉高
      move_pulse <= '0';

      -- 偵測 eof 的 0->1 上升緣：代表「新的一偵開始」
      if (prev_eof = '0') and (eof = '1') then
        frame_idx := frame_idx + 1;

        -- 在每一偵開始的那個 pixel clock 打一下 move_pulse
        move_pulse <= '1';

        -- 也可以寫一個 frame header 方便 debug
        write(L, string'("FRAME "));
        write(L, frame_idx);
        writeline(f, L);
      end if;
      prev_eof := eof;

      -- 只在 video_on = 1 的時候記錄畫面
      if (video_on = '1') and (frame_idx > 0) then
        -- 把座標轉成整數
        row_i := to_integer(unsigned(pixel_row));
        col_i := to_integer(unsigned(pixel_column));
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
    assert false report "End of simulation" severity failure;  -- 用 assert 讓 run -all 停住
    --std.env.stop;
  end process;
  
	  ------------------------------------------------------------------
	-- Debug：每次 pixel_column 接近邊界時印出真實值
	------------------------------------------------------------------
	debug_proc : process
	begin
	  wait until rising_edge(vga_clk);

	  -- 只檢查 col = 637、638、639、640
	  if unsigned(pixel_column) = 639 and video_on = '1' then
		 report "DBG  clk  col=" & integer'image(to_integer(unsigned(pixel_column)))
				& "  row=" & integer'image(to_integer(unsigned(pixel_row)))
				& "  video_on=" & std_logic'image(video_on)
				& "  eof=" & std_logic'image(eof);
	  end if;

	end process;

end architecture sim;