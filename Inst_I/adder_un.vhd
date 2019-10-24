-- Quartus Prime VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- contador soma 4
entity unsigned_adder is

	generic
	(
		DATA_WIDTH : natural := 32
	);

	port 
	(
		a	   : in unsigned  ((DATA_WIDTH-1) downto 0);
		result : out unsigned ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of unsigned_adder is
begin

	result <= std_logic_vector(a + 4);

end rtl;