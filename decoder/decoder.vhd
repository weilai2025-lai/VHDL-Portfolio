library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder is
	generic(width_in: integer:=3;
	        width_out: integer:=8);
	port(Din :in std_logic_vector(width_in-1 downto 0);
	     Dout :out std_logic_vector(width_out-1 downto 0));
end entity decoder;

architecture behavioral of decoder is
begin
	process(all)
	begin
	case to_integer(unsigned(Din)) is
		when 0 => Dout <= b"00000001";
		when 1 => Dout <= b"00000010";
		when 2 => Dout <= b"00000100";
		when 3 => Dout <= b"00001000";
		when 4 => Dout <= b"00010000";
		when 5 => Dout <= b"00100000";
		when 6 => Dout <= b"01000000";
		when 7 => Dout <= b"10000000";
		when others => Dout <= (others => '0');
	end case;
	end process;
end architecture behavioral;