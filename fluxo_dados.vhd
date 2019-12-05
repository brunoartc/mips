-- Design de Computadores
-- file: fluxo_dados.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

	entity fluxo_dados is
    generic (
        larguraROM          : natural := 8 -- deve ser menor ou igual a 32
    );
	port
    (
        clk			            : IN STD_LOGIC;
        pontosDeControle        : IN STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0); --mudar nos genericos
        instrucao               : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  instrucao_saida          : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saida_ula_out 				: OUT std_logic_vector(32-1 downto 0);
		  saida_mux_jump_out 		: OUT std_logic_vector(DATA_WIDTH-1 downto 0);
		  ULActr_out 					: OUT std_logic_vector(CTRL_ALU_WIDTH-1 downto 0);
		  A_ULA							: OUT std_logic_vector(DATA_WIDTH-1 downto 0);
		  B_ULA							: OUT std_logic_vector(DATA_WIDTH-1 downto 0);
		  end_a_out                : OUT std_logic_vector(4 downto 0);
		  end_b_out                : OUT std_logic_vector(4 downto 0)
		
	 );
end entity;

architecture estrutural of fluxo_dados is
    -- Declaração de sinais auxiliares
    
    -- Sinais auxiliar da instrução
    signal instrucao_s : std_logic_vector(DATA_WIDTH-1 downto 0);
	 signal instrucao_s_saida : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para o banco de registradores
    signal RA, RB : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para a ULA
    signal saida_ula : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal Z_out : std_logic;

    -- Sinais auxiliares para a lógica do PC
    signal PC_s, PC_mais_4, PC_mais_8, PC_mais_4_mais_imediato, entrada_somador_beq : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para a RAM
    signal dado_lido_mem : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para os componentes manipuladores do imediato
    signal sinal_ext : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para os componentes manipuladores do endereço de jump
    signal PC_4_concat_imed : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal saida_shift_jump : std_logic_vector(27 downto 0);
            
    -- Sinais auxiliares dos MUXs
    signal sel_mux_beq : std_logic;
    signal saida_mux_ula_mem, saida_mux_banco_ula, saida_mux_beq, saida_mux_jump : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal saida_mux_rd_rt : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0);
     
    -- Controle da ULA
    signal ULActr : std_logic_vector(CTRL_ALU_WIDTH-1 downto 0);
	 
	 -- Pipeline signals
	 signal out_if_id : std_logic_vector(64-1 downto 0); 
	 signal out_id_ex : std_logic_vector(150-1 downto 0); 
	 signal out_ex_mem : std_logic_vector(140-1 downto 0); 
	 signal out_mem_wb : std_logic_vector(104-1 downto 0); 
	 
	 signal inMemEx : std_logic_vector(110-1 downto 0); --era 109
	 signal inMemWb : std_logic_vector(79-1 downto 0); --era 78
	 signal outMemMb : std_logic_vector(78-1 downto 0); --era 77
	 signal isJmpOrBeq : std_logic;
	 

    -- Codigos da palavra de controle:
	 --alias sel_tipo_extensao : std_logic_vector is pontosDeControle(15 downto 14); Para as instrucoes do tipo I
	 --alias sel_imed_zero_ext : std_logic is pontosDeControle(13);
    alias ULAop             : std_logic_vector(ALU_OP_WIDTH-1 downto 0) is pontosDeControle(13 downto 11); --era 10 downto 8
    alias escreve_RC        : std_logic is pontosDeControle(10); --era 7
    alias escreve_RAM       : std_logic is pontosDeControle(9); --era 6
    alias leitura_RAM       : std_logic is pontosDeControle(8); --era 5
    
	 
	 alias sel_mux_ula_mem   : std_logic_vector is pontosDeControle(7 downto 6); --  era 6 e 5  - mudado era 4 e std_loc
    alias sel_mux_rd_rt     : std_logic_vector is pontosDeControle(5 downto 4); --   era 4 e 3 - mudado era 3 e std_logic
    
	 
	 alias sel_mux_banco_ula : std_logic is pontosDeControle(3); --2
    alias sel_beq           : std_logic is pontosDeControle(2); --era 1
    alias sel_mux_jump      : std_logic_vector is pontosDeControle(1 downto 0); --era 0
	 
	
