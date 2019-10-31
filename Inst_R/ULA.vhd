-- Quartus Prime VHDL Template
-- Signed Adder/Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		a		: in signed ((DATA_WIDTH-1) downto 0);
		b		: in signed ((DATA_WIDTH-1) downto 0);
		--add_sub : in std_logic;
		func_ula : in std_logic_vector(5 downto 0);
		result	: out signed ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of ULA is
SIGNAL func_ula_3: std_logic_vector ( 3 downto 0);
begin


	result <= (a+b) WHEN (func_ula="100000") ELSE
	(a-b);
	
	
end rtl;
