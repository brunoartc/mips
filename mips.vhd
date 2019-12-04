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
		  pcOut_out     : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)

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
	 
	 signal saida_ula : std_logic_vector(32-1 downto 0);
	 signal pcOut     : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
	 
	 
	 signal key_clk : std_logic;
begin
	
oo <= instrucao;
pontosDeControleOut <= pontosDeControle;
    -- CLOCK generator auxiliar para simulação
    -- CG : entity work.clock_generator port map (clk	=> clk);
	--saida_ula <= saida_ula_out;
	
	saida_ula_out <= saida_ula;
	pcOut_out <= pcOut;
				
				
				
				
				
	
	
	MENOS_ULA: entity work.conversorHex7Seg
    port map
    (
        -- Input ports
        dadoHex => saida_ula(3 downto 0),
        -- Output ports
        saida7seg => HEX0 -- := (others => '1')
    );
	 
	 MMENOS_ULA: entity work.conversorHex7Seg
    port map
    (
        -- Input ports
        dadoHex => saida_ula(7 downto 4),
        -- Output ports
        saida7seg => HEX1 -- := (others => '1')
    );
	 
	 MENOS_ULAA: entity work.conversorHex7Seg
    port map
    (

        dadoHex =>    saida_ula(11 downto 8),
        saida7seg => HEX2 -- := (others => '1')
    );
	 
	 MENOS_ULAAA: entity work.conversorHex7Seg
    port map
    (
        dadoHex =>    saida_ula(15 downto 12),
        saida7seg => HEX3 -- := (others => '1')
    );
	 
	 
	 MENOS_PC: entity work.conversorHex7Seg
    port map
    (
        -- Input ports
        dadoHex => pcOut(3 downto 0),
        -- Output ports
        saida7seg => HEX4 -- := (others => '1')
    );
	 
	 MMENOS_PC: entity work.conversorHex7Seg
    port map
    (
        -- Input ports
        dadoHex => pcOut(7 downto 4),
        -- Output ports
        saida7seg => HEX5 -- := (others => '1')
    );
	 
	 MENOS_PCC: entity work.conversorHex7Seg
    port map
    (

        dadoHex =>    pcOut(11 downto 8),
        saida7seg => HEX6 -- := (others => '1')
    );
	 
	 MENOS_PCCC: entity work.conversorHex7Seg
    port map
    (
        dadoHex =>    pcOut(15 downto 12),
        saida7seg => HEX7 -- := (others => '1')
    );
	 
	 
	 
	 
	 
	 
	 
	
	ED_EDD_EDDY: entity work.edgeDetector
     port map ( clk   =>  clk, --NAO TA FUNCIONANDO
              entrada =>  not(key),
              saida  => key_clk);
	
	
	
	
    FD : entity work.fluxo_dados 
	port map
	(
        clk	                    => key_clk, --key_clk
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
