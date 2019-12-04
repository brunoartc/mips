-- Toranja
-- file: display.vhd
-- date: 04/12/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity display is
	port
    (
	 -- DISPLAYS 7 SEG
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 downto 0);
		
		  saida_ula : IN std_logic_vector(32-1 downto 0);

		  pcOut     : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)

    );
end entity;

architecture estrutural of display is


begin
	
				
				
				
				
				
	
	
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
	 --key_clk
	 MENOS_PCCC: entity work.conversorHex7Seg
    port map
    (
        dadoHex =>    pcOut(15 downto 12),
        saida7seg => HEX7 -- := (others => '1')
    );
	 
		
		  
		  

end architecture;
