library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.nn_config.all;

entity Layer_1 is
  generic (
    NN             : integer := NUM_NEURON_LAYER_1;  -- 預設 30
    numWeight      : integer := NUM_WEIGHT_LAYER_1;  -- 預設 784
    dataWidth      : integer := DATA_WIDTH;          -- 預設 16
    layerNum       : integer := 1;
    sigmoidSize    : integer := SIGMOID_SIZE;        -- 預設 5
    weightIntWidth : integer := WEIGHT_INT_WIDTH;    -- 預設 1
    actType        : string  := LAYER_1_ACT_TYPE     -- 預設 "sigmoid"
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
end entity Layer_1;

architecture rtl of Layer_1 is
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
      biasFile       => "b_1_0.mif",
      weightFile     => "w_1_0.mif"
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
      biasFile       => "b_1_1.mif",
      weightFile     => "w_1_1.mif"
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
      biasFile       => "b_1_2.mif",
      weightFile     => "w_1_2.mif"
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
      biasFile       => "b_1_3.mif", weightFile => "w_1_3.mif"
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
      biasFile => "b_1_4.mif", weightFile => "w_1_4.mif"
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
      biasFile => "b_1_5.mif", weightFile => "w_1_5.mif"
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
      biasFile => "b_1_6.mif", weightFile => "w_1_6.mif"
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
      biasFile => "b_1_7.mif", weightFile => "w_1_7.mif"
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
      biasFile => "b_1_8.mif", weightFile => "w_1_8.mif"
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
      biasFile => "b_1_9.mif", weightFile => "w_1_9.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(10*dataWidth-1 downto 9*dataWidth),
      outvalid => o_valid(9)
    );

  -- n_10
  n_10 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 10, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_10.mif", weightFile => "w_1_10.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(11*dataWidth-1 downto 10*dataWidth),
      outvalid => o_valid(10)
    );

  -- n_11
  n_11 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 11, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_11.mif", weightFile => "w_1_11.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(12*dataWidth-1 downto 11*dataWidth),
      outvalid => o_valid(11)
    );

  -- n_12
  n_12 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 12, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_12.mif", weightFile => "w_1_12.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(13*dataWidth-1 downto 12*dataWidth),
      outvalid => o_valid(12)
    );

  -- n_13
  n_13 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 13, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_13.mif", weightFile => "w_1_13.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(14*dataWidth-1 downto 13*dataWidth),
      outvalid => o_valid(13)
    );

  -- n_14
  n_14 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 14, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_14.mif", weightFile => "w_1_14.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(15*dataWidth-1 downto 14*dataWidth),
      outvalid => o_valid(14)
    );

  -- n_15
  n_15 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 15, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_15.mif", weightFile => "w_1_15.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(16*dataWidth-1 downto 15*dataWidth),
      outvalid => o_valid(15)
    );

  -- n_16
  n_16 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 16, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_16.mif", weightFile => "w_1_16.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(17*dataWidth-1 downto 16*dataWidth),
      outvalid => o_valid(16)
    );

  -- n_17
  n_17 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 17, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_17.mif", weightFile => "w_1_17.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(18*dataWidth-1 downto 17*dataWidth),
      outvalid => o_valid(17)
    );

  -- n_18
  n_18 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 18, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_18.mif", weightFile => "w_1_18.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(19*dataWidth-1 downto 18*dataWidth),
      outvalid => o_valid(18)
    );

  -- n_19
  n_19 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 19, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_19.mif", weightFile => "w_1_19.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(20*dataWidth-1 downto 19*dataWidth),
      outvalid => o_valid(19)
    );

  -- n_20
  n_20 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 20, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_20.mif", weightFile => "w_1_20.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(21*dataWidth-1 downto 20*dataWidth),
      outvalid => o_valid(20)
    );

  -- n_21
  n_21 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 21, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_21.mif", weightFile => "w_1_21.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(22*dataWidth-1 downto 21*dataWidth),
      outvalid => o_valid(21)
    );

  -- n_22
  n_22 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 22, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_22.mif", weightFile => "w_1_22.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(23*dataWidth-1 downto 22*dataWidth),
      outvalid => o_valid(22)
    );

  -- n_23
  n_23 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 23, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_23.mif", weightFile => "w_1_23.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(24*dataWidth-1 downto 23*dataWidth),
      outvalid => o_valid(23)
    );

  -- n_24
  n_24 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 24, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_24.mif", weightFile => "w_1_24.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(25*dataWidth-1 downto 24*dataWidth),
      outvalid => o_valid(24)
    );

  -- n_25
  n_25 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 25, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_25.mif", weightFile => "w_1_25.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(26*dataWidth-1 downto 25*dataWidth),
      outvalid => o_valid(25)
    );

  -- n_26
  n_26 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 26, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_26.mif", weightFile => "w_1_26.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(27*dataWidth-1 downto 26*dataWidth),
      outvalid => o_valid(26)
    );

  -- n_27
  n_27 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 27, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_27.mif", weightFile => "w_1_27.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(28*dataWidth-1 downto 27*dataWidth),
      outvalid => o_valid(27)
    );

  -- n_28
  n_28 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 28, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_28.mif", weightFile => "w_1_28.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(29*dataWidth-1 downto 28*dataWidth),
      outvalid => o_valid(28)
    );

  -- n_29
  n_29 : entity work.neuron
    generic map(
      layerNo => layerNum, neuronNo => 29, numWeight => numWeight,
      dataWidth => dataWidth, sigmoidSize => sigmoidSize,
      weightIntWidth => weightIntWidth, actType => actType,
      biasFile => "b_1_29.mif", weightFile => "w_1_29.mif"
    )
    port map(
      clk => clk, rst => rst, myinput => x_in, myinputValid => x_valid,
      weightValid => weightValid, biasValid => biasValid,
      weightValue => weightValue, biasValue => biasValue,
      config_layer_num => config_layer_num, config_neuron_num => config_neuron_num,
      output => x_out(30*dataWidth-1 downto 29*dataWidth),
      outvalid => o_valid(29)
    );

end architecture rtl;