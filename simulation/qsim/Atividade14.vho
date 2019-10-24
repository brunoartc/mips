-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "10/24/2019 19:36:46"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ULA IS
    PORT (
	a : IN std_logic_vector(7 DOWNTO 0);
	b : IN std_logic_vector(7 DOWNTO 0);
	func_ula : IN std_logic_vector(5 DOWNTO 0);
	result : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ULA;

ARCHITECTURE structure OF ULA IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_func_ula : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_result : std_logic_vector(7 DOWNTO 0);
SIGNAL \result[0]~output_o\ : std_logic;
SIGNAL \result[1]~output_o\ : std_logic;
SIGNAL \result[2]~output_o\ : std_logic;
SIGNAL \result[3]~output_o\ : std_logic;
SIGNAL \result[4]~output_o\ : std_logic;
SIGNAL \result[5]~output_o\ : std_logic;
SIGNAL \result[6]~output_o\ : std_logic;
SIGNAL \result[7]~output_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \func_ula[4]~input_o\ : std_logic;
SIGNAL \func_ula[0]~input_o\ : std_logic;
SIGNAL \func_ula[1]~input_o\ : std_logic;
SIGNAL \func_ula[2]~input_o\ : std_logic;
SIGNAL \func_ula[3]~input_o\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \func_ula[5]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~0_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[0]~1_cout\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[1]~2_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~1_combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[1]~3\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[2]~4_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~2_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[2]~5\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[3]~6_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~3_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[3]~7\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[4]~8_combout\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~4_combout\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[4]~9\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[5]~10_combout\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~5_combout\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[5]~11\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[6]~12_combout\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~6_combout\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[6]~13\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[7]~14_combout\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|_~7_combout\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[7]~15\ : std_logic;
SIGNAL \Add1|auto_generated|result_int[8]~16_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_func_ula <= func_ula;
result <= ww_result;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\result[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[1]~2_combout\,
	devoe => ww_devoe,
	o => \result[0]~output_o\);

\result[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[2]~4_combout\,
	devoe => ww_devoe,
	o => \result[1]~output_o\);

\result[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[3]~6_combout\,
	devoe => ww_devoe,
	o => \result[2]~output_o\);

\result[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[4]~8_combout\,
	devoe => ww_devoe,
	o => \result[3]~output_o\);

\result[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[5]~10_combout\,
	devoe => ww_devoe,
	o => \result[4]~output_o\);

\result[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[6]~12_combout\,
	devoe => ww_devoe,
	o => \result[5]~output_o\);

\result[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[7]~14_combout\,
	devoe => ww_devoe,
	o => \result[6]~output_o\);

\result[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1|auto_generated|result_int[8]~16_combout\,
	devoe => ww_devoe,
	o => \result[7]~output_o\);

\b[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

\func_ula[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func_ula(4),
	o => \func_ula[4]~input_o\);

\func_ula[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func_ula(0),
	o => \func_ula[0]~input_o\);

\func_ula[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func_ula(1),
	o => \func_ula[1]~input_o\);

\func_ula[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func_ula(2),
	o => \func_ula[2]~input_o\);

\func_ula[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func_ula(3),
	o => \func_ula[3]~input_o\);

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\func_ula[0]~input_o\ & (!\func_ula[1]~input_o\ & (!\func_ula[2]~input_o\ & !\func_ula[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_ula[0]~input_o\,
	datab => \func_ula[1]~input_o\,
	datac => \func_ula[2]~input_o\,
	datad => \func_ula[3]~input_o\,
	combout => \Equal0~0_combout\);

\func_ula[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func_ula(5),
	o => \func_ula[5]~input_o\);

\Add1|auto_generated|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~0_combout\ = \b[0]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~0_combout\);

\a[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Equal0~0_combout\ & (\func_ula[5]~input_o\ & !\func_ula[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \func_ula[5]~input_o\,
	datad => \func_ula[4]~input_o\,
	combout => \Equal0~1_combout\);

\Add1|auto_generated|result_int[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[0]~1_cout\ = CARRY(!\Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datad => VCC,
	cout => \Add1|auto_generated|result_int[0]~1_cout\);

\Add1|auto_generated|result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[1]~2_combout\ = (\Add1|auto_generated|_~0_combout\ & ((\a[0]~input_o\ & (!\Add1|auto_generated|result_int[0]~1_cout\)) # (!\a[0]~input_o\ & ((\Add1|auto_generated|result_int[0]~1_cout\) # (GND))))) # 
-- (!\Add1|auto_generated|_~0_combout\ & ((\a[0]~input_o\ & (\Add1|auto_generated|result_int[0]~1_cout\ & VCC)) # (!\a[0]~input_o\ & (!\Add1|auto_generated|result_int[0]~1_cout\))))
-- \Add1|auto_generated|result_int[1]~3\ = CARRY((\Add1|auto_generated|_~0_combout\ & ((!\Add1|auto_generated|result_int[0]~1_cout\) # (!\a[0]~input_o\))) # (!\Add1|auto_generated|_~0_combout\ & (!\a[0]~input_o\ & 
-- !\Add1|auto_generated|result_int[0]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~0_combout\,
	datab => \a[0]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[0]~1_cout\,
	combout => \Add1|auto_generated|result_int[1]~2_combout\,
	cout => \Add1|auto_generated|result_int[1]~3\);

\b[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

\Add1|auto_generated|_~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~1_combout\ = \b[1]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~1_combout\);

\a[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

\Add1|auto_generated|result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[2]~4_combout\ = ((\Add1|auto_generated|_~1_combout\ $ (\a[1]~input_o\ $ (\Add1|auto_generated|result_int[1]~3\)))) # (GND)
-- \Add1|auto_generated|result_int[2]~5\ = CARRY((\Add1|auto_generated|_~1_combout\ & (\a[1]~input_o\ & !\Add1|auto_generated|result_int[1]~3\)) # (!\Add1|auto_generated|_~1_combout\ & ((\a[1]~input_o\) # (!\Add1|auto_generated|result_int[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~1_combout\,
	datab => \a[1]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[1]~3\,
	combout => \Add1|auto_generated|result_int[2]~4_combout\,
	cout => \Add1|auto_generated|result_int[2]~5\);

\b[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

\Add1|auto_generated|_~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~2_combout\ = \b[2]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~2_combout\);

\a[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

\Add1|auto_generated|result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[3]~6_combout\ = (\Add1|auto_generated|_~2_combout\ & ((\a[2]~input_o\ & (!\Add1|auto_generated|result_int[2]~5\)) # (!\a[2]~input_o\ & ((\Add1|auto_generated|result_int[2]~5\) # (GND))))) # 
-- (!\Add1|auto_generated|_~2_combout\ & ((\a[2]~input_o\ & (\Add1|auto_generated|result_int[2]~5\ & VCC)) # (!\a[2]~input_o\ & (!\Add1|auto_generated|result_int[2]~5\))))
-- \Add1|auto_generated|result_int[3]~7\ = CARRY((\Add1|auto_generated|_~2_combout\ & ((!\Add1|auto_generated|result_int[2]~5\) # (!\a[2]~input_o\))) # (!\Add1|auto_generated|_~2_combout\ & (!\a[2]~input_o\ & !\Add1|auto_generated|result_int[2]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~2_combout\,
	datab => \a[2]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[2]~5\,
	combout => \Add1|auto_generated|result_int[3]~6_combout\,
	cout => \Add1|auto_generated|result_int[3]~7\);

\b[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

\Add1|auto_generated|_~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~3_combout\ = \b[3]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~3_combout\);

\a[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

\Add1|auto_generated|result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[4]~8_combout\ = ((\Add1|auto_generated|_~3_combout\ $ (\a[3]~input_o\ $ (\Add1|auto_generated|result_int[3]~7\)))) # (GND)
-- \Add1|auto_generated|result_int[4]~9\ = CARRY((\Add1|auto_generated|_~3_combout\ & (\a[3]~input_o\ & !\Add1|auto_generated|result_int[3]~7\)) # (!\Add1|auto_generated|_~3_combout\ & ((\a[3]~input_o\) # (!\Add1|auto_generated|result_int[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~3_combout\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[3]~7\,
	combout => \Add1|auto_generated|result_int[4]~8_combout\,
	cout => \Add1|auto_generated|result_int[4]~9\);

\b[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

\Add1|auto_generated|_~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~4_combout\ = \b[4]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~4_combout\);

\a[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

\Add1|auto_generated|result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[5]~10_combout\ = (\Add1|auto_generated|_~4_combout\ & ((\a[4]~input_o\ & (!\Add1|auto_generated|result_int[4]~9\)) # (!\a[4]~input_o\ & ((\Add1|auto_generated|result_int[4]~9\) # (GND))))) # 
-- (!\Add1|auto_generated|_~4_combout\ & ((\a[4]~input_o\ & (\Add1|auto_generated|result_int[4]~9\ & VCC)) # (!\a[4]~input_o\ & (!\Add1|auto_generated|result_int[4]~9\))))
-- \Add1|auto_generated|result_int[5]~11\ = CARRY((\Add1|auto_generated|_~4_combout\ & ((!\Add1|auto_generated|result_int[4]~9\) # (!\a[4]~input_o\))) # (!\Add1|auto_generated|_~4_combout\ & (!\a[4]~input_o\ & !\Add1|auto_generated|result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~4_combout\,
	datab => \a[4]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[4]~9\,
	combout => \Add1|auto_generated|result_int[5]~10_combout\,
	cout => \Add1|auto_generated|result_int[5]~11\);

\b[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

\Add1|auto_generated|_~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~5_combout\ = \b[5]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[5]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~5_combout\);

\a[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

\Add1|auto_generated|result_int[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[6]~12_combout\ = ((\Add1|auto_generated|_~5_combout\ $ (\a[5]~input_o\ $ (\Add1|auto_generated|result_int[5]~11\)))) # (GND)
-- \Add1|auto_generated|result_int[6]~13\ = CARRY((\Add1|auto_generated|_~5_combout\ & (\a[5]~input_o\ & !\Add1|auto_generated|result_int[5]~11\)) # (!\Add1|auto_generated|_~5_combout\ & ((\a[5]~input_o\) # (!\Add1|auto_generated|result_int[5]~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~5_combout\,
	datab => \a[5]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[5]~11\,
	combout => \Add1|auto_generated|result_int[6]~12_combout\,
	cout => \Add1|auto_generated|result_int[6]~13\);

\b[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

\Add1|auto_generated|_~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~6_combout\ = \b[6]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[6]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~6_combout\);

\a[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

\Add1|auto_generated|result_int[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[7]~14_combout\ = (\Add1|auto_generated|_~6_combout\ & ((\a[6]~input_o\ & (!\Add1|auto_generated|result_int[6]~13\)) # (!\a[6]~input_o\ & ((\Add1|auto_generated|result_int[6]~13\) # (GND))))) # 
-- (!\Add1|auto_generated|_~6_combout\ & ((\a[6]~input_o\ & (\Add1|auto_generated|result_int[6]~13\ & VCC)) # (!\a[6]~input_o\ & (!\Add1|auto_generated|result_int[6]~13\))))
-- \Add1|auto_generated|result_int[7]~15\ = CARRY((\Add1|auto_generated|_~6_combout\ & ((!\Add1|auto_generated|result_int[6]~13\) # (!\a[6]~input_o\))) # (!\Add1|auto_generated|_~6_combout\ & (!\a[6]~input_o\ & !\Add1|auto_generated|result_int[6]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~6_combout\,
	datab => \a[6]~input_o\,
	datad => VCC,
	cin => \Add1|auto_generated|result_int[6]~13\,
	combout => \Add1|auto_generated|result_int[7]~14_combout\,
	cout => \Add1|auto_generated|result_int[7]~15\);

\b[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

\Add1|auto_generated|_~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|_~7_combout\ = \b[7]~input_o\ $ (((!\func_ula[4]~input_o\ & (\Equal0~0_combout\ & \func_ula[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \func_ula[4]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \func_ula[5]~input_o\,
	combout => \Add1|auto_generated|_~7_combout\);

\a[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

\Add1|auto_generated|result_int[8]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1|auto_generated|result_int[8]~16_combout\ = \Add1|auto_generated|_~7_combout\ $ (\a[7]~input_o\ $ (\Add1|auto_generated|result_int[7]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1|auto_generated|_~7_combout\,
	datab => \a[7]~input_o\,
	cin => \Add1|auto_generated|result_int[7]~15\,
	combout => \Add1|auto_generated|result_int[8]~16_combout\);

ww_result(0) <= \result[0]~output_o\;

ww_result(1) <= \result[1]~output_o\;

ww_result(2) <= \result[2]~output_o\;

ww_result(3) <= \result[3]~output_o\;

ww_result(4) <= \result[4]~output_o\;

ww_result(5) <= \result[5]~output_o\;

ww_result(6) <= \result[6]~output_o\;

ww_result(7) <= \result[7]~output_o\;
END structure;


