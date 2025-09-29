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

-- DATE "09/26/2025 19:56:45"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	mac_int8 IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	en : IN std_logic;
	clr : IN std_logic;
	a : IN std_logic_vector(7 DOWNTO 0);
	b : IN std_logic_vector(7 DOWNTO 0);
	acc_in : IN std_logic_vector(31 DOWNTO 0);
	acc_out : OUT std_logic_vector(31 DOWNTO 0)
	);
END mac_int8;

-- Design Ports Information
-- acc_out[0]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[1]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[2]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[3]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[4]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[6]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[7]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[8]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[9]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[10]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[11]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[12]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[13]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[14]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[15]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[16]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[17]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[18]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[19]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[20]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[21]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[22]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[23]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[24]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[25]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[26]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[27]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[28]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[29]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[30]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_out[31]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clr	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[31]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[0]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[2]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[3]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[4]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[5]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[6]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[7]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[8]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[9]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[10]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[11]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[12]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[13]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[14]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[15]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[16]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[17]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[18]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[19]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[20]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[21]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[22]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[23]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[24]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[25]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[26]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[27]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[28]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[29]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- acc_in[30]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[4]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[5]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[6]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[7]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mac_int8 IS
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
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_clr : std_logic;
SIGNAL ww_a : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_acc_in : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_acc_out : std_logic_vector(31 DOWNTO 0);
SIGNAL \Mult0~mac_AX_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Mult0~mac_AY_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Mult0~mac_BX_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Mult0~mac_BY_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Mult0~mac_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult0~8\ : std_logic;
SIGNAL \Mult0~9\ : std_logic;
SIGNAL \Mult0~10\ : std_logic;
SIGNAL \Mult0~11\ : std_logic;
SIGNAL \Mult0~12\ : std_logic;
SIGNAL \Mult0~13\ : std_logic;
SIGNAL \Mult0~14\ : std_logic;
SIGNAL \Mult0~15\ : std_logic;
SIGNAL \Mult0~16\ : std_logic;
SIGNAL \Mult0~17\ : std_logic;
SIGNAL \Mult0~18\ : std_logic;
SIGNAL \Mult0~19\ : std_logic;
SIGNAL \Mult0~20\ : std_logic;
SIGNAL \Mult0~21\ : std_logic;
SIGNAL \Mult0~22\ : std_logic;
SIGNAL \Mult0~23\ : std_logic;
SIGNAL \Mult0~24\ : std_logic;
SIGNAL \Mult0~25\ : std_logic;
SIGNAL \Mult0~26\ : std_logic;
SIGNAL \Mult0~27\ : std_logic;
SIGNAL \Mult0~28\ : std_logic;
SIGNAL \Mult0~29\ : std_logic;
SIGNAL \Mult0~30\ : std_logic;
SIGNAL \Mult0~31\ : std_logic;
SIGNAL \Mult0~32\ : std_logic;
SIGNAL \Mult0~33\ : std_logic;
SIGNAL \Mult0~34\ : std_logic;
SIGNAL \Mult0~35\ : std_logic;
SIGNAL \Mult0~36\ : std_logic;
SIGNAL \Mult0~37\ : std_logic;
SIGNAL \Mult0~38\ : std_logic;
SIGNAL \Mult0~39\ : std_logic;
SIGNAL \Mult0~40\ : std_logic;
SIGNAL \Mult0~41\ : std_logic;
SIGNAL \Mult0~42\ : std_logic;
SIGNAL \Mult0~43\ : std_logic;
SIGNAL \Mult0~44\ : std_logic;
SIGNAL \Mult0~45\ : std_logic;
SIGNAL \Mult0~46\ : std_logic;
SIGNAL \Mult0~47\ : std_logic;
SIGNAL \Mult0~48\ : std_logic;
SIGNAL \Mult0~49\ : std_logic;
SIGNAL \Mult0~50\ : std_logic;
SIGNAL \Mult0~51\ : std_logic;
SIGNAL \Mult0~52\ : std_logic;
SIGNAL \Mult0~53\ : std_logic;
SIGNAL \Mult0~54\ : std_logic;
SIGNAL \Mult0~55\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \acc_in[31]~input_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \acc_in[30]~input_o\ : std_logic;
SIGNAL \acc_in[29]~input_o\ : std_logic;
SIGNAL \acc_in[28]~input_o\ : std_logic;
SIGNAL \acc_in[27]~input_o\ : std_logic;
SIGNAL \acc_in[26]~input_o\ : std_logic;
SIGNAL \acc_in[25]~input_o\ : std_logic;
SIGNAL \acc_in[24]~input_o\ : std_logic;
SIGNAL \acc_in[23]~input_o\ : std_logic;
SIGNAL \acc_in[22]~input_o\ : std_logic;
SIGNAL \acc_in[21]~input_o\ : std_logic;
SIGNAL \acc_in[20]~input_o\ : std_logic;
SIGNAL \acc_in[19]~input_o\ : std_logic;
SIGNAL \acc_in[18]~input_o\ : std_logic;
SIGNAL \acc_in[17]~input_o\ : std_logic;
SIGNAL \acc_in[16]~input_o\ : std_logic;
SIGNAL \acc_in[15]~input_o\ : std_logic;
SIGNAL \acc_in[14]~input_o\ : std_logic;
SIGNAL \acc_in[13]~input_o\ : std_logic;
SIGNAL \acc_in[12]~input_o\ : std_logic;
SIGNAL \acc_in[11]~input_o\ : std_logic;
SIGNAL \acc_in[10]~input_o\ : std_logic;
SIGNAL \acc_in[9]~input_o\ : std_logic;
SIGNAL \acc_in[8]~input_o\ : std_logic;
SIGNAL \acc_in[7]~input_o\ : std_logic;
SIGNAL \acc_in[6]~input_o\ : std_logic;
SIGNAL \acc_in[5]~input_o\ : std_logic;
SIGNAL \acc_in[4]~input_o\ : std_logic;
SIGNAL \acc_in[3]~input_o\ : std_logic;
SIGNAL \acc_in[2]~input_o\ : std_logic;
SIGNAL \acc_in[1]~input_o\ : std_logic;
SIGNAL \acc_in[0]~input_o\ : std_logic;
SIGNAL \Add1~130_cout\ : std_logic;
SIGNAL \Add1~126_cout\ : std_logic;
SIGNAL \Add1~122_cout\ : std_logic;
SIGNAL \Add1~118_cout\ : std_logic;
SIGNAL \Add1~114_cout\ : std_logic;
SIGNAL \Add1~110_cout\ : std_logic;
SIGNAL \Add1~106_cout\ : std_logic;
SIGNAL \Add1~102_cout\ : std_logic;
SIGNAL \Add1~98_cout\ : std_logic;
SIGNAL \Add1~94_cout\ : std_logic;
SIGNAL \Add1~90_cout\ : std_logic;
SIGNAL \Add1~86_cout\ : std_logic;
SIGNAL \Add1~82_cout\ : std_logic;
SIGNAL \Add1~78_cout\ : std_logic;
SIGNAL \Add1~74_cout\ : std_logic;
SIGNAL \Add1~70_cout\ : std_logic;
SIGNAL \Add1~66_cout\ : std_logic;
SIGNAL \Add1~62_cout\ : std_logic;
SIGNAL \Add1~58_cout\ : std_logic;
SIGNAL \Add1~54_cout\ : std_logic;
SIGNAL \Add1~50_cout\ : std_logic;
SIGNAL \Add1~46_cout\ : std_logic;
SIGNAL \Add1~42_cout\ : std_logic;
SIGNAL \Add1~38_cout\ : std_logic;
SIGNAL \Add1~34_cout\ : std_logic;
SIGNAL \Add1~30_cout\ : std_logic;
SIGNAL \Add1~26_cout\ : std_logic;
SIGNAL \Add1~22_cout\ : std_logic;
SIGNAL \Add1~18_cout\ : std_logic;
SIGNAL \Add1~14_cout\ : std_logic;
SIGNAL \Add1~10_cout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \acc_outs~0_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \clr~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \acc_outs[0]~1_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \acc_outs~2_combout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \acc_outs~3_combout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \acc_outs~4_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \acc_outs~5_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \acc_outs~6_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \acc_outs~7_combout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \acc_outs~8_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \acc_outs~9_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \acc_outs~10_combout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \acc_outs~11_combout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \acc_outs~12_combout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \acc_outs~13_combout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \acc_outs~14_combout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \acc_outs~15_combout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \acc_outs~16_combout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \acc_outs~17_combout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \acc_outs~18_combout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \acc_outs~19_combout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \acc_outs~20_combout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \acc_outs~21_combout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \acc_outs~22_combout\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \acc_outs~23_combout\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \acc_outs~24_combout\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \acc_outs~25_combout\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \acc_outs~26_combout\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~105_sumout\ : std_logic;
SIGNAL \acc_outs~27_combout\ : std_logic;
SIGNAL \Add0~106\ : std_logic;
SIGNAL \Add0~109_sumout\ : std_logic;
SIGNAL \acc_outs~28_combout\ : std_logic;
SIGNAL \Add0~110\ : std_logic;
SIGNAL \Add0~113_sumout\ : std_logic;
SIGNAL \acc_outs~29_combout\ : std_logic;
SIGNAL \Add0~114\ : std_logic;
SIGNAL \Add0~117_sumout\ : std_logic;
SIGNAL \acc_outs~30_combout\ : std_logic;
SIGNAL \Add0~118\ : std_logic;
SIGNAL \Add0~121_sumout\ : std_logic;
SIGNAL \acc_outs~31_combout\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~125_sumout\ : std_logic;
SIGNAL \acc_outs~32_combout\ : std_logic;
SIGNAL acc_outs : std_logic_vector(31 DOWNTO 0);
SIGNAL mult16 : std_logic_vector(15 DOWNTO 0);
SIGNAL mult_ext : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL ALT_INV_mult16 : std_logic_vector(14 DOWNTO 0);
SIGNAL \ALT_INV_Add0~105_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL ALT_INV_mult_ext : std_logic_vector(15 DOWNTO 15);
SIGNAL \ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~101_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~109_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~85_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~121_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~113_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~125_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~97_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~117_sumout\ : std_logic;
SIGNAL \ALT_INV_acc_in[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_clr~input_o\ : std_logic;
SIGNAL \ALT_INV_en~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_acc_in[25]~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_en <= en;
ww_clr <= clr;
ww_a <= a;
ww_b <= b;
ww_acc_in <= acc_in;
acc_out <= ww_acc_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mult0~mac_AX_bus\ <= (\a[7]~input_o\ & \a[7]~input_o\ & \a[6]~input_o\ & \a[5]~input_o\ & \a[4]~input_o\ & \a[3]~input_o\ & \a[2]~input_o\ & \a[1]~input_o\ & \a[0]~input_o\);

\Mult0~mac_AY_bus\ <= (\b[7]~input_o\ & \b[7]~input_o\ & \b[6]~input_o\ & \b[5]~input_o\ & \b[4]~input_o\ & \b[3]~input_o\ & \b[2]~input_o\ & \b[1]~input_o\ & \b[0]~input_o\);

\Mult0~mac_BX_bus\ <= (\a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\ & \a[7]~input_o\);

\Mult0~mac_BY_bus\ <= (\b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\ & \b[7]~input_o\);

mult16(0) <= \Mult0~mac_RESULTA_bus\(0);
mult16(1) <= \Mult0~mac_RESULTA_bus\(1);
mult16(2) <= \Mult0~mac_RESULTA_bus\(2);
mult16(3) <= \Mult0~mac_RESULTA_bus\(3);
mult16(4) <= \Mult0~mac_RESULTA_bus\(4);
mult16(5) <= \Mult0~mac_RESULTA_bus\(5);
mult16(6) <= \Mult0~mac_RESULTA_bus\(6);
mult16(7) <= \Mult0~mac_RESULTA_bus\(7);
mult16(8) <= \Mult0~mac_RESULTA_bus\(8);
mult16(9) <= \Mult0~mac_RESULTA_bus\(9);
mult16(10) <= \Mult0~mac_RESULTA_bus\(10);
mult16(11) <= \Mult0~mac_RESULTA_bus\(11);
mult16(12) <= \Mult0~mac_RESULTA_bus\(12);
mult16(13) <= \Mult0~mac_RESULTA_bus\(13);
mult16(14) <= \Mult0~mac_RESULTA_bus\(14);
mult_ext(15) <= \Mult0~mac_RESULTA_bus\(15);
\Mult0~8\ <= \Mult0~mac_RESULTA_bus\(16);
\Mult0~9\ <= \Mult0~mac_RESULTA_bus\(17);
\Mult0~10\ <= \Mult0~mac_RESULTA_bus\(18);
\Mult0~11\ <= \Mult0~mac_RESULTA_bus\(19);
\Mult0~12\ <= \Mult0~mac_RESULTA_bus\(20);
\Mult0~13\ <= \Mult0~mac_RESULTA_bus\(21);
\Mult0~14\ <= \Mult0~mac_RESULTA_bus\(22);
\Mult0~15\ <= \Mult0~mac_RESULTA_bus\(23);
\Mult0~16\ <= \Mult0~mac_RESULTA_bus\(24);
\Mult0~17\ <= \Mult0~mac_RESULTA_bus\(25);
\Mult0~18\ <= \Mult0~mac_RESULTA_bus\(26);
\Mult0~19\ <= \Mult0~mac_RESULTA_bus\(27);
\Mult0~20\ <= \Mult0~mac_RESULTA_bus\(28);
\Mult0~21\ <= \Mult0~mac_RESULTA_bus\(29);
\Mult0~22\ <= \Mult0~mac_RESULTA_bus\(30);
\Mult0~23\ <= \Mult0~mac_RESULTA_bus\(31);
\Mult0~24\ <= \Mult0~mac_RESULTA_bus\(32);
\Mult0~25\ <= \Mult0~mac_RESULTA_bus\(33);
\Mult0~26\ <= \Mult0~mac_RESULTA_bus\(34);
\Mult0~27\ <= \Mult0~mac_RESULTA_bus\(35);
\Mult0~28\ <= \Mult0~mac_RESULTA_bus\(36);
\Mult0~29\ <= \Mult0~mac_RESULTA_bus\(37);
\Mult0~30\ <= \Mult0~mac_RESULTA_bus\(38);
\Mult0~31\ <= \Mult0~mac_RESULTA_bus\(39);
\Mult0~32\ <= \Mult0~mac_RESULTA_bus\(40);
\Mult0~33\ <= \Mult0~mac_RESULTA_bus\(41);
\Mult0~34\ <= \Mult0~mac_RESULTA_bus\(42);
\Mult0~35\ <= \Mult0~mac_RESULTA_bus\(43);
\Mult0~36\ <= \Mult0~mac_RESULTA_bus\(44);
\Mult0~37\ <= \Mult0~mac_RESULTA_bus\(45);
\Mult0~38\ <= \Mult0~mac_RESULTA_bus\(46);
\Mult0~39\ <= \Mult0~mac_RESULTA_bus\(47);
\Mult0~40\ <= \Mult0~mac_RESULTA_bus\(48);
\Mult0~41\ <= \Mult0~mac_RESULTA_bus\(49);
\Mult0~42\ <= \Mult0~mac_RESULTA_bus\(50);
\Mult0~43\ <= \Mult0~mac_RESULTA_bus\(51);
\Mult0~44\ <= \Mult0~mac_RESULTA_bus\(52);
\Mult0~45\ <= \Mult0~mac_RESULTA_bus\(53);
\Mult0~46\ <= \Mult0~mac_RESULTA_bus\(54);
\Mult0~47\ <= \Mult0~mac_RESULTA_bus\(55);
\Mult0~48\ <= \Mult0~mac_RESULTA_bus\(56);
\Mult0~49\ <= \Mult0~mac_RESULTA_bus\(57);
\Mult0~50\ <= \Mult0~mac_RESULTA_bus\(58);
\Mult0~51\ <= \Mult0~mac_RESULTA_bus\(59);
\Mult0~52\ <= \Mult0~mac_RESULTA_bus\(60);
\Mult0~53\ <= \Mult0~mac_RESULTA_bus\(61);
\Mult0~54\ <= \Mult0~mac_RESULTA_bus\(62);
\Mult0~55\ <= \Mult0~mac_RESULTA_bus\(63);
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_Add0~33_sumout\ <= NOT \Add0~33_sumout\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_Add0~37_sumout\ <= NOT \Add0~37_sumout\;
\ALT_INV_Add0~41_sumout\ <= NOT \Add0~41_sumout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
ALT_INV_mult16(4) <= NOT mult16(4);
\ALT_INV_Add0~105_sumout\ <= NOT \Add0~105_sumout\;
\ALT_INV_Add0~89_sumout\ <= NOT \Add0~89_sumout\;
ALT_INV_mult16(7) <= NOT mult16(7);
ALT_INV_mult16(8) <= NOT mult16(8);
\ALT_INV_Add0~73_sumout\ <= NOT \Add0~73_sumout\;
ALT_INV_mult16(10) <= NOT mult16(10);
ALT_INV_mult16(14) <= NOT mult16(14);
ALT_INV_mult16(5) <= NOT mult16(5);
ALT_INV_mult_ext(15) <= NOT mult_ext(15);
\ALT_INV_Add0~57_sumout\ <= NOT \Add0~57_sumout\;
\ALT_INV_Add0~93_sumout\ <= NOT \Add0~93_sumout\;
\ALT_INV_Add0~101_sumout\ <= NOT \Add0~101_sumout\;
\ALT_INV_Add0~109_sumout\ <= NOT \Add0~109_sumout\;
ALT_INV_mult16(0) <= NOT mult16(0);
\ALT_INV_Add0~53_sumout\ <= NOT \Add0~53_sumout\;
ALT_INV_mult16(11) <= NOT mult16(11);
\ALT_INV_Add0~81_sumout\ <= NOT \Add0~81_sumout\;
ALT_INV_mult16(1) <= NOT mult16(1);
ALT_INV_mult16(12) <= NOT mult16(12);
\ALT_INV_Add0~49_sumout\ <= NOT \Add0~49_sumout\;
\ALT_INV_Add0~61_sumout\ <= NOT \Add0~61_sumout\;
\ALT_INV_Add0~45_sumout\ <= NOT \Add0~45_sumout\;
\ALT_INV_Add0~69_sumout\ <= NOT \Add0~69_sumout\;
\ALT_INV_Add0~85_sumout\ <= NOT \Add0~85_sumout\;
\ALT_INV_Add0~77_sumout\ <= NOT \Add0~77_sumout\;
\ALT_INV_Add0~121_sumout\ <= NOT \Add0~121_sumout\;
\ALT_INV_Add0~65_sumout\ <= NOT \Add0~65_sumout\;
ALT_INV_mult16(2) <= NOT mult16(2);
ALT_INV_mult16(3) <= NOT mult16(3);
ALT_INV_mult16(6) <= NOT mult16(6);
ALT_INV_mult16(9) <= NOT mult16(9);
ALT_INV_mult16(13) <= NOT mult16(13);
\ALT_INV_Add0~113_sumout\ <= NOT \Add0~113_sumout\;
\ALT_INV_Add0~125_sumout\ <= NOT \Add0~125_sumout\;
\ALT_INV_Add0~97_sumout\ <= NOT \Add0~97_sumout\;
\ALT_INV_Add0~117_sumout\ <= NOT \Add0~117_sumout\;
\ALT_INV_acc_in[11]~input_o\ <= NOT \acc_in[11]~input_o\;
\ALT_INV_acc_in[12]~input_o\ <= NOT \acc_in[12]~input_o\;
\ALT_INV_acc_in[13]~input_o\ <= NOT \acc_in[13]~input_o\;
\ALT_INV_acc_in[14]~input_o\ <= NOT \acc_in[14]~input_o\;
\ALT_INV_clr~input_o\ <= NOT \clr~input_o\;
\ALT_INV_en~input_o\ <= NOT \en~input_o\;
\ALT_INV_acc_in[31]~input_o\ <= NOT \acc_in[31]~input_o\;
\ALT_INV_acc_in[0]~input_o\ <= NOT \acc_in[0]~input_o\;
\ALT_INV_acc_in[4]~input_o\ <= NOT \acc_in[4]~input_o\;
\ALT_INV_acc_in[5]~input_o\ <= NOT \acc_in[5]~input_o\;
\ALT_INV_acc_in[2]~input_o\ <= NOT \acc_in[2]~input_o\;
\ALT_INV_acc_in[3]~input_o\ <= NOT \acc_in[3]~input_o\;
\ALT_INV_acc_in[7]~input_o\ <= NOT \acc_in[7]~input_o\;
\ALT_INV_acc_in[1]~input_o\ <= NOT \acc_in[1]~input_o\;
\ALT_INV_acc_in[6]~input_o\ <= NOT \acc_in[6]~input_o\;
\ALT_INV_acc_in[8]~input_o\ <= NOT \acc_in[8]~input_o\;
\ALT_INV_acc_in[9]~input_o\ <= NOT \acc_in[9]~input_o\;
\ALT_INV_acc_in[10]~input_o\ <= NOT \acc_in[10]~input_o\;
\ALT_INV_acc_in[19]~input_o\ <= NOT \acc_in[19]~input_o\;
\ALT_INV_acc_in[15]~input_o\ <= NOT \acc_in[15]~input_o\;
\ALT_INV_acc_in[23]~input_o\ <= NOT \acc_in[23]~input_o\;
\ALT_INV_acc_in[16]~input_o\ <= NOT \acc_in[16]~input_o\;
\ALT_INV_acc_in[30]~input_o\ <= NOT \acc_in[30]~input_o\;
\ALT_INV_acc_in[27]~input_o\ <= NOT \acc_in[27]~input_o\;
\ALT_INV_acc_in[17]~input_o\ <= NOT \acc_in[17]~input_o\;
\ALT_INV_acc_in[18]~input_o\ <= NOT \acc_in[18]~input_o\;
\ALT_INV_acc_in[24]~input_o\ <= NOT \acc_in[24]~input_o\;
\ALT_INV_acc_in[28]~input_o\ <= NOT \acc_in[28]~input_o\;
\ALT_INV_acc_in[26]~input_o\ <= NOT \acc_in[26]~input_o\;
\ALT_INV_acc_in[29]~input_o\ <= NOT \acc_in[29]~input_o\;
\ALT_INV_acc_in[20]~input_o\ <= NOT \acc_in[20]~input_o\;
\ALT_INV_acc_in[22]~input_o\ <= NOT \acc_in[22]~input_o\;
\ALT_INV_acc_in[21]~input_o\ <= NOT \acc_in[21]~input_o\;
\ALT_INV_acc_in[25]~input_o\ <= NOT \acc_in[25]~input_o\;

-- Location: IOOBUF_X40_Y0_N19
\acc_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(0),
	devoe => ww_devoe,
	o => ww_acc_out(0));

