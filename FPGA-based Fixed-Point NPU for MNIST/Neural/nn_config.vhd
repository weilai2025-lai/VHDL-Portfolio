library IEEE;
use IEEE.std_logic_1164.all;

package nn_config is
	constant PRETRAINED :boolean:=true;
	constant SIM_READ_FILE:boolean:=true;
	constant NUM_LAYERS        : integer := 5;
   constant DATA_WIDTH        : integer := 16;
   constant SIGMOID_SIZE      : integer := 10;
   constant WEIGHT_INT_WIDTH  : integer := 1;
	
	----first layer-------
	constant NUM_NEURON_LAYER_1 : integer := 30;
   constant NUM_WEIGHT_LAYER_1 : integer := 784;
   constant LAYER_1_ACT_TYPE   : string  := "sigmoid";
   ----2nd layer-------
   constant NUM_NEURON_LAYER_2 : integer := 30;
   constant NUM_WEIGHT_LAYER_2 : integer := 30;
   constant LAYER_2_ACT_TYPE   : string  := "sigmoid";
   ----3rd layer-------
   constant NUM_NEURON_LAYER_3 : integer := 10;
   constant NUM_WEIGHT_LAYER_3 : integer := 30;
   constant LAYER_3_ACT_TYPE   : string  := "sigmoid";
	----4st layer-------
   constant NUM_NEURON_LAYER_4 : integer := 10;
   constant NUM_WEIGHT_LAYER_4 : integer := 10;
   constant LAYER_4_ACT_TYPE   : string  := "sigmoid";
	----5st layer-------
   constant NUM_NEURON_LAYER_5 : integer := 10;
   constant NUM_WEIGHT_LAYER_5 : integer := 10;
   constant LAYER_5_ACT_TYPE   : string  := "hardmax";
	-------readfile---------------
   attribute ram_init_file : string;
	constant WEIGHTFILE :string :="w_1_15.mif";
	
end package nn_config;

package body nn_config is
end package body nn_config;