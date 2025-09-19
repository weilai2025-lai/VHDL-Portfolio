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

-- DATE "09/17/2025 22:53:18"

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

ENTITY 	clg IS
    PORT (
	cin : IN std_logic;
	g : IN std_logic_vector(3 DOWNTO 0);
	p : IN std_logic_vector(3 DOWNTO 0);
	c_middle : OUT std_logic_vector(2 DOWNTO 0);
	cout : OUT std_logic
	);
END clg;

-- Design Ports Information
-- c_middle[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c_middle[1]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c_middle[2]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g[0]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- p[0]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g[1]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- p[1]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g[2]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- p[2]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- p[3]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g[3]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF clg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_cin : std_logic;
SIGNAL ww_g : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_p : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_c_middle : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL \c_middle[0]~output_o\ : std_logic;
SIGNAL \c_middle[1]~output_o\ : std_logic;
SIGNAL \c_middle[2]~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \g[0]~input_o\ : std_logic;
SIGNAL \p[0]~input_o\ : std_logic;
SIGNAL \c_middle~0_combout\ : std_logic;
SIGNAL \p[1]~input_o\ : std_logic;
SIGNAL \g[1]~input_o\ : std_logic;
SIGNAL \c_middle~1_combout\ : std_logic;
SIGNAL \c_middle~2_combout\ : std_logic;
SIGNAL \p[2]~input_o\ : std_logic;
SIGNAL \c_middle~3_combout\ : std_logic;
SIGNAL \g[2]~input_o\ : std_logic;
SIGNAL \c_middle~4_combout\ : std_logic;
SIGNAL \cout~0_combout\ : std_logic;
SIGNAL \g[3]~input_o\ : std_logic;
SIGNAL \p[3]~input_o\ : std_logic;
SIGNAL \cout~1_combout\ : std_logic;

BEGIN

ww_cin <= cin;
ww_g <= g;
ww_p <= p;
c_middle <= ww_c_middle;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y31_N2
\c_middle[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c_middle~0_combout\,
	devoe => ww_devoe,
	o => \c_middle[0]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\c_middle[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c_middle~2_combout\,
	devoe => ww_devoe,
	o => \c_middle[1]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\c_middle[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c_middle~4_combout\,
	devoe => ww_devoe,
	o => \c_middle[2]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\cout~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cout~1_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

-- Location: IOIBUF_X10_Y31_N1
\cin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\g[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_g(0),
	o => \g[0]~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\p[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p(0),
	o => \p[0]~input_o\);

-- Location: LCCOMB_X16_Y7_N0
\c_middle~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c_middle~0_combout\ = (\g[0]~input_o\) # ((\cin~input_o\ & \p[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datac => \g[0]~input_o\,
	datad => \p[0]~input_o\,
	combout => \c_middle~0_combout\);

-- Location: IOIBUF_X12_Y0_N8
\p[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p(1),
	o => \p[1]~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\g[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_g(1),
	o => \g[1]~input_o\);

-- Location: LCCOMB_X16_Y7_N2
\c_middle~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c_middle~1_combout\ = (\p[1]~input_o\ & (\cin~input_o\ & \p[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p[1]~input_o\,
	datac => \cin~input_o\,
	datad => \p[0]~input_o\,
	combout => \c_middle~1_combout\);

-- Location: LCCOMB_X16_Y7_N20
\c_middle~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c_middle~2_combout\ = (\g[1]~input_o\) # ((\c_middle~1_combout\) # ((\p[1]~input_o\ & \g[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p[1]~input_o\,
	datab => \g[0]~input_o\,
	datac => \g[1]~input_o\,
	datad => \c_middle~1_combout\,
	combout => \c_middle~2_combout\);

-- Location: IOIBUF_X20_Y0_N1
\p[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p(2),
	o => \p[2]~input_o\);

-- Location: LCCOMB_X16_Y7_N6
\c_middle~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c_middle~3_combout\ = (\g[1]~input_o\ & ((\p[2]~input_o\) # ((\g[0]~input_o\ & \p[1]~input_o\)))) # (!\g[1]~input_o\ & (((\g[0]~input_o\ & \p[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \g[1]~input_o\,
	datab => \p[2]~input_o\,
	datac => \g[0]~input_o\,
	datad => \p[1]~input_o\,
	combout => \c_middle~3_combout\);

-- Location: IOIBUF_X10_Y0_N8
\g[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_g(2),
	o => \g[2]~input_o\);

-- Location: LCCOMB_X16_Y7_N16
\c_middle~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c_middle~4_combout\ = (\c_middle~3_combout\) # ((\g[2]~input_o\) # ((\p[2]~input_o\ & \c_middle~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c_middle~3_combout\,
	datab => \g[2]~input_o\,
	datac => \p[2]~input_o\,
	datad => \c_middle~1_combout\,
	combout => \c_middle~4_combout\);

-- Location: LCCOMB_X16_Y7_N26
\cout~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cout~0_combout\ = (\p[2]~input_o\ & ((\g[1]~input_o\) # ((\p[1]~input_o\ & \c_middle~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p[1]~input_o\,
	datab => \p[2]~input_o\,
	datac => \g[1]~input_o\,
	datad => \c_middle~0_combout\,
	combout => \cout~0_combout\);

-- Location: IOIBUF_X29_Y0_N1
\g[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_g(3),
	o => \g[3]~input_o\);

-- Location: IOIBUF_X33_Y10_N8
\p[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p(3),
	o => \p[3]~input_o\);

-- Location: LCCOMB_X16_Y7_N12
\cout~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cout~1_combout\ = (\g[3]~input_o\) # ((\p[3]~input_o\ & ((\cout~0_combout\) # (\g[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cout~0_combout\,
	datab => \g[2]~input_o\,
	datac => \g[3]~input_o\,
	datad => \p[3]~input_o\,
	combout => \cout~1_combout\);

ww_c_middle(0) <= \c_middle[0]~output_o\;

ww_c_middle(1) <= \c_middle[1]~output_o\;

ww_c_middle(2) <= \c_middle[2]~output_o\;

ww_cout <= \cout~output_o\;
END structure;


