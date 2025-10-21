library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.nn_config.all;

entity zyNet is
  generic (
    C_S_AXI_DATA_WIDTH : integer := 32; -- 保留參數(未使用)
    C_S_AXI_ADDR_WIDTH : integer := 5   -- 保留參數(未使用)
  );
  port (
    -- Clock / Reset
    s_axi_aclk      : in  std_logic;
    s_axi_aresetn   : in  std_logic;            -- active-low
    -- AXI-Stream (slave) input
    axis_in_data        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    axis_in_data_valid  : in  std_logic;
    axis_in_data_ready  : out std_logic;
	 --output classfication result
	 class_id    : out std_logic_vector(3 downto 0);
    class_valid : out std_logic;
    ----------------------------------------------------------------
    -- 權重/偏差 & 組態（對外給，上層可自行驅動）
    weightValid       : in  std_logic;
    biasValid         : in  std_logic;
    weightValue       : in  std_logic_vector(31 downto 0);
    biasValue         : in  std_logic_vector(31 downto 0);
    config_layer_num  : in  std_logic_vector(31 downto 0);
    config_neuron_num : in  std_logic_vector(31 downto 0)
    ----------------------------------------------------------------
    -- 最後一層輸出先不對外；如要導出可在此加上 port
  );
end entity;

architecture rtl of zyNet is
  -- AXI ready：目前固定 ready
  signal reset : std_logic;

  -- Layer 1 介面
  signal o1_valid : std_logic_vector(NUM_NEURON_LAYER_1-1 downto 0);
  signal x1_out   : std_logic_vector(NUM_NEURON_LAYER_1*DATA_WIDTH-1 downto 0);

  -- 串到 Layer 2 的暫存與輸出（並→串）
  type state_t is (IDLE, SEND);
  signal state_1          : state_t;
  signal count_1          : integer range 0 to NUM_NEURON_LAYER_1;
  signal holdData_1       : std_logic_vector(NUM_NEURON_LAYER_1*DATA_WIDTH-1 downto 0);
  signal out_data_1       : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data_out_valid_1 : std_logic;

  -- Layer 2 介面
  signal o2_valid : std_logic_vector(NUM_NEURON_LAYER_2-1 downto 0);
  signal x2_out   : std_logic_vector(NUM_NEURON_LAYER_2*DATA_WIDTH-1 downto 0);

  -- 串到 Layer 3 的暫存與輸出（並→串）
  signal state_2          : state_t;
  signal count_2          : integer range 0 to NUM_NEURON_LAYER_2;
  signal holdData_2       : std_logic_vector(NUM_NEURON_LAYER_2*DATA_WIDTH-1 downto 0);
  signal out_data_2       : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data_out_valid_2 : std_logic;

  -- Layer 3 介面
  signal o3_valid : std_logic_vector(NUM_NEURON_LAYER_3-1 downto 0);
  signal x3_out   : std_logic_vector(NUM_NEURON_LAYER_3*DATA_WIDTH-1 downto 0);

  -- 串到 Layer 4 的暫存與輸出（並→串）
  signal state_3          : state_t;
  signal count_3          : integer range 0 to NUM_NEURON_LAYER_3;
  signal holdData_3       : std_logic_vector(NUM_NEURON_LAYER_3*DATA_WIDTH-1 downto 0);
  signal out_data_3       : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data_out_valid_3 : std_logic;

  -- Layer 4 介面
  signal o4_valid : std_logic_vector(NUM_NEURON_LAYER_4-1 downto 0);
  signal x4_out   : std_logic_vector(NUM_NEURON_LAYER_4*DATA_WIDTH-1 downto 0);

  -- Layer 4 串流暫存（目前不對外）
  signal state_4          : state_t;
  signal count_4          : integer range 0 to NUM_NEURON_LAYER_4;
  signal holdData_4       : std_logic_vector(NUM_NEURON_LAYER_4*DATA_WIDTH-1 downto 0);
  signal out_data_4       : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data_out_valid_4 : std_logic;

  -- ★ 新增：maxFinder 輸出（內部觀察用；如要對外可加到 entity ）
  signal max_index  : std_logic_vector(31 downto 0);
  signal max_valid  : std_logic;

