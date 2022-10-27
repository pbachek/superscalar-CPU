library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity even_rf_reg is
port(
    clk            : in  std_logic;
    gate_n         : in  std_logic;

    Unit_d         : in  std_logic_vector(0 to 2);
    Latency_d      : in  std_logic_vector(0 to 2);
    RegDst_d       : in  std_logic_vector(0 to 6);
    RegWr_d        : in  std_logic;

    op_SFU1_d      : in  std_logic_vector(0 to 4);
    op_SFU2_d      : in  std_logic_vector(0 to 2);
    op_SPU_d       : in  std_logic_vector(0 to 3);
    op_BU_d        : in  std_logic_vector(0 to 1);

    Imm_d          : in  std_logic_vector(0 to 17);
    RA_d           : in  std_logic_vector(0 to 6);
    RB_d           : in  std_logic_vector(0 to 6);
    RC_d           : in  std_logic_vector(0 to 6);

    Unit_q         : out std_logic_vector(0 to 2);
    Latency_q      : out std_logic_vector(0 to 2);
    RegDst_q       : out std_logic_vector(0 to 6);
    RegWr_q        : out std_logic;

    op_SFU1_q      : out std_logic_vector(0 to 4);
    op_SFU2_q      : out std_logic_vector(0 to 2);
    op_SPU_q       : out std_logic_vector(0 to 3);
    op_BU_q        : out std_logic_vector(0 to 1);

    Imm_q          : out std_logic_vector(0 to 17);
    RA_q           : out std_logic_vector(0 to 6);
    RB_q           : out std_logic_vector(0 to 6);
    RC_q           : out std_logic_vector(0 to 6)
);
end entity;

architecture rtl of even_rf_reg is

    signal Unit_reg         : std_logic_vector(0 to 2) := (others => '0');
    signal Latency_reg      : std_logic_vector(0 to 2) := (others => '0');
    signal RegDst_reg       : std_logic_vector(0 to 6) := (others => '0');
    signal RegWr_reg        : std_logic := '0';

    signal op_SFU1_reg      : std_logic_vector(0 to 4) := (others => '0');
    signal op_SFU2_reg      : std_logic_vector(0 to 2) := (others => '0');
    signal op_SPU_reg       : std_logic_vector(0 to 3) := (others => '0');
    signal op_BU_reg        : std_logic_vector(0 to 1) := (others => '0');

    signal Imm_reg          : std_logic_vector(0 to 17) := (others => '0');
    signal RA_reg           : std_logic_vector(0 to 6) := (others => '0');
    signal RB_reg           : std_logic_vector(0 to 6) := (others => '0');
    signal RC_reg           : std_logic_vector(0 to 6) := (others => '0');

begin

    process(all)
    begin
        if gate_n then
            Unit_q    <= (others => '0');
            Latency_q <= (others => '0');
            RegDst_q  <= (others => '0');
            RegWr_q   <= '0';
            op_SFU1_q <= (others => '0');
            op_SFU2_q <= (others => '0');
            op_SPU_q  <= (others => '0');
            op_BU_q   <= (others => '0');
            Imm_q     <= (others => '0');
            RA_q      <= (others => '0');
            RB_q      <= (others => '0');
            RC_q      <= (others => '0');
        else
            Unit_q    <= Unit_reg;
            Latency_q <= Latency_reg;
            RegDst_q  <= RegDst_reg;
            RegWr_q   <= RegWr_reg;
            op_SFU1_q <= op_SFU1_reg;
            op_SFU2_q <= op_SFU2_reg;
            op_SPU_q  <= op_SPU_reg;
            op_BU_q   <= op_BU_reg;
            Imm_q     <= Imm_reg;
            RA_q      <= RA_reg;
            RB_q      <= RB_reg;
            RC_q      <= RC_reg;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            Unit_reg    <= Unit_d;
            Latency_reg <= Latency_d;
            RegDst_reg  <= RegDst_d;
            RegWr_reg   <= RegWr_d;
            op_SFU1_reg <= op_SFU1_d;
            op_SFU2_reg <= op_SFU2_d;
            op_SPU_reg  <= op_SPU_d;
            op_BU_reg   <= op_BU_d;
            Imm_reg     <= Imm_d;
            RA_reg      <= RA_d;
            RB_reg      <= RB_d;
            RC_reg      <= RC_d;
        end if;
    end process;

end architecture;