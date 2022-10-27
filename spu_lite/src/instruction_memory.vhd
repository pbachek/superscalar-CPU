library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

entity instruction_memory is
port(
    addr : in  std_logic_vector(0 to 31);
    data : out std_logic_vector(0 to 7)
);
end entity;

architecture rtl of instruction_memory is

	type instruction_mem_t is array (0 to 2**16-1) of std_logic_vector(0 to 7);
	signal instruction_mem : instruction_mem_t;

begin

    process
		file instructionFile : text is in "instructions_bin.txt";
		variable instructionLine : line;
		variable instructionData : std_logic_vector(0 to 31);
        variable instructionAddr : natural := 0;
    begin
        instruction_mem <= (others => (others => '0'));
        while not endfile(instructionFile) loop
			readLine(instructionFile, instructionLine);
			read(instructionLine, instructionData);
			instruction_mem(instructionAddr) <= instructionData(0 to 7);
			instruction_mem(instructionAddr + 1) <= instructionData(8 to 15);
			instruction_mem(instructionAddr + 2) <= instructionData(16 to 23);
			instruction_mem(instructionAddr + 3) <= instructionData(24 to 31);
            instructionAddr := instructionAddr + 4;
		end loop;
        file_close(instructionFile);
        wait;
    end process;

    data <= instruction_mem(to_integer(unsigned(addr)));

end architecture;
