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

-- DATE "09/18/2025 12:00:23"

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

ENTITY 	multiply_4bit IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	mul_out : OUT std_logic_vector(7 DOWNTO 0)
	);
END multiply_4bit;

-- Design Ports Information
-- mul_out[0]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[1]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[2]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[3]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[4]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[5]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[6]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mul_out[7]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF multiply_4bit IS
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
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_mul_out : std_logic_vector(7 DOWNTO 0);
SIGNAL \mul_out[0]~output_o\ : std_logic;
SIGNAL \mul_out[1]~output_o\ : std_logic;
SIGNAL \mul_out[2]~output_o\ : std_logic;
SIGNAL \mul_out[3]~output_o\ : std_logic;
SIGNAL \mul_out[4]~output_o\ : std_logic;
SIGNAL \mul_out[5]~output_o\ : std_logic;
SIGNAL \mul_out[6]~output_o\ : std_logic;
SIGNAL \mul_out[7]~output_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \generate_mx_uout:0:unit_mout|uout[0]~0_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \c0|f0|s~0_combout\ : std_logic;
SIGNAL \c0|f0|g~combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \c0|f1|s~combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \c1|f0|s~0_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \c1|f0|g~combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \c0|f2|s~0_combout\ : std_logic;
SIGNAL \c0|c0|c_middle~2_combout\ : std_logic;
SIGNAL \c1|f1|s~combout\ : std_logic;
SIGNAL \c2|f0|s~0_combout\ : std_logic;
SIGNAL \c1|c0|c_middle~0_combout\ : std_logic;
SIGNAL \c0|c0|c_middle~4_combout\ : std_logic;
SIGNAL \c0|c0|c_middle~3_combout\ : std_logic;
SIGNAL \c1|f2|s~4_combout\ : std_logic;
SIGNAL \c2|f0|g~combout\ : std_logic;
SIGNAL \c2|f1|s~combout\ : std_logic;
SIGNAL \c2|c0|c_middle~0_combout\ : std_logic;
SIGNAL \c1|f1|g~combout\ : std_logic;
SIGNAL \c1|c0|c_middle~1_combout\ : std_logic;
SIGNAL \c0|f2|s~combout\ : std_logic;
SIGNAL \c1|c0|c_middle~2_combout\ : std_logic;
SIGNAL \c0|c0|cout~0_combout\ : std_logic;
SIGNAL \c1|f3|s~2_combout\ : std_logic;
SIGNAL \c2|f2|s~combout\ : std_logic;
SIGNAL \c2|f1|g~combout\ : std_logic;
SIGNAL \c2|c0|c_middle~1_combout\ : std_logic;
SIGNAL \c2|c0|c_middle~2_combout\ : std_logic;
SIGNAL \c2|c0|cout~1_combout\ : std_logic;
SIGNAL \c2|c0|cout~2_combout\ : std_logic;
SIGNAL \c2|c0|cout~3_combout\ : std_logic;
SIGNAL \c2|c0|cout~4_combout\ : std_logic;
SIGNAL \c2|f3|s~combout\ : std_logic;
SIGNAL \generate_mx_uout:0:unit_mout|uout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \generate_mx_uout:3:unit_mout|uout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \generate_mx_uout:2:unit_mout|uout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \generate_mx_uout:1:unit_mout|uout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
mul_out <= ww_mul_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X24_Y0_N2
\mul_out[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generate_mx_uout:0:unit_mout|uout[0]~0_combout\,
	devoe => ww_devoe,
	o => \mul_out[0]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\mul_out[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c0|f0|s~0_combout\,
	devoe => ww_devoe,
	o => \mul_out[1]~output_o\);

-- Location: IOOBUF_X33_Y12_N9
\mul_out[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c1|f0|s~0_combout\,
	devoe => ww_devoe,
	o => \mul_out[2]~output_o\);

-- Location: IOOBUF_X33_Y10_N2
\mul_out[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c2|f0|s~0_combout\,
	devoe => ww_devoe,
	o => \mul_out[3]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\mul_out[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c2|f1|s~combout\,
	devoe => ww_devoe,
	o => \mul_out[4]~output_o\);

-- Location: IOOBUF_X33_Y11_N9
\mul_out[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c2|f2|s~combout\,
	devoe => ww_devoe,
	o => \mul_out[5]~output_o\);

-- Location: IOOBUF_X33_Y14_N2
\mul_out[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c2|f3|s~combout\,
	devoe => ww_devoe,
	o => \mul_out[6]~output_o\);

-- Location: IOOBUF_X33_Y11_N2
\mul_out[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c2|c0|cout~4_combout\,
	devoe => ww_devoe,
	o => \mul_out[7]~output_o\);

-- Location: IOIBUF_X33_Y16_N1
\b[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X33_Y16_N8
\a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: LCCOMB_X26_Y8_N16
\generate_mx_uout:0:unit_mout|uout[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:0:unit_mout|uout[0]~0_combout\ = (\b[0]~input_o\ & \a[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datad => \a[0]~input_o\,
	combout => \generate_mx_uout:0:unit_mout|uout[0]~0_combout\);

-- Location: IOIBUF_X29_Y0_N1
\b[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X26_Y8_N18
\c0|f0|s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|f0|s~0_combout\ = (\b[1]~input_o\ & (\a[0]~input_o\ $ (((\a[1]~input_o\ & \b[0]~input_o\))))) # (!\b[1]~input_o\ & (((\a[1]~input_o\ & \b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \b[0]~input_o\,
	combout => \c0|f0|s~0_combout\);

-- Location: LCCOMB_X26_Y8_N22
\c0|f0|g\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|f0|g~combout\ = (\b[1]~input_o\ & (\a[0]~input_o\ & (\a[1]~input_o\ & \b[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \b[0]~input_o\,
	combout => \c0|f0|g~combout\);

-- Location: IOIBUF_X33_Y14_N8
\a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X26_Y8_N20
\generate_mx_uout:0:unit_mout|uout[2]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:0:unit_mout|uout\(2) = (\a[2]~input_o\ & \b[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a[2]~input_o\,
	datad => \b[0]~input_o\,
	combout => \generate_mx_uout:0:unit_mout|uout\(2));

-- Location: LCCOMB_X26_Y8_N24
\c0|f1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|f1|s~combout\ = \c0|f0|g~combout\ $ (\generate_mx_uout:0:unit_mout|uout\(2) $ (((\a[1]~input_o\ & \b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|f0|g~combout\,
	datab => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	datad => \generate_mx_uout:0:unit_mout|uout\(2),
	combout => \c0|f1|s~combout\);

-- Location: IOIBUF_X26_Y0_N1
\b[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LCCOMB_X25_Y8_N8
\c1|f0|s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|f0|s~0_combout\ = \c0|f1|s~combout\ $ (((\b[2]~input_o\ & \a[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c0|f1|s~combout\,
	datac => \b[2]~input_o\,
	datad => \a[0]~input_o\,
	combout => \c1|f0|s~0_combout\);

-- Location: IOIBUF_X33_Y12_N1
\b[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X25_Y8_N12
\c1|f0|g\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|f0|g~combout\ = (\c0|f1|s~combout\ & (\b[2]~input_o\ & \a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c0|f1|s~combout\,
	datac => \b[2]~input_o\,
	datad => \a[0]~input_o\,
	combout => \c1|f0|g~combout\);

-- Location: LCCOMB_X25_Y8_N18
\generate_mx_uout:2:unit_mout|uout[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:2:unit_mout|uout\(1) = (\b[2]~input_o\ & \a[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b[2]~input_o\,
	datad => \a[1]~input_o\,
	combout => \generate_mx_uout:2:unit_mout|uout\(1));

-- Location: IOIBUF_X33_Y10_N8
\a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X26_Y8_N10
\c0|f2|s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|f2|s~0_combout\ = (\b[1]~input_o\ & (\a[2]~input_o\ $ (((\a[3]~input_o\ & \b[0]~input_o\))))) # (!\b[1]~input_o\ & (\a[3]~input_o\ & ((\b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \a[3]~input_o\,
	datac => \a[2]~input_o\,
	datad => \b[0]~input_o\,
	combout => \c0|f2|s~0_combout\);

-- Location: LCCOMB_X26_Y8_N4
\c0|c0|c_middle~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c0|c_middle~2_combout\ = (\c0|f0|g~combout\ & ((\generate_mx_uout:0:unit_mout|uout\(2)) # ((\a[1]~input_o\ & \b[1]~input_o\)))) # (!\c0|f0|g~combout\ & (\a[1]~input_o\ & (\b[1]~input_o\ & \generate_mx_uout:0:unit_mout|uout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|f0|g~combout\,
	datab => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	datad => \generate_mx_uout:0:unit_mout|uout\(2),
	combout => \c0|c0|c_middle~2_combout\);

-- Location: LCCOMB_X25_Y8_N14
\c1|f1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|f1|s~combout\ = \c1|f0|g~combout\ $ (\generate_mx_uout:2:unit_mout|uout\(1) $ (\c0|f2|s~0_combout\ $ (\c0|c0|c_middle~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|f0|g~combout\,
	datab => \generate_mx_uout:2:unit_mout|uout\(1),
	datac => \c0|f2|s~0_combout\,
	datad => \c0|c0|c_middle~2_combout\,
	combout => \c1|f1|s~combout\);

-- Location: LCCOMB_X25_Y8_N16
\c2|f0|s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|f0|s~0_combout\ = \c1|f1|s~combout\ $ (((\b[3]~input_o\ & \a[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datac => \c1|f1|s~combout\,
	datad => \a[0]~input_o\,
	combout => \c2|f0|s~0_combout\);

-- Location: LCCOMB_X25_Y8_N10
\generate_mx_uout:3:unit_mout|uout[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:3:unit_mout|uout\(1) = (\a[1]~input_o\ & \b[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \generate_mx_uout:3:unit_mout|uout\(1));

-- Location: LCCOMB_X25_Y8_N20
\c1|c0|c_middle~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|c0|c_middle~0_combout\ = (\c1|f0|g~combout\ & ((\generate_mx_uout:2:unit_mout|uout\(1)) # (\c0|f2|s~0_combout\ $ (\c0|c0|c_middle~2_combout\)))) # (!\c1|f0|g~combout\ & (\generate_mx_uout:2:unit_mout|uout\(1) & (\c0|f2|s~0_combout\ $ 
-- (\c0|c0|c_middle~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|f0|g~combout\,
	datab => \generate_mx_uout:2:unit_mout|uout\(1),
	datac => \c0|f2|s~0_combout\,
	datad => \c0|c0|c_middle~2_combout\,
	combout => \c1|c0|c_middle~0_combout\);

-- Location: LCCOMB_X26_Y8_N2
\c0|c0|c_middle~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c0|c_middle~4_combout\ = (\a[2]~input_o\ & (\b[0]~input_o\ & ((\a[1]~input_o\) # (\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \a[1]~input_o\,
	datac => \a[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \c0|c0|c_middle~4_combout\);

-- Location: LCCOMB_X26_Y8_N14
\c0|c0|c_middle~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c0|c_middle~3_combout\ = (\b[1]~input_o\ & ((\c0|c0|c_middle~4_combout\) # ((\generate_mx_uout:0:unit_mout|uout[0]~0_combout\ & \a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generate_mx_uout:0:unit_mout|uout[0]~0_combout\,
	datab => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	datad => \c0|c0|c_middle~4_combout\,
	combout => \c0|c0|c_middle~3_combout\);

-- Location: LCCOMB_X26_Y8_N26
\generate_mx_uout:2:unit_mout|uout[2]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:2:unit_mout|uout\(2) = (\b[2]~input_o\ & \a[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[2]~input_o\,
	datac => \a[2]~input_o\,
	combout => \generate_mx_uout:2:unit_mout|uout\(2));

-- Location: LCCOMB_X26_Y8_N12
\c1|f2|s~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|f2|s~4_combout\ = \c0|c0|c_middle~3_combout\ $ (\generate_mx_uout:2:unit_mout|uout\(2) $ (((\b[1]~input_o\ & \a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \a[3]~input_o\,
	datac => \c0|c0|c_middle~3_combout\,
	datad => \generate_mx_uout:2:unit_mout|uout\(2),
	combout => \c1|f2|s~4_combout\);

-- Location: LCCOMB_X25_Y8_N6
\c2|f0|g\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|f0|g~combout\ = (\b[3]~input_o\ & (\c1|f1|s~combout\ & \a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datac => \c1|f1|s~combout\,
	datad => \a[0]~input_o\,
	combout => \c2|f0|g~combout\);

-- Location: LCCOMB_X25_Y8_N24
\c2|f1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|f1|s~combout\ = \generate_mx_uout:3:unit_mout|uout\(1) $ (\c1|c0|c_middle~0_combout\ $ (\c1|f2|s~4_combout\ $ (\c2|f0|g~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generate_mx_uout:3:unit_mout|uout\(1),
	datab => \c1|c0|c_middle~0_combout\,
	datac => \c1|f2|s~4_combout\,
	datad => \c2|f0|g~combout\,
	combout => \c2|f1|s~combout\);

-- Location: LCCOMB_X25_Y8_N28
\c2|c0|c_middle~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|c_middle~0_combout\ = (\generate_mx_uout:3:unit_mout|uout\(1) & ((\c2|f0|g~combout\) # (\c1|c0|c_middle~0_combout\ $ (\c1|f2|s~4_combout\)))) # (!\generate_mx_uout:3:unit_mout|uout\(1) & (\c2|f0|g~combout\ & (\c1|c0|c_middle~0_combout\ $ 
-- (\c1|f2|s~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generate_mx_uout:3:unit_mout|uout\(1),
	datab => \c1|c0|c_middle~0_combout\,
	datac => \c1|f2|s~4_combout\,
	datad => \c2|f0|g~combout\,
	combout => \c2|c0|c_middle~0_combout\);

-- Location: LCCOMB_X25_Y11_N0
\generate_mx_uout:3:unit_mout|uout[2]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:3:unit_mout|uout\(2) = (\b[3]~input_o\ & \a[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b[3]~input_o\,
	datad => \a[2]~input_o\,
	combout => \generate_mx_uout:3:unit_mout|uout\(2));

-- Location: LCCOMB_X26_Y8_N30
\c1|f1|g\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|f1|g~combout\ = (\a[1]~input_o\ & (\b[2]~input_o\ & (\c0|f2|s~0_combout\ $ (\c0|c0|c_middle~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c0|f2|s~0_combout\,
	datab => \a[1]~input_o\,
	datac => \c0|c0|c_middle~2_combout\,
	datad => \b[2]~input_o\,
	combout => \c1|f1|g~combout\);

-- Location: LCCOMB_X26_Y8_N0
\generate_mx_uout:1:unit_mout|uout[3]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:1:unit_mout|uout\(3) = (\a[3]~input_o\ & \b[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[3]~input_o\,
	datac => \b[1]~input_o\,
	combout => \generate_mx_uout:1:unit_mout|uout\(3));

-- Location: LCCOMB_X26_Y8_N8
\c1|c0|c_middle~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|c0|c_middle~1_combout\ = (\generate_mx_uout:2:unit_mout|uout\(2) & ((\c1|f1|g~combout\) # (\c0|c0|c_middle~3_combout\ $ (\generate_mx_uout:1:unit_mout|uout\(3))))) # (!\generate_mx_uout:2:unit_mout|uout\(2) & (\c1|f1|g~combout\ & 
-- (\c0|c0|c_middle~3_combout\ $ (\generate_mx_uout:1:unit_mout|uout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generate_mx_uout:2:unit_mout|uout\(2),
	datab => \c0|c0|c_middle~3_combout\,
	datac => \c1|f1|g~combout\,
	datad => \generate_mx_uout:1:unit_mout|uout\(3),
	combout => \c1|c0|c_middle~1_combout\);

-- Location: LCCOMB_X25_Y9_N8
\c0|f2|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|f2|s~combout\ = \c0|f2|s~0_combout\ $ (\c0|c0|c_middle~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \c0|f2|s~0_combout\,
	datad => \c0|c0|c_middle~2_combout\,
	combout => \c0|f2|s~combout\);

-- Location: LCCOMB_X25_Y8_N2
\c1|c0|c_middle~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|c0|c_middle~2_combout\ = (\c1|c0|c_middle~1_combout\) # ((\c1|f0|g~combout\ & ((\generate_mx_uout:2:unit_mout|uout\(1)) # (\c0|f2|s~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|f0|g~combout\,
	datab => \generate_mx_uout:2:unit_mout|uout\(1),
	datac => \c1|c0|c_middle~1_combout\,
	datad => \c0|f2|s~combout\,
	combout => \c1|c0|c_middle~2_combout\);

-- Location: LCCOMB_X26_Y8_N28
\c0|c0|cout~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c0|c0|cout~0_combout\ = (\b[1]~input_o\ & ((\a[2]~input_o\) # ((\a[1]~input_o\ & \a[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \a[1]~input_o\,
	datac => \a[2]~input_o\,
	datad => \a[0]~input_o\,
	combout => \c0|c0|cout~0_combout\);

-- Location: LCCOMB_X26_Y8_N6
\c1|f3|s~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c1|f3|s~2_combout\ = (\a[3]~input_o\ & (\b[2]~input_o\ $ (((\b[0]~input_o\ & \c0|c0|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \b[2]~input_o\,
	datac => \a[3]~input_o\,
	datad => \c0|c0|cout~0_combout\,
	combout => \c1|f3|s~2_combout\);

-- Location: LCCOMB_X25_Y11_N2
\c2|f2|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|f2|s~combout\ = \c2|c0|c_middle~0_combout\ $ (\generate_mx_uout:3:unit_mout|uout\(2) $ (\c1|c0|c_middle~2_combout\ $ (\c1|f3|s~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2|c0|c_middle~0_combout\,
	datab => \generate_mx_uout:3:unit_mout|uout\(2),
	datac => \c1|c0|c_middle~2_combout\,
	datad => \c1|f3|s~2_combout\,
	combout => \c2|f2|s~combout\);

-- Location: LCCOMB_X25_Y8_N0
\c2|f1|g\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|f1|g~combout\ = (\a[1]~input_o\ & (\b[3]~input_o\ & (\c1|c0|c_middle~0_combout\ $ (\c1|f2|s~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \c1|c0|c_middle~0_combout\,
	datac => \c1|f2|s~4_combout\,
	datad => \b[3]~input_o\,
	combout => \c2|f1|g~combout\);

-- Location: LCCOMB_X25_Y11_N6
\c2|c0|c_middle~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|c_middle~1_combout\ = (\c2|f1|g~combout\ & ((\generate_mx_uout:3:unit_mout|uout\(2)) # (\c1|f3|s~2_combout\ $ (\c1|c0|c_middle~2_combout\)))) # (!\c2|f1|g~combout\ & (\generate_mx_uout:3:unit_mout|uout\(2) & (\c1|f3|s~2_combout\ $ 
-- (\c1|c0|c_middle~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1|f3|s~2_combout\,
	datab => \c2|f1|g~combout\,
	datac => \c1|c0|c_middle~2_combout\,
	datad => \generate_mx_uout:3:unit_mout|uout\(2),
	combout => \c2|c0|c_middle~1_combout\);

-- Location: LCCOMB_X25_Y11_N20
\generate_mx_uout:3:unit_mout|uout[3]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \generate_mx_uout:3:unit_mout|uout\(3) = (\b[3]~input_o\ & \a[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datac => \a[3]~input_o\,
	combout => \generate_mx_uout:3:unit_mout|uout\(3));

-- Location: LCCOMB_X25_Y8_N22
\c2|c0|c_middle~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|c_middle~2_combout\ = (\c2|f0|g~combout\ & ((\generate_mx_uout:3:unit_mout|uout\(1)) # (\c1|c0|c_middle~0_combout\ $ (\c1|f2|s~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generate_mx_uout:3:unit_mout|uout\(1),
	datab => \c1|c0|c_middle~0_combout\,
	datac => \c1|f2|s~4_combout\,
	datad => \c2|f0|g~combout\,
	combout => \c2|c0|c_middle~2_combout\);

-- Location: LCCOMB_X25_Y11_N10
\c2|c0|cout~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|cout~1_combout\ = (\generate_mx_uout:3:unit_mout|uout\(3) & ((\c2|c0|c_middle~2_combout\) # ((\c2|f1|g~combout\)))) # (!\generate_mx_uout:3:unit_mout|uout\(3) & (\c2|c0|cout~4_combout\ & ((\c2|c0|c_middle~2_combout\) # (\c2|f1|g~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generate_mx_uout:3:unit_mout|uout\(3),
	datab => \c2|c0|c_middle~2_combout\,
	datac => \c2|f1|g~combout\,
	datad => \c2|c0|cout~4_combout\,
	combout => \c2|c0|cout~1_combout\);

-- Location: LCCOMB_X25_Y11_N12
\c2|c0|cout~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|cout~2_combout\ = (\c2|c0|cout~1_combout\ & ((\generate_mx_uout:3:unit_mout|uout\(2)) # (\c1|c0|c_middle~2_combout\ $ (\c1|f3|s~2_combout\)))) # (!\c2|c0|cout~1_combout\ & ((\c1|c0|c_middle~2_combout\ $ (\c1|f3|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2|c0|cout~1_combout\,
	datab => \generate_mx_uout:3:unit_mout|uout\(2),
	datac => \c1|c0|c_middle~2_combout\,
	datad => \c1|f3|s~2_combout\,
	combout => \c2|c0|cout~2_combout\);

-- Location: LCCOMB_X25_Y11_N22
\c2|c0|cout~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|cout~3_combout\ = (\c2|c0|cout~4_combout\ & ((\a[3]~input_o\) # ((\c2|c0|cout~2_combout\ & \a[2]~input_o\)))) # (!\c2|c0|cout~4_combout\ & (\c2|c0|cout~2_combout\ & (\a[3]~input_o\ & \a[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2|c0|cout~2_combout\,
	datab => \c2|c0|cout~4_combout\,
	datac => \a[3]~input_o\,
	datad => \a[2]~input_o\,
	combout => \c2|c0|cout~3_combout\);

-- Location: LCCOMB_X25_Y11_N24
\c2|c0|cout~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|c0|cout~4_combout\ = (\c2|c0|cout~1_combout\ & ((\c2|c0|cout~2_combout\) # ((\c2|c0|cout~3_combout\ & \b[3]~input_o\)))) # (!\c2|c0|cout~1_combout\ & (\c2|c0|cout~3_combout\ & (\b[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2|c0|cout~1_combout\,
	datab => \c2|c0|cout~3_combout\,
	datac => \b[3]~input_o\,
	datad => \c2|c0|cout~2_combout\,
	combout => \c2|c0|cout~4_combout\);

-- Location: LCCOMB_X25_Y11_N16
\c2|f3|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \c2|f3|s~combout\ = \generate_mx_uout:3:unit_mout|uout\(3) $ (\c2|c0|cout~4_combout\ $ (((\c2|c0|c_middle~1_combout\) # (\c2|c0|c_middle~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2|c0|c_middle~1_combout\,
	datab => \generate_mx_uout:3:unit_mout|uout\(3),
	datac => \c2|c0|cout~4_combout\,
	datad => \c2|c0|c_middle~2_combout\,
	combout => \c2|f3|s~combout\);

ww_mul_out(0) <= \mul_out[0]~output_o\;

ww_mul_out(1) <= \mul_out[1]~output_o\;

ww_mul_out(2) <= \mul_out[2]~output_o\;

ww_mul_out(3) <= \mul_out[3]~output_o\;

ww_mul_out(4) <= \mul_out[4]~output_o\;

ww_mul_out(5) <= \mul_out[5]~output_o\;

ww_mul_out(6) <= \mul_out[6]~output_o\;

ww_mul_out(7) <= \mul_out[7]~output_o\;
END structure;


