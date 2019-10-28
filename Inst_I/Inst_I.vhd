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
    SIGNAL out_rom, out_pc, out_ram, out_adder, out_reg1, out_reg2, out_ula, imediato, out_mux2, out_mux3, out_mux4, out_shifter: STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL out_pc_unsigned, out_shifter_unsigned, out_adder_unsigned : unsigned(31 DOWNTO 0);
    SIGNAL out_mux1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL sel_ula: STD_LOGIC_VECTOR(2 DOWNTO 0); -- aumentar conforme adicionamos instruções
    SIGNAL write_enable, sel_mux1, sel_mux2, sel_mux3, sel_mux4, sig_z, read_write_ram:STD_LOGIC;

    begin		
    ---------------------------------------------------------------------------------------------------------
        ROM: entity work.rom 

            GENERIC MAP(
                dataWidth => 32, 
                addrWidth => 32) 

            PORT MAP( 
                Dado => out_rom, 
                Endereco => out_pc);
    ---------------------------------------------------------------------------------------------------------
        MUX_1: entity work.muxGenerico  
        -- between ROM and bank
            GENERIC MAP(
                larguraDados => 5

            )
            PORT MAP(
                IN_A => out_rom(20 downto 16),
                IN_B => out_rom(15 downto 11),
                sel => sel_mux1,
                mux_out => out_mux1
            );
    ---------------------------------------------------------------------------------------------------------
        BANCO_REGISTRADORES: entity work.bancoRegistradores 
            GENERIC MAP(
                larguraDados => 32, 
                larguraEndBancoRegs => 5
            )
            PORT MAP(
                clk => clk,
                enderecoA => out_rom(25 DOWNTO 21),
                enderecoB =>out_rom(20 DOWNTO 16),
                enderecoC => out_mux1,
                dadoEscritaC => out_mux3,
                escreveC => write_enable,
                saidaA => out_reg1, 
                saidaB => out_reg2
            );
    ---------------------------------------------------------------------------------------------------------
        MUX_3: entity work.muxGenerico  
        -- between RAM and bank
            GENERIC MAP(
                larguraDados => 32

            )
            PORT MAP(
                IN_A => out_ula,
                IN_B => out_ram,
                sel => sel_mux3,
                mux_out => out_mux3
            );
    ---------------------------------------------------------------------------------------------------------
        MUX_2: entity work.muxGenerico  
        -- between bank and ULA
            GENERIC MAP(
                larguraDados => 32

            )
            PORT MAP(
                IN_A => out_reg2,
                IN_B => imediato,
                sel => sel_mux2,
                mux_out => out_mux2
            );
    ---------------------------------------------------------------------------------------------------------
        EXTENSOR: entity work.extendeSinalGenerico
            GENERIC MAP(
                larguraDadoEntrada => 16,
                larguraDadoSaida   => 32

            )
            PORT MAP(
                estendeSinal_IN  => out_rom(15 downto 0),
                estendeSinal_OUT => imediato
            );
    ---------------------------------------------------------------------------------------------------------
        ULA: entity work.ALU 
            PORT MAP(
                A   => out_reg1, 
                B   => out_mux2, 
                Sel => sel_ula, 
                Res => out_ula,
                Z   => sig_z
                );
    ---------------------------------------------------------------------------------------------------------
        RAM: entity work.ram
            GENERIC MAP (
                dataWidth => 32,
                addrWidth => 32
            )
            PORT MAP
            (
            addr     => out_ula,
            we       => read_write_ram,
            clk      => clk,
            dado_in  => out_reg2,
            dado_out => out_ram
            );
    ---------------------------------------------------------------------------------------------------------
        SHIFTER: entity work.shift_register
            PORT MAP
            (
            dado_entrada => imediato,
            dado_saida   => out_shifter
            );
    ---------------------------------------------------------------------------------------------------------
        ADDER: entity work.unsigned_adder
            GENERIC MAP
            (
            DATA_WIDTH => 32
            )
            PORT MAP
            (
            a => out_pc_unsigned,
				b => out_shifter_unsigned,
            result => out_adder_unsigned
				);
				
				out_shifter <= std_logic_vector(out_shifter_unsigned);
				
				out_adder <= std_logic_vector(out_adder_unsigned);
				
				out_pc <= std_logic_vector(out_pc_unsigned);
		
        
        
       
    end architecture;

