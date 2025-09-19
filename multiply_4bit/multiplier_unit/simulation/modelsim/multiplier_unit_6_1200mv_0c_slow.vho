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

-- DATE "09/18/2025 11:13:27"

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

ENTITY 	multiplier_unit IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic;
	uout : OUT std_logic_vector(3 DOWNTO 0)
	);
END multiplier_unit;

-- Design Ports Information
-- uout[0]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uout[1]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uout[2]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- uout[3]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF multiplier_unit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic;
SIGNAL ww_uout : std_logic_vector(3 DOWNTO 0);
SIGNAL \uout[0]~output_o\ : std_logic;
SIGNAL \uout[1]~output_o\ : std_logic;
SIGNAL \uout[2]~output_o\ : std_logic;
SIGNAL \uout[3]~output_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \uout~0_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \uout~1_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \uout~2_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \uout~3_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
uout <= ww_uout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X14_Y0_N2
\uout[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uout~0_combout\,
	devoe => ww_devoe,
	o => \uout[0]~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\uout[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uout~1_combout\,
	devoe => ww_devoe,
	o => \uout[1]~output_o\);

-- Location: IOOBUF_X26_Y0_N2
\uout[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uout~2_combout\,
	devoe => ww_devoe,
	o => \uout[2]~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\uout[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uout~3_combout\,
	devoe => ww_devoe,
	o => \uout[3]~output_o\);

-- Location: IOIBUF_X8_Y0_N1
\a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X12_Y0_N8
\b~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: LCCOMB_X6_Y1_N16
\uout~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \uout~0_combout\ = (\a[0]~input_o\ & \b~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[0]~input_o\,
	datad => \b~input_o\,
	combout => \uout~0_combout\);

-- Location: IOIBUF_X14_Y0_N8
\a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X6_Y1_N10
\uout~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \uout~1_combout\ = (\b~input_o\ & \a[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b~input_o\,
	datad => \a[1]~input_o\,
	combout => \uout~1_combout\);

-- Location: IOIBUF_X10_Y0_N8
\a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X6_Y1_N20
\uout~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \uout~2_combout\ = (\a[2]~input_o\ & \b~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datad => \b~input_o\,
	combout => \uout~2_combout\);

-- Location: IOIBUF_X22_Y0_N1
\a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X6_Y1_N6
\uout~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \uout~3_combout\ = (\b~input_o\ & \a[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b~input_o\,
	datac => \a[3]~input_o\,
	combout => \uout~3_combout\);

ww_uout(0) <= \uout[0]~output_o\;

ww_uout(1) <= \uout[1]~output_o\;

ww_uout(2) <= \uout[2]~output_o\;

ww_uout(3) <= \uout[3]~output_o\;
END structure;


