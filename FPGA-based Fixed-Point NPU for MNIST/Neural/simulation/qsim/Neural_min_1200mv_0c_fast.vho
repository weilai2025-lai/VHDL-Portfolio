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

-- DATE "10/05/2025 22:17:29"

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


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	test IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	myinputValid : IN std_logic;
	a : IN std_logic;
	wout : BUFFER std_logic;
	ren_out : BUFFER std_logic;
	xx : BUFFER std_logic;
	r_addr_out : BUFFER std_logic_vector(7 DOWNTO 0);
	reg_valid : BUFFER std_logic
	);
END test;

-- Design Ports Information
-- wout	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ren_out	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- xx	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[0]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[1]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[2]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[3]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[4]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[5]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[6]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_addr_out[7]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_valid	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- myinputValid	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF test IS
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
SIGNAL ww_myinputValid : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_wout : std_logic;
SIGNAL ww_ren_out : std_logic;
SIGNAL ww_xx : std_logic;
SIGNAL ww_r_addr_out : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_reg_valid : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \wout~output_o\ : std_logic;
SIGNAL \ren_out~output_o\ : std_logic;
SIGNAL \xx~output_o\ : std_logic;
SIGNAL \r_addr_out[0]~output_o\ : std_logic;
SIGNAL \r_addr_out[1]~output_o\ : std_logic;
SIGNAL \r_addr_out[2]~output_o\ : std_logic;
SIGNAL \r_addr_out[3]~output_o\ : std_logic;
SIGNAL \r_addr_out[4]~output_o\ : std_logic;
SIGNAL \r_addr_out[5]~output_o\ : std_logic;
SIGNAL \r_addr_out[6]~output_o\ : std_logic;
SIGNAL \r_addr_out[7]~output_o\ : std_logic;
SIGNAL \reg_valid~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \myinputValid~input_o\ : std_logic;
SIGNAL \wout_internal~0_combout\ : std_logic;
SIGNAL \wout_internal~q\ : std_logic;
SIGNAL \registered_valid~feeder_combout\ : std_logic;
SIGNAL \registered_valid~q\ : std_logic;
SIGNAL \xx~0_combout\ : std_logic;
SIGNAL \xx~reg0_q\ : std_logic;
SIGNAL \r_addr[0]~8_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \r_addr[0]~10_combout\ : std_logic;
SIGNAL \r_addr[0]~9\ : std_logic;
SIGNAL \r_addr[1]~11_combout\ : std_logic;
SIGNAL \r_addr[1]~12\ : std_logic;
SIGNAL \r_addr[2]~13_combout\ : std_logic;
SIGNAL \r_addr[2]~14\ : std_logic;
SIGNAL \r_addr[3]~15_combout\ : std_logic;
SIGNAL \r_addr[3]~16\ : std_logic;
SIGNAL \r_addr[4]~17_combout\ : std_logic;
SIGNAL \r_addr[4]~18\ : std_logic;
SIGNAL \r_addr[5]~19_combout\ : std_logic;
SIGNAL \r_addr[5]~20\ : std_logic;
SIGNAL \r_addr[6]~21_combout\ : std_logic;
SIGNAL \r_addr[6]~22\ : std_logic;
SIGNAL \r_addr[7]~23_combout\ : std_logic;
SIGNAL r_addr : std_logic_vector(7 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_myinputValid <= myinputValid;
ww_a <= a;
wout <= ww_wout;
ren_out <= ww_ren_out;
xx <= ww_xx;
r_addr_out <= ww_r_addr_out;
reg_valid <= ww_reg_valid;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y16_N16
\wout~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \wout_internal~q\,
	devoe => ww_devoe,
	o => \wout~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\ren_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \myinputValid~input_o\,
	devoe => ww_devoe,
	o => \ren_out~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\xx~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \xx~reg0_q\,
	devoe => ww_devoe,
	o => \xx~output_o\);

-- Location: IOOBUF_X0_Y16_N23
\r_addr_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(0),
	devoe => ww_devoe,
	o => \r_addr_out[0]~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\r_addr_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(1),
	devoe => ww_devoe,
	o => \r_addr_out[1]~output_o\);

