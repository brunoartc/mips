library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity process_bits is

	generic
	(
		DATA_WIDTH : natural := 32
	);

	port 
	(
		a	   : in std_logic_vector((DATA_WIDTH-1) downto 0);
		result : out std_logic
	);
	
	

end entity;

architecture rtl of process_bits is
signal zero: std_logic_vector((data_width -1) DOWNTO 0) := ( others => '0');

begin
	result <= '1' when a = zero else
				'0';
				
end rtl;