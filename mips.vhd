-- Design de Computadores
-- file: mips.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity mips is
	port
    (
	 -- DISPLAYS 7 SEG
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		KEY				: IN STD_LOGIC;
        clk			            : IN  STD_LOGIC;
		  oo            : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saida_ula_out : out std_logic_vector(32-1 downto 0);
		  pontosDeControleOut     : OUT STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
		  pcOut_out     : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		ULActr_out 					: OUT std_logic_vector(CTRL_ALU_WIDTH-1 downto 0);
      A_ULA							: OUT std_logic_vector(DATA_WIDTH-1 downto 0);
		  B_ULA							: OUT std_logic_vector(DATA_WIDTH-1 downto 0);
		  end_a_out                : OUT std_logic_vector(4 downto 0);
		  end_b_out                : OUT std_logic_vector(4 downto 0)
		  
    );
end entity;

architecture estrutural of mips is

	-- Declaração de sinais auxiliares
    signal pontosDeControle     : STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
    signal instrucao            : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
	 
	 signal instrucao_saida      : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
	 
    signal ALUop                : STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
    signal ALUctr               : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);

    -- Sinal de clock auxiliar para simulação
    -- signal clk  : STD_LOGIC;

    alias opcode : std_logic_vector(OPCODE_WIDTH-1 downto 0) is instrucao_saida(31 DOWNTO 26);   -- mudei para instrucao_saida (mais certo)
	 alias funct     : std_logic_vector(FUNCT_WIDTH-1 downto 0) is  instrucao_saida(5 DOWNTO 0);   -- esse tambem
	 
	 signal saida_ula : std_logic_vector(32-1 downto 0);
	 signal pcOut     : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
	 
	 
	 signal key_clk : std_logic;
begin
	
oo <= instrucao_saida;
pontosDeControleOut <= pontosDeControle;
    -- CLOCK generator auxiliar para simulação
    -- CG : entity work.clock_generator port map (clk	=> clk);
	--saida_ula <= saida_ula_out;
	
	saida_ula_out <= saida_ula;
	pcOut_out <= pcOut;
				
				
				
				
				
	
	
	DISPLAY: entity work.display
		port map
		 (
		 -- DISPLAYS 7 SEG
			  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
			
			  saida_ula,

			  pcOut

		 );
		 
	
	ED_EDD_EDDY: entity work.edgeDetector
     port map ( clk   =>  clk,
              entrada =>  (not key),
              saida  => key_clk);
	
	
	
	
    FD : entity work.fluxo_dados 
	port map
	(
        clk	                    => key_clk, --key_clk
        pontosDeControle        => pontosDeControle,
        instrucao               => instrucao,
		  instrucao_saida         => instrucao_saida,
		  saida_ula_out 				  => saida_ula,
		  saida_mux_jump_out			=> pcOut,
		  ULActr_out => ULActr_out,
		    A_ULA	=> 	A_ULA,			
		  B_ULA	=> B_ULA,
		  end_a_out                => end_a_out,
		  end_b_out                => end_b_out
    );

    UC : entity work.uc 
	port map
	(
        opcode              	=> opcode,
		  funct						=> funct,
        pontosDeControle    	=> pontosDeControle
    );
	 
		
		  
		  

end architecture;
