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
	 MUX8 : with seletor select
	saida <= entradaA when "00",
				entradaB when "01",
				entradaC when "10",
				entradaD when "11",
				entradaA when others;

				
end architecture;