begin
  -- Reset / Ready
  reset <= not s_axi_aresetn;
  axis_in_data_ready <= '1';

  ------------------------------------------------------------------
  -- Layer_1
  ------------------------------------------------------------------
  L1 : entity work.Layer_1
    generic map (
      NN             => NUM_NEURON_LAYER_1,
      numWeight      => NUM_WEIGHT_LAYER_1,
      dataWidth      => DATA_WIDTH,
      layerNum       => 1,
      sigmoidSize    => SIGMOID_SIZE,
      weightIntWidth => WEIGHT_INT_WIDTH,
      actType        => LAYER_1_ACT_TYPE
    )
    port map (
      clk               => s_axi_aclk,
      rst               => reset,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      x_valid           => axis_in_data_valid,
      x_in              => axis_in_data,
      o_valid           => o1_valid,
      x_out             => x1_out
    );

  -- 並→串：Layer1 → Layer2
  process (s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      if reset = '1' then
        state_1          <= IDLE;
        count_1          <= 0;
        data_out_valid_1 <= '0';
        holdData_1       <= (others => '0');
        out_data_1       <= (others => '0');
      else
        case state_1 is
          when IDLE =>
            count_1          <= 0;
            data_out_valid_1 <= '0';
            if o1_valid(0) = '1' then
              holdData_1 <= x1_out;
              state_1    <= SEND;
            end if;

          when SEND =>
            out_data_1       <= holdData_1(DATA_WIDTH-1 downto 0);
            holdData_1       <= std_logic_vector(shift_right(unsigned(holdData_1), DATA_WIDTH));           
            data_out_valid_1 <= '1';
            if count_1 = NUM_NEURON_LAYER_1-1 then
              state_1 <= IDLE;
				else
				  count_1 <= count_1 + 1;
            end if;
        end case;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- Layer_2
  ------------------------------------------------------------------
  L2 : entity work.Layer_2
    generic map (
      NN             => NUM_NEURON_LAYER_2,
      numWeight      => NUM_WEIGHT_LAYER_2,
      dataWidth      => DATA_WIDTH,
      layerNum       => 2,
      sigmoidSize    => SIGMOID_SIZE,
      weightIntWidth => WEIGHT_INT_WIDTH,
      actType        => LAYER_2_ACT_TYPE
    )
    port map (
      clk               => s_axi_aclk,
      rst               => reset,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      x_valid           => data_out_valid_1,
      x_in              => out_data_1,
      o_valid           => o2_valid,
      x_out             => x2_out
    );

  -- 並→串：Layer2 → Layer3
  process (s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      if reset = '1' then
        state_2          <= IDLE;
        count_2          <= 0;
        data_out_valid_2 <= '0';
        holdData_2       <= (others => '0');
        out_data_2       <= (others => '0');
      else
        case state_2 is
          when IDLE =>
            count_2          <= 0;
            data_out_valid_2 <= '0';
            if o2_valid(0) = '1' then
              holdData_2 <= x2_out;
              state_2    <= SEND;
            end if;

          when SEND =>
            out_data_2       <= holdData_2(DATA_WIDTH-1 downto 0);
            holdData_2       <= std_logic_vector(shift_right(unsigned(holdData_2), DATA_WIDTH));        
            data_out_valid_2 <= '1';
            if count_2 = NUM_NEURON_LAYER_2-1 then
              state_2          <= IDLE;
				else
				  count_2 <= count_2 + 1;
            end if;
        end case;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- Layer_3
  ------------------------------------------------------------------
  L3 : entity work.Layer_3
    generic map (
      NN             => NUM_NEURON_LAYER_3,
      numWeight      => NUM_WEIGHT_LAYER_3,
      dataWidth      => DATA_WIDTH,
      layerNum       => 3,
      sigmoidSize    => SIGMOID_SIZE,
      weightIntWidth => WEIGHT_INT_WIDTH,
      actType        => LAYER_3_ACT_TYPE
    )
    port map (
      clk               => s_axi_aclk,
      rst               => reset,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      x_valid           => data_out_valid_2,
      x_in              => out_data_2,
      o_valid           => o3_valid,
      x_out             => x3_out
    );

  -- 並→串：Layer3 → Layer4
  process (s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      if reset = '1' then
        state_3          <= IDLE;
        count_3          <= 0;
        data_out_valid_3 <= '0';
        holdData_3       <= (others => '0');
        out_data_3       <= (others => '0');
      else
        case state_3 is
          when IDLE =>
            count_3          <= 0;
            data_out_valid_3 <= '0';
            if o3_valid(0) = '1' then
              holdData_3 <= x3_out;
              state_3    <= SEND;
            end if;

          when SEND =>
            out_data_3       <= holdData_3(DATA_WIDTH-1 downto 0);
            holdData_3       <= std_logic_vector(shift_right(unsigned(holdData_3), DATA_WIDTH));
            data_out_valid_3 <= '1';
            if count_3 = NUM_NEURON_LAYER_3-1 then
              state_3 <= IDLE;
				else
				  count_3 <= count_3 + 1;
            end if;
        end case;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- Layer_4（最末層；目前只做並→串暫存，不對外）
  ------------------------------------------------------------------
  L4 : entity work.Layer_4
    generic map (
      NN             => NUM_NEURON_LAYER_4,
      numWeight      => NUM_WEIGHT_LAYER_4,
      dataWidth      => DATA_WIDTH,
      layerNum       => 4,
      sigmoidSize    => SIGMOID_SIZE,
      weightIntWidth => WEIGHT_INT_WIDTH,
      actType        => LAYER_4_ACT_TYPE
    )
    port map (
      clk               => s_axi_aclk,
      rst               => reset,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      x_valid           => data_out_valid_3,
      x_in              => out_data_3,
      o_valid           => o4_valid,
      x_out             => x4_out
    );

  -- 並→串：Layer4 → （先留在本模組，之後你要接 AXIS/argmax 再往下做）
  process (s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      if reset = '1' then
        state_4          <= IDLE;
        count_4          <= 0;
        data_out_valid_4 <= '0';
        holdData_4       <= (others => '0');
        out_data_4       <= (others => '0');
      else
        case state_4 is
          when IDLE =>
            count_4          <= 0;
            data_out_valid_4 <= '0';
            if o4_valid(0) = '1' then
              holdData_4 <= x4_out;
              state_4    <= SEND;
            end if;

          when SEND =>
            out_data_4       <= holdData_4(DATA_WIDTH-1 downto 0);
            holdData_4       <= std_logic_vector(shift_right(unsigned(holdData_4), DATA_WIDTH));
            data_out_valid_4 <= '1';
            if count_4 = NUM_NEURON_LAYER_4-1 then
              state_4 <= IDLE;
				else
				  count_4 <= count_4 + 1;
            end if;
        end case;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- ★ 新增：maxFinder（語意對齊 Verilog 版；忽略 AXI-Lite）
  --   - 輸入資料：x4_out（展平的一串，寬度 = NUM_NEURON_LAYER_4*DATA_WIDTH）
  --   - 有效旗標：用 o4_valid(0) 當作「本拍 Layer_4 輸出有效」
  --   - 輸出：
  --       max_index  = 最大值所在索引（0..NUM_NEURON_LAYER_4-1，32-bit 寬）
  --       max_valid  = 上述索引有效的 1 拍脈衝
  ------------------------------------------------------------------
  mFind : entity work.maxFinder
    generic map (
      numInput   => NUM_NEURON_LAYER_4,
      inputWidth => DATA_WIDTH
    )
    port map (
      i_clk        => s_axi_aclk,
      i_data       => x4_out,
      i_valid      => o4_valid(0),
      o_data       => class_id,
      o_data_valid => class_valid
    );

  -- ※ 若你之後想對外輸出結果，只要在 entity zyNet 補兩個腳位，
  --   例如:
  --     max_index_o  : out std_logic_vector(31 downto 0);
  --     max_valid_o  : out std_logic;
  --   然後在這裡加：
  --     -- max_index_o <= max_index;
  --     -- max_valid_o <= max_valid;

end architecture;