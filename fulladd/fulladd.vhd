library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fulladd is 
	port(a :in std_logic;
	     b :in std_logic;
		  cin :in std_logic;
		  s :out std_logic;
		  cout :out std_logic);
end entity fulladd;

architecture dataflow of fulladd is
begin
	cout <= (a and b) or (b and cin) or (a and cin);
	s <= a xor b xor cin;
	
end architecture dataflow;