-- Location: IOOBUF_X4_Y0_N53
\acc_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(1),
	devoe => ww_devoe,
	o => ww_acc_out(1));

-- Location: IOOBUF_X56_Y0_N19
\acc_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(2),
	devoe => ww_devoe,
	o => ww_acc_out(2));

-- Location: IOOBUF_X58_Y0_N76
\acc_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(3),
	devoe => ww_devoe,
	o => ww_acc_out(3));

-- Location: IOOBUF_X56_Y0_N36
\acc_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(4),
	devoe => ww_devoe,
	o => ww_acc_out(4));

-- Location: IOOBUF_X62_Y0_N2
\acc_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(5),
	devoe => ww_devoe,
	o => ww_acc_out(5));

-- Location: IOOBUF_X64_Y0_N36
\acc_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(6),
	devoe => ww_devoe,
	o => ww_acc_out(6));

-- Location: IOOBUF_X4_Y0_N36
\acc_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(7),
	devoe => ww_devoe,
	o => ww_acc_out(7));

-- Location: IOOBUF_X6_Y0_N36
\acc_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(8),
	devoe => ww_devoe,
	o => ww_acc_out(8));

-- Location: IOOBUF_X68_Y0_N36
\acc_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(9),
	devoe => ww_devoe,
	o => ww_acc_out(9));

