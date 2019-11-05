-- Quartus Prime VHDL Template
-- Single port RAM with single read/write address 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
	port 
	(
	 i_opcode : in std_logic_vector(5 downto 0);
	 opcode : in std_logic_vector(5 downto 0);
    ula_enable, write_enable, sel_mux1, sel_mux2, sel_mux3, read_write_ram, beq  : out std_logic;
	 op_ula : in std_logic_vector(1 downto 0);
    sel_ula: STD_LOGIC_VECTOR(2 DOWNTO 0);
	

	);

end entity;

architecture rtl of decoder is



begin

   beq             <= '1' when(i_opcode(5 downto 0) = x "04"   --beq
						 else '0';

   read_write_ram  <= '1' when(i_opcode(5 downto 0) = x "2B" or -- escrever = 1 & ler = 0 
								opcode(3 downto 0) = x"20" or           -- store e instr R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or
								opcode(3 downto 0) = x"2A" or 
						else '0';

								
	sel_mux3        <= '1' when(i_opcode(5 downto 0) = x "2B"   --lw
						else '0';
						
						
						
	sel_mux2        <= '1' when(i_opcode(5 downto 0) = x "2B" or -- 1 para lw, sw e beq e 0 para o resto
								  when(i_opcode(5 downto 0) = x "23" or
								  when(i_opcode(5 downto 0) = x "04"
						else '0';
						
						

   sel_mux1        <= '1' when(opcode(5 downto 4) = x"0" and (
								opcode(3 downto 0) = x"20" or      --INSTRUÇOES TIPO R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or
								opcode(3 downto 0) = x"2A" ))
						else '0';
	

	write_enable 	<= '1' when (opcode(5 downto 4) = x"0" and ( --OPCODE TIPO R
	
								opcode(3 downto 0) = x"20" or      --INSTRUÇOES TIPO R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or 
								opcode(3 downto 0) = x"2A" ))
						else '0';
	
	-- TODO: CHANGE TO BE ALUOP 
	ula_enable 		<= '1' when (opcode(5 downto 4) = x"0" and (   --OPCODE TIPO R 
	
								opcode(3 downto 0) = x"20" or      --INSTRUÇOES TIPO R
								opcode(3 downto 0) = x"22" or
								opcode(3 downto 0) = x"24" or
								opcode(3 downto 0) = x"25" or 
								opcode(3 downto 0) = x"2A"))
						else '0';
	
	

	

end rtl;