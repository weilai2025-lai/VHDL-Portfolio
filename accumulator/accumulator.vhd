library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity accumulator is 
	generic(width: integer:=32);
	port(clk :in std_logic;
		  rst :in std_logic;
		  w_en :in std_logic;
		  acc_out :out std_logic_vector(width-1 downto 0));
end entity accumulator;

architecture behavioral of accumulator is
	signal acc_outs :unsigned(width-1 downto 0);
begin
	process(clk)
	begin
	if rising_edge(clk) then
		if (rst = '1') then
		acc_outs <= (others => '0');
		else 
			if (w_en = '1') then
			acc_outs <= acc_outs + 1;
			end if;
		end if;
	end if;
	end process;
	acc_out <= std_logic_vector(acc_outs);
end architecture behavioral;