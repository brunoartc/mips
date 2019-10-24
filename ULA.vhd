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

	func_ula_3 <= func_ula( 3 downto 0);

	process(a,b, func_ula)
	begin
		-- Add if "add_sub" is 1, else subtract default
--		if (add_sub = '1') then
--			result <= a + b;
--		else
--			result <= a - b;
--		end if;
		
		
		if (func_ula = x"020") then 
			result <= a + b;
		
		elsif  (func_ula_3 = x"22") then
			result <= a - b;
		elsif  (func_ula_3 = x"24") then
			result <= a and b;
		elsif  (func_ula_3 = x"25") then
			result <= a or b;
		elsif  (func_ula_3 = x"2A") then
			result <= (others => '0');
			if (a<b) then
				result <= result((DATA_WIDTH-1) downto 1) & '1';
			else 
				result <= result((DATA_WIDTH-1) downto 1) & '0';
			end if;
			
		end if;
		
	end process;

end rtl;
