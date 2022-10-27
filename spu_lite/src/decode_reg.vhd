library ieee;
use ieee.std_logic_1164.all;

entity decode_reg is
port(
    clk             : in  std_logic;
    gate_n          : in  std_logic;

    stall_A         : in  std_logic;
    stall_B         : in  std_logic;

    instruction_A_d : in  std_logic_vector(0 to 31);
    instruction_B_d : in  std_logic_vector(0 to 31);

    instruction_A_q : out std_logic_vector(0 to 31);
    instruction_B_q : out std_logic_vector(0 to 31)
);
end entity;

architecture rtl of decode_reg is

signal instruction_A_reg : std_logic_vector(0 to 31) := (others => '0');
signal instruction_B_reg : std_logic_vector(0 to 31) := (others => '0');

begin

    process(all)
    begin
        if gate_n then
            instruction_A_q <= (others => '0');
            instruction_B_q <= (others => '0');
        else
            instruction_A_q <= instruction_A_reg;
            instruction_B_q <= instruction_B_reg;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            instruction_A_reg <= (others => '0') when stall_A else instruction_A_d;
            instruction_B_reg <= (others => '0') when stall_B else instruction_B_d;
        end if;
    end process;

end architecture;
