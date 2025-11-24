library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ps2_7seg_top is
    port(
        -- 板子 50MHz 系統時脈
        CLOCK_50  : in  std_logic;
        -- reset，假設接在某個 KEY 上，active-low
        RESET_N   : in  std_logic;
        -- PS/2 鍵盤介面
        PS2_CLK   : in  std_logic;
        PS2_DAT   : in  std_logic;
        -- 四個七段顯示器（每個 7 segment，active-low）
        HEX0      : out std_logic_vector(6 downto 0);
        HEX1      : out std_logic_vector(6 downto 0);
        HEX2      : out std_logic_vector(6 downto 0);
        HEX3      : out std_logic_vector(6 downto 0)
    );
end entity ps2_7seg_top;

architecture rtl of ps2_7seg_top is

    -- 從 ps2 模組拉出來的訊號
    signal scan_code_s   : std_logic_vector(7 downto 0);
    signal scan_ready_s  : std_logic;
    signal hist0_s       : std_logic_vector(7 downto 0);
    signal hist1_s       : std_logic_vector(7 downto 0);
    signal hist2_s       : std_logic_vector(7 downto 0);
    signal hist3_s       : std_logic_vector(7 downto 0);

begin

    ----------------------------------------------------------------
    -- 實例化 ps2：負責解 PS/2 協定，輸出 scan_code / hist*
    ----------------------------------------------------------------
    u_ps2: entity work.ps2
        port map(
            keyboard_clk   => PS2_CLK,
            keyboard_data  => PS2_DAT,
            clock_50MHz    => CLOCK_50,
            reset          => RESET_N,
            scan_code      => scan_code_s,
            scan_readyo    => scan_ready_s,
            hist3          => hist3_s,
            hist2          => hist2_s,
            hist1          => hist1_s,
            hist0          => hist0_s
        );

    ----------------------------------------------------------------
    -- 把 hist0 / hist1 的高低 4bit 映射到 4 個七段顯示器
    -- HEX0：hist0[3:0]  (最低 nibble)
    -- HEX1：hist0[7:4]
    -- HEX2：hist1[3:0]
    -- HEX3：hist1[7:4]
    ----------------------------------------------------------------

    u_hex0: entity work.leddcd
        port map(
            data_in      => hist0_s(3 downto 0),
            segments_out => HEX0
        );

    u_hex1: entity work.leddcd
        port map(
            data_in      => hist0_s(7 downto 4),
            segments_out => HEX1
        );

    u_hex2: entity work.leddcd
        port map(
            data_in      => hist1_s(3 downto 0),
            segments_out => HEX2
        );

    u_hex3: entity work.leddcd
        port map(
            data_in      => hist1_s(7 downto 4),
            segments_out => HEX3
        );

end architecture rtl;