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

-- DATE "09/18/2025 22:30:24"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	decoder IS
    PORT (
	Din : IN std_logic_vector(2 DOWNTO 0);
	Dout : OUT std_logic_vector(7 DOWNTO 0)
	);
END decoder;

-- Design Ports Information
-- Dout[0]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[1]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[2]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[4]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[5]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[6]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[7]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[2]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[0]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[1]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Din : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Dout : std_logic_vector(7 DOWNTO 0);
SIGNAL \Dout[0]~output_o\ : std_logic;
SIGNAL \Dout[1]~output_o\ : std_logic;
SIGNAL \Dout[2]~output_o\ : std_logic;
SIGNAL \Dout[3]~output_o\ : std_logic;
SIGNAL \Dout[4]~output_o\ : std_logic;
SIGNAL \Dout[5]~output_o\ : std_logic;
SIGNAL \Dout[6]~output_o\ : std_logic;
SIGNAL \Dout[7]~output_o\ : std_logic;
SIGNAL \Din[2]~input_o\ : std_logic;
SIGNAL \Din[1]~input_o\ : std_logic;
SIGNAL \Din[0]~input_o\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \Mux7~5_combout\ : std_logic;
SIGNAL \Mux7~6_combout\ : std_logic;
SIGNAL \Mux7~7_combout\ : std_logic;

BEGIN

ww_Din <= Din;
Dout <= ww_Dout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X14_Y0_N2
\Dout[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~0_combout\,
	devoe => ww_devoe,
	o => \Dout[0]~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\Dout[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~1_combout\,
	devoe => ww_devoe,
	o => \Dout[1]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\Dout[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~2_combout\,
	devoe => ww_devoe,
	o => \Dout[2]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\Dout[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~3_combout\,
	devoe => ww_devoe,
	o => \Dout[3]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\Dout[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~4_combout\,
	devoe => ww_devoe,
	o => \Dout[4]~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\Dout[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~5_combout\,
	devoe => ww_devoe,
	o => \Dout[5]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\Dout[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~6_combout\,
	devoe => ww_devoe,
	o => \Dout[6]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\Dout[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~7_combout\,
	devoe => ww_devoe,
	o => \Dout[7]~output_o\);

-- Location: IOIBUF_X33_Y14_N1
\Din[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(2),
	o => \Din[2]~input_o\);

-- Location: IOIBUF_X33_Y16_N15
\Din[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(1),
	o => \Din[1]~input_o\);

-- Location: IOIBUF_X33_Y16_N22
\Din[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(0),
	o => \Din[0]~input_o\);

-- Location: LCCOMB_X15_Y3_N16
\Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (!\Din[2]~input_o\ & (!\Din[1]~input_o\ & !\Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X15_Y3_N2
\Mux7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (!\Din[2]~input_o\ & (!\Din[1]~input_o\ & \Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X15_Y3_N4
\Mux7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (!\Din[2]~input_o\ & (\Din[1]~input_o\ & !\Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X15_Y3_N22
\Mux7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (!\Din[2]~input_o\ & (\Din[1]~input_o\ & \Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~3_combout\);

-- Location: LCCOMB_X15_Y3_N24
\Mux7~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = (\Din[2]~input_o\ & (!\Din[1]~input_o\ & !\Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~4_combout\);

-- Location: LCCOMB_X15_Y3_N26
\Mux7~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~5_combout\ = (\Din[2]~input_o\ & (!\Din[1]~input_o\ & \Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~5_combout\);

-- Location: LCCOMB_X15_Y3_N12
\Mux7~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~6_combout\ = (\Din[2]~input_o\ & (\Din[1]~input_o\ & !\Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~6_combout\);

-- Location: LCCOMB_X15_Y3_N30
\Mux7~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~7_combout\ = (\Din[2]~input_o\ & (\Din[1]~input_o\ & \Din[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din[2]~input_o\,
	datac => \Din[1]~input_o\,
	datad => \Din[0]~input_o\,
	combout => \Mux7~7_combout\);

ww_Dout(0) <= \Dout[0]~output_o\;

ww_Dout(1) <= \Dout[1]~output_o\;

ww_Dout(2) <= \Dout[2]~output_o\;

ww_Dout(3) <= \Dout[3]~output_o\;

ww_Dout(4) <= \Dout[4]~output_o\;

ww_Dout(5) <= \Dout[5]~output_o\;

ww_Dout(6) <= \Dout[6]~output_o\;

ww_Dout(7) <= \Dout[7]~output_o\;
END structure;


