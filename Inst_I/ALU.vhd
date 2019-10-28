library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU is

port(
	A:	in std_logic_vector(31 downto 0);
	B:	in std_logic_vector(31 downto 0);
	Sel:	in std_logic_vector(2 downto 0);
	Res:	out std_logic_vector(31 downto 0);
	Z: 		out std_logic
);

end ALU;

---------------------------------------------------

architecture behv of ALU is
begin
	



end behv;

----------------------------------------------------
