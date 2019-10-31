-- Quartus Prime VHDL Template
-- Single port RAM with single read/write address 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is

	generic 
	(
		addrWidth : natural := 32;
		dataWidth : natural := 32
	);

	port 
	(
	opcode : in std_logic_vector(5 downto 0);
	pc_enable, escreve_in_c, ula_enable  : out std_logic
	

	);

end entity;

architecture rtl of decoder is



begin

	escreve_in_c 	<= '1' when (opcode(5 downto 4) = x"0" and ( --OPCODE TIPO R
	
								opcode(3 downto 0) = x"20" or      --INSTRUÇOES TIPO R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or 
								opcode(3 downto 0) = x"2A" ))
						else '0';
	
	pc_enable 		<= '1' when (opcode(5 downto 4) = x"0" and ( --OPCODE TIPO R
	
								opcode(3 downto 0) = x"20" or   --INSTRUÇOES TIPO R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or 
								opcode(3 downto 0) = x"2A"))
						else '0';
	
	ula_enable 		<= '1' when (opcode(5 downto 4) = x"0" and (   --OPCODE TIPO R
	
								opcode(3 downto 0) = x"20" or      --INSTRUÇOES TIPO R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or 
								opcode(3 downto 0) = x"2A"))
						else '0';
	
	

	

end rtl;
