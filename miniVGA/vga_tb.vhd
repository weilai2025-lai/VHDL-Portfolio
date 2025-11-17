library IEEE;
library STD;
use std.textio.all;
use ieee.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity vga_tb is
end entity;

architecture sim of vga_tb is
  ------------------------------------------------------------------
  -- 1) 時脈 / 重置信號
  ------------------------------------------------------------------
  constant T_50 : time := 20 ns;  -- 50 MHz

  signal clock_50   : std_logic := '0';
  signal reset_n    : std_logic := '0';

  ------------------------------------------------------------------
  -- 2) VGA_SYNC / pixelGenerator 之間的連線
  ------------------------------------------------------------------
  signal horiz_sync   : std_logic;
  signal verti_sync   : std_logic;
  signal vga_blank    : std_logic;
  signal vga_clk      : std_logic;
  signal video_on     : std_logic;
  signal eof          : std_logic;

  signal pixel_row    : std_logic_vector(9 downto 0);
  signal pixel_column : std_logic_vector(9 downto 0);

  signal vga_red      : std_logic_vector(9 downto 0);
  signal vga_green    : std_logic_vector(9 downto 0);
  signal vga_blue     : std_logic_vector(9 downto 0);

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
  --rst_proc : process
  --begin
    --reset_n <= '0';
    --wait for 200 ns;
    --reset_n <= '1';
    --wait;  -- 之後一直保持 '1'
  --end process;

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
  -- 6) 實例化 pixelGenerator（用你自己那版）
  ------------------------------------------------------------------
  u_pix : entity work.pixelGenerator_staticmodule
    port map(
      clk          => clock_50,     -- 你現在 pixelDraw 用的是 50MHz
      ROM_clk      => vga_clk,      -- colorROM 用 pixel clock
      rst_n        => reset_n,
      video_on     => video_on,
      eof          => eof,
      pixel_row    => pixel_row,
      pixel_column => pixel_column,
      red_out      => vga_red,
      blue_out     => vga_blue,
      green_out    => vga_green
    );

  ------------------------------------------------------------------
  -- 7) Dump 一個 frame 的 (row, col, R, G, B) 到文字檔
  ------------------------------------------------------------------
  dump_proc : process
    file f          : text open write_mode is "frame_dump.txt";
    variable L      : line;
    variable row_i  : integer;
    variable col_i  : integer;
    variable r_i    : integer;
    variable g_i    : integer;
    variable b_i    : integer;
    variable frame_done : boolean := false;
  begin
    -- 每一顆 pixel clock 抓一次
    wait until rising_edge(vga_clk);

    if video_on = '1' then
      -- 把座標轉成整數
      row_i := to_integer(unsigned(pixel_row));
      col_i := to_integer(unsigned(pixel_column));
      -- 把顏色強度轉成整數
      r_i   := to_integer(unsigned(vga_red));
      g_i   := to_integer(unsigned(vga_green));
      b_i   := to_integer(unsigned(vga_blue));

      -- 寫一行：row,col : R,G,B
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

    -- 簡單示範：看到第一個 eof 就結束模擬
    if eof = '1' and not frame_done then
      frame_done := true;
      -- 給一點時間寫完最後幾行，再結束模擬
      wait for 1 us;
      assert false report "End of 1 frame" severity failure;
		--std.env.stop; 
    end if;
  end process;

end architecture sim;