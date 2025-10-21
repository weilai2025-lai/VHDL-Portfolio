library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity maxFinder is
  generic (
    numInput   : integer := 10;  -- 幾個輸入
    inputWidth : integer := 16   -- 每個輸入寬度
  );
  port (
    i_clk        : in  std_logic;
    i_data       : in  std_logic_vector(numInput*inputWidth-1 downto 0); -- 扁平匯流排
    i_valid      : in  std_logic;                                        -- 此拍資料有效
    o_data       : out std_logic_vector(3 downto 0);                    -- 最大值索引
    o_data_valid : out std_logic                                         -- 結果有效脈衝（1拍）
  );
end entity maxFinder;

architecture rtl of maxFinder is
  -- 元素型別/陣列型別（用 generic 的 inputWidth）
  subtype word_t is std_logic_vector(inputWidth-1 downto 0);
  type word_array_t is array (natural range <>) of word_t;

  -- 把扁平匯流排先拆成陣列（常數 slice，合成友善）
  signal inDataArray : word_array_t(0 to numInput-1);

  -- 內部暫存
  signal maxValue       : unsigned(inputWidth-1 downto 0) := (others => '0');
  signal inDataBuffer   : std_logic_vector(numInput*inputWidth-1 downto 0) := (others => '0');
  signal counter        : integer range 0 to numInput := 0;  -- 0=idle, 1..numInput-1 比較中, numInput=收尾
  signal o_data_r       : unsigned(3 downto 0) := (others => '0');
  signal o_data_valid_r : std_logic := '0';
  
  signal curr_dbg       : unsigned(inputWidth-1 downto 0) := (others => '0');
begin
  -- 對外輸出
  o_data       <= std_logic_vector(o_data_r);
  o_data_valid <= o_data_valid_r;

  -- 用常數索引拆扁平匯流排 → 陣列
  gen_unpack : for i in 0 to numInput-1 generate
  begin
    inDataArray(i) <= inDataBuffer((i+1)*inputWidth-1 downto i*inputWidth);
  end generate;

  process(i_clk)
    variable curr : unsigned(inputWidth-1 downto 0);
  begin
    if rising_edge(i_clk) then
      -- 預設本拍不輸出有效
      o_data_valid_r <= '0';

      if i_valid = '1' then
        -- 起始：鎖住當拍資料到 buffer，先把第0筆當最大，從第1筆開始比
        inDataBuffer <= i_data;
        maxValue     <= unsigned(i_data(inputWidth-1 downto 0));
        o_data_r     <= (others => '0');   -- 最大索引=0
        counter      <= 1;

      elsif counter = numInput then
        -- 已比較完最後一筆，這拍拉高 valid，並回到 idle
        o_data_valid_r <= '1';
        counter        <= 0;

      elsif counter /= 0 then
        -- 比較進行中：拿第 counter 筆
        curr := unsigned(inDataArray(counter));
		  curr_dbg <= curr;
        if curr > maxValue then
          maxValue <= curr;
          o_data_r <= to_unsigned(counter, o_data_r'length);
        end if;

        counter <= counter + 1;
      end if;
    end if;
  end process;

end architecture rtl;