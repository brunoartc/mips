-- Design de Computadores
-- file: mips.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity mips is
	port
    (
        clk			            : IN  STD_LOGIC;
		  oo            : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saida_ula : out std_logic_vector(32-1 downto 0);
		  pontosDeControleOut     : OUT STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
		  pcOut     : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)

    );
end entity;

architecture estrutural of mips is

	-- Declaração de sinais auxiliares
    signal pontosDeControle     : STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
    signal instrucao            : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    signal ALUop                : STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
    signal ALUctr               : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);

    -- Sinal de clock auxiliar para simulação
    -- signal clk  : STD_LOGIC;

    alias opcode : std_logic_vector(OPCODE_WIDTH-1 downto 0) is instrucao(31 DOWNTO 26);
	 alias funct     : std_logic_vector(FUNCT_WIDTH-1 downto 0) is  instrucao(5 DOWNTO 0);
	 
	 
	 
	 
	 signal signal_clk : std_logic;
begin
	
oo <= instrucao;
pontosDeControleOut <= pontosDeControle;
    -- CLOCK generator auxiliar para simulação
    -- CG : entity work.clock_generator port map (clk	=> clk);
	--saida_ula <= saida_ula_out;
	
	
	
	
	ED_EDD_EDDY: entity work.edgeDetector
     port map ( clk   =>  clk,
              entrada =>  clk,
              saida  => signal_clk);
	
	
	
	
    FD : entity work.fluxo_dados 
	port map
	(
        clk	                    => signal_clk,
        pontosDeControle        => pontosDeControle,
        instrucao               => instrucao,
		  saida_ula_out 				  => saida_ula,
		  saida_mux_jump_out			=> pcOut
    );

    UC : entity work.uc 
	port map
	(
        opcode              	=> opcode,
		  funct						=> funct,
        pontosDeControle    	=> pontosDeControle
    );
	 
		
		  
		  

end architecture;
