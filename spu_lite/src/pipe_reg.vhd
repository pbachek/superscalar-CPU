library ieee;
use ieee.std_logic_1164.all;

entity pipe_reg is
port(
    clk       : in  std_logic;

    Result_d  : in  std_logic_vector(0 to 127);
    Unit_d    : in  std_logic_vector(0 to 2);
    Latency_d : in  std_logic_vector(0 to 2);
    RegDst_d  : in  std_logic_vector(0 to 6);
    RegWr_d   : in  std_logic;

    Result_q  : out std_logic_vector(0 to 127) := (others => '0');
    Unit_q    : out std_logic_vector(0 to 2) := (others => '0');
    Latency_q : out std_logic_vector(0 to 2) := (others => '0');
    RegDst_q  : out std_logic_vector(0 to 6) := (others => '0');
    RegWr_q   : out std_logic := '0'
);
end entity;

architecture rtl of pipe_reg is
begin

process(clk)
begin
    if rising_edge(clk) then
        Result_q <= Result_d;
        Unit_q <= Unit_d;
        Latency_q <= Latency_d;
        RegDst_q <= RegDst_d;
        RegWr_q <= RegWr_d;
    end if;
end process;

end architecture;