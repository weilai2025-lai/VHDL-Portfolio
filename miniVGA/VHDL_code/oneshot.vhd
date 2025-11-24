LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity oneshot IS
	port(
		pulse_out : out std_logic;
		trigger_in : in std_logic; 
		clk: in std_logic 
		);
end oneshot;

architecture dd of oneshot is 
signal delay : std_logic;
begin
	process(clk) is
		begin
		if(rising_edge(clk)) then
			if (trigger_in = '1' and delay = '0') then
				pulse_out <= '1';
			else
				pulse_out <= '0';
				delay <= trigger_in;
			end if;
		end if;
	end process;
	
end dd;