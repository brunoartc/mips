LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity uc is
    generic (
        DATA_WIDTH : NATURAL := 32
    );
    PORT (
        data : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
        set1, set2: OUT STD_LOGIC;
        sel_ula : OUT STD_LOGIC_VECTOR(2 DOWNTO 0) -- dependende da quantidade de instruções
    );
END ENTITY;

ARCHITECTURE arch OF uc IS
BEGIN
    sel_ula <= 
END arch;