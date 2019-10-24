-- Quartus Prime VHDL Template
-- Single port RAM with single read/write address 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mips is

	generic 
	(
		addrWidth : natural := 32;
		dataWidth : natural := 32
	);

	port 
	(
	clk : in std_logic

	);

end entity;

architecture rtl of mips is
SIGNAL out_ROM: std_logic_vector(dataWidth - 1 downto 0);

SIGNAL out_pc : std_logic_vector(dataWidth - 1 downto 0); --errado

SIGNAL imediate : std_logic_vector(16 - 1 downto 0); 

SIGNAL in_memoria, out_RAM, in_ula_a, in_ula_b, out_ula, out_banco, out_adder_saida: std_logic_vector(dataWidth - 1 downto 0);

SIGNAL out_ula_signed: signed(dataWidth - 1 downto 0);

SIGNAL RAM_READ_WRITE, escreve_in_c, op_ula, carry, pc_enable: std_logic;

SIGNAL TRINTAE1ZEROS: std_logic_vector(dataWidth - 4 downto 0) := (others => '0');


begin

	

	imediate <= out_ROM(15 downto 0);

	ROM: ENTITY work.memoria GENERIC MAP (dataWidth => dataWidth, addrWidth => addrWidth) PORT MAP (Endereco => out_pc , Dado=>out_ROM);

	
	BR: ENTITY work.bancoRegistradores PORT MAP (
        clk        => clk,
        enderecoA       => out_ROM(25 downto 21),
        enderecoB       => out_ROM(20 downto 16),
        enderecoC       => out_ROM(15 downto 11),
        dadoEscritaC    => out_ula,
        escreveC        => escreve_in_c,
        saidaA          => in_ula_a,
        saidaB          => in_ula_b
    );
	 
	 
	 ULA : ENTITY work.ULA GENERIC MAP (DATA_WIDTH => addrWidth) PORT MAP (
        a        => signed(in_ula_a),
        b       => signed(in_ula_b),
		  func_ula => out_ROM(5 downto 0),
        result       => out_ula_signed
    );
	 
	 
	 out_ula <= std_logic_vector(out_ula_signed);
	 
	 
	 
	 
	 
	 
	 ADDER_1 : ENTITY work.ADDER GENERIC MAP (n => addrWidth) PORT MAP (A => TRINTAE1ZEROS & "100" , B => out_pc, sum => out_adder_saida, carry => carry); --define generic default for data n & larguraDados
	 
	 
	 PC : ENTITY work.registradorGenerico GENERIC MAP (larguraDados => addrWidth)PORT MAP(data => out_adder_saida, clk => CLK, enable => pc_enable, q => out_pc, RST => '0');
	
	 
	 DECODER : ENTITY work.decoder PORT MAP(opcode => out_ROM(31 downto 26), escreve_in_c => escreve_in_c, pc_enable => pc_enable);
	
	 
	 


end rtl;
