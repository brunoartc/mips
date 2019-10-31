
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------

entity ALU is

port(
	A:	in std_logic_vector(31 downto 0);
	B:	in std_logic_vector(31 downto 0);
	Sel:	in std_logic_vector(2 downto 0);
	Res:	out std_logic_vector(31 downto 0);
	Z: 	out std_logic
);

end ALU;

---------------------------------------------------

architecture behv of ALU is
SIGNAL A_SIGNED, B_SIGNED, Res_SIGNED: signed(31 downto 0);
SIGNAL A_UNSIGNED, B_UNSIGNED, Res_UNSIGNED: unsigned(31 downto 0);
begin

	A_SIGNED <= signed(A);
	
	B_SIGNED <= signed(B);
	
	A_UNSIGNED <= unsigned(A);
	
	B_UNSIGNED <= unsigned(B);

	Res_SIGNED <= (A_SIGNED + B_SIGNED) when Sel = "000"  else (others => '0');

	

	Res_UNSIGNED <= (A_UNSIGNED + B_UNSIGNED) when Sel = "001";       -- add unsigned
	
	
	
	Res <= std_logic_vector(Res_SIGNED) when Sel = "000" else         -- add
	
	std_logic_vector(Res_UNSIGNED) when Sel = "001" else
	
	(A nor B) when Sel = "010"			                                 -- nor

	else (A or  B) when Sel = "011"					                    	-- or
 
	else (A and B) when Sel = "100"						                  -- and

	else (others => '0');


end behv;