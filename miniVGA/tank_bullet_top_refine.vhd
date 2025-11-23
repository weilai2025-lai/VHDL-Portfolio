library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity tank_bullet_top_refine is

	generic(
		SCREEN_WIDTH:integer:= 640;
		SCREEN_HEIGHT:integer:= 480;
		TOP_TANKY_BOUNDARY:integer:= 9;--0 + tank_height - 1
		BOTTOM_TANKY_BOUNDARY:integer:= 470;-- SCREEN_HEIGHT-1 - tank_height + 1
		WALL_WIDTH:integer:= 5;
		TANK_W:integer:= 32;
		TANK_H:integer:= 10;
		BULLET_SIZE:integer:= 5;
		DIR_UP:std_logic:= '0'; --1:up 0: down
		STEP_PIXELS:integer:= 5 --bullet's moving speed
	);

	port(
		clk, rst_n:in std_logic;
		move_pulse:in std_logic;
		fire:in std_logic;
		enemytankx:in std_logic_vector(9 downto 0);
		tankx, tanky:in std_logic_vector(9 downto 0);
		tank_dir:in std_logic;
		speed_sel:in std_logic_vector(1 downto 0);
		bullet_active:out std_logic;
		bullet_x, bullet_y:out std_logic_vector(9 downto 0);
		collision_state:out std_logic
		);

end entity tank_bullet_top_refine;

architecture behavior of tank_bullet_top_refine is
--------define state---------
	type state_t is (IDLE, FLY);
	signal state_reg, state_next:state_t;
-------register value---------
	signal x_reg, x_next:unsigned(9 downto 0);
	signal y_reg, y_next:unsigned(9 downto 0);
	signal active_reg, active_next:std_logic;
	signal fire_reg, fire_next:std_logic;
	signal colli_reg, colli_next:std_logic;
------------------------------
begin
-----update information at rising edge-----
	reg:process(clk, rst_n)
	begin
	if rst_n = '0' then
		state_reg <= IDLE;
		x_reg <= (others => '0');
		y_reg <= (others => '0');
		active_reg <= '0';
		fire_reg <= '0';
		colli_reg <= '0';
	elsif rising_edge(clk) then
		state_reg <= state_next;
		x_reg <= x_next;
		y_reg <= y_next;
		active_reg <= active_next;
		fire_reg <= fire_next;
		colli_reg <= colli_next;
	end if;
	end process reg;

