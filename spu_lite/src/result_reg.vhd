library ieee;
use ieee.std_logic_1164.all;

entity result_reg is
port(
    clk : in  std_logic;
    d   : in  std_logic_vector(0 to 127);
    q   : out std_logic_vector(0 to 127) := (others => '0')
);
end entity;

architecture rtl of result_reg is
begin
    q <= d when rising_edge(clk);
end architecture;