-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "09/16/2025 20:56:29"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	accumulator IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	w_en : IN std_logic;
	acc_out : OUT std_logic_vector(31 DOWNTO 0)
	);
END accumulator;

-- Design Ports Information
-- acc_out[0]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[2]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[4]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[5]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[6]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[7]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[8]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[9]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[10]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[11]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[12]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[13]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[14]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[15]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[16]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[17]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[18]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[19]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[20]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[21]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[22]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[23]	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[24]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[25]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[26]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[27]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[28]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[29]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[30]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[31]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- w_en	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF accumulator IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_w_en : std_logic;
SIGNAL ww_acc_out : std_logic_vector(31 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \acc_out[0]~output_o\ : std_logic;
SIGNAL \acc_out[1]~output_o\ : std_logic;
SIGNAL \acc_out[2]~output_o\ : std_logic;
SIGNAL \acc_out[3]~output_o\ : std_logic;
SIGNAL \acc_out[4]~output_o\ : std_logic;
SIGNAL \acc_out[5]~output_o\ : std_logic;
SIGNAL \acc_out[6]~output_o\ : std_logic;
SIGNAL \acc_out[7]~output_o\ : std_logic;
SIGNAL \acc_out[8]~output_o\ : std_logic;
SIGNAL \acc_out[9]~output_o\ : std_logic;
SIGNAL \acc_out[10]~output_o\ : std_logic;
SIGNAL \acc_out[11]~output_o\ : std_logic;
SIGNAL \acc_out[12]~output_o\ : std_logic;
SIGNAL \acc_out[13]~output_o\ : std_logic;
SIGNAL \acc_out[14]~output_o\ : std_logic;
SIGNAL \acc_out[15]~output_o\ : std_logic;
SIGNAL \acc_out[16]~output_o\ : std_logic;
SIGNAL \acc_out[17]~output_o\ : std_logic;
SIGNAL \acc_out[18]~output_o\ : std_logic;
SIGNAL \acc_out[19]~output_o\ : std_logic;
SIGNAL \acc_out[20]~output_o\ : std_logic;
SIGNAL \acc_out[21]~output_o\ : std_logic;
SIGNAL \acc_out[22]~output_o\ : std_logic;
SIGNAL \acc_out[23]~output_o\ : std_logic;
SIGNAL \acc_out[24]~output_o\ : std_logic;
SIGNAL \acc_out[25]~output_o\ : std_logic;
SIGNAL \acc_out[26]~output_o\ : std_logic;
SIGNAL \acc_out[27]~output_o\ : std_logic;
SIGNAL \acc_out[28]~output_o\ : std_logic;
SIGNAL \acc_out[29]~output_o\ : std_logic;
SIGNAL \acc_out[30]~output_o\ : std_logic;
SIGNAL \acc_out[31]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \acc_out_s[0]~32_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \w_en~input_o\ : std_logic;
SIGNAL \acc_out_s[0]~34_combout\ : std_logic;
SIGNAL \acc_out_s[0]~33\ : std_logic;
SIGNAL \acc_out_s[1]~35_combout\ : std_logic;
SIGNAL \acc_out_s[1]~36\ : std_logic;
SIGNAL \acc_out_s[2]~37_combout\ : std_logic;
SIGNAL \acc_out_s[2]~38\ : std_logic;
SIGNAL \acc_out_s[3]~39_combout\ : std_logic;
SIGNAL \acc_out_s[3]~40\ : std_logic;
SIGNAL \acc_out_s[4]~41_combout\ : std_logic;
SIGNAL \acc_out_s[4]~42\ : std_logic;
SIGNAL \acc_out_s[5]~43_combout\ : std_logic;
SIGNAL \acc_out_s[5]~44\ : std_logic;
SIGNAL \acc_out_s[6]~45_combout\ : std_logic;
SIGNAL \acc_out_s[6]~46\ : std_logic;
SIGNAL \acc_out_s[7]~47_combout\ : std_logic;
SIGNAL \acc_out_s[7]~48\ : std_logic;
SIGNAL \acc_out_s[8]~49_combout\ : std_logic;
SIGNAL \acc_out_s[8]~50\ : std_logic;
SIGNAL \acc_out_s[9]~51_combout\ : std_logic;
SIGNAL \acc_out_s[9]~52\ : std_logic;
SIGNAL \acc_out_s[10]~53_combout\ : std_logic;
SIGNAL \acc_out_s[10]~54\ : std_logic;
SIGNAL \acc_out_s[11]~55_combout\ : std_logic;
SIGNAL \acc_out_s[11]~56\ : std_logic;
SIGNAL \acc_out_s[12]~57_combout\ : std_logic;
SIGNAL \acc_out_s[12]~58\ : std_logic;
SIGNAL \acc_out_s[13]~59_combout\ : std_logic;
SIGNAL \acc_out_s[13]~60\ : std_logic;
SIGNAL \acc_out_s[14]~61_combout\ : std_logic;
SIGNAL \acc_out_s[14]~62\ : std_logic;
SIGNAL \acc_out_s[15]~63_combout\ : std_logic;
SIGNAL \acc_out_s[15]~64\ : std_logic;
SIGNAL \acc_out_s[16]~65_combout\ : std_logic;
SIGNAL \acc_out_s[16]~66\ : std_logic;
SIGNAL \acc_out_s[17]~67_combout\ : std_logic;
SIGNAL \acc_out_s[17]~68\ : std_logic;
SIGNAL \acc_out_s[18]~69_combout\ : std_logic;
SIGNAL \acc_out_s[18]~70\ : std_logic;
SIGNAL \acc_out_s[19]~71_combout\ : std_logic;
SIGNAL \acc_out_s[19]~72\ : std_logic;
SIGNAL \acc_out_s[20]~73_combout\ : std_logic;
SIGNAL \acc_out_s[20]~74\ : std_logic;
SIGNAL \acc_out_s[21]~75_combout\ : std_logic;
SIGNAL \acc_out_s[21]~76\ : std_logic;
SIGNAL \acc_out_s[22]~77_combout\ : std_logic;
SIGNAL \acc_out_s[22]~78\ : std_logic;
SIGNAL \acc_out_s[23]~79_combout\ : std_logic;
SIGNAL \acc_out_s[23]~80\ : std_logic;
SIGNAL \acc_out_s[24]~81_combout\ : std_logic;
SIGNAL \acc_out_s[24]~82\ : std_logic;
SIGNAL \acc_out_s[25]~83_combout\ : std_logic;
SIGNAL \acc_out_s[25]~84\ : std_logic;
SIGNAL \acc_out_s[26]~85_combout\ : std_logic;
SIGNAL \acc_out_s[26]~86\ : std_logic;
SIGNAL \acc_out_s[27]~87_combout\ : std_logic;
SIGNAL \acc_out_s[27]~88\ : std_logic;
SIGNAL \acc_out_s[28]~89_combout\ : std_logic;
SIGNAL \acc_out_s[28]~90\ : std_logic;
SIGNAL \acc_out_s[29]~91_combout\ : std_logic;
SIGNAL \acc_out_s[29]~92\ : std_logic;
SIGNAL \acc_out_s[30]~93_combout\ : std_logic;
SIGNAL \acc_out_s[30]~94\ : std_logic;
SIGNAL \acc_out_s[31]~95_combout\ : std_logic;
SIGNAL acc_out_s : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_w_en <= w_en;
acc_out <= ww_acc_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X33_Y24_N2
\acc_out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(0),
	devoe => ww_devoe,
	o => \acc_out[0]~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\acc_out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(1),
	devoe => ww_devoe,
	o => \acc_out[1]~output_o\);

