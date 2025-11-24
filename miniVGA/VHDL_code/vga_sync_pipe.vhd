library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity vga_sync_pipe is
    port(
        clock_50mhz    : in  std_logic;
        horiz_sync_out : out std_logic;
        verti_syn_out  : out std_logic;
        video_on		  : out std_logic;
		  video_on_pipe  : out std_logic;
        pixel_clock    : out std_logic;
        eof            : out std_logic;
        pixel_row      : out std_logic_vector(9 downto 0);
		  pixel_row_pipe : out std_logic_vector(9 downto 0);
        pixel_column   : out std_logic_vector(9 downto 0);
		  pixel_column_pipe   : out std_logic_vector(9 downto 0)
    );
end entity vga_sync_pipe;

architecture behavior of vga_sync_pipe is
    ----------------------------------------------------------------
    -- 內部訊號
    ----------------------------------------------------------------
    signal horiz_sync      : std_logic := '1';
    signal verti_sync      : std_logic := '1';
    signal pixel_clock_int : std_logic := '0';
    signal video_on_v      : std_logic := '0';
    signal video_on_h      : std_logic := '0';
    signal h_count         : unsigned(9 downto 0) := (others => '0');
    signal v_count         : unsigned(9 downto 0) := (others => '0');
	 ---------pipeline對齊-------------------------------------------
	 signal video_on_vd1, video_on_vd2 :std_logic;
	 signal video_on_hd1, video_on_hd2 :std_logic;
	 signal pixel_columnd1, pixel_columnd2 :std_logic_vector(9 downto 0);
	 signal pixel_rowd1, pixel_rowd2 :std_logic_vector(9 downto 0);
    ----------------------------------------------------------------
    -- 水平 / 垂直 timing 參數
    ----------------------------------------------------------------
    constant h_pixel_visible : natural := 640;
    constant h_sync_low      : natural := 664;
    constant h_sync_high     : natural := 760;
    constant h_end_count     : natural := 800;

    constant v_pixel_visible : natural := 480;
    constant v_sync_low      : natural := 491;
    constant v_sync_high     : natural := 493;
    constant v_end_count     : natural := 525;

begin
    ----------------------------------------------------------------
    -- 50 MHz → pixel clock (25 MHz) 分頻
    ----------------------------------------------------------------
    clock_divide : process(clock_50mhz)
    begin
        if rising_edge(clock_50mhz) then
            pixel_clock_int <= not pixel_clock_int;
        end if;
    end process;

    pixel_clock <= pixel_clock_int;

    ----------------------------------------------------------------
    -- video_on：完全註冊後的 H/V 可視區
    ----------------------------------------------------------------
    video_on <= video_on_h and video_on_v;
	 video_on_pipe <= video_on_hd2 and video_on_vd2;
	 pixel_column_pipe <= pixel_columnd2;
	 pixel_row_pipe <= pixel_rowd2;
    ----------------------------------------------------------------
    -- 主 process：計數 / 同步 / 可視區 / 座標
    ----------------------------------------------------------------
    pixel_process : process(pixel_clock_int)
        -- next-state 變數
        variable h_next : unsigned(9 downto 0);
        variable v_next : unsigned(9 downto 0);
    begin
        if rising_edge(pixel_clock_int) then

            --------------------------------------------------------
            -- 1) 先算「下一拍」的 h_count
            --------------------------------------------------------
            if h_count = to_unsigned(h_end_count, h_count'length) then
                h_next := (others => '0');
            else
                h_next := h_count + 1;
            end if;

            --------------------------------------------------------
            -- 2) 再用 h_next 來決定 v_next（每行只在特定 h 位置 +1）
            --------------------------------------------------------
            v_next := v_count;  -- 先假設不變

            if (v_count >= to_unsigned(v_end_count, v_count'length)) and
               (h_next  >= to_unsigned(h_sync_low,  h_next'length)) then
                v_next := (others => '0');
            elsif (h_next = to_unsigned(h_sync_low, h_next'length)) then
                v_next := v_count + 1;
            end if;

            --------------------------------------------------------
            -- 3) 用 h_next / v_next 來產生 sync 訊號
            --------------------------------------------------------
            -- 水平 sync
            if (h_next <= to_unsigned(h_sync_high, h_next'length)) and
               (h_next >= to_unsigned(h_sync_low,  h_next'length)) then
                horiz_sync <= '0';
            else
                horiz_sync <= '1';
            end if;

            -- 垂直 sync
            if (v_next <= to_unsigned(v_sync_high, v_next'length)) and
               (v_next >= to_unsigned(v_sync_low,  v_next'length)) then
                verti_sync <= '0';
            else
                verti_sync <= '1';
            end if;

            --------------------------------------------------------
            -- 4) 用 h_next / v_next 來決定「可視區 + 座標」
            --    這裡是根本對齊的關鍵
            --------------------------------------------------------
            -- 水平可視區 / column
            if (h_next < to_unsigned(h_pixel_visible, h_next'length)) then
                video_on_h   <= '1';
					 video_on_hd1   <= video_on_h;
					 video_on_hd2   <= video_on_hd1;
                pixel_column <= std_logic_vector(h_next);
					 pixel_columnd1 <=  pixel_column;
					 pixel_columnd2 <=  pixel_columnd1;
            else
                video_on_h   <= '0';
					 video_on_hd1   <= video_on_h;
					 video_on_hd2   <= video_on_hd1;
					 pixel_columnd1 <=  pixel_column;
					 pixel_columnd2 <=  pixel_columnd1;
                --pixel_column <= (others => '0');  -- 離開可視區就不留舊值
            end if;

            -- 垂直可視區 / row
            if (v_next < to_unsigned(v_pixel_visible, v_next'length)) then
                video_on_v <= '1';
					 video_on_vd1   <= video_on_v;
					 video_on_vd2   <= video_on_vd1;
                pixel_row  <= std_logic_vector(v_next);
					 pixel_rowd1 <=  pixel_row;
					 pixel_rowd2 <=  pixel_rowd1;
                eof        <= '0';
            else
                video_on_v <= '0';
					 video_on_vd1   <= video_on_v;
					 video_on_vd2   <= video_on_vd1;
					 pixel_rowd1 <=  pixel_row;
					 pixel_rowd2 <=  pixel_rowd1;
                --pixel_row  <= (others => '0');
                eof        <= '1';
            end if;

            --------------------------------------------------------
            -- 5) 最後才把 next-state 寫回暫存器
            --------------------------------------------------------
            h_count <= h_next;
            v_count <= v_next;

            horiz_sync_out <= horiz_sync;
            verti_syn_out  <= verti_sync;

        end if;
    end process;

end architecture behavior;