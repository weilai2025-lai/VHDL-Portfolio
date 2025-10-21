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
-- Generated on "10/07/2025 11:31:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Sig_ROM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Sig_ROM_vhd_vec_tst IS
END Sig_ROM_vhd_vec_tst;
ARCHITECTURE Sig_ROM_arch OF Sig_ROM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL x : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT Sig_ROM
	PORT (
	clk : IN STD_LOGIC;
	output : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	x : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Sig_ROM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	output => output,
	x => x
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
-- x[4]
t_prcs_x_4: PROCESS
BEGIN
	x(4) <= '1';
	WAIT FOR 20000 ps;
	x(4) <= '0';
WAIT;
END PROCESS t_prcs_x_4;
-- x[3]
t_prcs_x_3: PROCESS
BEGIN
	x(3) <= '0';
	WAIT FOR 30000 ps;
	x(3) <= '1';
	WAIT FOR 30000 ps;
	x(3) <= '0';
WAIT;
END PROCESS t_prcs_x_3;
-- x[2]
t_prcs_x_2: PROCESS
BEGIN
	x(2) <= '0';
	WAIT FOR 30000 ps;
	x(2) <= '1';
	WAIT FOR 30000 ps;
	x(2) <= '0';
WAIT;
END PROCESS t_prcs_x_2;
-- x[1]
t_prcs_x_1: PROCESS
BEGIN
	x(1) <= '0';
	WAIT FOR 30000 ps;
	x(1) <= '1';
	WAIT FOR 30000 ps;
	x(1) <= '0';
WAIT;
END PROCESS t_prcs_x_1;
-- x[0]
t_prcs_x_0: PROCESS
BEGIN
	x(0) <= '0';
	WAIT FOR 30000 ps;
	x(0) <= '1';
	WAIT FOR 30000 ps;
	x(0) <= '0';
WAIT;
END PROCESS t_prcs_x_0;
END Sig_ROM_arch;
