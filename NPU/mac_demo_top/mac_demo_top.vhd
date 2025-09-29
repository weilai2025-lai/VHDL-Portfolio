library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mac_demo_top is
	port(clk_in :in std_logic;
		  BTN_RST :in std_logic;
		  BTN_CLR :in std_logic;
		  BTN_STEP :in std_logic;
		  BTN_LOAD :in std_logic;
		  
		  SW_DATA :in std_logic_vector(7 downto 0);-- 接板子 SW0..SW7
		  SW_LOADSEL : in std_logic; -- 接板子 SW8（0=A、1=B）
		  SW_ACCSEL  : in std_logic; -- 接板子 SW9（0=回授、1=外部）
		  HEX0 : out std_logic_vector(6 downto 0);
		  HEX1 : out std_logic_vector(6 downto 0);
	     HEX2 : out std_logic_vector(6 downto 0);
		  HEX3 : out std_logic_vector(6 downto 0);
		  HEX4 : out std_logic_vector(6 downto 0);
		  HEX5 : out std_logic_vector(6 downto 0);
		  HEX6 : out std_logic_vector(6 downto 0);
		  HEX7 : out std_logic_vector(6 downto 0));
end entity mac_demo_top;
		  
architecture rtl of mac_demo_top is
	
	component mac_int8_pipeline1 is
	generic(acc_width : integer:=32;
			  sat_en : boolean:=true );
	port(clk, rst_n, en, clr :in std_logic;
		  a, b :in std_logic_vector(7 downto 0);
		  acc_in :in std_logic_vector(acc_width-1 downto 0);
		  acc_out :out std_logic_vector(acc_width-1 downto 0));	
	end component;
	
	signal rst_sync1, rst_sync2 :std_logic:='0';
	signal clr_sync1, clr_sync2 :std_logic:='0';
	signal step_sync1, step_sync2 :std_logic:='0';
	signal load_sync1, load_sync2 : std_logic := '0';


	signal en_pulse :std_logic:='0';
	signal clr_pulse :std_logic:='0';
	signal load_pulse : std_logic:= '0';
	
	signal a_reg :std_logic_vector(7 downto 0):=(others => '0');
	signal b_reg :std_logic_vector(7 downto 0):=(others => '0');
	
	signal rst_n :std_logic;
	signal acc_in_s :std_logic_vector(31 downto 0);
	signal acc_out_s :std_logic_vector(31 downto 0);
	
	type digit_arr is array(6 downto 0) of integer range 0 to 9;
	signal bcd_digits :digit_arr:=(others => 0);
	signal neg_sign    : std_logic := '0'; 
	signal acc_latched : std_logic_vector(31 downto 0) := (others => '0');
	
	function seg7_encode(d :integer) return std_logic_vector is
		variable s :std_logic_vector(6 downto 0);
	begin
		case d is
      when 0  => s := "1000000";
      when 1  => s := "1111001";
      when 2  => s := "0100100";
      when 3  => s := "0110000";
      when 4  => s := "0011001";
      when 5  => s := "0010010";
      when 6  => s := "0000010";
      when 7  => s := "1111000";
      when 8  => s := "0000000";
      when 9  => s := "0010000";
		when -2 => s := "1111110";
		when others => s := "1111111";
		end case;
		return s;
	end function;
	
begin	
  -- 右邊 7 顆顯示個位→百萬位；HEX0 最右、HEX7 最左
   HEX0 <= seg7_encode(bcd_digits(0));
   HEX1 <= seg7_encode(bcd_digits(1));
   HEX2 <= seg7_encode(bcd_digits(2));
   HEX3 <= seg7_encode(bcd_digits(3));
   HEX4 <= seg7_encode(bcd_digits(4));
   HEX5 <= seg7_encode(bcd_digits(5));
   HEX6 <= seg7_encode(bcd_digits(6));
	-- 最左邊 HEX7：顯示負號或空白
   HEX7 <= seg7_encode(-2) when neg_sign = '1' else seg7_encode(-1);
	rst_n <= rst_sync2;
	acc_in_s <= (others => '0')
            when SW_ACCSEL = '0' else
            std_logic_vector(resize(signed(SW_DATA), 32));
	U_MAC:mac_int8_pipeline1
	generic map(acc_width => 32, sat_en => true)
	port map(clk => clk_in, rst_n => rst_n,
	         en => en_pulse, clr => clr_pulse,
				a => a_reg, b => b_reg,
				acc_in => acc_in_s,
				acc_out => acc_out_s);
				
	process(clk_in)
	 variable s_acc : signed(31 downto 0);
    variable mag   : unsigned(31 downto 0);
    variable tmp   : unsigned(31 downto 0);
	 begin
	 if rising_edge(clk_in) then
		if acc_out_s /= acc_latched then
			acc_latched <= acc_out_s;
			
			s_acc := signed(acc_out_s);
			if s_acc < 0 then
				neg_sign <= '1';
				mag := unsigned(-s_acc); --絕對值
			else 
				neg_sign <= '0';
				mag := unsigned(s_acc);
			end if;
			
			tmp := mag;
			for i in 0 to 6 loop
				bcd_digits(i) <= to_integer(tmp mod 10);
				tmp := tmp/10;
			end loop;
		end if;
	 end if;
	end process;
	
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			if load_pulse = '1' then
				if SW_LOADSEL = '0' then
					a_reg <= SW_DATA; -- SW_LOADSEL=0 → 載到 A
				else
					b_reg <= SW_DATA; -- SW_LOADSEL=1 → 載到 B
			   end if;
		   end if;
		end if;
	end process;	
	process(clk_in)
	begin 
		if rising_edge(clk_in) then
			rst_sync1 <= BTN_RST; rst_sync2 <= rst_sync1; 
			clr_sync1 <= BTN_CLR; clr_sync2 <= clr_sync1; 
			step_sync1 <= BTN_STEP; step_sync2 <= step_sync1; 
			load_sync1 <= BTN_LOAD; load_sync2 <= load_sync1;
		end if;
	end process;
	
	en_pulse <= (not step_sync1) and step_sync2;
	clr_pulse <= (not clr_sync1) and clr_sync2;
	load_pulse <= (not load_sync1) and load_sync2;

end architecture rtl;