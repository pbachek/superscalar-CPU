library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library spu_lite;
use spu_lite.spu_lite_pkg.all;

entity local_store_unit is
port(
    clk    : in  std_logic;

    op_sel : in  std_logic_vector(0 to 2);
    A      : in  std_logic_vector(0 to 127);
    B      : in  std_logic_vector(0 to 127);
    T      : in  std_logic_vector(0 to 127);
    Imm    : in  std_logic_vector(0 to 15);
    Result : out std_logic_vector(0 to 127)
);
end entity;

architecture rtl of local_store_unit is

constant LSLR : unsigned(0 to 31) := x"0003FFFF";

type LS_t is array (0 to 2**18-1) of std_logic_vector(0 to 7);

function LS_init (filename : string) return LS_t is
    file text_var : text;
    variable line_var : line;
	variable data : std_logic_vector(0 to 7);
    variable addr : natural := 0;
    variable init : LS_t := (others => (others => '0'));
begin
    -- Initialize local store memory from file
    file_open(text_var, filename, read_mode);
    while not endfile(text_var) loop
        readLine(text_var, line_var);
        for i in 0 to 15 loop
			hread(line_var, data);
            init(addr + i) := data;
        end loop;
        addr := addr + 16;
    end loop;
    file_close(text_var);
    return init;
end function;

signal LS : LS_t := LS_init("ls_init.txt");

signal op : local_store_unit_op_t;

signal LSA : unsigned(0 to 31);

begin

op <= local_store_unit_op_t'val(to_integer(unsigned(op_sel)));

process(all)
begin
    case op is
        when OP_LOAD_QUADWORD_D | OP_STORE_QUADWORD_D =>
            LSA <= resize(unsigned(std_logic_vector(signed(Imm(6 to 15))&"0000" + signed("0"&A(0 to 31)))), 32) and LSLR and x"FFFFFFF0";
        when OP_LOAD_QUADWORD_X | OP_STORE_QUADWORD_X =>
            LSA <= unsigned(A(0 to 31)) + unsigned(B(0 to 31)) and LSLR and x"FFFFFFF0";
        when OP_LOAD_QUADWORD_A | OP_STORE_QUADWORD_A =>
            LSA <= unsigned((0 to 13 => Imm(0)) & Imm(0 to 15) & "00") and LSLR and x"FFFFFFF0";
    end case;
end process;

process(all)
begin
    case op is
    when OP_LOAD_QUADWORD_D | OP_LOAD_QUADWORD_X | OP_LOAD_QUADWORD_A =>
        for i in 0 to 15 loop
            Result(i*8 to i*8+7) <= LS(to_integer(LSA)+i);
        end loop;
    when OP_STORE_QUADWORD_D | OP_STORE_QUADWORD_X | OP_STORE_QUADWORD_A =>
        Result <= (others => '0');
    end case;
end process;

process(clk)
begin
    if rising_edge(clk) then
        case op is
        when OP_LOAD_QUADWORD_D | OP_LOAD_QUADWORD_X | OP_LOAD_QUADWORD_A =>
            null;
        when OP_STORE_QUADWORD_D | OP_STORE_QUADWORD_X | OP_STORE_QUADWORD_A =>
            for i in 0 to 15 loop
                LS(to_integer(LSA)+i) <= T(i*8 to i*8+7);
            end loop;
        end case;
    end if;
end process;

end architecture;