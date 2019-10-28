library ieee;  
use ieee.std_logic_1164.all;  

ENTITY shift_register IS  
    port   
    (  
        dado_entrada : in std_logic_vector(31 DOWNTO 0),
        dado_saida : out std_logic_vector(31 DOWNTO 0)
    );

end shift_register;  

architecture RTL of shift_register is
    begin
        dado_saida <= dado_entrado(31 DOWNTO 2) and "00"

end architecture RTL; 