LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity inst_i is
	generic (
		larguraDados    : natural  :=  32;
		larguraEnderecos: natural := 5;
		larguraImediato : natural := 16
    );

    PORT(
		clk: in std_logic
		  );
end entity;

ARCHITECTURE arch OF inst_i is
    SIGNAL out_rom, out_pc, out_adder, out_reg1, out_reg2, out_ula, imediato : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL sel_ula: STD_LOGIC_VECTOR(2 DOWNTO 0); -- aumentar conforme adicionamos instruções
    SIGNAL write_enable STD_LOGIC;

	begin
		
		Adder: entity work.adder_un 
            GENERIC MAP(DATA_WIDTH => 32) PORT MAP(a => out_pc, result => out_adder);
		
        Rom: entity work.rom 
            GENERIC MAP(DATA_WIDTH => 32, ADDR_WIDTH => 32) PORT MAP(clk => clk, q => imediato, addr => out_pc);

        Ula: entity work.ula 
            PORT MAP(A => out_reg1, B => out_reg2, Sel => sel_ula, Res => out_ula);
		
        Pc: entity work.reg_gen 
            GENERIC MAP(larguraDados => 32) PORT MAP(DIN => out_adder, DOUT => out_pc, ENABLE => '1', CLK => CLK, RST => '0');
        
        Reg_bank: entity work.banco_reg_misp 
            GENERIC MAP(larguraDados => larguraDados, larguraEndBancoRegs => larguraEnderecos) 
		    PORT MAP(clk => clk, enderecoA => imediato(25 DOWNTO 21), enderecoB =>imediato(20 DOWNTO 16), enderecoC => imediato(15 DOWNTO 11), dadoEscritaC => out_ula, escreveC => write_enable, saidaA => out_reg1, saidaB => out_reg2);
        
        Uc: ---

    end architecture;