--alias wb_address   : std_loogic_vector(4 downto 0) is out_if_id();
	
	 -- JUMP INSTRUCTIONS 
	 
	 alias address	  : std_logic_vector(JMP_ADDR_WIDTH-1 downto 0) is instrucao_s(25 downto 0);

    -- Parsing da instrucao
    alias RS_addr   : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0) is instrucao_s_saida(25 downto 21);
    alias RT_addr   : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0) is instrucao_s_saida(20 downto 16);
    alias RD_addr   : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0) is instrucao_s_saida(15 downto 11);
    alias funct     : std_logic_vector(FUNCT_WIDTH-1 downto 0) is  instrucao_s_saida(5 DOWNTO 0); --TODO possivelmente errado MAN NAO SEI MAIS
    alias imediato  : std_logic_vector(15 downto 0) is instrucao_s(15 downto 0);
	 alias funct_ula : std_logic_vector(FUNCT_WIDTH-1 downto 0) is out_id_ex(24 downto 19);
	 
	 
	 -- Mux intermediario nao
	 signal ZeroImediateMux, B : std_logic_vector(DATA_WIDTH-1 downto 0);
	 signal sel_imed_zero_ext : std_logic;  --remove and use upper alias
	 signal sel_tipo_extensao : std_logic_vector(1 downto 0);
	 
	 signal dezeseisZeros : std_logic_vector(16-1 downto 0) := (others => '0');
	 


begin
instrucao_s_saida <= out_if_id(31 downto 0);
instrucao_saida <= out_if_id(31 downto 0);

end_a_out <= out_if_id(25 downto 21);
end_b_out <= out_if_id(20 downto 16);
		saida_mux_jump_out <= PC_s;
		
		
		
		--funct_ula <= out_id_ex(24 downto 19);

	saida_ula_out <= saida_ula;

    instrucao <= instrucao_s;
	 --instrucao_s =  out_if_id(31 downto 0)
	 
	 ULActr_out <= ULActr;
	 
	 A_ULA <= out_id_ex(117 downto 86);
	 
	 B_ULA <= saida_mux_banco_ula;

    sel_mux_beq <= sel_beq AND Z_out;

    -- Ajuste do PC para jump (concatena com imediato multiplicado por 4)
    PC_4_concat_imed <= PC_mais_4(31 downto 28) & saida_shift_jump;

    -- Banco de registradores
     BR: entity work.bancoRegistradores 
        generic map (
            larguraDados => DATA_WIDTH, 
            larguraEndBancoRegs => 5
        )
        port map (
            enderecoA => out_if_id(25 downto 21), --isso ta errado (acho que nao)
            enderecoB => out_if_id(20 downto 16),
            enderecoC => out_mem_wb(71 downto 67),
            clk          => clk,
            dadoEscritaC => saida_mux_ula_mem, 
            escreveC     => out_mem_wb(0),
            saidaA       => RA,
            saidaB       => RB
        );
    
    -- ULA
     ULA: entity work.ULA
        generic map (
            NUM_BITS => DATA_WIDTH
        )
		port map (
            A   => out_id_ex(117 downto 86),--out_id_ex(117 downto 86),--, ---estranho ula travada
            B   => saida_mux_banco_ula,--saida_mux_banco_ula,--saida_mux_banco_ula, -- anterior saida mux banco ula
            ctr => ULActr,
            C   => saida_ula,
            Z   => Z_out
        );
    
    UCULA : entity work.uc_ula 
        port map
        (
            funct  => funct_ula,    --achei eh aqui que ta errado era funct antes
            ALUop  => out_id_ex(85 downto 83),
            ALUctr => ULActr
        );
     
    -- PC e somadores
     PC: entity work.Registrador
        generic map (
            NUM_BITS => DATA_WIDTH
        )
		port map (
            data_out => PC_s,
            data_in  => saida_mux_jump,
            clk      => clk,
            enable   => '1',
            reset    => '1' -- reset negado
        );
    
     Somador_imediato: entity work.somador 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => entrada_somador_beq,
            entradaB => out_id_ex(149 downto 118),
            saida    => PC_mais_4_mais_imediato
        );
    
     Somador: entity work.soma4
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entrada => PC_s,
            saida   => PC_mais_4
        ); 
		  
		Somador8: entity work.soma4
        generic map (
            larguraDados => DATA_WIDTH,
				incremento => 8
        )
		port map (
            entrada => PC_s,
            saida   => PC_mais_8
        );

    -- ROM
    ROM: entity work.ROM 
        generic map (
            dataWidth => DATA_WIDTH, 
            addrWidth => larguraROM
        ) 
		port map (
            endereco => PC_s(larguraROM-1 downto 0),
            dado     => instrucao_s
        );
    
    -- RAM: escreve valor lido no registrador B no endereço de memória de acordo com a saída da ULA
     RAM: entity work.single_port_RAM 
        generic map (
            dataWidth => DATA_WIDTH, 
            addrWidth => ADDR_WIDTH
        )
		port map (
            endereco    => out_ex_mem(102 downto 71), 
            we          => out_ex_mem(4),
            re          => out_ex_mem(3),
            clk         => clk,
            dado_write  => out_ex_mem(70 downto 39),
            dado_read   => dado_lido_mem
        ); 

     -- Componentes manipuladores do imediato
     extensor: entity work.estendeSinalGenerico 
        generic map (
            larguraDadoEntrada => 16,
            larguraDadoSaida   => DATA_WIDTH
        )
		port map (
            estendeSinal_IN  => out_if_id(15 downto 0),
            estendeSinal_OUT => sinal_ext 
        ); 

     shift: entity work.shift2_imediato 
        generic map (
            larguraDado => DATA_WIDTH
        )
		port map (
            shift_IN  => out_id_ex(50 downto 19) ,
            shift_OUT => entrada_somador_beq
        );
    
    -- Componentes manipuladores do endereço de jump
     shift_jump: entity work.shift2 
        generic map (
            larguraDado => 26
        )
		port map (
            shift_IN  => instrucao_s(25 downto 0),
            shift_OUT => saida_shift_jump
        );
    
    -- MUXs
