-- Quartus Prime VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signed_adder is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		a	   : in signed	((DATA_WIDTH-1) downto 0);
		b	   : in signed	((DATA_WIDTH-1) downto 0);
		result : out std_logic_vector ((DATA_WIDTH-1) downto 0);
		overflow: out std_logic
	);

end entity;

architecture rtl of signed_adder is
signal a_extended, b_extended : signed	((DATA_WIDTH) downto 0);
signal result_signed: signed	((DATA_WIDTH) downto 0);
begin

	a_extended <= '0' & a;
	
	b_extended <= '0' & b;

	result_signed <= a_extended + b_extended;
	
	
	result <= std_logic_vector(result_signed((DATA_WIDTH-1) downto 0));
	
	overflow <= result_signed(DATA_WIDTH);

end rtl;
