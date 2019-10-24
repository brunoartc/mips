library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU is

port(	A:	in std_logic_vector(1 downto 0);
	B:	in std_logic_vector(1 downto 0);
	Sel:	in std_logic_vector(2 downto 0);
	Res:	out std_logic_vector(1 downto 0)  
);

end ALU;

---------------------------------------------------

architecture behv of ALU is
begin					   

    process(A,B,Sel)
    begin
    
	-- use case statement to achieve 
	-- different operations of ALU

	case Sel is
		-- Instruções R
		
		-- add 
		when "000" => Res <= signed(A) + signed(B);
		
		-- add unsigned
		when "001" => Res <= unsigned(A) + unsigned(B);
		
		-- nor
		when "010" => Res <= A nor B;
		
		--or
		when "011" => Res <= A or B;
		
		-- and
		when "100" => Res <= A and B;

	    when others =>	 
		Res <= "XX";
        end case;

    end process;

end behv;

----------------------------------------------------
