library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fulladd_4bit is
	generic(width: integer:=4);
	port (a :in std_logic_vector(width-1 downto 0);
	      b :in std_logic_vector(width-1 downto 0);
			cin : in std_logic;
			s :out std_logic_vector(width-1 downto 0);
			cout :out std_logic);
end entity fulladd_4bit;

architecture structure of fulladd_4bit is
	component fulladd is
	port(a :in std_logic;
	     b :in std_logic;
		  cin :in std_logic;
		  s :out std_logic;
		  cout :out std_logic);
	end component;
	signal carry_in :std_logic_vector(width-2 downto 0);
begin
	f0: fulladd
	port map(a => a(0), b => b(0), cin => cin, s => s(0), cout => carry_in(0));
	f1: fulladd
	port map(a => a(1), b => b(1), cin => carry_in(0), s => s(1), cout => carry_in(1));
	f2: fulladd
	port map(a => a(2), b => b(2), cin => carry_in(1), s => s(2), cout => carry_in(2));
	f3: fulladd
	port map(a => a(3), b => b(3), cin => carry_in(2), s => s(3), cout => cout);
	
	
end architecture structure;