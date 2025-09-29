library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mac_int8 is
	generic(acc_width: integer:=32;
		     sat_en: boolean:=true);
	port(clk, rst_n, en, clr :in std_logic;
		  a, b :in std_logic_vector(7 downto 0);
		  acc_in :in std_logic_vector(acc_width-1 downto 0);
		  acc_out :out std_logic_vector(acc_width-1 downto 0));
end entity mac_int8;

architecture rtl_code of mac_int8 is
	signal mult16 :signed(15 downto 0);
	signal mult_ext :signed(acc_width-1 downto 0);
	signal sum :signed(acc_width-1 downto 0);
	signal wide_sum :signed(acc_width downto 0);
	signal a_s, b_s :signed(7 downto 0);
	signal acc_ins :signed(acc_width-1 downto 0);
	signal acc_outs :signed(acc_width-1 downto 0);
	
	function sat(x :signed(acc_width-1 downto 0);
	wide_x :signed(acc_width downto 0)	
	) return signed is
	variable y : signed(acc_width-1 downto 0);
	begin
	if not sat_en then 
	return x;
	end if;
		if(wide_x(acc_width) /= wide_x(acc_width-1)) then
			if(wide_x(acc_width) = '0') then --need to tune as max value max = 2^(bit-1) -1
				y := (acc_width-1 => '0', others => '1');
			else  --need to tune as min value min = -2^(bit-1)
				y := (acc_width-1 => '1', others => '0');
			end if;
			return y;
		else
		 return x;
		end if;
	end function;
begin
	a_s <= signed(a);
	b_s <= signed(b);
	acc_ins <= signed(acc_in);
	mult16 <= a_s * b_s;
	mult_ext <= resize(mult16, acc_width);
	sum <= acc_ins + mult_ext;
	wide_sum <= resize(acc_ins, acc_width+1) + resize(mult_ext, acc_width+1);
	process(clk, rst_n)
	variable next_acc :signed(acc_width-1 downto 0);
	begin
	if rst_n = '0' then
	acc_outs <= (others => '0');
	else
		if rising_edge(clk) then
			if clr = '1' then
			acc_outs <= (others => '0');
			else
				if en = '1' then
				next_acc := sat(sum, wide_sum);
				acc_outs <= next_acc;
				else
				acc_outs <= acc_outs;
				end if;
			end if;
		end if;
	end if;
	end process;
	acc_out <= std_logic_vector(acc_outs);
end architecture rtl_code;