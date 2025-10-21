-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "10/07/2025 11:31:43"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Sig_ROM IS
    PORT (
	clk : IN std_logic;
	x : IN std_logic_vector(4 DOWNTO 0);
	output : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END Sig_ROM;

-- Design Ports Information
-- clk	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[0]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[8]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[9]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[10]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[11]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[12]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[13]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[14]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[15]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[0]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[1]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[2]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[4]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[3]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Sig_ROM IS
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
SIGNAL ww_x : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(15 DOWNTO 0);
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \output[0]~output_o\ : std_logic;
SIGNAL \output[1]~output_o\ : std_logic;
SIGNAL \output[2]~output_o\ : std_logic;
SIGNAL \output[3]~output_o\ : std_logic;
SIGNAL \output[4]~output_o\ : std_logic;
SIGNAL \output[5]~output_o\ : std_logic;
SIGNAL \output[6]~output_o\ : std_logic;
SIGNAL \output[7]~output_o\ : std_logic;
SIGNAL \output[8]~output_o\ : std_logic;
SIGNAL \output[9]~output_o\ : std_logic;
SIGNAL \output[10]~output_o\ : std_logic;
SIGNAL \output[11]~output_o\ : std_logic;
SIGNAL \output[12]~output_o\ : std_logic;
SIGNAL \output[13]~output_o\ : std_logic;
SIGNAL \output[14]~output_o\ : std_logic;
SIGNAL \output[15]~output_o\ : std_logic;
SIGNAL \x[2]~input_o\ : std_logic;
SIGNAL \x[4]~input_o\ : std_logic;
SIGNAL \x[0]~input_o\ : std_logic;
SIGNAL \x[1]~input_o\ : std_logic;
SIGNAL \x[3]~input_o\ : std_logic;
SIGNAL \mem_s~23_combout\ : std_logic;
SIGNAL \mem_s~24_combout\ : std_logic;
SIGNAL \mem_s~21_combout\ : std_logic;
SIGNAL \mem_s~22_combout\ : std_logic;
SIGNAL \mem_s~1_combout\ : std_logic;
SIGNAL \mem_s~0_combout\ : std_logic;
SIGNAL \mem_s~2_combout\ : std_logic;
SIGNAL \mem_s~19_combout\ : std_logic;
SIGNAL \mem_s~20_combout\ : std_logic;
SIGNAL \mem_s~3_combout\ : std_logic;
SIGNAL \mem_s~4_combout\ : std_logic;
SIGNAL \mem_s~5_combout\ : std_logic;
SIGNAL \mem_s~6_combout\ : std_logic;
SIGNAL \mem_s~7_combout\ : std_logic;
SIGNAL \mem_s~8_combout\ : std_logic;
SIGNAL \mem_s~9_combout\ : std_logic;
SIGNAL \mem_s~10_combout\ : std_logic;
SIGNAL \mem_s~11_combout\ : std_logic;
SIGNAL \mem_s~12_combout\ : std_logic;
SIGNAL \mem_s~13_combout\ : std_logic;
SIGNAL \mem_s~14_combout\ : std_logic;
SIGNAL \mem_s~15_combout\ : std_logic;
SIGNAL \mem_s~16_combout\ : std_logic;
SIGNAL \mem_s~17_combout\ : std_logic;
SIGNAL \mem_s~18_combout\ : std_logic;
SIGNAL \ALT_INV_mem_s~18_combout\ : std_logic;
SIGNAL \ALT_INV_x[4]~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_x <= x;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_mem_s~18_combout\ <= NOT \mem_s~18_combout\;
\ALT_INV_x[4]~input_o\ <= NOT \x[4]~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X5_Y73_N2
\output[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~24_combout\,
	devoe => ww_devoe,
	o => \output[0]~output_o\);

-- Location: IOOBUF_X0_Y69_N9
\output[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~22_combout\,
	devoe => ww_devoe,
	o => \output[1]~output_o\);

-- Location: IOOBUF_X3_Y73_N2
\output[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~2_combout\,
	devoe => ww_devoe,
	o => \output[2]~output_o\);

-- Location: IOOBUF_X11_Y73_N16
\output[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~20_combout\,
	devoe => ww_devoe,
	o => \output[3]~output_o\);

-- Location: IOOBUF_X0_Y68_N9
\output[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~4_combout\,
	devoe => ww_devoe,
	o => \output[4]~output_o\);

-- Location: IOOBUF_X1_Y73_N9
\output[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~7_combout\,
	devoe => ww_devoe,
	o => \output[5]~output_o\);

-- Location: IOOBUF_X3_Y73_N9
\output[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~9_combout\,
	devoe => ww_devoe,
	o => \output[6]~output_o\);

-- Location: IOOBUF_X5_Y73_N23
\output[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~11_combout\,
	devoe => ww_devoe,
	o => \output[7]~output_o\);

-- Location: IOOBUF_X9_Y73_N2
\output[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~13_combout\,
	devoe => ww_devoe,
	o => \output[8]~output_o\);

-- Location: IOOBUF_X11_Y73_N23
\output[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~15_combout\,
	devoe => ww_devoe,
	o => \output[9]~output_o\);

-- Location: IOOBUF_X3_Y73_N23
\output[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~17_combout\,
	devoe => ww_devoe,
	o => \output[10]~output_o\);

-- Location: IOOBUF_X9_Y73_N9
\output[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~13_combout\,
	devoe => ww_devoe,
	o => \output[11]~output_o\);

-- Location: IOOBUF_X5_Y73_N9
\output[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_mem_s~18_combout\,
	devoe => ww_devoe,
	o => \output[12]~output_o\);

-- Location: IOOBUF_X1_Y73_N2
\output[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \mem_s~7_combout\,
	devoe => ww_devoe,
	o => \output[13]~output_o\);

-- Location: IOOBUF_X1_Y73_N16
\output[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_x[4]~input_o\,
	devoe => ww_devoe,
	o => \output[14]~output_o\);

-- Location: IOOBUF_X0_Y65_N16
\output[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \output[15]~output_o\);

-- Location: IOIBUF_X11_Y73_N1
\x[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(2),
	o => \x[2]~input_o\);

-- Location: IOIBUF_X1_Y73_N22
\x[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(4),
	o => \x[4]~input_o\);

-- Location: IOIBUF_X7_Y73_N22
\x[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(0),
	o => \x[0]~input_o\);

-- Location: IOIBUF_X7_Y73_N15
\x[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(1),
	o => \x[1]~input_o\);

-- Location: IOIBUF_X11_Y73_N8
\x[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(3),
	o => \x[3]~input_o\);

-- Location: LCCOMB_X6_Y72_N20
\mem_s~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~23_combout\ = (\x[0]~input_o\ & (((\x[3]~input_o\)) # (!\x[4]~input_o\))) # (!\x[0]~input_o\ & (\x[1]~input_o\ $ (((!\x[4]~input_o\ & \x[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110101110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[4]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~23_combout\);

-- Location: LCCOMB_X6_Y72_N6
\mem_s~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~24_combout\ = (\x[2]~input_o\ & (\x[3]~input_o\ $ (((\mem_s~23_combout\ & \x[4]~input_o\))))) # (!\x[2]~input_o\ & (\mem_s~23_combout\ & ((\x[3]~input_o\) # (!\x[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \mem_s~23_combout\,
	datac => \x[4]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~24_combout\);

-- Location: LCCOMB_X6_Y72_N16
\mem_s~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~21_combout\ = (\x[4]~input_o\ & (\x[3]~input_o\ & (\x[0]~input_o\ $ (!\x[1]~input_o\)))) # (!\x[4]~input_o\ & ((\x[1]~input_o\ & ((\x[3]~input_o\))) # (!\x[1]~input_o\ & (\x[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[4]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~21_combout\);

-- Location: LCCOMB_X6_Y72_N18
\mem_s~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~22_combout\ = (\x[4]~input_o\ & (\x[3]~input_o\ & (\x[2]~input_o\ $ (\mem_s~21_combout\)))) # (!\x[4]~input_o\ & ((\x[2]~input_o\ & ((\x[3]~input_o\) # (!\mem_s~21_combout\))) # (!\x[2]~input_o\ & (\mem_s~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \mem_s~21_combout\,
	datac => \x[4]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~22_combout\);

-- Location: LCCOMB_X7_Y72_N10
\mem_s~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~1_combout\ = (\x[2]~input_o\ & ((\x[3]~input_o\) # (\x[0]~input_o\ $ (\x[1]~input_o\)))) # (!\x[2]~input_o\ & ((\x[1]~input_o\) # ((!\x[0]~input_o\ & \x[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~1_combout\);

-- Location: LCCOMB_X7_Y72_N24
\mem_s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~0_combout\ = (\x[1]~input_o\ & (\x[2]~input_o\ & (\x[0]~input_o\))) # (!\x[1]~input_o\ & (\x[3]~input_o\ & (\x[2]~input_o\ $ (\x[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~0_combout\);

-- Location: LCCOMB_X7_Y72_N4
\mem_s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~2_combout\ = (\x[4]~input_o\ & ((\mem_s~0_combout\))) # (!\x[4]~input_o\ & (\mem_s~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_s~1_combout\,
	datab => \x[4]~input_o\,
	datad => \mem_s~0_combout\,
	combout => \mem_s~2_combout\);

-- Location: LCCOMB_X7_Y72_N22
\mem_s~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~19_combout\ = (\x[0]~input_o\ & ((\x[4]~input_o\ $ (!\x[1]~input_o\)) # (!\x[2]~input_o\))) # (!\x[0]~input_o\ & ((\x[4]~input_o\ & ((!\x[1]~input_o\))) # (!\x[4]~input_o\ & ((\x[2]~input_o\) # (\x[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011100111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[4]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[0]~input_o\,
	combout => \mem_s~19_combout\);

-- Location: LCCOMB_X7_Y72_N16
\mem_s~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~20_combout\ = (\mem_s~19_combout\ & ((\x[3]~input_o\) # ((\x[1]~input_o\ & !\x[4]~input_o\)))) # (!\mem_s~19_combout\ & (\x[1]~input_o\ & (!\x[4]~input_o\ & \x[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[1]~input_o\,
	datab => \x[4]~input_o\,
	datac => \mem_s~19_combout\,
	datad => \x[3]~input_o\,
	combout => \mem_s~20_combout\);

-- Location: LCCOMB_X6_Y72_N0
\mem_s~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~3_combout\ = (\x[1]~input_o\ & (!\x[2]~input_o\ & ((\x[3]~input_o\) # (!\x[0]~input_o\)))) # (!\x[1]~input_o\ & (\x[0]~input_o\ $ (((\x[2]~input_o\ & !\x[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~3_combout\);

-- Location: LCCOMB_X6_Y72_N26
\mem_s~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~4_combout\ = (\mem_s~3_combout\ & ((\x[3]~input_o\) # (!\x[4]~input_o\))) # (!\mem_s~3_combout\ & (!\x[4]~input_o\ & \x[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mem_s~3_combout\,
	datac => \x[4]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~4_combout\);

-- Location: LCCOMB_X6_Y72_N12
\mem_s~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~5_combout\ = (\x[2]~input_o\ & (\x[0]~input_o\ & (\x[1]~input_o\ & \x[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~5_combout\);

-- Location: LCCOMB_X6_Y72_N14
\mem_s~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~6_combout\ = (!\x[2]~input_o\ & !\x[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~6_combout\);

-- Location: LCCOMB_X6_Y72_N24
\mem_s~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~7_combout\ = (\mem_s~5_combout\) # ((!\x[4]~input_o\ & ((\x[1]~input_o\) # (!\mem_s~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_s~5_combout\,
	datab => \mem_s~6_combout\,
	datac => \x[1]~input_o\,
	datad => \x[4]~input_o\,
	combout => \mem_s~7_combout\);

-- Location: LCCOMB_X6_Y72_N2
\mem_s~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~8_combout\ = (\x[4]~input_o\ & (!\x[1]~input_o\ & \x[3]~input_o\)) # (!\x[4]~input_o\ & (\x[1]~input_o\ & !\x[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[4]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~8_combout\);

-- Location: LCCOMB_X6_Y72_N4
\mem_s~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~9_combout\ = (\x[0]~input_o\ & ((\mem_s~8_combout\ $ (\x[3]~input_o\)))) # (!\x[0]~input_o\ & (\x[3]~input_o\ & ((\x[2]~input_o\) # (!\mem_s~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[0]~input_o\,
	datac => \mem_s~8_combout\,
	datad => \x[3]~input_o\,
	combout => \mem_s~9_combout\);

-- Location: LCCOMB_X6_Y72_N30
\mem_s~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~10_combout\ = (\x[4]~input_o\ & (\x[1]~input_o\ & \x[3]~input_o\)) # (!\x[4]~input_o\ & ((\x[1]~input_o\) # (\x[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[4]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~10_combout\);

-- Location: LCCOMB_X6_Y72_N8
\mem_s~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~11_combout\ = (\x[4]~input_o\ & (!\x[2]~input_o\ & (\mem_s~10_combout\ & \x[0]~input_o\))) # (!\x[4]~input_o\ & ((\mem_s~10_combout\) # (\x[2]~input_o\ $ (\x[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[4]~input_o\,
	datac => \mem_s~10_combout\,
	datad => \x[0]~input_o\,
	combout => \mem_s~11_combout\);

-- Location: LCCOMB_X7_Y72_N6
\mem_s~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~12_combout\ = (\x[2]~input_o\ & (!\x[0]~input_o\ & (\x[1]~input_o\ & \x[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[0]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~12_combout\);

-- Location: LCCOMB_X7_Y72_N0
\mem_s~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~13_combout\ = (\mem_s~12_combout\) # ((!\x[4]~input_o\ & ((\x[0]~input_o\) # (!\mem_s~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_s~12_combout\,
	datab => \x[4]~input_o\,
	datac => \mem_s~6_combout\,
	datad => \x[0]~input_o\,
	combout => \mem_s~13_combout\);

-- Location: LCCOMB_X7_Y72_N26
\mem_s~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~14_combout\ = (\x[2]~input_o\ & (!\x[4]~input_o\ & ((\x[1]~input_o\) # (\x[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[4]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[0]~input_o\,
	combout => \mem_s~14_combout\);

-- Location: LCCOMB_X7_Y72_N28
\mem_s~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~15_combout\ = (\x[3]~input_o\ & ((\x[2]~input_o\) # ((!\x[4]~input_o\)))) # (!\x[3]~input_o\ & (((\mem_s~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[4]~input_o\,
	datac => \mem_s~14_combout\,
	datad => \x[3]~input_o\,
	combout => \mem_s~15_combout\);

-- Location: LCCOMB_X6_Y72_N10
\mem_s~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~16_combout\ = (\x[2]~input_o\ & ((\x[3]~input_o\) # (!\x[4]~input_o\))) # (!\x[2]~input_o\ & (!\x[4]~input_o\ & \x[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[2]~input_o\,
	datab => \x[4]~input_o\,
	datad => \x[3]~input_o\,
	combout => \mem_s~16_combout\);

-- Location: LCCOMB_X6_Y72_N28
\mem_s~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~17_combout\ = (\mem_s~16_combout\ & ((\x[1]~input_o\ $ (\x[0]~input_o\)) # (!\x[4]~input_o\))) # (!\mem_s~16_combout\ & (!\x[4]~input_o\ & (!\x[1]~input_o\ & \x[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_s~16_combout\,
	datab => \x[4]~input_o\,
	datac => \x[1]~input_o\,
	datad => \x[0]~input_o\,
	combout => \mem_s~17_combout\);

-- Location: LCCOMB_X6_Y72_N22
\mem_s~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem_s~18_combout\ = (\x[4]~input_o\) # ((!\x[1]~input_o\ & (\mem_s~6_combout\ & !\x[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[1]~input_o\,
	datab => \x[4]~input_o\,
	datac => \mem_s~6_combout\,
	datad => \x[0]~input_o\,
	combout => \mem_s~18_combout\);

-- Location: IOIBUF_X81_Y73_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

ww_output(0) <= \output[0]~output_o\;

ww_output(1) <= \output[1]~output_o\;

ww_output(2) <= \output[2]~output_o\;

ww_output(3) <= \output[3]~output_o\;

ww_output(4) <= \output[4]~output_o\;

ww_output(5) <= \output[5]~output_o\;

ww_output(6) <= \output[6]~output_o\;

ww_output(7) <= \output[7]~output_o\;

ww_output(8) <= \output[8]~output_o\;

ww_output(9) <= \output[9]~output_o\;

ww_output(10) <= \output[10]~output_o\;

ww_output(11) <= \output[11]~output_o\;

ww_output(12) <= \output[12]~output_o\;

ww_output(13) <= \output[13]~output_o\;

ww_output(14) <= \output[14]~output_o\;

ww_output(15) <= \output[15]~output_o\;
END structure;


