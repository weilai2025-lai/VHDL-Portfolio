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

-- DATE "09/17/2025 20:52:24"

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
	s : OUT std_logic;
	cout : OUT std_logic
	);
END fulladd;

-- Design Ports Information
-- s	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_s : std_logic;
SIGNAL ww_cout : std_logic;
SIGNAL \s~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \s~0_combout\ : std_logic;
SIGNAL \cout~0_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
s <= ww_s;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N9
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

-- Location: IOOBUF_X31_Y0_N2
\cout~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cout~0_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

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

-- Location: IOIBUF_X26_Y0_N8
\cin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

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

-- Location: LCCOMB_X8_Y1_N2
\cout~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cout~0_combout\ = (\a~input_o\ & ((\cin~input_o\) # (\b~input_o\))) # (!\a~input_o\ & (\cin~input_o\ & \b~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~input_o\,
	datac => \cin~input_o\,
	datad => \b~input_o\,
	combout => \cout~0_combout\);

ww_s <= \s~output_o\;

ww_cout <= \cout~output_o\;
END structure;


