library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fulladd_clg is
	generic(width_clg: integer:=4;
			  width_gp :integer:=4;
			  width_cmiddle :integer:=3);
	port(a :in std_logic_vector(width_clg-1 downto 0);
	     b :in std_logic_vector(width_clg-1 downto 0);
		  cin :in std_logic;
		  s :out std_logic_vector(width_clg-1 downto 0);
		  cout :out std_logic);
end entity fulladd_clg;

architecture structure of fulladd_clg is
	component clg is
	port(cin :in std_logic;
		  g :in std_logic_vector(width_gp-1 downto 0);
		  p :in std_logic_vector(width_gp-1 downto 0);
		  c_middle :out std_logic_vector(width_cmiddle-1 downto 0);
		  cout :out std_logic);
	end component;
	component fulladd is
	port(a :in std_logic;
	     b :in std_logic;
		  cin :in std_logic;
		  g :out std_logic;
		  p :out std_logic;
		  s :out std_logic
		  );
	end component;
	signal g :std_logic_vector(width_gp-1 downto 0);
	signal p :std_logic_vector(width_gp-1 downto 0);
	signal c_middle :std_logic_vector(width_cmiddle-1 downto 0);
begin
	c0: clg
	port map(cin => cin,g => g,p => p,c_middle => c_middle,cout => cout);
	f0: fulladd
	port map(a => a(0), b => b(0), cin => cin, s => s(0), g => g(0), p => p(0));
	f1: fulladd
	port map(a => a(1), b => b(1), cin => c_middle(0), s => s(1), g => g(1), p => p(1));
	f2: fulladd
	port map(a => a(2), b => b(2), cin => c_middle(1), s => s(2), g => g(2), p => p(2));
	f3: fulladd
	port map(a => a(3), b => b(3), cin => c_middle(2), s => s(3), g => g(3), p => p(3));

end architecture structure;