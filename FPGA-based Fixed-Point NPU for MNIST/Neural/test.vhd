library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test is
	port(
		clk          : in  std_logic;
		rst          : in  std_logic;     -- NEW: 加入重置訊號
		myinputValid : in  std_logic;
		a            : in  std_logic;
		wout         : out std_logic;
		ren_out      : out std_logic;
		xx           : out std_logic;
		r_addr_out   : out unsigned(7 downto 0); -- NEW: 觀察計數器的輸出
		multi :out std_logic
	);
end entity test;

architecture rtl of test is
	signal ren_internal     : std_logic;
	signal registered_valid : std_logic;
	signal wout_internal    : std_logic;
	signal r_addr           : unsigned(7 downto 0); -- NEW SIGNAL: 宣告計數器
	signal mux :std_logic;
begin
	-- 組合邏輯
	ren_internal <= myinputValid;
	ren_out      <= ren_internal;
	wout         <= wout_internal;
	r_addr_out   <= r_addr; -- NEW: 將內部計數器連到輸出埠
	mux <= registered_valid;

	-- registered_valid 正反器
	process(clk)
	begin
		if rising_edge(clk) then
			registered_valid <= myinputValid;
			multi <= mux;
		end if;
	end process;

	-- 模擬 Memory 的 wout 正反器
	process(clk)
	begin
		if rising_edge(clk) then
			if ren_internal = '1' then
				wout_internal <= a;
			end if;
		end if;
	end process;	
	
	-- xx 的計算正反器
	process(clk)
	begin
		if rising_edge(clk) then
			xx <= registered_valid and wout_internal;
		end if;
	end process;	
	
	-- NEW PROCESS: 您新增的 r_addr 計數器
	process(clk)
	begin
		if rising_edge(clk) then
			-- 優先處理重置訊號
			if rst = '1' then
				r_addr <= (others => '0');
			-- 只有在 myinputValid 為 '1' 時才計數
			elsif myinputValid = '1' then
				r_addr <= r_addr + 1;
			end if;
			-- 如果 rst=0 且 myinputValid=0，r_addr 會保持原值
		end if;
	end process;
	
end architecture rtl;