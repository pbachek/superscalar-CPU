library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity odd_rf_reg is
port(
    clk            : in  std_logic;
    gate_n         : in  std_logic;

    Unit_d         : in  std_logic_vector(0 to 2);
    Latency_d      : in  std_logic_vector(0 to 2);
    RegDst_d       : in  std_logic_vector(0 to 6);
    RegWr_d        : in  std_logic;

    op_LSU_d       : in  std_logic_vector(0 to 2);
    op_PU_d        : in  std_logic_vector(0 to 1);
    op_BRU_d       : in  std_logic_vector(0 to 2);

    PC_d           : in  std_logic_vector(0 to 31);

    Imm_d          : in  std_logic_vector(0 to 15);
    RD_d           : in  std_logic_vector(0 to 6);
    RE_d           : in  std_logic_vector(0 to 6);
    RF_d           : in  std_logic_vector(0 to 6);

    Unit_q         : out std_logic_vector(0 to 2);
    Latency_q      : out std_logic_vector(0 to 2);
    RegDst_q       : out std_logic_vector(0 to 6);
    RegWr_q        : out std_logic;

    op_LSU_q       : out std_logic_vector(0 to 2);
    op_PU_q        : out std_logic_vector(0 to 1);
    op_BRU_q       : out std_logic_vector(0 to 2);

    PC_q           : out std_logic_vector(0 to 31);

    Imm_q          : out std_logic_vector(0 to 15);
    RD_q           : out std_logic_vector(0 to 6);
    RE_q           : out std_logic_vector(0 to 6);
    RF_q           : out std_logic_vector(0 to 6)
);
end entity;

architecture rtl of odd_rf_reg is

    signal Unit_reg         : std_logic_vector(0 to 2) := (others => '0');
    signal Latency_reg      : std_logic_vector(0 to 2) := (others => '0');
    signal RegDst_reg       : std_logic_vector(0 to 6) := (others => '0');
    signal RegWr_reg        : std_logic := '0';

    signal op_LSU_reg       : std_logic_vector(0 to 2) := (others => '0');
    signal op_PU_reg        : std_logic_vector(0 to 1) := (others => '0');
    signal op_BRU_reg       : std_logic_vector(0 to 2) := (others => '0');

    signal PC_reg           : std_logic_vector(0 to 31) := (others => '0');

    signal Imm_reg          : std_logic_vector(0 to 15) := (others => '0');
    signal RD_reg           : std_logic_vector(0 to 6) := (others => '0');
    signal RE_reg           : std_logic_vector(0 to 6) := (others => '0');
    signal RF_reg           : std_logic_vector(0 to 6) := (others => '0');

begin

    process(all)
    begin
        if gate_n then
            Unit_q    <= (others => '0');
            Latency_q <= (others => '0');
            RegDst_q  <= (others => '0');
            RegWr_q   <= '0';
            op_LSU_q  <= (others => '0');
            op_PU_q   <= (others => '0');
            op_BRU_q  <= (others => '0');
            Imm_q     <= (others => '0');
            PC_q      <= (others => '0');
            RD_q      <= (others => '0');
            RE_q      <= (others => '0');
            RF_q      <= (others => '0');
        else
            Unit_q    <= Unit_reg;
            Latency_q <= Latency_reg;
            RegDst_q  <= RegDst_reg;
            RegWr_q   <= RegWr_reg;
            op_LSU_q  <= op_LSU_reg;
            op_PU_q   <= op_PU_reg;
            op_BRU_q  <= op_BRU_reg;
            Imm_q     <= Imm_reg;
            PC_q      <= PC_reg;
            RD_q      <= RD_reg;
            RE_q      <= RE_reg;
            RF_q      <= RF_reg;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            Unit_reg    <= Unit_d;
            Latency_reg <= Latency_d;
            RegDst_reg  <= RegDst_d;
            RegWr_reg   <= RegWr_d;
            op_LSU_reg  <= op_LSU_d;
            op_PU_reg   <= op_PU_d;
            op_BRU_reg  <= op_BRU_d;
            Imm_reg     <= Imm_d;
            PC_reg      <= PC_d;
            RD_reg      <= RD_d;
            RE_reg      <= RE_d;
            RF_reg      <= RF_d;
        end if;
    end process;

end architecture;