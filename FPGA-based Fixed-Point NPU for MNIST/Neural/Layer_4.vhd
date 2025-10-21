library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.nn_config.all;

entity Layer_4 is
  generic (
    NN             : integer := 10;                 -- 對齊此檔目前只放 10 顆
    numWeight      : integer := NUM_WEIGHT_LAYER_4; -- 建議設為上一層輸出個數
    dataWidth      : integer := DATA_WIDTH;
    layerNum       : integer := 4;                  -- 第四層（配合 w_4_x / b_4_x）
    sigmoidSize    : integer := 10;                 -- 對齊你的 Verilog
    weightIntWidth : integer := 4;                  -- 對齊你的 Verilog
    actType        : string  := LAYER_4_ACT_TYPE    -- 例如 "relu"
  );
  port (
    clk               : in  std_logic;
    rst               : in  std_logic;

    weightValid       : in  std_logic;
    biasValid         : in  std_logic;
    weightValue       : in  std_logic_vector(31 downto 0);
    biasValue         : in  std_logic_vector(31 downto 0);
    config_layer_num  : in  std_logic_vector(31 downto 0);
    config_neuron_num : in  std_logic_vector(31 downto 0);

    x_valid           : in  std_logic;
    x_in              : in  std_logic_vector(dataWidth-1 downto 0);

    o_valid           : out std_logic_vector(NN-1 downto 0);
    x_out             : out std_logic_vector(NN*dataWidth-1 downto 0)
  );
end entity Layer_4;

architecture rtl of Layer_4 is
begin
  -- n_0
  n_0 : entity work.neuron
    generic map(
      layerNo        => layerNum,
      neuronNo       => 0,
      numWeight      => numWeight,
      dataWidth      => dataWidth,
      sigmoidSize    => sigmoidSize,
      weightIntWidth => weightIntWidth,
      actType        => actType,
      biasFile       => "b_4_0.mif",
      weightFile     => "w_4_0.mif"
    )
    port map(
      clk               => clk,
      rst               => rst,
      myinput           => x_in,
      myinputValid      => x_valid,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      output            => x_out(1*dataWidth-1 downto 0*dataWidth),
      outvalid          => o_valid(0)
    );

  -- n_1
  n_1 : entity work.neuron
    generic map(
      layerNo        => layerNum,
      neuronNo       => 1,
      numWeight      => numWeight,
      dataWidth      => dataWidth,
      sigmoidSize    => sigmoidSize,
      weightIntWidth => weightIntWidth,
      actType        => actType,
      biasFile       => "b_4_1.mif",
      weightFile     => "w_4_1.mif"
    )
    port map(
      clk               => clk,
      rst               => rst,
      myinput           => x_in,
      myinputValid      => x_valid,
      weightValid       => weightValid,
      biasValid         => biasValid,
      weightValue       => weightValue,
      biasValue         => biasValue,
      config_layer_num  => config_layer_num,
      config_neuron_num => config_neuron_num,
      output            => x_out(2*dataWidth-1 downto 1*dataWidth),
      outvalid          => o_valid(1)
    );

  -- n_2
  n_2 : entity work.neuron
    generic map(
      layerNo        => layerNum,
      neuronNo       => 2,
      numWeight      => numWeight,
      dataWidth      => dataWidth,
      sigmoidSize    => sigmoidSize,
      weightIntWidth => weightIntWidth,
      actType        => actType,
      biasFile       => "b_4_2.mif",
      weightFile     => "w_4_2.mif"
    )
    port map(
      clk               => clk, rst => rst,
      myinput           => x_in, myinputValid => x_valid,
      weightValid       => weightValid, biasValid => biasValid,
      weightValue       => weightValue, biasValue => biasValue,
      config_layer_num  => config_layer_num, config_neuron_num => config_neuron_num,
      output            => x_out(3*dataWidth-1 downto 2*dataWidth),
      outvalid          => o_valid(2)
    );

  -- n_3
  n_3 : entity work.neuron
    generic map(
      layerNo        => layerNum, neuronNo => 3, numWeight => numWeight,
      dataWidth      => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile       => "b_4_3.mif", weightFile => "w_4_3.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(4*dataWidth-1 downto 3*dataWidth),
      outvalid => o_valid(3)
    );

  -- n_4
  n_4 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 4, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_4_4.mif", weightFile => "w_4_4.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(5*dataWidth-1 downto 4*dataWidth),
      outvalid => o_valid(4)
    );

  -- n_5
  n_5 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 5, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_4_5.mif", weightFile => "w_4_5.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(6*dataWidth-1 downto 5*dataWidth),
      outvalid => o_valid(5)
    );

  -- n_6
  n_6 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 6, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_4_6.mif", weightFile => "w_4_6.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(7*dataWidth-1 downto 6*dataWidth),
      outvalid => o_valid(6)
    );

  -- n_7
  n_7 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 7, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_4_7.mif", weightFile => "w_4_7.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(8*dataWidth-1 downto 7*dataWidth),
      outvalid => o_valid(7)
    );

  -- n_8
  n_8 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 8, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_4_8.mif", weightFile => "w_4_8.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(9*dataWidth-1 downto 8*dataWidth),
      outvalid => o_valid(8)
    );

  -- n_9
  n_9 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 9, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_4_9.mif", weightFile => "w_4_9.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(10*dataWidth-1 downto 9*dataWidth),
      outvalid => o_valid(9)
    );

end architecture rtl;