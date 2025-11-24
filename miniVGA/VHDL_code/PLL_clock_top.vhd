library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity PLL_clock_top is	
	port(
		clock_50MHz:in std_logic;
		freeze:in std_logic;
		rst_n:in std_logic;
		clock_100Mhz:out std_logic;
		move_pulse:out std_logic
	);
end entity PLL_clock_top;


architecture rtl of PLL_clock_top is
	signal counter_accum:unsigned(20 downto 0):=(others => '0');
	signal clock_100Mhz_int:std_logic;
	signal freeze_reg:std_logic;
	constant CNT_MAX: unsigned(20 downto 0):= to_unsigned(1999999, 21);
begin
--------------------------------------------
	uPLL:entity work.PLL_clock
	port map(
		areset => '0',
		inclk0 => clock_50MHz,
		c0 => clock_100Mhz_int,
		locked => open
	);
--------------------------------------------	
	gen_pulse:process(clock_100Mhz_int, rst_n)
	begin
	if rst_n = '0' then
		freeze_reg <= '0';
		counter_accum <= (others => '0');
		move_pulse <= '0';
	elsif rising_edge(clock_100Mhz_int) then
		if freeze = '1' then
			freeze_reg <= '1';
		end if;
		if freeze_reg = '1' then
			move_pulse <= '0';
			counter_accum <= counter_accum;
		else
			if counter_accum = CNT_MAX then
				counter_accum <= (others => '0');
				move_pulse <= '1';
			else
				counter_accum <= counter_accum + 1;
				move_pulse <= '0';
			end if;
		end if;
	end if;
	end process gen_pulse;
---------------------------------------------
	clock_100Mhz <= clock_100Mhz_int;
end architecture rtl;
