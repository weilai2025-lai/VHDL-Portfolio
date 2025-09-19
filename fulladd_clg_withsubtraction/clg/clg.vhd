library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clg is
	generic(width_gp: integer:=4;
			  width_cmiddle: integer:=3);
	port(cin :in std_logic;
		  g :in std_logic_vector(width_gp-1 downto 0);
		  p :in std_logic_vector(width_gp-1 downto 0);
		  c_middle :out std_logic_vector(width_cmiddle-1 downto 0);
		  cout :out std_logic);
end entity clg;

architecture gatelevel of clg is
begin
	c_middle(0) <= g(0) or (p(0) and cin);
	c_middle(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
	c_middle(2) <= g(2) or (p(2) and g(1)) or (p(1) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
	cout <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);
end architecture gatelevel;