-- Location: IOOBUF_X33_Y27_N2
\acc_out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(2),
	devoe => ww_devoe,
	o => \acc_out[2]~output_o\);

-- Location: IOOBUF_X31_Y31_N9
\acc_out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(3),
	devoe => ww_devoe,
	o => \acc_out[3]~output_o\);

-- Location: IOOBUF_X33_Y11_N9
\acc_out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(4),
	devoe => ww_devoe,
	o => \acc_out[4]~output_o\);

-- Location: IOOBUF_X33_Y25_N9
\acc_out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(5),
	devoe => ww_devoe,
	o => \acc_out[5]~output_o\);

-- Location: IOOBUF_X31_Y31_N2
\acc_out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(6),
	devoe => ww_devoe,
	o => \acc_out[6]~output_o\);

-- Location: IOOBUF_X33_Y22_N9
\acc_out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(7),
	devoe => ww_devoe,
	o => \acc_out[7]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\acc_out[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(8),
	devoe => ww_devoe,
	o => \acc_out[8]~output_o\);

-- Location: IOOBUF_X33_Y14_N2
\acc_out[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(9),
	devoe => ww_devoe,
	o => \acc_out[9]~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\acc_out[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(10),
	devoe => ww_devoe,
	o => \acc_out[10]~output_o\);

-- Location: IOOBUF_X33_Y25_N2
\acc_out[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(11),
	devoe => ww_devoe,
	o => \acc_out[11]~output_o\);

-- Location: IOOBUF_X33_Y10_N2
\acc_out[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(12),
	devoe => ww_devoe,
	o => \acc_out[12]~output_o\);

-- Location: IOOBUF_X29_Y31_N9
\acc_out[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(13),
	devoe => ww_devoe,
	o => \acc_out[13]~output_o\);

-- Location: IOOBUF_X33_Y10_N9
\acc_out[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(14),
	devoe => ww_devoe,
	o => \acc_out[14]~output_o\);

-- Location: IOOBUF_X33_Y27_N9
\acc_out[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(15),
	devoe => ww_devoe,
	o => \acc_out[15]~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\acc_out[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(16),
	devoe => ww_devoe,
	o => \acc_out[16]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\acc_out[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(17),
	devoe => ww_devoe,
	o => \acc_out[17]~output_o\);

-- Location: IOOBUF_X33_Y28_N9
\acc_out[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(18),
	devoe => ww_devoe,
	o => \acc_out[18]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\acc_out[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(19),
	devoe => ww_devoe,
	o => \acc_out[19]~output_o\);

-- Location: IOOBUF_X26_Y0_N2
\acc_out[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(20),
	devoe => ww_devoe,
	o => \acc_out[20]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\acc_out[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(21),
	devoe => ww_devoe,
	o => \acc_out[21]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\acc_out[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(22),
	devoe => ww_devoe,
	o => \acc_out[22]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\acc_out[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(23),
	devoe => ww_devoe,
	o => \acc_out[23]~output_o\);

-- Location: IOOBUF_X33_Y12_N2
\acc_out[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(24),
	devoe => ww_devoe,
	o => \acc_out[24]~output_o\);

-- Location: IOOBUF_X33_Y11_N2
\acc_out[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(25),
	devoe => ww_devoe,
	o => \acc_out[25]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\acc_out[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(26),
	devoe => ww_devoe,
	o => \acc_out[26]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\acc_out[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(27),
	devoe => ww_devoe,
	o => \acc_out[27]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\acc_out[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(28),
	devoe => ww_devoe,
	o => \acc_out[28]~output_o\);

-- Location: IOOBUF_X33_Y12_N9
\acc_out[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(29),
	devoe => ww_devoe,
	o => \acc_out[29]~output_o\);

-- Location: IOOBUF_X33_Y28_N2
\acc_out[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(30),
	devoe => ww_devoe,
	o => \acc_out[30]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\acc_out[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => acc_out_s(31),
	devoe => ww_devoe,
	o => \acc_out[31]~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X32_Y13_N0
\acc_out_s[0]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[0]~32_combout\ = acc_out_s(0) $ (VCC)
-- \acc_out_s[0]~33\ = CARRY(acc_out_s(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(0),
	datad => VCC,
	combout => \acc_out_s[0]~32_combout\,
	cout => \acc_out_s[0]~33\);

-- Location: IOIBUF_X33_Y15_N8
\rst~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X33_Y22_N1
\w_en~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_w_en,
	o => \w_en~input_o\);

-- Location: LCCOMB_X32_Y15_N8
\acc_out_s[0]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[0]~34_combout\ = (\rst~input_o\) # (\w_en~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \w_en~input_o\,
	combout => \acc_out_s[0]~34_combout\);

-- Location: FF_X32_Y13_N1
\acc_out_s[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[0]~32_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(0));

-- Location: LCCOMB_X32_Y13_N2
\acc_out_s[1]~35\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[1]~35_combout\ = (acc_out_s(1) & (!\acc_out_s[0]~33\)) # (!acc_out_s(1) & ((\acc_out_s[0]~33\) # (GND)))
-- \acc_out_s[1]~36\ = CARRY((!\acc_out_s[0]~33\) # (!acc_out_s(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(1),
	datad => VCC,
	cin => \acc_out_s[0]~33\,
	combout => \acc_out_s[1]~35_combout\,
	cout => \acc_out_s[1]~36\);

-- Location: FF_X32_Y13_N3
\acc_out_s[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[1]~35_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(1));

-- Location: LCCOMB_X32_Y13_N4
\acc_out_s[2]~37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[2]~37_combout\ = (acc_out_s(2) & (\acc_out_s[1]~36\ $ (GND))) # (!acc_out_s(2) & (!\acc_out_s[1]~36\ & VCC))
-- \acc_out_s[2]~38\ = CARRY((acc_out_s(2) & !\acc_out_s[1]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(2),
	datad => VCC,
	cin => \acc_out_s[1]~36\,
	combout => \acc_out_s[2]~37_combout\,
	cout => \acc_out_s[2]~38\);

-- Location: FF_X32_Y13_N5
\acc_out_s[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[2]~37_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(2));

-- Location: LCCOMB_X32_Y13_N6
\acc_out_s[3]~39\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[3]~39_combout\ = (acc_out_s(3) & (!\acc_out_s[2]~38\)) # (!acc_out_s(3) & ((\acc_out_s[2]~38\) # (GND)))
-- \acc_out_s[3]~40\ = CARRY((!\acc_out_s[2]~38\) # (!acc_out_s(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(3),
	datad => VCC,
	cin => \acc_out_s[2]~38\,
	combout => \acc_out_s[3]~39_combout\,
	cout => \acc_out_s[3]~40\);

-- Location: FF_X32_Y13_N7
\acc_out_s[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[3]~39_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(3));

-- Location: LCCOMB_X32_Y13_N8
\acc_out_s[4]~41\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[4]~41_combout\ = (acc_out_s(4) & (\acc_out_s[3]~40\ $ (GND))) # (!acc_out_s(4) & (!\acc_out_s[3]~40\ & VCC))
-- \acc_out_s[4]~42\ = CARRY((acc_out_s(4) & !\acc_out_s[3]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(4),
	datad => VCC,
	cin => \acc_out_s[3]~40\,
	combout => \acc_out_s[4]~41_combout\,
	cout => \acc_out_s[4]~42\);

-- Location: FF_X32_Y13_N9
\acc_out_s[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[4]~41_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(4));

-- Location: LCCOMB_X32_Y13_N10
\acc_out_s[5]~43\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[5]~43_combout\ = (acc_out_s(5) & (!\acc_out_s[4]~42\)) # (!acc_out_s(5) & ((\acc_out_s[4]~42\) # (GND)))
-- \acc_out_s[5]~44\ = CARRY((!\acc_out_s[4]~42\) # (!acc_out_s(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(5),
	datad => VCC,
	cin => \acc_out_s[4]~42\,
	combout => \acc_out_s[5]~43_combout\,
	cout => \acc_out_s[5]~44\);

-- Location: FF_X32_Y13_N11
\acc_out_s[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[5]~43_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(5));

-- Location: LCCOMB_X32_Y13_N12
\acc_out_s[6]~45\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[6]~45_combout\ = (acc_out_s(6) & (\acc_out_s[5]~44\ $ (GND))) # (!acc_out_s(6) & (!\acc_out_s[5]~44\ & VCC))
-- \acc_out_s[6]~46\ = CARRY((acc_out_s(6) & !\acc_out_s[5]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(6),
	datad => VCC,
	cin => \acc_out_s[5]~44\,
	combout => \acc_out_s[6]~45_combout\,
	cout => \acc_out_s[6]~46\);

-- Location: FF_X32_Y13_N13
\acc_out_s[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[6]~45_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(6));

-- Location: LCCOMB_X32_Y13_N14
\acc_out_s[7]~47\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[7]~47_combout\ = (acc_out_s(7) & (!\acc_out_s[6]~46\)) # (!acc_out_s(7) & ((\acc_out_s[6]~46\) # (GND)))
-- \acc_out_s[7]~48\ = CARRY((!\acc_out_s[6]~46\) # (!acc_out_s(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(7),
	datad => VCC,
	cin => \acc_out_s[6]~46\,
	combout => \acc_out_s[7]~47_combout\,
	cout => \acc_out_s[7]~48\);

-- Location: FF_X32_Y13_N15
\acc_out_s[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[7]~47_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(7));

-- Location: LCCOMB_X32_Y13_N16
\acc_out_s[8]~49\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[8]~49_combout\ = (acc_out_s(8) & (\acc_out_s[7]~48\ $ (GND))) # (!acc_out_s(8) & (!\acc_out_s[7]~48\ & VCC))
-- \acc_out_s[8]~50\ = CARRY((acc_out_s(8) & !\acc_out_s[7]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(8),
	datad => VCC,
	cin => \acc_out_s[7]~48\,
	combout => \acc_out_s[8]~49_combout\,
	cout => \acc_out_s[8]~50\);

-- Location: FF_X32_Y13_N17
\acc_out_s[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[8]~49_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(8));

-- Location: LCCOMB_X32_Y13_N18
\acc_out_s[9]~51\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[9]~51_combout\ = (acc_out_s(9) & (!\acc_out_s[8]~50\)) # (!acc_out_s(9) & ((\acc_out_s[8]~50\) # (GND)))
-- \acc_out_s[9]~52\ = CARRY((!\acc_out_s[8]~50\) # (!acc_out_s(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(9),
	datad => VCC,
	cin => \acc_out_s[8]~50\,
	combout => \acc_out_s[9]~51_combout\,
	cout => \acc_out_s[9]~52\);

-- Location: FF_X32_Y13_N19
\acc_out_s[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[9]~51_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(9));

-- Location: LCCOMB_X32_Y13_N20
\acc_out_s[10]~53\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[10]~53_combout\ = (acc_out_s(10) & (\acc_out_s[9]~52\ $ (GND))) # (!acc_out_s(10) & (!\acc_out_s[9]~52\ & VCC))
-- \acc_out_s[10]~54\ = CARRY((acc_out_s(10) & !\acc_out_s[9]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(10),
	datad => VCC,
	cin => \acc_out_s[9]~52\,
	combout => \acc_out_s[10]~53_combout\,
	cout => \acc_out_s[10]~54\);

-- Location: FF_X32_Y13_N21
\acc_out_s[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[10]~53_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(10));

-- Location: LCCOMB_X32_Y13_N22
\acc_out_s[11]~55\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[11]~55_combout\ = (acc_out_s(11) & (!\acc_out_s[10]~54\)) # (!acc_out_s(11) & ((\acc_out_s[10]~54\) # (GND)))
-- \acc_out_s[11]~56\ = CARRY((!\acc_out_s[10]~54\) # (!acc_out_s(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(11),
	datad => VCC,
	cin => \acc_out_s[10]~54\,
	combout => \acc_out_s[11]~55_combout\,
	cout => \acc_out_s[11]~56\);

-- Location: FF_X32_Y13_N23
\acc_out_s[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[11]~55_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(11));

-- Location: LCCOMB_X32_Y13_N24
\acc_out_s[12]~57\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[12]~57_combout\ = (acc_out_s(12) & (\acc_out_s[11]~56\ $ (GND))) # (!acc_out_s(12) & (!\acc_out_s[11]~56\ & VCC))
-- \acc_out_s[12]~58\ = CARRY((acc_out_s(12) & !\acc_out_s[11]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(12),
	datad => VCC,
	cin => \acc_out_s[11]~56\,
	combout => \acc_out_s[12]~57_combout\,
	cout => \acc_out_s[12]~58\);

-- Location: FF_X32_Y13_N25
\acc_out_s[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[12]~57_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(12));

-- Location: LCCOMB_X32_Y13_N26
\acc_out_s[13]~59\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[13]~59_combout\ = (acc_out_s(13) & (!\acc_out_s[12]~58\)) # (!acc_out_s(13) & ((\acc_out_s[12]~58\) # (GND)))
-- \acc_out_s[13]~60\ = CARRY((!\acc_out_s[12]~58\) # (!acc_out_s(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(13),
	datad => VCC,
	cin => \acc_out_s[12]~58\,
	combout => \acc_out_s[13]~59_combout\,
	cout => \acc_out_s[13]~60\);

-- Location: FF_X32_Y13_N27
\acc_out_s[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[13]~59_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(13));

-- Location: LCCOMB_X32_Y13_N28
\acc_out_s[14]~61\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[14]~61_combout\ = (acc_out_s(14) & (\acc_out_s[13]~60\ $ (GND))) # (!acc_out_s(14) & (!\acc_out_s[13]~60\ & VCC))
-- \acc_out_s[14]~62\ = CARRY((acc_out_s(14) & !\acc_out_s[13]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(14),
	datad => VCC,
	cin => \acc_out_s[13]~60\,
	combout => \acc_out_s[14]~61_combout\,
	cout => \acc_out_s[14]~62\);

-- Location: FF_X32_Y13_N29
\acc_out_s[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[14]~61_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(14));

-- Location: LCCOMB_X32_Y13_N30
\acc_out_s[15]~63\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[15]~63_combout\ = (acc_out_s(15) & (!\acc_out_s[14]~62\)) # (!acc_out_s(15) & ((\acc_out_s[14]~62\) # (GND)))
-- \acc_out_s[15]~64\ = CARRY((!\acc_out_s[14]~62\) # (!acc_out_s(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(15),
	datad => VCC,
	cin => \acc_out_s[14]~62\,
	combout => \acc_out_s[15]~63_combout\,
	cout => \acc_out_s[15]~64\);

-- Location: FF_X32_Y13_N31
\acc_out_s[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[15]~63_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(15));

-- Location: LCCOMB_X32_Y12_N0
\acc_out_s[16]~65\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[16]~65_combout\ = (acc_out_s(16) & (\acc_out_s[15]~64\ $ (GND))) # (!acc_out_s(16) & (!\acc_out_s[15]~64\ & VCC))
-- \acc_out_s[16]~66\ = CARRY((acc_out_s(16) & !\acc_out_s[15]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(16),
	datad => VCC,
	cin => \acc_out_s[15]~64\,
	combout => \acc_out_s[16]~65_combout\,
	cout => \acc_out_s[16]~66\);

-- Location: FF_X32_Y12_N1
\acc_out_s[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[16]~65_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(16));

-- Location: LCCOMB_X32_Y12_N2
\acc_out_s[17]~67\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[17]~67_combout\ = (acc_out_s(17) & (!\acc_out_s[16]~66\)) # (!acc_out_s(17) & ((\acc_out_s[16]~66\) # (GND)))
-- \acc_out_s[17]~68\ = CARRY((!\acc_out_s[16]~66\) # (!acc_out_s(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(17),
	datad => VCC,
	cin => \acc_out_s[16]~66\,
	combout => \acc_out_s[17]~67_combout\,
	cout => \acc_out_s[17]~68\);

-- Location: FF_X32_Y12_N3
\acc_out_s[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[17]~67_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(17));

-- Location: LCCOMB_X32_Y12_N4
\acc_out_s[18]~69\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[18]~69_combout\ = (acc_out_s(18) & (\acc_out_s[17]~68\ $ (GND))) # (!acc_out_s(18) & (!\acc_out_s[17]~68\ & VCC))
-- \acc_out_s[18]~70\ = CARRY((acc_out_s(18) & !\acc_out_s[17]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(18),
	datad => VCC,
	cin => \acc_out_s[17]~68\,
	combout => \acc_out_s[18]~69_combout\,
	cout => \acc_out_s[18]~70\);

-- Location: FF_X32_Y12_N5
\acc_out_s[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[18]~69_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(18));

-- Location: LCCOMB_X32_Y12_N6
\acc_out_s[19]~71\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[19]~71_combout\ = (acc_out_s(19) & (!\acc_out_s[18]~70\)) # (!acc_out_s(19) & ((\acc_out_s[18]~70\) # (GND)))
-- \acc_out_s[19]~72\ = CARRY((!\acc_out_s[18]~70\) # (!acc_out_s(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(19),
	datad => VCC,
	cin => \acc_out_s[18]~70\,
	combout => \acc_out_s[19]~71_combout\,
	cout => \acc_out_s[19]~72\);

-- Location: FF_X32_Y12_N7
\acc_out_s[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[19]~71_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(19));

-- Location: LCCOMB_X32_Y12_N8
\acc_out_s[20]~73\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[20]~73_combout\ = (acc_out_s(20) & (\acc_out_s[19]~72\ $ (GND))) # (!acc_out_s(20) & (!\acc_out_s[19]~72\ & VCC))
-- \acc_out_s[20]~74\ = CARRY((acc_out_s(20) & !\acc_out_s[19]~72\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(20),
	datad => VCC,
	cin => \acc_out_s[19]~72\,
	combout => \acc_out_s[20]~73_combout\,
	cout => \acc_out_s[20]~74\);

-- Location: FF_X32_Y12_N9
\acc_out_s[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[20]~73_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(20));

-- Location: LCCOMB_X32_Y12_N10
\acc_out_s[21]~75\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[21]~75_combout\ = (acc_out_s(21) & (!\acc_out_s[20]~74\)) # (!acc_out_s(21) & ((\acc_out_s[20]~74\) # (GND)))
-- \acc_out_s[21]~76\ = CARRY((!\acc_out_s[20]~74\) # (!acc_out_s(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(21),
	datad => VCC,
	cin => \acc_out_s[20]~74\,
	combout => \acc_out_s[21]~75_combout\,
	cout => \acc_out_s[21]~76\);

-- Location: FF_X32_Y12_N11
\acc_out_s[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[21]~75_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(21));

-- Location: LCCOMB_X32_Y12_N12
\acc_out_s[22]~77\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[22]~77_combout\ = (acc_out_s(22) & (\acc_out_s[21]~76\ $ (GND))) # (!acc_out_s(22) & (!\acc_out_s[21]~76\ & VCC))
-- \acc_out_s[22]~78\ = CARRY((acc_out_s(22) & !\acc_out_s[21]~76\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(22),
	datad => VCC,
	cin => \acc_out_s[21]~76\,
	combout => \acc_out_s[22]~77_combout\,
	cout => \acc_out_s[22]~78\);

-- Location: FF_X32_Y12_N13
\acc_out_s[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[22]~77_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(22));

-- Location: LCCOMB_X32_Y12_N14
\acc_out_s[23]~79\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[23]~79_combout\ = (acc_out_s(23) & (!\acc_out_s[22]~78\)) # (!acc_out_s(23) & ((\acc_out_s[22]~78\) # (GND)))
-- \acc_out_s[23]~80\ = CARRY((!\acc_out_s[22]~78\) # (!acc_out_s(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(23),
	datad => VCC,
	cin => \acc_out_s[22]~78\,
	combout => \acc_out_s[23]~79_combout\,
	cout => \acc_out_s[23]~80\);

-- Location: FF_X32_Y12_N15
\acc_out_s[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[23]~79_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(23));

-- Location: LCCOMB_X32_Y12_N16
\acc_out_s[24]~81\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[24]~81_combout\ = (acc_out_s(24) & (\acc_out_s[23]~80\ $ (GND))) # (!acc_out_s(24) & (!\acc_out_s[23]~80\ & VCC))
-- \acc_out_s[24]~82\ = CARRY((acc_out_s(24) & !\acc_out_s[23]~80\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(24),
	datad => VCC,
	cin => \acc_out_s[23]~80\,
	combout => \acc_out_s[24]~81_combout\,
	cout => \acc_out_s[24]~82\);

-- Location: FF_X32_Y12_N17
\acc_out_s[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[24]~81_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(24));

-- Location: LCCOMB_X32_Y12_N18
\acc_out_s[25]~83\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[25]~83_combout\ = (acc_out_s(25) & (!\acc_out_s[24]~82\)) # (!acc_out_s(25) & ((\acc_out_s[24]~82\) # (GND)))
-- \acc_out_s[25]~84\ = CARRY((!\acc_out_s[24]~82\) # (!acc_out_s(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(25),
	datad => VCC,
	cin => \acc_out_s[24]~82\,
	combout => \acc_out_s[25]~83_combout\,
	cout => \acc_out_s[25]~84\);

-- Location: FF_X32_Y12_N19
\acc_out_s[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[25]~83_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(25));

-- Location: LCCOMB_X32_Y12_N20
\acc_out_s[26]~85\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[26]~85_combout\ = (acc_out_s(26) & (\acc_out_s[25]~84\ $ (GND))) # (!acc_out_s(26) & (!\acc_out_s[25]~84\ & VCC))
-- \acc_out_s[26]~86\ = CARRY((acc_out_s(26) & !\acc_out_s[25]~84\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(26),
	datad => VCC,
	cin => \acc_out_s[25]~84\,
	combout => \acc_out_s[26]~85_combout\,
	cout => \acc_out_s[26]~86\);

-- Location: FF_X32_Y12_N21
\acc_out_s[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[26]~85_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(26));

-- Location: LCCOMB_X32_Y12_N22
\acc_out_s[27]~87\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[27]~87_combout\ = (acc_out_s(27) & (!\acc_out_s[26]~86\)) # (!acc_out_s(27) & ((\acc_out_s[26]~86\) # (GND)))
-- \acc_out_s[27]~88\ = CARRY((!\acc_out_s[26]~86\) # (!acc_out_s(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(27),
	datad => VCC,
	cin => \acc_out_s[26]~86\,
	combout => \acc_out_s[27]~87_combout\,
	cout => \acc_out_s[27]~88\);

-- Location: FF_X32_Y12_N23
\acc_out_s[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[27]~87_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(27));

-- Location: LCCOMB_X32_Y12_N24
\acc_out_s[28]~89\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[28]~89_combout\ = (acc_out_s(28) & (\acc_out_s[27]~88\ $ (GND))) # (!acc_out_s(28) & (!\acc_out_s[27]~88\ & VCC))
-- \acc_out_s[28]~90\ = CARRY((acc_out_s(28) & !\acc_out_s[27]~88\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(28),
	datad => VCC,
	cin => \acc_out_s[27]~88\,
	combout => \acc_out_s[28]~89_combout\,
	cout => \acc_out_s[28]~90\);

-- Location: FF_X32_Y12_N25
\acc_out_s[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[28]~89_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(28));

-- Location: LCCOMB_X32_Y12_N26
\acc_out_s[29]~91\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[29]~91_combout\ = (acc_out_s(29) & (!\acc_out_s[28]~90\)) # (!acc_out_s(29) & ((\acc_out_s[28]~90\) # (GND)))
-- \acc_out_s[29]~92\ = CARRY((!\acc_out_s[28]~90\) # (!acc_out_s(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(29),
	datad => VCC,
	cin => \acc_out_s[28]~90\,
	combout => \acc_out_s[29]~91_combout\,
	cout => \acc_out_s[29]~92\);

-- Location: FF_X32_Y12_N27
\acc_out_s[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[29]~91_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(29));

-- Location: LCCOMB_X32_Y12_N28
\acc_out_s[30]~93\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[30]~93_combout\ = (acc_out_s(30) & (\acc_out_s[29]~92\ $ (GND))) # (!acc_out_s(30) & (!\acc_out_s[29]~92\ & VCC))
-- \acc_out_s[30]~94\ = CARRY((acc_out_s(30) & !\acc_out_s[29]~92\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => acc_out_s(30),
	datad => VCC,
	cin => \acc_out_s[29]~92\,
	combout => \acc_out_s[30]~93_combout\,
	cout => \acc_out_s[30]~94\);

-- Location: FF_X32_Y12_N29
\acc_out_s[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[30]~93_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(30));

-- Location: LCCOMB_X32_Y12_N30
\acc_out_s[31]~95\ : cycloneiv_lcell_comb
-- Equation(s):
-- \acc_out_s[31]~95_combout\ = acc_out_s(31) $ (\acc_out_s[30]~94\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => acc_out_s(31),
	cin => \acc_out_s[30]~94\,
	combout => \acc_out_s[31]~95_combout\);

-- Location: FF_X32_Y12_N31
\acc_out_s[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \acc_out_s[31]~95_combout\,
	sclr => \rst~input_o\,
	ena => \acc_out_s[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_out_s(31));

ww_acc_out(0) <= \acc_out[0]~output_o\;

ww_acc_out(1) <= \acc_out[1]~output_o\;

ww_acc_out(2) <= \acc_out[2]~output_o\;

ww_acc_out(3) <= \acc_out[3]~output_o\;

ww_acc_out(4) <= \acc_out[4]~output_o\;

ww_acc_out(5) <= \acc_out[5]~output_o\;

ww_acc_out(6) <= \acc_out[6]~output_o\;

ww_acc_out(7) <= \acc_out[7]~output_o\;

ww_acc_out(8) <= \acc_out[8]~output_o\;

ww_acc_out(9) <= \acc_out[9]~output_o\;

ww_acc_out(10) <= \acc_out[10]~output_o\;

ww_acc_out(11) <= \acc_out[11]~output_o\;

ww_acc_out(12) <= \acc_out[12]~output_o\;

ww_acc_out(13) <= \acc_out[13]~output_o\;

ww_acc_out(14) <= \acc_out[14]~output_o\;

ww_acc_out(15) <= \acc_out[15]~output_o\;

ww_acc_out(16) <= \acc_out[16]~output_o\;

ww_acc_out(17) <= \acc_out[17]~output_o\;

ww_acc_out(18) <= \acc_out[18]~output_o\;

ww_acc_out(19) <= \acc_out[19]~output_o\;

ww_acc_out(20) <= \acc_out[20]~output_o\;

ww_acc_out(21) <= \acc_out[21]~output_o\;

ww_acc_out(22) <= \acc_out[22]~output_o\;

ww_acc_out(23) <= \acc_out[23]~output_o\;

ww_acc_out(24) <= \acc_out[24]~output_o\;

ww_acc_out(25) <= \acc_out[25]~output_o\;

ww_acc_out(26) <= \acc_out[26]~output_o\;

ww_acc_out(27) <= \acc_out[27]~output_o\;

ww_acc_out(28) <= \acc_out[28]~output_o\;

ww_acc_out(29) <= \acc_out[29]~output_o\;

ww_acc_out(30) <= \acc_out[30]~output_o\;

ww_acc_out(31) <= \acc_out[31]~output_o\;
END structure;


