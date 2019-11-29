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


SIGNAL muxJump, muxBeq, habEscritaReg, muxRtimediato,  beq, habLeituraMem,habEscritaMem,  muxUlaBanc, sel_imed_zero_ext : STD_LOGIC;
SIGNAL muxRtRd, muxUlaMem, sel_tipo_extensao : STD_LOGIC_VECTOR(1 downto 0); --era std logic vector
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
	
	muxRtRd <= 	"01" when opcode = opCodeTipoR else --mudar era '1' e '0'
					"00";
					
	
	 muxUlaBanc <= '1' when opcode = opCodeLW or opcode = opCodeSW else
						'0';
						
	muxUlaMem <= "01" when opcode = opCodeLW else  -- mudar era '1' e '0'
						"00";
						
	habLeituraMem <= '1' when opcode = opCodeLW else
						'0';
	
	 habEscritaMem <= '1' when opcode = opCodeSW else
						'0';
	
	
	habEscritaReg <= '1' when opcode = opCodeLW or opcode = opCodeTipoR  else
						'0';
						
						
	ulaOp <= readFunctULA when opcode = opCodeTipoR else 
				aluOpDC when opcode = opCodeTipoJ else 
				aluOpSub when opcode = opCodeBEQ else 
				aluOpAdd when opcode = opCodeLW or opcode = opCodeSW else
				
				"000";
				
	sel_imed_zero_ext <= '1' when opcode = opCodeAddI or opcode = opCodeAndI or opcode = opCodeOrI else  --ori e andi sao zero & resto nao 
				
				'0';		
				
				
	sel_tipo_extensao <= "01" when opcode = opCodeAndI or opcode = opCodeOrI else
								"10" when opcode = opCodeLUI else
								"00";
				
	
				
				
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
	 -- jr
	 
	 -- bne
	 -- jal
	 

	 
	 
	 --end process;

end bhv;