-- Location: IOOBUF_X4_Y0_N2
\acc_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(10),
	devoe => ww_devoe,
	o => ww_acc_out(10));

-- Location: IOOBUF_X2_Y0_N59
\acc_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(11),
	devoe => ww_devoe,
	o => ww_acc_out(11));

-- Location: IOOBUF_X52_Y0_N19
\acc_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(12),
	devoe => ww_devoe,
	o => ww_acc_out(12));

-- Location: IOOBUF_X60_Y0_N19
\acc_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(13),
	devoe => ww_devoe,
	o => ww_acc_out(13));

-- Location: IOOBUF_X64_Y0_N19
\acc_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(14),
	devoe => ww_devoe,
	o => ww_acc_out(14));

-- Location: IOOBUF_X6_Y0_N53
\acc_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(15),
	devoe => ww_devoe,
	o => ww_acc_out(15));

-- Location: IOOBUF_X2_Y0_N76
\acc_out[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(16),
	devoe => ww_devoe,
	o => ww_acc_out(16));

-- Location: IOOBUF_X60_Y0_N53
\acc_out[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(17),
	devoe => ww_devoe,
	o => ww_acc_out(17));

-- Location: IOOBUF_X54_Y0_N2
\acc_out[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(18),
	devoe => ww_devoe,
	o => ww_acc_out(18));

