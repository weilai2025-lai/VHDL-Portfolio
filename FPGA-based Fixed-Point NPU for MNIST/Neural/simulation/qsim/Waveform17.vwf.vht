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
-- Generated on "10/05/2025 22:41:00"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          test
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY test_vhd_vec_tst IS
END test_vhd_vec_tst;
ARCHITECTURE test_arch OF test_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL multi : STD_LOGIC;
SIGNAL myinputValid : STD_LOGIC;
SIGNAL r_addr_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ren_out : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL wout : STD_LOGIC;
SIGNAL xx : STD_LOGIC;
COMPONENT test
	PORT (
	a : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	multi : BUFFER STD_LOGIC;
	myinputValid : IN STD_LOGIC;
	r_addr_out : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	ren_out : BUFFER STD_LOGIC;
	rst : IN STD_LOGIC;
	wout : BUFFER STD_LOGIC;
	xx : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : test
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	clk => clk,
	multi => multi,
	myinputValid => myinputValid,
	r_addr_out => r_addr_out,
	ren_out => ren_out,
	rst => rst,
	wout => wout,
	xx => xx
	);

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;

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

-- a
t_prcs_a: PROCESS
BEGIN
	a <= '1';
WAIT;
END PROCESS t_prcs_a;

-- myinputValid
t_prcs_myinputValid: PROCESS
BEGIN
	myinputValid <= '1';
	WAIT FOR 10000 ps;
	myinputValid <= '0';
WAIT;
END PROCESS t_prcs_myinputValid;
END test_arch;
