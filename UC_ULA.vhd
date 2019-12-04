-- Design de Computadores
-- file: UC_ULA.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity UC_ULA is
	port
    (
        funct               : IN STD_LOGIC_VECTOR(FUNCT_WIDTH-1 DOWNTO 0);
        ALUop               : IN STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
        ALUctr              : OUT STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0)
    );
end entity;

architecture bhv of UC_ULA is	
    signal ALUop_s : STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
begin	
	ALUctr <= 	------------- ADD --------------
					ulaCtrlAdd when (funct = functADD					
								and ALUop = readFunctULA) 
								or (ALUop = aluOpAdd)	else
								
					----------- SUB/BEQ/BNE ---------			
					ulaCtrlSub when (funct = functSUB					
								and ALUop = readFunctULA)
									or (ALUop = aluOpSub) else --beq & bne
									
					------------- AND --------------
					ulaCtrlAnd when funct = functAND 					
								and ALUop = readFunctULA else
								
					-------------- OR --------------
					ulaCtrlOr when funct = functOR
								and ALUop = readFunctULA else
								
					------------- SLT --------------
					ulaCtrlSlt when funct = functSLT
								and ALUop = readFunctULA 
					
					------------ ELSE --------------
					else (others => '0');
								
					


end bhv;