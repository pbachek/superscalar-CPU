library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library spu_lite;
use spu_lite.spu_lite_pkg.all;

	-- Add your library and packages declaration here ...

entity spu_lite_tb is
end spu_lite_tb;

architecture TB_ARCHITECTURE of spu_lite_tb is
	-- Component declaration of the tested unit
	component spu_lite
	port(
		clk : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...
    signal end_sim : boolean := false;

    type regs_t is array (0 to 127) of std_logic_vector(0 to 127);
    alias registers is <<signal UUT.Registers.registers : regs_t>>;

    type LS_t is array (0 to 2**18-1) of std_logic_vector(0 to 7);
    alias LS is <<signal UUT.LSU.LS : LS_t>>;

    alias a_stop is <<signal UUT.a_stop : std_logic>>;
    alias b_stop is <<signal UUT.a_stop : std_logic>>;
    alias A_cache_hit_q is <<signal UUT.A_cache_hit_q : std_logic>>;
    alias B_cache_hit_q is <<signal UUT.B_cache_hit_q : std_logic>>;
    alias PCWr is <<signal UUT.PCWr : std_logic>>;
    alias PCWr_BRU is <<signal UUT.PCWr_BRU : std_logic>>;

begin

    process begin
        clk <= '0';
        while not end_sim loop
            wait for 500ps;
            clk <= not clk;
        end loop;
        wait;
    end process;

    process
        file text_var : text;
        variable line_var : line;
    begin
        -- Wait for stop signal
        wait until rising_edge(clk);
        wait until falling_edge(clk) and a_stop = '1' and b_stop = '1' and A_cache_hit_q = '1' and B_cache_hit_q = '1' and PCWr = '0' and PCWr_BRU = '0';

        -- Wait for pipeline to finish
        for i in 0 to 11 loop
            wait until rising_edge(clk);
        end loop;
        end_sim <= true;

        -- Dump registers to file
        file_open(text_var, "reg_dump.txt", write_mode);
        for i in registers'range loop
            write(line_var, to_hstring(registers(i)));
            writeline(text_var, line_var);
        end loop;
        file_close(text_var);

        -- Dump local store to file
        file_open(text_var, "ls_dump.txt", write_mode);
        for i in LS'range loop
            if i > 0 and i mod 16 = 0 then
                writeline(text_var, line_var);
            end if;
            write(line_var, to_hstring(LS(i)) & " ");
        end loop;
        file_close(text_var);

        report "Test Complete" & CR & LF;
        wait;
    end process;

	-- Unit Under Test port map
	UUT : spu_lite
		port map (
			clk => clk
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_spu_lite of spu_lite_tb is
	for TB_ARCHITECTURE
		for UUT : spu_lite
			use entity spu_lite.spu_lite(rtl);
		end for;
	end for;
end TESTBENCH_FOR_spu_lite;

