-- Design de Computadores
-- file: uc.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity uc is
	port
    (
        opcode              	: IN STD_LOGIC_VECTOR(OPCODE_WIDTH-1 DOWNTO 0);
        pontosDeControle    	: OUT STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0)
    );
end entity;

architecture bhv of uc is


SIGNAL muxJump, muxBeq, muxRtRd, habEscritaReg, muxRtimediato, muxUlaMem, beq, habLeituraMem,habEscritaMem,  muxUlaBanc : STD_LOGIC;
SIGNAL ulaOp : STD_LOGIC_VECTOR(2 DOWNTO 0);
begin
    --process(opcode)
	 --begin
	 
	 
	 
	 
	 
	 
	 
	 
	 -- control points [ mux PC(beq & jump) , mux (rt / rd ), hab Escrita reg , mux rt/ imediato, ula op , mux ula mem, beq, hab leitura mem, hab escrita mem ]
	 
	 -- lw  	   R[rt] M[
	 --			mux PC(beq & jump) = 0
	 -- 			mux (rt / rd )
	 
	 muxJump <= 	'1' when opcode = opCodeTipoJ else
							'0';
							
	muxBeq <= 	'1' when opcode = opCodeBEQ else
							'0';
	
	muxRtRd <= 	'1' when opcode = opCodeTipoR else
					'0';
					
	
	 muxUlaBanc <= '1' when opcode = ctrlTipoLW or opcode = ctrlTipoSW else
						'0';
						
	muxUlaMem <= '1' when opcode = ctrlTipoLW else
						'0';
						
	habLeituraMem <= '1' when opcode = ctrlTipoLW else
						'0';
	
	 habEscritaMem <= '1' when opcode = ctrlTipoSW else
						'0';
	
	
	habEscritaReg <= '1' when opcode = ctrlTipoLW or opcode = opCodeTipoR  else
						'0';
						
						
	ulaOp <= readFunctULA when opcode = opCodeTipoR else 
				aluOpDC when opcode = opCodeTipoJ else 
				aluOpSub when opcode = opCodeBEQ else 
				aluOpAdd when opcode = ctrlTipoLW or opcode = ctrlTipoSW else
				"000";
				
				
	pontosDeControle <= ulaOp & habEscritaReg & habEscritaMem & habLeituraMem & muxUlaMem & muxRtRd & muxUlaBanc & muxBeq & muxJump;
				
	 
	 -- sw
	 -- add
	 -- sub
	 -- AND
	 -- OR
	 -- slt set less than
	 -- beq branch equal
	 -- j jump
	 -- lui load upper immediate
	 -- addi
	 -- andi
	 -- ori
	 -- slti
	 -- bne
	 -- jal
	 -- jr
	 
	 
	 --end process;

end bhv;