-- Location: IOOBUF_X0_Y15_N16
\r_addr_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(2),
	devoe => ww_devoe,
	o => \r_addr_out[2]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\r_addr_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(3),
	devoe => ww_devoe,
	o => \r_addr_out[3]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\r_addr_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(4),
	devoe => ww_devoe,
	o => \r_addr_out[4]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\r_addr_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(5),
	devoe => ww_devoe,
	o => \r_addr_out[5]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\r_addr_out[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(6),
	devoe => ww_devoe,
	o => \r_addr_out[6]~output_o\);

-- Location: IOOBUF_X0_Y13_N2
\r_addr_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => r_addr(7),
	devoe => ww_devoe,
	o => \r_addr_out[7]~output_o\);

-- Location: IOOBUF_X0_Y17_N16
\reg_valid~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \registered_valid~q\,
	devoe => ww_devoe,
	o => \reg_valid~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
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

-- Location: IOIBUF_X0_Y11_N22
\a~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

-- Location: IOIBUF_X0_Y12_N15
\myinputValid~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_myinputValid,
	o => \myinputValid~input_o\);

-- Location: LCCOMB_X1_Y15_N0
\wout_internal~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \wout_internal~0_combout\ = (\myinputValid~input_o\ & (\a~input_o\)) # (!\myinputValid~input_o\ & ((\wout_internal~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~input_o\,
	datac => \wout_internal~q\,
	datad => \myinputValid~input_o\,
	combout => \wout_internal~0_combout\);

-- Location: FF_X1_Y15_N1
wout_internal : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wout_internal~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wout_internal~q\);

-- Location: LCCOMB_X1_Y15_N28
\registered_valid~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \registered_valid~feeder_combout\ = \myinputValid~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myinputValid~input_o\,
	combout => \registered_valid~feeder_combout\);

-- Location: FF_X1_Y15_N29
registered_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \registered_valid~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registered_valid~q\);

-- Location: LCCOMB_X1_Y15_N2
\xx~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \xx~0_combout\ = (\registered_valid~q\ & \wout_internal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \registered_valid~q\,
	datad => \wout_internal~q\,
	combout => \xx~0_combout\);

-- Location: FF_X1_Y15_N3
\xx~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \xx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \xx~reg0_q\);

