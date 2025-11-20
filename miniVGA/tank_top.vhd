library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tank_top is

generic(
	SCREEN_WIDTH: integer:=640;
	TANK_WIDTH: integer:=32;
	WALL_WIDTH: integer:=5;
	
	X_INIT: integer:=593;
	Y_FIXED: integer:=0;
	INIT_DIR: std_logic:='0'
);
port(
	clk:in std_logic;
	rst_n:in std_logic;
	move_pulse:in std_logic;
	speed_sel:in std_logic_vector(1 downto 0);
	freeze:in std_logic;
	
	tankx: out std_logic_vector(9 downto 0);
	tanky: out std_logic_vector(9 downto 0);
	tank_dir: out std_logic	
);

end entity tank_top;

architecture behavior of tank_top is
--------------------------------------------
	type state_t is (RUN, STOP);
	signal state_reg, state_next:state_t; 
--------------------------------------------
	signal x_reg, x_next: unsigned(9 downto 0);
	signal y_reg, y_next: unsigned(9 downto 0);
	signal dir_reg, dir_next: std_logic;
---------------------------------------------
	constant DIR_RIGHT : std_logic := '1';
	constant DIR_LEFT  : std_logic := '0';
---------------------------------------------
	constant X_MIN_INT : integer := WALL_WIDTH; 
	constant X_MAX_INT : integer := SCREEN_WIDTH - WALL_WIDTH - TANK_WIDTH;
begin

	---register value---------
	reg:process(clk, rst_n)
	begin
		if rst_n = '0' then
			state_reg <= RUN;
			x_reg <= to_unsigned(X_INIT, 10);
			y_reg <= to_unsigned(Y_FIXED, 10);
			dir_reg <= INIT_DIR;
		elsif rising_edge(clk) then
			state_reg <= state_next;
			x_reg <= x_next;
			y_reg <= y_next;
			dir_reg <= dir_next;
		end if;
	end process reg;
	---combinational logics-----
	comb:process(all)
		variable step: integer range 0 to 100;
		variable x_temp:integer range -100 to 1024;
	begin
		state_next <= state_reg;
		x_next <= x_reg;
		y_next <= y_reg;
		dir_next <= dir_reg;
			
		case(speed_sel) is
			when "00" => step:=10;
			when "01" => step:=20;
			when "10" => step:=30;
			when others => step:=10;
		end case;
		
		case(state_reg) is
		when RUN => 
			if freeze = '1' then
				state_next <= STOP;
			elsif move_pulse = '1' and step /= 0 then
				x_temp := to_integer(x_reg);
				-------direction check-----
				if dir_reg = DIR_RIGHT then
					x_temp := x_temp + step;
				else
					x_temp := x_temp - step;
				end if;
				------collison check-------
				if x_temp <= X_MIN_INT then
					x_temp   := X_MIN_INT;
					dir_next <= DIR_RIGHT;
				elsif x_temp >= X_MAX_INT then
					x_temp   := X_MAX_INT;
					dir_next <= DIR_LEFT;
				end if;
				x_next <= to_unsigned(x_temp, 10);
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
	end process comb;
---------------------------------------------------------
	tankx <= std_logic_vector(x_reg);
	tanky   <= std_logic_vector(y_reg);
	tank_dir <= dir_reg;

end architecture behavior;