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

-- DATE "09/18/2025 10:20:38"

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

ENTITY 	fulladd_clg_withsubtraction IS
    PORT (
	M : IN std_logic;
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	s : OUT std_logic_vector(3 DOWNTO 0);
	cout : OUT std_logic;
	v : OUT std_logic
	);
END fulladd_clg_withsubtraction;

-- Design Ports Information
-- s[0]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[1]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[2]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[3]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- M	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fulladd_clg_withsubtraction IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_M : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_s : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL ww_v : std_logic;
SIGNAL \s[0]~output_o\ : std_logic;
SIGNAL \s[1]~output_o\ : std_logic;
SIGNAL \s[2]~output_o\ : std_logic;
SIGNAL \s[3]~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \v~output_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \f0|s~0_combout\ : std_logic;
SIGNAL \M~input_o\ : std_logic;
SIGNAL \c0|c_middle[0]~2_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \f1|s~combout\ : std_logic;
SIGNAL \c0|c_middle~3_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \c0|c_middle[1]~4_combout\ : std_logic;
SIGNAL \c0|c_middle[1]~8_combout\ : std_logic;
SIGNAL \f2|s~combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \c0|c_middle~6_combout\ : std_logic;
SIGNAL \c0|c_middle~5_combout\ : std_logic;
SIGNAL \f2|p~combout\ : std_logic;
SIGNAL \c0|c_middle[2]~7_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \f3|s~combout\ : std_logic;
SIGNAL \c0|cout~1_combout\ : std_logic;
SIGNAL \c0|cout~0_combout\ : std_logic;
SIGNAL \c0|cout~2_combout\ : std_logic;
SIGNAL \v~0_combout\ : std_logic;
SIGNAL norB : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_M <= M;
ww_a <= a;
ww_b <= b;
s <= ww_s;
cout <= ww_cout;
v <= ww_v;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N2
\s[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \f0|s~0_combout\,
	devoe => ww_devoe,
	o => \s[0]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\s[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \f1|s~combout\,
	devoe => ww_devoe,
	o => \s[1]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\s[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \f2|s~combout\,
	devoe => ww_devoe,
	o => \s[2]~output_o\);

-- Location: IOOBUF_X33_Y11_N2
\s[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \f3|s~combout\,
	devoe => ww_devoe,
	o => \s[3]~output_o\);

-- Location: IOOBUF_X33_Y10_N9
\cout~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c0|cout~2_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\v~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v~0_combout\,
	devoe => ww_devoe,
	o => \v~output_o\);

-- Location: IOIBUF_X12_Y0_N8
\a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\b[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: LCCOMB_X15_Y1_N0
\f0|s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \f0|s~0_combout\ = \a[0]~input_o\ $ (\b[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a[0]~input_o\,
	datad => \b[0]~input_o\,
	combout => \f0|s~0_combout\);

-- Location: IOIBUF_X20_Y0_N8
\M~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M,
	o => \M~input_o\);

-- Location: LCCOMB_X15_Y1_N12
\c0|c_middle[0]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle[0]~2_combout\ = (\b[0]~input_o\ & ((\a[0]~input_o\))) # (!\b[0]~input_o\ & (\M~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \M~input_o\,
	datac => \a[0]~input_o\,
	datad => \b[0]~input_o\,
	combout => \c0|c_middle[0]~2_combout\);

-- Location: IOIBUF_X8_Y0_N8
\a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\b[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X15_Y1_N18
\f1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \f1|s~combout\ = \c0|c_middle[0]~2_combout\ $ (\a[1]~input_o\ $ (\M~input_o\ $ (\b[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|c_middle[0]~2_combout\,
	datab => \a[1]~input_o\,
	datac => \M~input_o\,
	datad => \b[1]~input_o\,
	combout => \f1|s~combout\);

-- Location: LCCOMB_X15_Y1_N26
\norB[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- norB(1) = \M~input_o\ $ (\b[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \M~input_o\,
	datad => \b[1]~input_o\,
	combout => norB(1));

-- Location: LCCOMB_X15_Y1_N24
\norB[0]\ : cycloneiv_lcell_comb
-- Equation(s):
-- norB(0) = \M~input_o\ $ (\b[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \M~input_o\,
	datad => \b[0]~input_o\,
	combout => norB(0));

-- Location: LCCOMB_X15_Y1_N10
\c0|c_middle~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle~3_combout\ = (norB(1) & ((\a[1]~input_o\) # ((\a[0]~input_o\ & norB(0))))) # (!norB(1) & (\a[1]~input_o\ & (\a[0]~input_o\ & norB(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => norB(1),
	datab => \a[1]~input_o\,
	datac => \a[0]~input_o\,
	datad => norB(0),
	combout => \c0|c_middle~3_combout\);

-- Location: IOIBUF_X14_Y0_N1
\b[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LCCOMB_X15_Y1_N14
\norB[2]\ : cycloneiv_lcell_comb
-- Equation(s):
-- norB(2) = \b[2]~input_o\ $ (\M~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[2]~input_o\,
	datac => \M~input_o\,
	combout => norB(2));

-- Location: IOIBUF_X20_Y0_N1
\a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X15_Y1_N28
\c0|c_middle[1]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle[1]~4_combout\ = (\a[0]~input_o\) # (\M~input_o\ $ (\b[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \M~input_o\,
	datac => \a[0]~input_o\,
	datad => \b[0]~input_o\,
	combout => \c0|c_middle[1]~4_combout\);

-- Location: LCCOMB_X15_Y1_N20
\c0|c_middle[1]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle[1]~8_combout\ = (\c0|c_middle[1]~4_combout\ & (\M~input_o\ & ((\a[1]~input_o\) # (!\b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \c0|c_middle[1]~4_combout\,
	datac => \M~input_o\,
	datad => \a[1]~input_o\,
	combout => \c0|c_middle[1]~8_combout\);

-- Location: LCCOMB_X15_Y1_N6
\f2|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \f2|s~combout\ = norB(2) $ (\a[2]~input_o\ $ (((\c0|c_middle~3_combout\) # (\c0|c_middle[1]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|c_middle~3_combout\,
	datab => norB(2),
	datac => \a[2]~input_o\,
	datad => \c0|c_middle[1]~8_combout\,
	combout => \f2|s~combout\);

-- Location: IOIBUF_X31_Y0_N8
\a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X15_Y1_N2
\c0|c_middle~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle~6_combout\ = (\a[2]~input_o\ & ((norB(2)) # ((norB(1) & \a[1]~input_o\)))) # (!\a[2]~input_o\ & (norB(1) & (norB(2) & \a[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => norB(1),
	datab => \a[2]~input_o\,
	datac => norB(2),
	datad => \a[1]~input_o\,
	combout => \c0|c_middle~6_combout\);

-- Location: LCCOMB_X15_Y1_N8
\c0|c_middle~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle~5_combout\ = (\a[0]~input_o\ & (norB(0) & ((norB(1)) # (\a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => norB(1),
	datab => \a[1]~input_o\,
	datac => \a[0]~input_o\,
	datad => norB(0),
	combout => \c0|c_middle~5_combout\);

-- Location: LCCOMB_X15_Y1_N4
\f2|p\ : cycloneiv_lcell_comb
-- Equation(s):
-- \f2|p~combout\ = (\a[2]~input_o\) # (\M~input_o\ $ (\b[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[2]~input_o\,
	datac => \M~input_o\,
	datad => \b[2]~input_o\,
	combout => \f2|p~combout\);

-- Location: LCCOMB_X15_Y1_N22
\c0|c_middle[2]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c_middle[2]~7_combout\ = (\c0|c_middle~6_combout\) # ((\c0|c_middle~5_combout\) # ((\f2|p~combout\ & \c0|c_middle[1]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|c_middle~6_combout\,
	datab => \c0|c_middle~5_combout\,
	datac => \f2|p~combout\,
	datad => \c0|c_middle[1]~8_combout\,
	combout => \c0|c_middle[2]~7_combout\);

-- Location: IOIBUF_X24_Y0_N8
\b[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X20_Y4_N16
\f3|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \f3|s~combout\ = \M~input_o\ $ (\a[3]~input_o\ $ (\c0|c_middle[2]~7_combout\ $ (\b[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \M~input_o\,
	datab => \a[3]~input_o\,
	datac => \c0|c_middle[2]~7_combout\,
	datad => \b[3]~input_o\,
	combout => \f3|s~combout\);

-- Location: LCCOMB_X15_Y1_N16
\c0|cout~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|cout~1_combout\ = (\f2|p~combout\ & ((norB(1) & ((\a[1]~input_o\) # (\c0|c_middle[0]~2_combout\))) # (!norB(1) & (\a[1]~input_o\ & \c0|c_middle[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => norB(1),
	datab => \a[1]~input_o\,
	datac => \f2|p~combout\,
	datad => \c0|c_middle[0]~2_combout\,
	combout => \c0|cout~1_combout\);

-- Location: LCCOMB_X20_Y4_N0
\norB[3]\ : cycloneiv_lcell_comb
-- Equation(s):
-- norB(3) = \M~input_o\ $ (\b[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \M~input_o\,
	datad => \b[3]~input_o\,
	combout => norB(3));

-- Location: LCCOMB_X20_Y4_N2
\c0|cout~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|cout~0_combout\ = (norB(3) & ((\a[3]~input_o\) # ((norB(2) & \a[2]~input_o\)))) # (!norB(3) & (norB(2) & (\a[2]~input_o\ & \a[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => norB(2),
	datab => norB(3),
	datac => \a[2]~input_o\,
	datad => \a[3]~input_o\,
	combout => \c0|cout~0_combout\);

-- Location: LCCOMB_X20_Y4_N12
\c0|cout~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|cout~2_combout\ = (\c0|cout~0_combout\) # ((\c0|cout~1_combout\ & ((norB(3)) # (\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|cout~1_combout\,
	datab => norB(3),
	datac => \c0|cout~0_combout\,
	datad => \a[3]~input_o\,
	combout => \c0|cout~2_combout\);

-- Location: LCCOMB_X20_Y4_N6
\v~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \v~0_combout\ = \c0|c_middle[2]~7_combout\ $ (\c0|cout~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c0|c_middle[2]~7_combout\,
	datad => \c0|cout~2_combout\,
	combout => \v~0_combout\);

ww_s(0) <= \s[0]~output_o\;

ww_s(1) <= \s[1]~output_o\;

ww_s(2) <= \s[2]~output_o\;

ww_s(3) <= \s[3]~output_o\;

ww_cout <= \cout~output_o\;

ww_v <= \v~output_o\;
END structure;


