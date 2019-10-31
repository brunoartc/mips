library ieee;
use ieee.std_logic_1164.all;

entity mux is
    generic (
        larguraDados    : natural  :=   9
    );
    port (
        IN_A    : in  std_logic_vector(larguraDados-1 downto 0);
        IN_B    : in  std_logic_vector(larguraDados-1 downto 0);
        sel   : in  std_logic;

        mux_out   : out std_logic_vector(larguraDados-1 downto 0)
    );
end entity;

architecture comportamento of mux is
begin

    mux_out <= IN_A when sel='0' else
    mux_out <= IN_B;

end architecture;