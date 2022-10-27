library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library spu_lite;
use spu_lite.spu_lite_pkg.all;

entity result_mux is
generic(
    G_UNIT : unit_t;
    G_LATENCY : natural
);
port(
    Unit_sel    : in  std_logic_vector(0 to 2);
    Latency     : in  std_logic_vector(0 to 2);
    Result0     : in  std_logic_vector(0 to 127);
    Result1     : in  std_logic_vector(0 to 127);
    Result      : out std_logic_vector(0 to 127)
);
end entity;

architecture rtl of result_mux is

begin

Result <= Result1 when unit_t'val(to_integer(unsigned(Unit_sel))) = G_UNIT and to_integer(unsigned(Latency)) = G_LATENCY else Result0;

end architecture;