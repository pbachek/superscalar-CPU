library ieee;
use ieee.std_logic_1164.all;

entity branch_reg is
port(
    clk    : in  std_logic;
    PC_d   : in  std_logic_vector(0 to 31);
    PCWr_d : in  std_logic;
    PC_q   : out std_logic_vector(0 to 31) := (others => '0');
    PCWr_q : out std_logic := '0'
);
end entity;

architecture rtl of branch_reg is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            PCWr_q <= PCWr_d;
            PC_q <= PC_d;
        end if;
    end process;
end architecture;