-- Location: IOOBUF_X54_Y0_N53
\acc_out[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(19),
	devoe => ww_devoe,
	o => ww_acc_out(19));

-- Location: IOOBUF_X52_Y0_N2
\acc_out[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(20),
	devoe => ww_devoe,
	o => ww_acc_out(20));

-- Location: IOOBUF_X34_Y0_N93
\acc_out[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(21),
	devoe => ww_devoe,
	o => ww_acc_out(21));

-- Location: IOOBUF_X40_Y0_N53
\acc_out[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(22),
	devoe => ww_devoe,
	o => ww_acc_out(22));

-- Location: IOOBUF_X6_Y0_N19
\acc_out[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(23),
	devoe => ww_devoe,
	o => ww_acc_out(23));

-- Location: IOOBUF_X54_Y0_N36
\acc_out[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(24),
	devoe => ww_devoe,
	o => ww_acc_out(24));

-- Location: IOOBUF_X64_Y0_N2
\acc_out[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(25),
	devoe => ww_devoe,
	o => ww_acc_out(25));

-- Location: IOOBUF_X52_Y0_N53
\acc_out[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(26),
	devoe => ww_devoe,
	o => ww_acc_out(26));

-- Location: IOOBUF_X6_Y0_N2
\acc_out[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(27),
	devoe => ww_devoe,
	o => ww_acc_out(27));

-- Location: IOOBUF_X58_Y0_N93
\acc_out[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(28),
	devoe => ww_devoe,
	o => ww_acc_out(28));

-- Location: IOOBUF_X30_Y0_N19
\acc_out[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(29),
	devoe => ww_devoe,
	o => ww_acc_out(29));

-- Location: IOOBUF_X40_Y0_N2
\acc_out[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(30),
	devoe => ww_devoe,
	o => ww_acc_out(30));

-- Location: IOOBUF_X54_Y0_N19
\acc_out[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => acc_outs(31),
	devoe => ww_devoe,
	o => ww_acc_out(31));

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X8_Y0_N1
\acc_in[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(31),
	o => \acc_in[31]~input_o\);

