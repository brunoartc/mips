-- Quartus Prime VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity equal is

	port 
	(
		a	   : in std_logic;
		b	   : in std_logic;
		result : out std_logic
	);

end entity;

architecture rtl of equal is
begin

    result <= '1' when a = '1' and b = '1'
    else '0';

end rtl;