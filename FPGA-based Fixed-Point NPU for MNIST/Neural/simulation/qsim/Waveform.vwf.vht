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
-- Generated on "10/04/2025 23:27:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Weight_Memory
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Weight_Memory_vhd_vec_tst IS
END Weight_Memory_vhd_vec_tst;
ARCHITECTURE Weight_Memory_arch OF Weight_Memory_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL radd : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL ren : STD_LOGIC;
SIGNAL wadd : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL wen : STD_LOGIC;
SIGNAL win : STD_LOGIC_VECTOR(30 DOWNTO 0);
SIGNAL wout : STD_LOGIC_VECTOR(30 DOWNTO 0);
COMPONENT Weight_Memory
	PORT (
	clk : IN STD_LOGIC;
	radd : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	ren : IN STD_LOGIC;
	wadd : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	wen : IN STD_LOGIC;
	win : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
	wout : OUT STD_LOGIC_VECTOR(30 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Weight_Memory
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	radd => radd,
	ren => ren,
	wadd => wadd,
	wen => wen,
	win => win,
	wout => wout
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- radd[9]
t_prcs_radd_9: PROCESS
BEGIN
	radd(9) <= '0';
WAIT;
END PROCESS t_prcs_radd_9;
-- radd[8]
t_prcs_radd_8: PROCESS
BEGIN
	radd(8) <= '0';
WAIT;
END PROCESS t_prcs_radd_8;
-- radd[7]
t_prcs_radd_7: PROCESS
BEGIN
	radd(7) <= '0';
WAIT;
END PROCESS t_prcs_radd_7;
-- radd[6]
t_prcs_radd_6: PROCESS
BEGIN
	radd(6) <= '0';
WAIT;
END PROCESS t_prcs_radd_6;
-- radd[5]
t_prcs_radd_5: PROCESS
BEGIN
	radd(5) <= '0';
WAIT;
END PROCESS t_prcs_radd_5;
-- radd[4]
t_prcs_radd_4: PROCESS
BEGIN
	radd(4) <= '0';
WAIT;
END PROCESS t_prcs_radd_4;
-- radd[3]
t_prcs_radd_3: PROCESS
BEGIN
	radd(3) <= '0';
WAIT;
END PROCESS t_prcs_radd_3;
-- radd[2]
t_prcs_radd_2: PROCESS
BEGIN
	radd(2) <= '0';
WAIT;
END PROCESS t_prcs_radd_2;
-- radd[1]
t_prcs_radd_1: PROCESS
BEGIN
	radd(1) <= '0';
WAIT;
END PROCESS t_prcs_radd_1;
-- radd[0]
t_prcs_radd_0: PROCESS
BEGIN
	radd(0) <= '0';
WAIT;
END PROCESS t_prcs_radd_0;

-- ren
t_prcs_ren: PROCESS
BEGIN
	ren <= '0';
WAIT;
END PROCESS t_prcs_ren;
-- wadd[9]
t_prcs_wadd_9: PROCESS
BEGIN
	wadd(9) <= '0';
WAIT;
END PROCESS t_prcs_wadd_9;
-- wadd[8]
t_prcs_wadd_8: PROCESS
BEGIN
	wadd(8) <= '0';
WAIT;
END PROCESS t_prcs_wadd_8;
-- wadd[7]
t_prcs_wadd_7: PROCESS
BEGIN
	wadd(7) <= '0';
WAIT;
END PROCESS t_prcs_wadd_7;
-- wadd[6]
t_prcs_wadd_6: PROCESS
BEGIN
	wadd(6) <= '0';
WAIT;
END PROCESS t_prcs_wadd_6;
-- wadd[5]
t_prcs_wadd_5: PROCESS
BEGIN
	wadd(5) <= '0';
WAIT;
END PROCESS t_prcs_wadd_5;
-- wadd[4]
t_prcs_wadd_4: PROCESS
BEGIN
	wadd(4) <= '0';
WAIT;
END PROCESS t_prcs_wadd_4;
-- wadd[3]
t_prcs_wadd_3: PROCESS
BEGIN
	wadd(3) <= '0';
WAIT;
END PROCESS t_prcs_wadd_3;
-- wadd[2]
t_prcs_wadd_2: PROCESS
BEGIN
	wadd(2) <= '0';
WAIT;
END PROCESS t_prcs_wadd_2;
-- wadd[1]
t_prcs_wadd_1: PROCESS
BEGIN
	wadd(1) <= '0';
WAIT;
END PROCESS t_prcs_wadd_1;
-- wadd[0]
t_prcs_wadd_0: PROCESS
BEGIN
	wadd(0) <= '0';
WAIT;
END PROCESS t_prcs_wadd_0;

-- wen
t_prcs_wen: PROCESS
BEGIN
	wen <= '0';
WAIT;
END PROCESS t_prcs_wen;
-- win[30]
t_prcs_win_30: PROCESS
BEGIN
	win(30) <= '0';
WAIT;
END PROCESS t_prcs_win_30;
-- win[29]
t_prcs_win_29: PROCESS
BEGIN
	win(29) <= '0';
WAIT;
END PROCESS t_prcs_win_29;
-- win[28]
t_prcs_win_28: PROCESS
BEGIN
	win(28) <= '0';
WAIT;
END PROCESS t_prcs_win_28;
-- win[27]
t_prcs_win_27: PROCESS
BEGIN
	win(27) <= '0';
WAIT;
END PROCESS t_prcs_win_27;
-- win[26]
t_prcs_win_26: PROCESS
BEGIN
	win(26) <= '0';
WAIT;
END PROCESS t_prcs_win_26;
-- win[25]
t_prcs_win_25: PROCESS
BEGIN
	win(25) <= '0';
WAIT;
END PROCESS t_prcs_win_25;
-- win[24]
t_prcs_win_24: PROCESS
BEGIN
	win(24) <= '0';
WAIT;
END PROCESS t_prcs_win_24;
-- win[23]
t_prcs_win_23: PROCESS
BEGIN
	win(23) <= '0';
WAIT;
END PROCESS t_prcs_win_23;
-- win[22]
t_prcs_win_22: PROCESS
BEGIN
	win(22) <= '0';
WAIT;
END PROCESS t_prcs_win_22;
-- win[21]
t_prcs_win_21: PROCESS
BEGIN
	win(21) <= '0';
WAIT;
END PROCESS t_prcs_win_21;
-- win[20]
t_prcs_win_20: PROCESS
BEGIN
	win(20) <= '0';
WAIT;
END PROCESS t_prcs_win_20;
-- win[19]
t_prcs_win_19: PROCESS
BEGIN
	win(19) <= '0';
WAIT;
END PROCESS t_prcs_win_19;
-- win[18]
t_prcs_win_18: PROCESS
BEGIN
	win(18) <= '0';
WAIT;
END PROCESS t_prcs_win_18;
-- win[17]
t_prcs_win_17: PROCESS
BEGIN
	win(17) <= '0';
WAIT;
END PROCESS t_prcs_win_17;
-- win[16]
t_prcs_win_16: PROCESS
BEGIN
	win(16) <= '0';
WAIT;
END PROCESS t_prcs_win_16;
-- win[15]
t_prcs_win_15: PROCESS
BEGIN
	win(15) <= '0';
WAIT;
END PROCESS t_prcs_win_15;
-- win[14]
t_prcs_win_14: PROCESS
BEGIN
	win(14) <= '0';
WAIT;
END PROCESS t_prcs_win_14;
-- win[13]
t_prcs_win_13: PROCESS
BEGIN
	win(13) <= '0';
WAIT;
END PROCESS t_prcs_win_13;
-- win[12]
t_prcs_win_12: PROCESS
BEGIN
	win(12) <= '0';
WAIT;
END PROCESS t_prcs_win_12;
-- win[11]
t_prcs_win_11: PROCESS
BEGIN
	win(11) <= '0';
WAIT;
END PROCESS t_prcs_win_11;
-- win[10]
t_prcs_win_10: PROCESS
BEGIN
	win(10) <= '0';
WAIT;
END PROCESS t_prcs_win_10;
-- win[9]
t_prcs_win_9: PROCESS
BEGIN
	win(9) <= '0';
WAIT;
END PROCESS t_prcs_win_9;
-- win[8]
t_prcs_win_8: PROCESS
BEGIN
	win(8) <= '0';
WAIT;
END PROCESS t_prcs_win_8;
-- win[7]
t_prcs_win_7: PROCESS
BEGIN
	win(7) <= '0';
WAIT;
END PROCESS t_prcs_win_7;
-- win[6]
t_prcs_win_6: PROCESS
BEGIN
	win(6) <= '0';
WAIT;
END PROCESS t_prcs_win_6;
-- win[5]
t_prcs_win_5: PROCESS
BEGIN
	win(5) <= '0';
WAIT;
END PROCESS t_prcs_win_5;
-- win[4]
t_prcs_win_4: PROCESS
BEGIN
	win(4) <= '0';
WAIT;
END PROCESS t_prcs_win_4;
-- win[3]
t_prcs_win_3: PROCESS
BEGIN
	win(3) <= '0';
WAIT;
END PROCESS t_prcs_win_3;
-- win[2]
t_prcs_win_2: PROCESS
BEGIN
	win(2) <= '0';
WAIT;
END PROCESS t_prcs_win_2;
-- win[1]
t_prcs_win_1: PROCESS
BEGIN
	win(1) <= '0';
WAIT;
END PROCESS t_prcs_win_1;
-- win[0]
t_prcs_win_0: PROCESS
BEGIN
	win(0) <= '0';
WAIT;
END PROCESS t_prcs_win_0;
END Weight_Memory_arch;