--     mux_Ula_Memoria: entity work.muxGenerico2  --mudar
--        generic map (
--            larguraDados => DATA_WIDTH
--        )
--		port map (
--            entradaA => saida_ula, 
--            entradaB => dado_lido_mem, 
--            seletor  => sel_mux_ula_mem,
--            saida    => saida_mux_ula_mem
--        );
		  
		mux_Ula_Memoria: entity work.muxGenerico4  --mudado
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => out_mem_wb(65 downto 34), --ta certo agr - saida da ula
            entradaB => out_mem_wb(33 downto 2),  --  dado lido na memoria
				entradaC => PC_mais_4,
				entradaD => PC_mais_8, --isso exiaste ?
            seletor  => out_mem_wb(2 downto 1), --tava 1 downto 0
            saida    => saida_mux_ula_mem
        );
		  
	 
--     mux_Rd_Rt: entity work.muxGenerico2 --mudar
--        generic map (
--            larguraDados => REGBANK_ADDR_WIDTH
--        )
--		port map (
--            entradaA => RT_addr, 
--            entradaB => RD_addr,
--            seletor  => sel_mux_rd_rt,
--            saida    => saida_mux_rd_rt
--        );
		  
		  
		mux_Rd_Rt: entity work.muxGenerico4 --mudado
        generic map (
            larguraDados => REGBANK_ADDR_WIDTH
        )
		port map (
            entradaA => out_id_ex(18 downto 14), 
            entradaB => out_id_ex(13 downto 9),
				entradaC => "11111",
				entradaD => (others => 'X'),
            seletor  => out_id_ex(7 downto 6),
            saida    => saida_mux_rd_rt
        );
		  
		  
		 
	
     mux_Banco_Ula: entity work.muxGenerico2 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => out_id_ex(82 downto 51), 
            entradaB => out_id_ex(50 downto 19),  
            seletor  => out_id_ex(8), --errado ? nao sei      
            saida    => saida_mux_banco_ula
        );
		
     mux_beq: entity work.muxGenerico2 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => PC_mais_4,
            entradaB => out_ex_mem(37 downto 6),
            seletor  => sel_mux_beq,
            saida    => saida_mux_beq
        );
		
