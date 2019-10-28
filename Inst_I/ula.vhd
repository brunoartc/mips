library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU is

port(
	A:	in std_logic_vector(1 downto 0);
	B:	in std_logic_vector(1 downto 0);
	Sel:	in std_logic_vector(2 downto 0);
	Res:	out std_logic_vector(1 downto 0);
	Z: 		out std_logic
);

end ALU;

---------------------------------------------------

architecture behv of ALU is
begin
	
	Res <= signed(A) + signed(B) when Sel = "000"  			-- add

	else Res <= unsigned(A) + unsigned(B) when Sel = "001"  -- add unsigned

	else Res <= A nor B when Sel = "010"					-- nor

	else Res <= A or B when Sel "011"						--or

	else Res <= A and B when Sel "100"						--and

	else Res <= "XXX"


end behv;

----------------------------------------------------
