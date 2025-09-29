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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "09/25/2025 22:31:39"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          mac_int8
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mac_int8_vhd_vec_tst IS
END mac_int8_vhd_vec_tst;
ARCHITECTURE mac_int8_arch OF mac_int8_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL acc_in : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL acc_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL en : STD_LOGIC;
SIGNAL rst_n : STD_LOGIC;
COMPONENT mac_int8
	PORT (
	a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	acc_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	acc_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	en : IN STD_LOGIC;
	rst_n : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mac_int8
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	acc_in => acc_in,
	acc_out => acc_out,
	b => b,
	clk => clk,
	en => en,
	rst_n => rst_n
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- a[7]
t_prcs_a_7: PROCESS
BEGIN
	a(7) <= '0';
WAIT;
END PROCESS t_prcs_a_7;
-- a[6]
t_prcs_a_6: PROCESS
BEGIN
	a(6) <= '0';
WAIT;
END PROCESS t_prcs_a_6;
-- a[5]
t_prcs_a_5: PROCESS
BEGIN
	a(5) <= '0';
	WAIT FOR 70000 ps;
	a(5) <= '1';
	WAIT FOR 30000 ps;
	a(5) <= '0';
WAIT;
END PROCESS t_prcs_a_5;
-- a[4]
t_prcs_a_4: PROCESS
BEGIN
	a(4) <= '0';
	WAIT FOR 70000 ps;
	a(4) <= '1';
	WAIT FOR 30000 ps;
	a(4) <= '0';
WAIT;
END PROCESS t_prcs_a_4;
-- a[3]
t_prcs_a_3: PROCESS
BEGIN
	a(3) <= '0';
WAIT;
END PROCESS t_prcs_a_3;
-- a[2]
t_prcs_a_2: PROCESS
BEGIN
	a(2) <= '0';
WAIT;
END PROCESS t_prcs_a_2;
-- a[1]
t_prcs_a_1: PROCESS
BEGIN
	a(1) <= '0';
WAIT;
END PROCESS t_prcs_a_1;
-- a[0]
t_prcs_a_0: PROCESS
BEGIN
	a(0) <= '0';
WAIT;
END PROCESS t_prcs_a_0;
-- b[7]
t_prcs_b_7: PROCESS
BEGIN
	b(7) <= '0';
WAIT;
END PROCESS t_prcs_b_7;
-- b[6]
t_prcs_b_6: PROCESS
BEGIN
	b(6) <= '0';
WAIT;
END PROCESS t_prcs_b_6;
-- b[5]
t_prcs_b_5: PROCESS
BEGIN
	b(5) <= '0';
WAIT;
END PROCESS t_prcs_b_5;
-- b[4]
t_prcs_b_4: PROCESS
BEGIN
	b(4) <= '0';
WAIT;
END PROCESS t_prcs_b_4;
-- b[3]
t_prcs_b_3: PROCESS
BEGIN
	b(3) <= '0';
	WAIT FOR 70000 ps;
	b(3) <= '1';
	WAIT FOR 30000 ps;
	b(3) <= '0';
WAIT;
END PROCESS t_prcs_b_3;
-- b[2]
t_prcs_b_2: PROCESS
BEGIN
	b(2) <= '0';
	WAIT FOR 70000 ps;
	b(2) <= '1';
	WAIT FOR 30000 ps;
	b(2) <= '0';
WAIT;
END PROCESS t_prcs_b_2;
-- b[1]
t_prcs_b_1: PROCESS
BEGIN
	b(1) <= '0';
	WAIT FOR 70000 ps;
	b(1) <= '1';
	WAIT FOR 30000 ps;
	b(1) <= '0';
WAIT;
END PROCESS t_prcs_b_1;
-- b[0]
t_prcs_b_0: PROCESS
BEGIN
	b(0) <= '0';
WAIT;
END PROCESS t_prcs_b_0;

-- en
t_prcs_en: PROCESS
BEGIN
	en <= '1';
WAIT;
END PROCESS t_prcs_en;

-- rst_n
t_prcs_rst_n: PROCESS
BEGIN
	rst_n <= '0';
	WAIT FOR 40000 ps;
	rst_n <= '1';
WAIT;
END PROCESS t_prcs_rst_n;
-- acc_in[31]
t_prcs_acc_in_31: PROCESS
BEGIN
	acc_in(31) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_31;
-- acc_in[30]
t_prcs_acc_in_30: PROCESS
BEGIN
	acc_in(30) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_30;
-- acc_in[29]
t_prcs_acc_in_29: PROCESS
BEGIN
	acc_in(29) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_29;
-- acc_in[28]
t_prcs_acc_in_28: PROCESS
BEGIN
	acc_in(28) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_28;
-- acc_in[27]
t_prcs_acc_in_27: PROCESS
BEGIN
	acc_in(27) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_27;
-- acc_in[26]
t_prcs_acc_in_26: PROCESS
BEGIN
	acc_in(26) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_26;
-- acc_in[25]
t_prcs_acc_in_25: PROCESS
BEGIN
	acc_in(25) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_25;
-- acc_in[24]
t_prcs_acc_in_24: PROCESS
BEGIN
	acc_in(24) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_24;
-- acc_in[23]
t_prcs_acc_in_23: PROCESS
BEGIN
	acc_in(23) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_23;
-- acc_in[22]
t_prcs_acc_in_22: PROCESS
BEGIN
	acc_in(22) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_22;
-- acc_in[21]
t_prcs_acc_in_21: PROCESS
BEGIN
	acc_in(21) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_21;
-- acc_in[20]
t_prcs_acc_in_20: PROCESS
BEGIN
	acc_in(20) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_20;
-- acc_in[19]
t_prcs_acc_in_19: PROCESS
BEGIN
	acc_in(19) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_19;
-- acc_in[18]
t_prcs_acc_in_18: PROCESS
BEGIN
	acc_in(18) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_18;
-- acc_in[17]
t_prcs_acc_in_17: PROCESS
BEGIN
	acc_in(17) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_17;
-- acc_in[16]
t_prcs_acc_in_16: PROCESS
BEGIN
	acc_in(16) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_16;
-- acc_in[15]
t_prcs_acc_in_15: PROCESS
BEGIN
	acc_in(15) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_15;
-- acc_in[14]
t_prcs_acc_in_14: PROCESS
BEGIN
	acc_in(14) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_14;
-- acc_in[13]
t_prcs_acc_in_13: PROCESS
BEGIN
	acc_in(13) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_13;
-- acc_in[12]
t_prcs_acc_in_12: PROCESS
BEGIN
	acc_in(12) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_12;
-- acc_in[11]
t_prcs_acc_in_11: PROCESS
BEGIN
	acc_in(11) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_11;
-- acc_in[10]
t_prcs_acc_in_10: PROCESS
BEGIN
	acc_in(10) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_10;
-- acc_in[9]
t_prcs_acc_in_9: PROCESS
BEGIN
	acc_in(9) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_9;
-- acc_in[8]
t_prcs_acc_in_8: PROCESS
BEGIN
	acc_in(8) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_8;
-- acc_in[7]
t_prcs_acc_in_7: PROCESS
BEGIN
	acc_in(7) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_7;
-- acc_in[6]
t_prcs_acc_in_6: PROCESS
BEGIN
	acc_in(6) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_6;
-- acc_in[5]
t_prcs_acc_in_5: PROCESS
BEGIN
	acc_in(5) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_5;
-- acc_in[4]
t_prcs_acc_in_4: PROCESS
BEGIN
	acc_in(4) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_4;
-- acc_in[3]
t_prcs_acc_in_3: PROCESS
BEGIN
	acc_in(3) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_3;
-- acc_in[2]
t_prcs_acc_in_2: PROCESS
BEGIN
	acc_in(2) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_2;
-- acc_in[1]
t_prcs_acc_in_1: PROCESS
BEGIN
	acc_in(1) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_1;
-- acc_in[0]
t_prcs_acc_in_0: PROCESS
BEGIN
	acc_in(0) <= '0';
WAIT;
END PROCESS t_prcs_acc_in_0;
END mac_int8_arch;