-- Location: LCCOMB_X1_Y15_N4
\r_addr[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[0]~8_combout\ = r_addr(0) $ (VCC)
-- \r_addr[0]~9\ = CARRY(r_addr(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => r_addr(0),
	datad => VCC,
	combout => \r_addr[0]~8_combout\,
	cout => \r_addr[0]~9\);

-- Location: IOIBUF_X0_Y13_N8
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X1_Y15_N30
\r_addr[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[0]~10_combout\ = (\myinputValid~input_o\) # (\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myinputValid~input_o\,
	datad => \rst~input_o\,
	combout => \r_addr[0]~10_combout\);

-- Location: FF_X1_Y15_N5
\r_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[0]~8_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(0));

-- Location: LCCOMB_X1_Y15_N6
\r_addr[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[1]~11_combout\ = (r_addr(1) & (!\r_addr[0]~9\)) # (!r_addr(1) & ((\r_addr[0]~9\) # (GND)))
-- \r_addr[1]~12\ = CARRY((!\r_addr[0]~9\) # (!r_addr(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => r_addr(1),
	datad => VCC,
	cin => \r_addr[0]~9\,
	combout => \r_addr[1]~11_combout\,
	cout => \r_addr[1]~12\);

-- Location: FF_X1_Y15_N7
\r_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[1]~11_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(1));

-- Location: LCCOMB_X1_Y15_N8
\r_addr[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[2]~13_combout\ = (r_addr(2) & (\r_addr[1]~12\ $ (GND))) # (!r_addr(2) & (!\r_addr[1]~12\ & VCC))
-- \r_addr[2]~14\ = CARRY((r_addr(2) & !\r_addr[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => r_addr(2),
	datad => VCC,
	cin => \r_addr[1]~12\,
	combout => \r_addr[2]~13_combout\,
	cout => \r_addr[2]~14\);

-- Location: FF_X1_Y15_N9
\r_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[2]~13_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(2));

-- Location: LCCOMB_X1_Y15_N10
\r_addr[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[3]~15_combout\ = (r_addr(3) & (!\r_addr[2]~14\)) # (!r_addr(3) & ((\r_addr[2]~14\) # (GND)))
-- \r_addr[3]~16\ = CARRY((!\r_addr[2]~14\) # (!r_addr(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => r_addr(3),
	datad => VCC,
	cin => \r_addr[2]~14\,
	combout => \r_addr[3]~15_combout\,
	cout => \r_addr[3]~16\);

-- Location: FF_X1_Y15_N11
\r_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[3]~15_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(3));

-- Location: LCCOMB_X1_Y15_N12
\r_addr[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[4]~17_combout\ = (r_addr(4) & (\r_addr[3]~16\ $ (GND))) # (!r_addr(4) & (!\r_addr[3]~16\ & VCC))
-- \r_addr[4]~18\ = CARRY((r_addr(4) & !\r_addr[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => r_addr(4),
	datad => VCC,
	cin => \r_addr[3]~16\,
	combout => \r_addr[4]~17_combout\,
	cout => \r_addr[4]~18\);

-- Location: FF_X1_Y15_N13
\r_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[4]~17_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(4));

-- Location: LCCOMB_X1_Y15_N14
\r_addr[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[5]~19_combout\ = (r_addr(5) & (!\r_addr[4]~18\)) # (!r_addr(5) & ((\r_addr[4]~18\) # (GND)))
-- \r_addr[5]~20\ = CARRY((!\r_addr[4]~18\) # (!r_addr(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => r_addr(5),
	datad => VCC,
	cin => \r_addr[4]~18\,
	combout => \r_addr[5]~19_combout\,
	cout => \r_addr[5]~20\);

-- Location: FF_X1_Y15_N15
\r_addr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[5]~19_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(5));

-- Location: LCCOMB_X1_Y15_N16
\r_addr[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[6]~21_combout\ = (r_addr(6) & (\r_addr[5]~20\ $ (GND))) # (!r_addr(6) & (!\r_addr[5]~20\ & VCC))
-- \r_addr[6]~22\ = CARRY((r_addr(6) & !\r_addr[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => r_addr(6),
	datad => VCC,
	cin => \r_addr[5]~20\,
	combout => \r_addr[6]~21_combout\,
	cout => \r_addr[6]~22\);

-- Location: FF_X1_Y15_N17
\r_addr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[6]~21_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(6));

-- Location: LCCOMB_X1_Y15_N18
\r_addr[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \r_addr[7]~23_combout\ = \r_addr[6]~22\ $ (r_addr(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => r_addr(7),
	cin => \r_addr[6]~22\,
	combout => \r_addr[7]~23_combout\);

-- Location: FF_X1_Y15_N19
\r_addr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r_addr[7]~23_combout\,
	sclr => \rst~input_o\,
	ena => \r_addr[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r_addr(7));

ww_wout <= \wout~output_o\;

ww_ren_out <= \ren_out~output_o\;

ww_xx <= \xx~output_o\;

ww_r_addr_out(0) <= \r_addr_out[0]~output_o\;

ww_r_addr_out(1) <= \r_addr_out[1]~output_o\;

ww_r_addr_out(2) <= \r_addr_out[2]~output_o\;

ww_r_addr_out(3) <= \r_addr_out[3]~output_o\;

ww_r_addr_out(4) <= \r_addr_out[4]~output_o\;

ww_r_addr_out(5) <= \r_addr_out[5]~output_o\;

ww_r_addr_out(6) <= \r_addr_out[6]~output_o\;

ww_r_addr_out(7) <= \r_addr_out[7]~output_o\;

ww_reg_valid <= \reg_valid~output_o\;
END structure;


