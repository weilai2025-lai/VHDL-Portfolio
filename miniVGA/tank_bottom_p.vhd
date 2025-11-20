library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tank_bottom_p is

	generic(
		SCREEN_WIDTH: integer:=640;
		TANK_WIDTH:integer:=32;
		WALL_WIDTH:integer:=5;
		
		X_INIT:integer:=10;
		Y_FIXED:integer:=470;
		INIT_DIR:std_logic:='1'
	);

	port(
		clk:in std_logic;
		rst_n:in std_logic;
		move_pulse:in std_logic;
		freeze:in std_logic;
		speed_sel:in std_logic_vector(1 downto 0);
		tankx:out std_logic_vector(9 downto 0);
		tanky:out std_logic_vector(9 downto 0);
		tank_dir:out std_logic
		
	);

end entity tank_bottom_p;


architecture behavior of tank_bottom_p is
	type state_t is (RUN, STOP);
	signal state_reg, state_next:state_t;
	signal tankx_reg,tankx_next:unsigned(9 downto 0);
	signal tanky_reg,tanky_next:unsigned(9 downto 0);
	signal tank_dir_reg, tank_dir_next:std_logic;
	
	constant DIR_RIGHT:std_logic:='1';
	constant DIR_LEFT:std_logic:='0';

begin
	reg:process(clk, rst_n)
	begin
		if rst_n  = '0' then
			state_reg <= RUN;
			tankx_reg <= to_unsigned(X_INIT, tankx_reg'length);
			tanky_reg <= to_unsigned(Y_FIXED, tanky_reg'length);
			tank_dir_reg <= INIT_DIR;
		elsif rising_edge(clk) then
			 tankx_reg <= tankx_next;
			 tanky_reg <= tanky_next;
			 tank_dir_reg <= tank_dir_next;
			 state_reg <= state_next;
		end if;
	end process reg;
	
	cal:process(all)
		variable step:integer range 0 to 100;
		variable x_temp:integer range -100 to 1023;
	begin
		 tankx_next <= tankx_reg;
		 tanky_next <= tanky_reg;
		 tank_dir_next <= tank_dir_reg;
		 state_next <= state_reg;
		 
		 case(speed_sel) is
		 when "00" => step:= 10;
		 when "01" => step:= 20;
		 when "10" => step:= 30;
		 when others => step:= 10;
		 end case;
		 
		 case(state_reg) is
		 
		 when RUN => 
			if freeze = '1' then
				state_next <= STOP;
			elsif move_pulse = '1' and step /= 0 then
				x_temp := to_integer(tankx_reg);
				if tank_dir_reg = DIR_RIGHT then
					if x_temp + step + TANK_WIDTH >= SCREEN_WIDTH - WALL_WIDTH then
						tank_dir_next <= DIR_LEFT;
						x_temp := SCREEN_WIDTH - WALL_WIDTH - TANK_WIDTH;
					else
						x_temp := x_temp + step;
					end if;
				else
					if x_temp - step <= WALL_WIDTH then
						tank_dir_next <= DIR_RIGHT;
						x_temp := WALL_WIDTH;
					else
						x_temp := x_temp - step;
					end if;
				end if;
				tankx_next <= to_unsigned(x_temp, tankx_next'length);
			end if;
		
		 when STOP =>
				if freeze = '0' then
					state_next <= RUN;
				else
					state_next <= STOP;
				end if;
				
		 when others => 
				state_next <= RUN;
		 end case;
		 
		 tankx <= std_logic_vector(tankx_reg);
		 tanky <= std_logic_vector(tanky_reg);
		 tank_dir <= tank_dir_reg;
	end process cal;

end architecture behavior;