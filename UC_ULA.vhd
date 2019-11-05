LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity UC_ULA is
	generic (
		data_width : natural  :=  32
		);

    PORT(
		funct:           in std_logic_vector(5 downto 0);
		op_ula:          in std_logic_vector(1 downto 0);

		invertA:       out std_logic;
		invertB:       out std_logic;
		
		selection:     out std_logic_vector(1 downto 0)
		
		
		);
end entity;

ARCHITECTURE arch OF UC_ULA is
begin
	
	invertB <= '1' when op_ula = "10" or op_ula = "11"; --1 bit eh o func enable e o outro eh o OP
	
	selection <= "10" when op_ula =  "01";
	
				
	 
	
end ARCHITECTURE;