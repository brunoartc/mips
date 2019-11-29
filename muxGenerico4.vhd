library ieee;
use ieee.std_logic_1164.all;

entity muxGenerico4 is
    generic (
        -- Total de bits das entradas e saidas
        larguraDados    : natural  :=   8
    );
    port (
        entradaA    : in  std_logic_vector(larguraDados-1 downto 0);
        entradaB    : in  std_logic_vector(larguraDados-1 downto 0);
		  entradaC    : in  std_logic_vector(larguraDados-1 downto 0);
		  entradaD    : in  std_logic_vector(larguraDados-1 downto 0);
        seletor     : in  std_logic_vector(1 downto 0);
        saida       : out std_logic_vector(larguraDados-1 downto 0)
    );
end entity;

architecture comportamento of muxGenerico4 is
begin
  -- Para sintetizar lógica combinacional usando um processo,
  --  todas as entradas do modulo devem aparecer na lista de sensibilidade.
    process(entradaA, entradaB, seletor) is
    begin
        if (seletor="00") then
            saida <= entradaA;
        elsif (seletor="01") then
            saida <= entradaB;
        elsif (seletor="10") then
            saida <= entradaC;
        else
            saida <= entradaD;
        end if;
    end process;
end architecture;