-- Location: IOIBUF_X38_Y0_N52
\a[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X50_Y0_N75
\a[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\a[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X62_Y0_N35
\a[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X40_Y0_N35
\a[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: IOIBUF_X38_Y0_N18
\a[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: IOIBUF_X32_Y0_N1
\a[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\a[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: IOIBUF_X38_Y0_N35
\b[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X60_Y0_N35
\b[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: IOIBUF_X50_Y0_N41
\b[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X36_Y0_N18
\b[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: IOIBUF_X50_Y0_N58
\b[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

-- Location: IOIBUF_X50_Y0_N92
\b[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

-- Location: IOIBUF_X32_Y0_N52
\b[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\b[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

-- Location: DSP_X32_Y2_N0
\Mult0~mac\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 9,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 9,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	bx_width => 9,
	by_clock => "none",
	by_use_scan_in => "false",
	by_width => 9,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m9x9",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "true",
	signed_may => "true",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	ax => \Mult0~mac_AX_bus\,
	ay => \Mult0~mac_AY_bus\,
	bx => \Mult0~mac_BX_bus\,
	by => \Mult0~mac_BY_bus\,
	resulta => \Mult0~mac_RESULTA_bus\);

-- Location: IOIBUF_X30_Y0_N1
\acc_in[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(30),
	o => \acc_in[30]~input_o\);

-- Location: IOIBUF_X26_Y0_N75
\acc_in[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(29),
	o => \acc_in[29]~input_o\);

-- Location: IOIBUF_X28_Y0_N18
\acc_in[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(28),
	o => \acc_in[28]~input_o\);

-- Location: IOIBUF_X34_Y0_N58
\acc_in[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(27),
	o => \acc_in[27]~input_o\);

-- Location: IOIBUF_X8_Y0_N52
\acc_in[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(26),
	o => \acc_in[26]~input_o\);

-- Location: IOIBUF_X26_Y0_N41
\acc_in[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(25),
	o => \acc_in[25]~input_o\);

-- Location: IOIBUF_X28_Y0_N52
\acc_in[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(24),
	o => \acc_in[24]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\acc_in[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(23),
	o => \acc_in[23]~input_o\);

-- Location: IOIBUF_X8_Y0_N18
\acc_in[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(22),
	o => \acc_in[22]~input_o\);

-- Location: IOIBUF_X30_Y0_N52
\acc_in[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(21),
	o => \acc_in[21]~input_o\);

-- Location: IOIBUF_X32_Y0_N18
\acc_in[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(20),
	o => \acc_in[20]~input_o\);

-- Location: IOIBUF_X58_Y0_N58
\acc_in[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(19),
	o => \acc_in[19]~input_o\);

-- Location: IOIBUF_X58_Y0_N41
\acc_in[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(18),
	o => \acc_in[18]~input_o\);

-- Location: IOIBUF_X34_Y0_N75
\acc_in[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(17),
	o => \acc_in[17]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\acc_in[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(16),
	o => \acc_in[16]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\acc_in[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(15),
	o => \acc_in[15]~input_o\);

-- Location: IOIBUF_X66_Y0_N58
\acc_in[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(14),
	o => \acc_in[14]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\acc_in[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(13),
	o => \acc_in[13]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\acc_in[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(12),
	o => \acc_in[12]~input_o\);

-- Location: IOIBUF_X30_Y0_N35
\acc_in[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(11),
	o => \acc_in[11]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\acc_in[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(10),
	o => \acc_in[10]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\acc_in[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(9),
	o => \acc_in[9]~input_o\);

-- Location: IOIBUF_X66_Y0_N92
\acc_in[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(8),
	o => \acc_in[8]~input_o\);

-- Location: IOIBUF_X34_Y0_N41
\acc_in[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(7),
	o => \acc_in[7]~input_o\);

-- Location: IOIBUF_X62_Y0_N18
\acc_in[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(6),
	o => \acc_in[6]~input_o\);

-- Location: IOIBUF_X2_Y0_N92
\acc_in[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(5),
	o => \acc_in[5]~input_o\);

-- Location: IOIBUF_X32_Y0_N35
\acc_in[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(4),
	o => \acc_in[4]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\acc_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(3),
	o => \acc_in[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\acc_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(2),
	o => \acc_in[2]~input_o\);

-- Location: IOIBUF_X62_Y0_N52
\acc_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(1),
	o => \acc_in[1]~input_o\);

-- Location: IOIBUF_X66_Y0_N75
\acc_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_acc_in(0),
	o => \acc_in[0]~input_o\);

-- Location: LABCELL_X24_Y2_N0
\Add1~130\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~130_cout\ = CARRY(( \acc_in[0]~input_o\ ) + ( mult16(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_mult16(0),
	datad => \ALT_INV_acc_in[0]~input_o\,
	cin => GND,
	cout => \Add1~130_cout\);

-- Location: LABCELL_X24_Y2_N3
\Add1~126\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~126_cout\ = CARRY(( mult16(1) ) + ( \acc_in[1]~input_o\ ) + ( \Add1~130_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult16(1),
	dataf => \ALT_INV_acc_in[1]~input_o\,
	cin => \Add1~130_cout\,
	cout => \Add1~126_cout\);

-- Location: LABCELL_X24_Y2_N6
\Add1~122\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~122_cout\ = CARRY(( mult16(2) ) + ( \acc_in[2]~input_o\ ) + ( \Add1~126_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[2]~input_o\,
	datad => ALT_INV_mult16(2),
	cin => \Add1~126_cout\,
	cout => \Add1~122_cout\);

-- Location: LABCELL_X24_Y2_N9
\Add1~118\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~118_cout\ = CARRY(( mult16(3) ) + ( \acc_in[3]~input_o\ ) + ( \Add1~122_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_mult16(3),
	dataf => \ALT_INV_acc_in[3]~input_o\,
	cin => \Add1~122_cout\,
	cout => \Add1~118_cout\);

-- Location: LABCELL_X24_Y2_N12
\Add1~114\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~114_cout\ = CARRY(( mult16(4) ) + ( \acc_in[4]~input_o\ ) + ( \Add1~118_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[4]~input_o\,
	datac => ALT_INV_mult16(4),
	cin => \Add1~118_cout\,
	cout => \Add1~114_cout\);

-- Location: LABCELL_X24_Y2_N15
\Add1~110\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~110_cout\ = CARRY(( \acc_in[5]~input_o\ ) + ( mult16(5) ) + ( \Add1~114_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[5]~input_o\,
	dataf => ALT_INV_mult16(5),
	cin => \Add1~114_cout\,
	cout => \Add1~110_cout\);

-- Location: LABCELL_X24_Y2_N18
\Add1~106\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~106_cout\ = CARRY(( \acc_in[6]~input_o\ ) + ( mult16(6) ) + ( \Add1~110_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[6]~input_o\,
	dataf => ALT_INV_mult16(6),
	cin => \Add1~110_cout\,
	cout => \Add1~106_cout\);

-- Location: LABCELL_X24_Y2_N21
\Add1~102\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~102_cout\ = CARRY(( mult16(7) ) + ( \acc_in[7]~input_o\ ) + ( \Add1~106_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[7]~input_o\,
	datad => ALT_INV_mult16(7),
	cin => \Add1~106_cout\,
	cout => \Add1~102_cout\);

-- Location: LABCELL_X24_Y2_N24
\Add1~98\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~98_cout\ = CARRY(( mult16(8) ) + ( \acc_in[8]~input_o\ ) + ( \Add1~102_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult16(8),
	datac => \ALT_INV_acc_in[8]~input_o\,
	cin => \Add1~102_cout\,
	cout => \Add1~98_cout\);

-- Location: LABCELL_X24_Y2_N27
\Add1~94\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~94_cout\ = CARRY(( mult16(9) ) + ( \acc_in[9]~input_o\ ) + ( \Add1~98_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult16(9),
	datac => \ALT_INV_acc_in[9]~input_o\,
	cin => \Add1~98_cout\,
	cout => \Add1~94_cout\);

-- Location: LABCELL_X24_Y2_N30
\Add1~90\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~90_cout\ = CARRY(( \acc_in[10]~input_o\ ) + ( mult16(10) ) + ( \Add1~94_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_mult16(10),
	datad => \ALT_INV_acc_in[10]~input_o\,
	cin => \Add1~94_cout\,
	cout => \Add1~90_cout\);

-- Location: LABCELL_X24_Y2_N33
\Add1~86\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~86_cout\ = CARRY(( \acc_in[11]~input_o\ ) + ( mult16(11) ) + ( \Add1~90_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[11]~input_o\,
	dataf => ALT_INV_mult16(11),
	cin => \Add1~90_cout\,
	cout => \Add1~86_cout\);

-- Location: LABCELL_X24_Y2_N36
\Add1~82\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~82_cout\ = CARRY(( mult16(12) ) + ( \acc_in[12]~input_o\ ) + ( \Add1~86_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[12]~input_o\,
	datac => ALT_INV_mult16(12),
	cin => \Add1~86_cout\,
	cout => \Add1~82_cout\);

-- Location: LABCELL_X24_Y2_N39
\Add1~78\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~78_cout\ = CARRY(( mult16(13) ) + ( \acc_in[13]~input_o\ ) + ( \Add1~82_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[13]~input_o\,
	datac => ALT_INV_mult16(13),
	cin => \Add1~82_cout\,
	cout => \Add1~78_cout\);

-- Location: LABCELL_X24_Y2_N42
\Add1~74\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~74_cout\ = CARRY(( mult16(14) ) + ( \acc_in[14]~input_o\ ) + ( \Add1~78_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[14]~input_o\,
	datac => ALT_INV_mult16(14),
	cin => \Add1~78_cout\,
	cout => \Add1~74_cout\);

-- Location: LABCELL_X24_Y2_N45
\Add1~70\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~70_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[15]~input_o\ ) + ( \Add1~74_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[15]~input_o\,
	cin => \Add1~74_cout\,
	cout => \Add1~70_cout\);

-- Location: LABCELL_X24_Y2_N48
\Add1~66\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~66_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[16]~input_o\ ) + ( \Add1~70_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[16]~input_o\,
	cin => \Add1~70_cout\,
	cout => \Add1~66_cout\);

-- Location: LABCELL_X24_Y2_N51
\Add1~62\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~62_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[17]~input_o\ ) + ( \Add1~66_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_mult_ext(15),
	dataf => \ALT_INV_acc_in[17]~input_o\,
	cin => \Add1~66_cout\,
	cout => \Add1~62_cout\);

-- Location: LABCELL_X24_Y2_N54
\Add1~58\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~58_cout\ = CARRY(( \acc_in[18]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~62_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult_ext(15),
	datad => \ALT_INV_acc_in[18]~input_o\,
	cin => \Add1~62_cout\,
	cout => \Add1~58_cout\);

-- Location: LABCELL_X24_Y2_N57
\Add1~54\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~54_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[19]~input_o\ ) + ( \Add1~58_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[19]~input_o\,
	cin => \Add1~58_cout\,
	cout => \Add1~54_cout\);

-- Location: LABCELL_X24_Y1_N0
\Add1~50\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~50_cout\ = CARRY(( \acc_in[20]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~54_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[20]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add1~54_cout\,
	cout => \Add1~50_cout\);

-- Location: LABCELL_X24_Y1_N3
\Add1~46\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~46_cout\ = CARRY(( \acc_in[21]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~50_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[21]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add1~50_cout\,
	cout => \Add1~46_cout\);

-- Location: LABCELL_X24_Y1_N6
\Add1~42\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~42_cout\ = CARRY(( \acc_in[22]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~46_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[22]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add1~46_cout\,
	cout => \Add1~42_cout\);

-- Location: LABCELL_X24_Y1_N9
\Add1~38\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~38_cout\ = CARRY(( \acc_in[23]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~42_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[23]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add1~42_cout\,
	cout => \Add1~38_cout\);

-- Location: LABCELL_X24_Y1_N12
\Add1~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~34_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[24]~input_o\ ) + ( \Add1~38_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datab => \ALT_INV_acc_in[24]~input_o\,
	cin => \Add1~38_cout\,
	cout => \Add1~34_cout\);

-- Location: LABCELL_X24_Y1_N15
\Add1~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~30_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[25]~input_o\ ) + ( \Add1~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[25]~input_o\,
	cin => \Add1~34_cout\,
	cout => \Add1~30_cout\);

-- Location: LABCELL_X24_Y1_N18
\Add1~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~26_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[26]~input_o\ ) + ( \Add1~30_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datab => \ALT_INV_acc_in[26]~input_o\,
	cin => \Add1~30_cout\,
	cout => \Add1~26_cout\);

-- Location: LABCELL_X24_Y1_N21
\Add1~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~22_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[27]~input_o\ ) + ( \Add1~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	dataf => \ALT_INV_acc_in[27]~input_o\,
	cin => \Add1~26_cout\,
	cout => \Add1~22_cout\);

-- Location: LABCELL_X24_Y1_N24
\Add1~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~18_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[28]~input_o\ ) + ( \Add1~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[28]~input_o\,
	cin => \Add1~22_cout\,
	cout => \Add1~18_cout\);

-- Location: LABCELL_X24_Y1_N27
\Add1~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~14_cout\ = CARRY(( mult_ext(15) ) + ( \acc_in[29]~input_o\ ) + ( \Add1~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[29]~input_o\,
	cin => \Add1~18_cout\,
	cout => \Add1~14_cout\);

-- Location: LABCELL_X24_Y1_N30
\Add1~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~10_cout\ = CARRY(( \acc_in[30]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~14_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[30]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add1~14_cout\,
	cout => \Add1~10_cout\);

-- Location: LABCELL_X24_Y1_N33
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( \acc_in[31]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~10_cout\ ))
-- \Add1~2\ = CARRY(( \acc_in[31]~input_o\ ) + ( mult_ext(15) ) + ( \Add1~10_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[31]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add1~10_cout\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: LABCELL_X23_Y2_N0
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( mult16(0) ) + ( \acc_in[0]~input_o\ ) + ( !VCC ))
-- \Add0~2\ = CARRY(( mult16(0) ) + ( \acc_in[0]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult16(0),
	datac => \ALT_INV_acc_in[0]~input_o\,
	cin => GND,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: LABCELL_X24_Y1_N36
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !mult_ext(15) ) + ( \acc_in[31]~input_o\ ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datab => \ALT_INV_acc_in[31]~input_o\,
	cin => \Add1~2\,
	sumout => \Add1~5_sumout\);

-- Location: LABCELL_X22_Y2_N3
\acc_outs~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~0_combout\ = ( \Add1~5_sumout\ & ( (\Add0~1_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~1_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~0_combout\);

-- Location: IOIBUF_X26_Y0_N92
\rst_n~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: IOIBUF_X26_Y0_N58
\clr~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clr,
	o => \clr~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\en~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LABCELL_X24_Y1_N42
\acc_outs[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs[0]~1_combout\ = ( \en~input_o\ ) # ( !\en~input_o\ & ( \clr~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_clr~input_o\,
	dataf => \ALT_INV_en~input_o\,
	combout => \acc_outs[0]~1_combout\);

-- Location: FF_X22_Y2_N4
\acc_outs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~0_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(0));

-- Location: LABCELL_X23_Y2_N3
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( mult16(1) ) + ( \acc_in[1]~input_o\ ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( mult16(1) ) + ( \acc_in[1]~input_o\ ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[1]~input_o\,
	datac => ALT_INV_mult16(1),
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: LABCELL_X22_Y2_N6
\acc_outs~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~2_combout\ = ( \Add1~5_sumout\ & ( (\Add0~5_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~5_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~2_combout\);

-- Location: FF_X22_Y2_N7
\acc_outs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~2_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(1));

-- Location: LABCELL_X23_Y2_N6
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( mult16(2) ) + ( \acc_in[2]~input_o\ ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( mult16(2) ) + ( \acc_in[2]~input_o\ ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult16(2),
	datac => \ALT_INV_acc_in[2]~input_o\,
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X22_Y2_N42
\acc_outs~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~3_combout\ = ( \Add1~5_sumout\ & ( (\Add0~9_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~9_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~9_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~3_combout\);

-- Location: FF_X22_Y2_N43
\acc_outs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~3_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(2));

-- Location: LABCELL_X23_Y2_N9
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \acc_in[3]~input_o\ ) + ( mult16(3) ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( \acc_in[3]~input_o\ ) + ( mult16(3) ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[3]~input_o\,
	dataf => ALT_INV_mult16(3),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: LABCELL_X22_Y2_N9
\acc_outs~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~4_combout\ = ( \Add1~5_sumout\ & ( (\Add0~13_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~13_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~13_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~4_combout\);

-- Location: FF_X22_Y2_N10
\acc_outs[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~4_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(3));

-- Location: LABCELL_X23_Y2_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( mult16(4) ) + ( \acc_in[4]~input_o\ ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( mult16(4) ) + ( \acc_in[4]~input_o\ ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[4]~input_o\,
	datac => ALT_INV_mult16(4),
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: LABCELL_X22_Y2_N45
\acc_outs~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~5_combout\ = ( \Add1~5_sumout\ & ( (\Add0~17_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~17_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~17_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~5_combout\);

-- Location: FF_X22_Y2_N46
\acc_outs[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~5_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(4));

-- Location: LABCELL_X23_Y2_N15
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( mult16(5) ) + ( \acc_in[5]~input_o\ ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( mult16(5) ) + ( \acc_in[5]~input_o\ ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[5]~input_o\,
	datad => ALT_INV_mult16(5),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: LABCELL_X22_Y2_N18
\acc_outs~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~6_combout\ = ( \Add1~5_sumout\ & ( (\Add0~21_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~21_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~21_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~6_combout\);

-- Location: FF_X22_Y2_N19
\acc_outs[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~6_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(5));

-- Location: LABCELL_X23_Y2_N18
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \acc_in[6]~input_o\ ) + ( mult16(6) ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( \acc_in[6]~input_o\ ) + ( mult16(6) ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[6]~input_o\,
	dataf => ALT_INV_mult16(6),
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: LABCELL_X22_Y2_N21
\acc_outs~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~7_combout\ = ( \Add1~5_sumout\ & ( (\Add0~25_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~25_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~25_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~7_combout\);

-- Location: FF_X22_Y2_N23
\acc_outs[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~7_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(6));

-- Location: LABCELL_X23_Y2_N21
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( mult16(7) ) + ( \acc_in[7]~input_o\ ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( mult16(7) ) + ( \acc_in[7]~input_o\ ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult16(7),
	datac => \ALT_INV_acc_in[7]~input_o\,
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: LABCELL_X22_Y2_N0
\acc_outs~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~8_combout\ = ( \Add1~5_sumout\ & ( (\Add0~29_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~29_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~29_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~8_combout\);

-- Location: FF_X22_Y2_N2
\acc_outs[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~8_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(7));

-- Location: LABCELL_X23_Y2_N24
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( mult16(8) ) + ( \acc_in[8]~input_o\ ) + ( \Add0~30\ ))
-- \Add0~34\ = CARRY(( mult16(8) ) + ( \acc_in[8]~input_o\ ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_mult16(8),
	datac => \ALT_INV_acc_in[8]~input_o\,
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: LABCELL_X22_Y2_N24
\acc_outs~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~9_combout\ = ( \Add1~5_sumout\ & ( (\Add0~33_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~33_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add0~33_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~9_combout\);

-- Location: FF_X22_Y2_N25
\acc_outs[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~9_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(8));

-- Location: LABCELL_X23_Y2_N27
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( mult16(9) ) + ( \acc_in[9]~input_o\ ) + ( \Add0~34\ ))
-- \Add0~38\ = CARRY(( mult16(9) ) + ( \acc_in[9]~input_o\ ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[9]~input_o\,
	datac => ALT_INV_mult16(9),
	cin => \Add0~34\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: LABCELL_X22_Y2_N27
\acc_outs~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~10_combout\ = ( \Add1~5_sumout\ & ( (\Add0~37_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~37_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~37_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~10_combout\);

-- Location: FF_X22_Y2_N28
\acc_outs[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~10_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(9));

-- Location: LABCELL_X23_Y2_N30
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( \acc_in[10]~input_o\ ) + ( mult16(10) ) + ( \Add0~38\ ))
-- \Add0~42\ = CARRY(( \acc_in[10]~input_o\ ) + ( mult16(10) ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_mult16(10),
	datad => \ALT_INV_acc_in[10]~input_o\,
	cin => \Add0~38\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: LABCELL_X22_Y2_N30
\acc_outs~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~11_combout\ = ( \Add1~5_sumout\ & ( (\Add0~41_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~41_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~41_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~11_combout\);

-- Location: FF_X22_Y2_N32
\acc_outs[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~11_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(10));

-- Location: LABCELL_X23_Y2_N33
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( mult16(11) ) + ( \acc_in[11]~input_o\ ) + ( \Add0~42\ ))
-- \Add0~46\ = CARRY(( mult16(11) ) + ( \acc_in[11]~input_o\ ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[11]~input_o\,
	datac => ALT_INV_mult16(11),
	cin => \Add0~42\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: LABCELL_X22_Y2_N33
\acc_outs~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~12_combout\ = ( \Add0~45_sumout\ & ( (\Add1~1_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add0~45_sumout\ & ( (\Add1~5_sumout\ & \Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datab => \ALT_INV_Add1~1_sumout\,
	dataf => \ALT_INV_Add0~45_sumout\,
	combout => \acc_outs~12_combout\);

-- Location: FF_X22_Y2_N34
\acc_outs[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~12_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(11));

-- Location: LABCELL_X23_Y2_N36
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( \acc_in[12]~input_o\ ) + ( mult16(12) ) + ( \Add0~46\ ))
-- \Add0~50\ = CARRY(( \acc_in[12]~input_o\ ) + ( mult16(12) ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[12]~input_o\,
	dataf => ALT_INV_mult16(12),
	cin => \Add0~46\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: LABCELL_X22_Y2_N36
\acc_outs~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~13_combout\ = ( \Add1~5_sumout\ & ( (\Add0~49_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~49_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~49_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~13_combout\);

-- Location: FF_X22_Y2_N37
\acc_outs[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~13_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(12));

-- Location: LABCELL_X23_Y2_N39
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( mult16(13) ) + ( \acc_in[13]~input_o\ ) + ( \Add0~50\ ))
-- \Add0~54\ = CARRY(( mult16(13) ) + ( \acc_in[13]~input_o\ ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[13]~input_o\,
	datac => ALT_INV_mult16(13),
	cin => \Add0~50\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: LABCELL_X22_Y2_N39
\acc_outs~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~14_combout\ = ( \Add0~53_sumout\ & ( (\Add1~1_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add0~53_sumout\ & ( (\Add1~5_sumout\ & \Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datab => \ALT_INV_Add1~1_sumout\,
	dataf => \ALT_INV_Add0~53_sumout\,
	combout => \acc_outs~14_combout\);

-- Location: FF_X22_Y2_N40
\acc_outs[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~14_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(13));

-- Location: LABCELL_X23_Y2_N42
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( mult16(14) ) + ( \acc_in[14]~input_o\ ) + ( \Add0~54\ ))
-- \Add0~58\ = CARRY(( mult16(14) ) + ( \acc_in[14]~input_o\ ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[14]~input_o\,
	datac => ALT_INV_mult16(14),
	cin => \Add0~54\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: LABCELL_X22_Y2_N12
\acc_outs~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~15_combout\ = ( \Add1~5_sumout\ & ( (\Add0~57_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~57_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~57_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~15_combout\);

-- Location: FF_X22_Y2_N14
\acc_outs[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~15_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(14));

-- Location: LABCELL_X23_Y2_N45
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[15]~input_o\ ) + ( \Add0~58\ ))
-- \Add0~62\ = CARRY(( mult_ext(15) ) + ( \acc_in[15]~input_o\ ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[15]~input_o\,
	cin => \Add0~58\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: LABCELL_X22_Y2_N15
\acc_outs~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~16_combout\ = ( \Add0~61_sumout\ & ( (\Add1~1_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add0~61_sumout\ & ( (\Add1~5_sumout\ & \Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datab => \ALT_INV_Add1~1_sumout\,
	dataf => \ALT_INV_Add0~61_sumout\,
	combout => \acc_outs~16_combout\);

-- Location: FF_X22_Y2_N16
\acc_outs[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~16_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(15));

-- Location: LABCELL_X23_Y2_N48
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[16]~input_o\ ) + ( \Add0~62\ ))
-- \Add0~66\ = CARRY(( mult_ext(15) ) + ( \acc_in[16]~input_o\ ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datab => \ALT_INV_acc_in[16]~input_o\,
	cin => \Add0~62\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: LABCELL_X22_Y2_N48
\acc_outs~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~17_combout\ = ( \Add1~5_sumout\ & ( (\Add0~65_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~65_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~65_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~17_combout\);

-- Location: FF_X22_Y2_N49
\acc_outs[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~17_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(16));

-- Location: LABCELL_X23_Y2_N51
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[17]~input_o\ ) + ( \Add0~66\ ))
-- \Add0~70\ = CARRY(( mult_ext(15) ) + ( \acc_in[17]~input_o\ ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[17]~input_o\,
	cin => \Add0~66\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: LABCELL_X22_Y2_N51
\acc_outs~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~18_combout\ = ( \Add0~69_sumout\ & ( (\Add1~1_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add0~69_sumout\ & ( (\Add1~5_sumout\ & \Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datab => \ALT_INV_Add1~1_sumout\,
	dataf => \ALT_INV_Add0~69_sumout\,
	combout => \acc_outs~18_combout\);

-- Location: FF_X22_Y2_N52
\acc_outs[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~18_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(17));

-- Location: LABCELL_X23_Y2_N54
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[18]~input_o\ ) + ( \Add0~70\ ))
-- \Add0~74\ = CARRY(( mult_ext(15) ) + ( \acc_in[18]~input_o\ ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[18]~input_o\,
	datac => ALT_INV_mult_ext(15),
	cin => \Add0~70\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: LABCELL_X22_Y2_N54
\acc_outs~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~19_combout\ = ( \Add1~5_sumout\ & ( (\Add0~73_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~73_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datad => \ALT_INV_Add0~73_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~19_combout\);

-- Location: FF_X22_Y2_N55
\acc_outs[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~19_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(18));

-- Location: LABCELL_X23_Y2_N57
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[19]~input_o\ ) + ( \Add0~74\ ))
-- \Add0~78\ = CARRY(( mult_ext(15) ) + ( \acc_in[19]~input_o\ ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	dataf => \ALT_INV_acc_in[19]~input_o\,
	cin => \Add0~74\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: LABCELL_X22_Y2_N57
\acc_outs~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~20_combout\ = ( \Add1~5_sumout\ & ( (\Add0~77_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add1~5_sumout\ & ( (\Add1~1_sumout\ & \Add0~77_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~77_sumout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~20_combout\);

-- Location: FF_X22_Y2_N59
\acc_outs[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~20_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(19));

-- Location: LABCELL_X23_Y1_N0
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( \acc_in[20]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~78\ ))
-- \Add0~82\ = CARRY(( \acc_in[20]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[20]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~78\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: LABCELL_X23_Y1_N39
\acc_outs~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~21_combout\ = (!\Add1~1_sumout\ & (\Add1~5_sumout\ & \Add0~81_sumout\)) # (\Add1~1_sumout\ & ((\Add0~81_sumout\) # (\Add1~5_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101110111000100010111011100010001011101110001000101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	datad => \ALT_INV_Add0~81_sumout\,
	combout => \acc_outs~21_combout\);

-- Location: FF_X23_Y1_N40
\acc_outs[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~21_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(20));

-- Location: LABCELL_X23_Y1_N3
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \acc_in[21]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~82\ ))
-- \Add0~86\ = CARRY(( \acc_in[21]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[21]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~82\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: LABCELL_X24_Y1_N45
\acc_outs~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~22_combout\ = (!\Add1~1_sumout\ & (\Add0~85_sumout\ & \Add1~5_sumout\)) # (\Add1~1_sumout\ & ((\Add1~5_sumout\) # (\Add0~85_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101011111000001010101111100000101010111110000010101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_Add0~85_sumout\,
	datad => \ALT_INV_Add1~5_sumout\,
	combout => \acc_outs~22_combout\);

-- Location: FF_X24_Y1_N46
\acc_outs[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~22_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(21));

-- Location: LABCELL_X23_Y1_N6
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( \acc_in[22]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~86\ ))
-- \Add0~90\ = CARRY(( \acc_in[22]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[22]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~86\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: LABCELL_X23_Y1_N36
\acc_outs~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~23_combout\ = ( \Add0~89_sumout\ & ( (\Add1~5_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add0~89_sumout\ & ( (\Add1~1_sumout\ & \Add1~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	dataf => \ALT_INV_Add0~89_sumout\,
	combout => \acc_outs~23_combout\);

-- Location: FF_X23_Y1_N37
\acc_outs[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~23_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(22));

-- Location: LABCELL_X23_Y1_N9
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( \acc_in[23]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~90\ ))
-- \Add0~94\ = CARRY(( \acc_in[23]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[23]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~90\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: LABCELL_X23_Y1_N42
\acc_outs~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~24_combout\ = ( \Add0~93_sumout\ & ( (\Add1~5_sumout\) # (\Add1~1_sumout\) ) ) # ( !\Add0~93_sumout\ & ( (\Add1~1_sumout\ & \Add1~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	dataf => \ALT_INV_Add0~93_sumout\,
	combout => \acc_outs~24_combout\);

-- Location: FF_X23_Y1_N43
\acc_outs[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~24_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(23));

-- Location: LABCELL_X23_Y1_N12
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( \acc_in[24]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~94\ ))
-- \Add0~98\ = CARRY(( \acc_in[24]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[24]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~94\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: LABCELL_X23_Y1_N51
\acc_outs~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~25_combout\ = (!\Add1~1_sumout\ & (\Add1~5_sumout\ & \Add0~97_sumout\)) # (\Add1~1_sumout\ & ((\Add0~97_sumout\) # (\Add1~5_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add0~97_sumout\,
	combout => \acc_outs~25_combout\);

-- Location: FF_X23_Y1_N52
\acc_outs[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~25_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(24));

-- Location: LABCELL_X23_Y1_N15
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( \acc_in[25]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~98\ ))
-- \Add0~102\ = CARRY(( \acc_in[25]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[25]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~98\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\);

-- Location: LABCELL_X23_Y1_N45
\acc_outs~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~26_combout\ = (!\Add1~1_sumout\ & (\Add1~5_sumout\ & \Add0~101_sumout\)) # (\Add1~1_sumout\ & ((\Add0~101_sumout\) # (\Add1~5_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add0~101_sumout\,
	combout => \acc_outs~26_combout\);

-- Location: FF_X23_Y1_N46
\acc_outs[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~26_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(25));

-- Location: LABCELL_X23_Y1_N18
\Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~105_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[26]~input_o\ ) + ( \Add0~102\ ))
-- \Add0~106\ = CARRY(( mult_ext(15) ) + ( \acc_in[26]~input_o\ ) + ( \Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_acc_in[26]~input_o\,
	datac => ALT_INV_mult_ext(15),
	cin => \Add0~102\,
	sumout => \Add0~105_sumout\,
	cout => \Add0~106\);

-- Location: LABCELL_X24_Y1_N48
\acc_outs~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~27_combout\ = ( \Add0~105_sumout\ & ( (\Add1~1_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add0~105_sumout\ & ( (\Add1~5_sumout\ & \Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add1~1_sumout\,
	dataf => \ALT_INV_Add0~105_sumout\,
	combout => \acc_outs~27_combout\);

-- Location: FF_X24_Y1_N49
\acc_outs[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~27_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(26));

-- Location: LABCELL_X23_Y1_N21
\Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~109_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[27]~input_o\ ) + ( \Add0~106\ ))
-- \Add0~110\ = CARRY(( mult_ext(15) ) + ( \acc_in[27]~input_o\ ) + ( \Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[27]~input_o\,
	cin => \Add0~106\,
	sumout => \Add0~109_sumout\,
	cout => \Add0~110\);

-- Location: LABCELL_X23_Y1_N54
\acc_outs~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~28_combout\ = (!\Add1~1_sumout\ & (\Add1~5_sumout\ & \Add0~109_sumout\)) # (\Add1~1_sumout\ & ((\Add0~109_sumout\) # (\Add1~5_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add0~109_sumout\,
	combout => \acc_outs~28_combout\);

-- Location: FF_X23_Y1_N55
\acc_outs[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~28_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(27));

-- Location: LABCELL_X23_Y1_N24
\Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~113_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[28]~input_o\ ) + ( \Add0~110\ ))
-- \Add0~114\ = CARRY(( mult_ext(15) ) + ( \acc_in[28]~input_o\ ) + ( \Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[28]~input_o\,
	cin => \Add0~110\,
	sumout => \Add0~113_sumout\,
	cout => \Add0~114\);

-- Location: LABCELL_X24_Y1_N51
\acc_outs~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~29_combout\ = ( \Add1~1_sumout\ & ( (\Add0~113_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add1~1_sumout\ & ( (\Add1~5_sumout\ & \Add0~113_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add0~113_sumout\,
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \acc_outs~29_combout\);

-- Location: FF_X24_Y1_N52
\acc_outs[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~29_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(28));

-- Location: LABCELL_X23_Y1_N27
\Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~117_sumout\ = SUM(( mult_ext(15) ) + ( \acc_in[29]~input_o\ ) + ( \Add0~114\ ))
-- \Add0~118\ = CARRY(( mult_ext(15) ) + ( \acc_in[29]~input_o\ ) + ( \Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_mult_ext(15),
	datac => \ALT_INV_acc_in[29]~input_o\,
	cin => \Add0~114\,
	sumout => \Add0~117_sumout\,
	cout => \Add0~118\);

-- Location: LABCELL_X24_Y1_N54
\acc_outs~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~30_combout\ = ( \Add0~117_sumout\ & ( (\Add1~1_sumout\) # (\Add1~5_sumout\) ) ) # ( !\Add0~117_sumout\ & ( (\Add1~5_sumout\ & \Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010111110101111100000101000001010101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add1~1_sumout\,
	datae => \ALT_INV_Add0~117_sumout\,
	combout => \acc_outs~30_combout\);

-- Location: FF_X24_Y1_N55
\acc_outs[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~30_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(29));

-- Location: LABCELL_X23_Y1_N30
\Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~121_sumout\ = SUM(( \acc_in[30]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~118\ ))
-- \Add0~122\ = CARRY(( \acc_in[30]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_acc_in[30]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~118\,
	sumout => \Add0~121_sumout\,
	cout => \Add0~122\);

-- Location: LABCELL_X23_Y1_N57
\acc_outs~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~31_combout\ = (!\Add1~1_sumout\ & (\Add1~5_sumout\ & \Add0~121_sumout\)) # (\Add1~1_sumout\ & ((\Add0~121_sumout\) # (\Add1~5_sumout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add0~121_sumout\,
	combout => \acc_outs~31_combout\);

-- Location: FF_X23_Y1_N58
\acc_outs[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~31_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(30));

-- Location: LABCELL_X23_Y1_N33
\Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~125_sumout\ = SUM(( \acc_in[31]~input_o\ ) + ( mult_ext(15) ) + ( \Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_acc_in[31]~input_o\,
	dataf => ALT_INV_mult_ext(15),
	cin => \Add0~122\,
	sumout => \Add0~125_sumout\);

-- Location: LABCELL_X23_Y1_N48
\acc_outs~32\ : cyclonev_lcell_comb
-- Equation(s):
-- \acc_outs~32_combout\ = (!\Add1~1_sumout\ & ((!\Add1~5_sumout\) # (\Add0~125_sumout\))) # (\Add1~1_sumout\ & (!\Add1~5_sumout\ & \Add0~125_sumout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111010001110100011101000111010001110100011101000111010001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add0~125_sumout\,
	combout => \acc_outs~32_combout\);

-- Location: FF_X23_Y1_N49
\acc_outs[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \acc_outs~32_combout\,
	clrn => \rst_n~input_o\,
	sclr => \clr~input_o\,
	ena => \acc_outs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => acc_outs(31));

-- Location: LABCELL_X56_Y71_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


