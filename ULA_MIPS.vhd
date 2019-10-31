LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity ULA_MIPS is
	generic (
		data_width : natural  :=  32
		);

    PORT(
		clk:           in std_logic;
		A:             in std_logic_vector(data_width - 1 downto 0);
		B:             in std_logic_vector(data_width - 1 downto 0);
		invertA:       in std_logic;
		invertB:       in std_logic;
		vai:           in std_logic;
		vem:           in std_logic;
		selection:     in std_logic_vector(1 downto 0);
		zero:          out std_logic;
		result:        out std_logic_vector(data_width - 1 downto 0)
		);
end entity;

ARCHITECTURE arch OF ULA_MIPS is
	signal sig_adder: std_logic_vector(data_width -1 DOWNTO 0);
	signal not_a, not_B, sig_and, sig_or, sig_slt, resultA, resultB, sig_result: std_logic_vector(data_width -1 DOWNTO 0);
	signal signed_A, signed_b, resultA_signed, resultB_signed: signed(data_width -1 DOWNTO 0);
	signal overflow: std_logic;
	
	
	
begin

	---------------------------------------------------------------------------------------------------------
        ADDER: entity work.signed_adder
            GENERIC MAP(
                DATA_WIDTH => 32
            )
            PORT MAP(
                a => resultA_signed,
                b => resultB_signed,
                result => sig_adder,
					 overflow => overflow
            );
    ---------------------------------------------------------------------------------------------------------
	 
		PROCESS_BITS: entity work.process_bits
			GENERIC MAP(
				DATA_WIDTH => 32
			)
			PORT MAP(
				a => sig_result,
				result=> zero
			 );
	---------------------------------------------------------------------------------------------------------
	
	signed_A <= signed(A);
	
	signed_B <= signed(B);
	
	result <= sig_result;
	
	sig_result <= 	std_logic_vector(sig_and) when selection = "00" else								-- AND
						std_logic_vector(sig_or) when selection = "01" else								-- OR
						sig_adder when selection = "10" else													-- ADD/SUB
						std_logic_vector(sig_slt) when selection = "11";									-- SLT
					
	
	sig_and <= std_logic_vector(resultA_signed) and std_logic_vector(resultB_signed);
	
	sig_or <= std_logic_vector(resultA_signed) or std_logic_vector(resultB_signed);
	
	
	
	resultA_signed <=  (signed_A) when invertA = '1' else
					not (signed_A);
	
	resultB_signed <=	(signed_B) when invertB = '1' else
					 not (signed_B);
	
					
	 
	
end ARCHITECTURE;