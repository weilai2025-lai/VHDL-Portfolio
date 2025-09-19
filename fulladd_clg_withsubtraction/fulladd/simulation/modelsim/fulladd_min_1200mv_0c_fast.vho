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

-- DATE "09/17/2025 23:08:52"

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

ENTITY 	fulladd IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	cin : IN std_logic;
	g : OUT std_logic;
	p : OUT std_logic;
	s : OUT std_logic
	);
END fulladd;

-- Design Ports Information
-- g	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- p	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fulladd IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_cin : std_logic;
SIGNAL ww_g : std_logic;
SIGNAL ww_p : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL \g~output_o\ : std_logic;
SIGNAL \p~output_o\ : std_logic;
SIGNAL \s~output_o\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \g~0_combout\ : std_logic;
SIGNAL \p~0_combout\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \s~0_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
g <= ww_g;
p <= ww_p;
s <= ww_s;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N2
\g~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \g~0_combout\,
	devoe => ww_devoe,
	o => \g~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\p~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \p~0_combout\,
	devoe => ww_devoe,
	o => \p~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\s~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s~0_combout\,
	devoe => ww_devoe,
	o => \s~output_o\);

-- Location: IOIBUF_X8_Y0_N1
\a~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\b~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: LCCOMB_X8_Y1_N24
\g~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \g~0_combout\ = (\a~input_o\ & \b~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a~input_o\,
	datad => \b~input_o\,
	combout => \g~0_combout\);

-- Location: LCCOMB_X8_Y1_N2
\p~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \p~0_combout\ = (\a~input_o\) # (\b~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a~input_o\,
	datad => \b~input_o\,
	combout => \p~0_combout\);

-- Location: IOIBUF_X31_Y0_N1
\cin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LCCOMB_X8_Y1_N20
\s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \s~0_combout\ = \a~input_o\ $ (\cin~input_o\ $ (\b~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~input_o\,
	datac => \cin~input_o\,
	datad => \b~input_o\,
	combout => \s~0_combout\);

ww_g <= \g~output_o\;

ww_p <= \p~output_o\;

ww_s <= \s~output_o\;
END structure;


