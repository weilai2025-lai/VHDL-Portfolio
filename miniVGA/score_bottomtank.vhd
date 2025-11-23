library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity score_bottomtank is

	port(
		clk, rst_n:in std_logic;
		collision_state_bottom:in std_logic;
		score:out std_logic_vector(3 downto 0);
		freeze:out std_logic
		);
end score_bottomtank;

architecture rtl of score_bottomtank is
	constant win_score:unsigned(3 downto 0):=to_unsigned(3, score'length);
	type state_t is (playing, ending);
	signal state_reg, state_next:state_t;
	signal score_reg, score_next:unsigned(3 downto 0);	
	signal freeze_reg, freeze_next:std_logic;
	
begin
	reg:process(clk, rst_n)
	begin
	if rst_n = '0' then
		score_reg <= (others => '0');
		state_reg <= playing;
		freeze_reg <= '0';
	elsif rising_edge(clk) then
		score_reg <= score_next;
		state_reg <= state_next;
		freeze_reg <= freeze_next;
	end if;
	end process reg;
	
	comb:process(all)
	begin
	score_next <= score_reg;
	state_next <= state_reg;
   freeze_next <= freeze_reg;
	case(state_reg) is
		when playing =>
			if score_reg >=  win_score then
				state_next <= ending;
				freeze_next <= '1';
			else
				state_next <= playing;
				if collision_state_bottom = '1' then
					score_next <= score_reg + to_unsigned(1, score_reg'length); 
				else
					score_next <= score_reg;
				end if;
			end if;
		when ending => 
			state_next <= ending;
			score_next <= score_reg;
			freeze_next <= '1';
	end case;
	end process;
	score <= std_logic_vector(score_reg);
	freeze <= freeze_reg;
end architecture rtl;