--     mux_jump: entity work.muxGenerico2 
--        generic map (
--            larguraDados => DATA_WIDTH
--        )
--		port map (
--            entradaA => saida_mux_beq,
--            entradaB => PC_4_concat_imed, --TODO: mudar para um mux de 4 portas e aumentar os pontos de controle
--            seletor  => sel_mux_jump,
--            saida    => saida_mux_jump
--        );
		  
		 -- =================================================== TODO MUDAR P`ARA 
		mux_jump: entity work.muxGenerico4
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => saida_mux_beq,
            entradaB => PC_4_concat_imed, 
            entradaC => RA, 
				entradaD => (others => 'X'), 
				seletor  => sel_mux_jump, --TODO: aumentar pontos de controle (WIP TODO: need funct in uc)
            saida    => saida_mux_jump
        );
--		  
		  
		  --- =================== PIPELINE ======================
		  
		IF_ID: entity work.registradorGenerico
			generic map (
			larguraDados => 64
			)
			port map(
				 data => 
					PC_mais_4 &  	-- (63 - 32) 
					instrucao_s,	-- (31 - 0)
					
				 q => out_if_id,
				 enable => '1',
				 CLK => clk,
				 RST => '0'
        );
		  
		ID_EX: entity work.registradorGenerico
        generic map (
		  -- 11 <- CONTROLWORD_WIDTH , 32 <- DATA_WIDTH , 2 registradores
			larguraDados => 150 -- 110 era - 109
			)
			port map(
				data => 
					out_if_id(63 downto 32) & 	-- (149 - 118)
					RA & 							   -- (117 - 86)
					ULAop &							-- (85 - 83)
					RB & 								-- (82 - 51)
					sinal_ext &						-- (50 - 19)
					out_if_id(20 downto 16) &  -- (18 - 14)
					out_if_id(15 downto 11) &	-- (13 - 9)
					sel_mux_banco_ula &			-- (8)
					sel_mux_rd_rt &				-- (7 - 6)
					escreve_RAM &					-- (5)
					leitura_RAM &					-- (4)
					sel_beq &						-- (3)
					sel_mux_ula_mem &				-- (2 - 1)
					escreve_RC,						-- (0)
					
				
				 q => out_id_ex, 
				 enable => '1',
				 CLK => clk,
				 RST => '0'
        );
		  
		  EX_MEM: entity work.registradorGenerico
        generic map (
		  -- 11 <- CONTROLWORD_WIDTH , 32 <- DATA_WIDTH , 33 saida ula
			larguraDados => 140 -- era 78
			)
			port map(
				data => 
					out_id_ex(149 downto 118) & 	-- (139 - 108)
					saida_mux_rd_rt &					-- (107 - 103)
					saida_ula &							-- (102 - 71)
					out_id_ex(82 downto 51) & -- RB  (70 - 39)
					Z_out &								--	(38)
					PC_mais_4_mais_imediato &		-- (37 - 6)	
					out_id_ex(5 downto 0),			-- (5 - 0)
					
				 q => out_ex_mem,
				 enable => '1',
				 CLK => clk,
				 RST => '0'
        );
		  
		  MEM_MB: entity work.registradorGenerico
        generic map (
		  -- 11 <- CONTROLWORD_WIDTH , 32 <- DATA_WIDTH , 32 saida mem
			larguraDados => 104 -- era 103     ---    era 77
			)
			port map(
				data => 
					out_ex_mem(102 downto 71) & 	-- (102 - 71)
					out_ex_mem(107 downto 103) & 	-- (70 - 66) saida_mux_rd_rt
					out_ex_mem(102 downto 71) & 	-- (65 - 34) saida_ula
					dado_lido_mem &					-- (33 - 2)
					out_ex_mem(2 downto 0),			-- (1 - 0) sel_mux
					
					
				 q => out_mem_wb, --in do banco de registradores
				 enable => '1',
				 CLK => clk,
				 RST => '0'
        );
		  
		  
		  
		  
		  ------ ============== mux ULA ==============
		  
		  -- TROCAR AS LIGACOES 
		  mux_zero_ext: entity work.muxGenerico2 
        generic map (
            larguraDados => DATA_WIDTH        -- TODO
        )
		port map (
            entradaA => saida_mux_banco_ula,      
            entradaB => ZeroImediateMux,
            seletor  => sel_imed_zero_ext,
            saida    => B      --  oque entra na ula dependendo as cosias 
        ); 
		  
		  
		  mux_extension_tipe: entity work.muxGenerico4 
        generic map (
            larguraDados => DATA_WIDTH     --TODO
        )
		port map (
            entradaA => sinal_ext, --resto das utilidades
            entradaB => (dezeseisZeros & imediato), --instrucoes com or immediate e and imeediate
				entradaC => (imediato & dezeseisZeros), -- instrucoes load upper immediate
				entradaD => (others => '0'),
            seletor  => sel_tipo_extensao,
            saida    => ZeroImediateMux
        ); 
		  
		  
		  
		  -- 
		  
		  
		  
		  
		  
		  
		 

end architecture;
