library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE>NUMERIC_STD.ALL;

entity binary_to_bcd is
	generic(binary_width : integer:=31;
			  bcd_digits : integer:=10
	);
	port(clk, rst_n :in std_logic;
		  start :in std_logic;
		  binary_in :in std_logic_vector(binary_width-1 downto 0);
		  bcd_out :out std_logic_vector(bcd_digits-1 downto 0);
		  done :out std_logic
		  );
end entity binary_to_bcd;


architecture behavioral of binary_to_bcd is
	--define state machine
	type state_type is (s_idle, s_covert, s_done);
	signal state: state_type:=s_idle;
	-- inert register
	signal count :integer range 0 to binary_width;
	-- inert shifter
	signal shifter :std_logic_vector(binary_width + bcd_digits*4 -1 downto 0);
	signal bcd_plus3 : std_logic_vector(bcd_digits*4 -1 downto 0);
begin
	


end architecture behavioral;