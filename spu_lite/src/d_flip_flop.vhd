library ieee;
use ieee.std_logic_1164.all;

entity dff is
port(
    clk : in  std_logic;
    d   : in  std_logic;
    q   : out std_logic := '0'
);
end entity;

architecture rtl of dff is
begin

    q <= d when rising_edge(clk);

end architecture;