----FSM: calculate next step value---------------
comb:process(all)
		variable x_temp:integer range -100 to 1023;
		variable x_temp_enemy:integer range -100 to 1023;
		variable x_start:integer range -100 to 1023;
		variable y_temp:integer range -100 to 1023;
		variable y_start:integer range -100 to 1023;
		variable step:integer range 0 to 100;
		variable midx:integer range -100 to 1023;
		variable bullet_l, bullet_r: integer range -100 to 1023;
	begin
	----receive current state value-------------- 
		state_next <= state_reg;
		x_next <= x_reg;
		y_next <= y_reg;
		active_next <= active_reg;
		fire_next <= fire_reg;
		colli_next <= colli_reg;
	----case by case(speed)-----------------------------
		case(speed_sel) is
		when "00" => step := 10;			
		when "01" => step := 20;
		when "10" => step := 30;
		when others => step := 10;	
		end case;	
	----case by case(bullet status)-------------------
		case(state_reg) is 
		when IDLE => 
			active_next <= '0';
			colli_next <= '0';
			---fire latch---
			if fire = '1' then
				fire_next <= '1';
			end if;
			if fire_reg = '1' and move_pulse = '1' then
				state_next <= FLY;
				active_next <= '1';
				fire_next <= '0';
				x_temp := to_integer(unsigned(tankx));
				if tank_dir = '1' then
					x_temp := x_temp + step;
				else
					x_temp := x_temp - step;
				end if;
				if x_temp < 0 then
					x_temp := WALL_WIDTH;
				elsif x_temp >= SCREEN_WIDTH - WALL_WIDTH - TANK_W then
					x_temp := SCREEN_WIDTH - WALL_WIDTH - TANK_W;
				end if;
				midx := x_temp + TANK_W / 2;
				x_start := midx - BULLET_SIZE / 2;
				if DIR_UP = '1' then
					y_start := to_integer(unsigned(tanky)) - BULLET_SIZE;
				else
					y_start := to_integer(unsigned(tanky)) + TANK_H;
				end if;
				x_next <= to_unsigned(x_start, x_next'length);
				y_next <= to_unsigned(y_start, y_next'length);
			end if;

		when FLY =>
			if move_pulse = '1' then
				active_next <= '1';
				
				-----------------------------------------------------
				-- 向上發射 (DIR_UP = '1')
				-----------------------------------------------------
				if DIR_UP = '1' then
					y_temp := to_integer(y_reg) - STEP_PIXELS;					
					
					-- 1. 先判斷是否進入了可能碰撞的區域 (或是穿過頭了)
					if y_temp <= TOP_TANKY_BOUNDARY then
						
						x_temp_enemy := to_integer(unsigned(enemytankx));
						bullet_l := to_integer(x_reg);
						bullet_r := to_integer(x_reg) + BULLET_SIZE - 1;

						-- 2. 判斷是否擊中 (X軸重疊)
						if bullet_r >= x_temp_enemy and bullet_l <= x_temp_enemy + TANK_W - 1 then
							-- 擊中！
							state_next <= IDLE;
							active_next <= '0';
							fire_next <= '0';
							colli_next <= '1';
						
						-- 3. 沒擊中，判斷是否撞牆 (小於0表示飛出去了)
						elsif y_temp < 0 then
							state_next <= IDLE;
							active_next <= '0';
							fire_next <= '0';
							colli_next <= '0'; -- 沒擊中，只是消失
						
						-- 4. 沒擊中也沒撞牆 (依然在 0~9 之間，非常罕見但可能)
						else
							y_next <= to_unsigned(y_temp, y_next'length);
						end if;
					
					-- 還沒飛到邊界
					else
						y_next <= to_unsigned(y_temp, y_next'length);
					end if;

				-----------------------------------------------------
				-- 向下發射 (DIR_UP = '0') - 這裡也幫你修正同樣邏輯
				-----------------------------------------------------
				else
					y_temp := to_integer(y_reg) + STEP_PIXELS;
					
					if y_temp + BULLET_SIZE - 1 >= BOTTOM_TANKY_BOUNDARY then
						
						x_temp_enemy := to_integer(unsigned(enemytankx));
						bullet_l := to_integer(x_reg);
						bullet_r := to_integer(x_reg) + BULLET_SIZE - 1;
						
						if bullet_r >= x_temp_enemy and bullet_l <= x_temp_enemy + TANK_W - 1 then
							-- 擊中！
							state_next <= IDLE;
							active_next <= '0';
							fire_next <= '0';
							colli_next <= '1';
						elsif y_temp > SCREEN_HEIGHT - BULLET_SIZE then
							-- 撞牆 (飛出底部)
							state_next <= IDLE;
							active_next <= '0';
							fire_next <= '0';
							colli_next <= '0';
						else
							y_next <= to_unsigned(y_temp, y_next'length);
						end if;
					else
						y_next <= to_unsigned(y_temp, y_next'length);
					end if;
				end if;
			end if;

		when others => 
			state_next <= IDLE;
			active_next <= '0';
			fire_next <= '0';
			colli_next <= '0';
		end case;
	end process comb;
------------output value----------------------
	bullet_x <= std_logic_vector(x_reg);
	bullet_y <= std_logic_vector(y_reg);
	bullet_active <= active_reg;
	collision_state <= colli_reg;
end architecture behavior;