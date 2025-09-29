library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity practice_demo is
	port(clk_in :in std_logic;
	     BTN_RST :in std_logic;
		  BTN_CLR :in std_logic;
		  BTN_LOAD :in std_logic;
		  BTN_STEP :in std_logic;
		  SW_DATA :in std_logic_vector(7 downto 0);
		  SW_LOADSEL :in std_logic;
		  SW_LOADACC :in std_logic;
		  HEX0 :out std_logic_vector(6 downto 0);
		  HEX1 :out std_logic_vector(6 downto 0);
		  HEX2 :out std_logic_vector(6 downto 0);
		  HEX3 :out std_logic_vector(6 downto 0);
		  HEX4 :out std_logic_vector(6 downto 0);
		  HEX5 :out std_logic_vector(6 downto 0);
		  HEX6 :out std_logic_vector(6 downto 0);
		  HEX7 :out std_logic_vector(6 downto 0));
end entity practice_demo;

architecture rtl of practice_demo is

	component mac_int8_pipeline1 is
	generic(acc_width : integer:=32;
			  sat_en : boolean:=true );
	port(clk, rst_n, en, clr :in std_logic;
		  a, b :in std_logic_vector(7 downto 0);
		  acc_in :in std_logic_vector(acc_width-1 downto 0);
		  acc_out :out std_logic_vector(acc_width-1 downto 0));	
	end component;
	
	function seven_seg(x :integer) return std_logic_vector is
	variable d: std_logic_vector(6 downto 0);
	begin
		case(x) is
      when 0  => d := "1000000";
      when 1  => d := "1111001";
      when 2  => d := "0100100";
      when 3  => d := "0110000";
      when 4  => d := "0011001";
      when 5  => d := "0010010";
      when 6  => d := "0000010";
      when 7  => d := "1111000";
      when 8  => d := "0000000";
      when 9  => d := "0010000";
		when -2 => d := "1111110";
		when others => d := "1111111";		
		end case;
		return d;
	end function;
	
	signal rst_n :std_logic;
	signal en_pulse :std_logic;
	signal clr_pulse :std_logic;
	signal load_pulse :std_logic;
	signal sync_rst1, sync_rst2 :std_logic;
	signal sync_clr1, sync_clr2 :std_logic;
	signal sync_step1, sync_step2 :std_logic;
	signal sync_load1, sync_load2 :std_logic;
	
	type digit_arr is array(6 downto 0) of integer range 0 to 9;
	signal bcd_digits :digit_arr:=(others => 0);
	signal neg_sign :std_logic:='0';
	signal acc_latched :std_logic_vector(31 downto 0);
	signal acc_in_s :std_logic_vector(31 downto 0);
	signal acc_out_s :std_logic_vector(31 downto 0);
	signal a_reg, b_reg :std_logic_vector(7 downto 0);

begin

	U_MAC: mac_int8_pipeline1
	generic map(acc_width => 32, sat_en => true)
	port map(clk => clk_in, rst_n => rst_n, en => en_pulse,
	         clr => clr_pulse, a => a_reg, b => b_reg,
				acc_in => acc_in_s, acc_out => acc_out_s);

	process(clk_in)
	begin
	if rising_edge(clk_in) then
		if load_pulse = '1' then
			if SW_LOADSEL = '0' then
				a_reg <= SW_DATA;
			else
				b_reg <= SW_DATA;
			end if;
		end if;
		if SW_LOADACC = '1' then
			acc_in_s <= std_logic_vector(resize(signed(SW_DATA), 32));
		else
			acc_in_s <= (others => '0');
		end if;
	end if;
	end process;

	process(clk_in)
	variable mag :unsigned(31 downto 0);
	variable tmp :unsigned(31 downto 0);
	variable sign_acc :signed(31 downto 0);
	begin
	if rising_edge(clk_in) then
		if acc_out_s /= acc_latched then
			acc_latched <= acc_out_s;
			sign_acc := signed(acc_out_s);
			if sign_acc < 0 then
				neg_sign <= '1';
				mag := unsigned(-sign_acc);
			else
				neg_sign <= '0';
				mag := unsigned(sign_acc);							
			end if;
			tmp := mag;
			for i in 0 to 6 loop
				bcd_digits(i) <= to_integer(tmp mod 10);
				tmp := tmp / 10;
			end loop;
		end if;
	end if;
	end process;



	process(clk_in)
	begin
	if rising_edge(clk_in) then
		sync_rst1 <= BTN_RST; sync_rst2 <= sync_rst1;
		sync_clr1 <= BTN_CLR; sync_clr2 <= sync_clr1;
		sync_step1 <= BTN_STEP; sync_step2 <= sync_step1;
		sync_load1 <= BTN_LOAD; sync_load2 <= sync_load1;		
	end if;
	end process;
	
	en_pulse <= (not sync_step1) and sync_step2;
	clr_pulse <= (not sync_clr1) and sync_clr2;
	load_pulse <= (not sync_load1) and sync_load2;
	rst_n <= sync_rst2;
	
	HEX0 <= seven_seg(bcd_digits(0));
	HEX1 <= seven_seg(bcd_digits(1));
	HEX2 <= seven_seg(bcd_digits(2));
	HEX3 <= seven_seg(bcd_digits(3));
	HEX4 <= seven_seg(bcd_digits(4));
	HEX5 <= seven_seg(bcd_digits(5));
	HEX6 <= seven_seg(bcd_digits(6));
	HEX7 <= seven_seg(-1)
		when neg_sign = '0' else
		seven_seg(-2);


end architecture rtl;