library ieee;
use ieee.std_logic_1164.all;

library spu_lite;
package spu_lite_pkg is

type unit_t is (
    UNIT_SIMPLE_FIXED1,
    UNIT_SIMPLE_FIXED2,
    UNIT_SINGLE_PRECISION,
    UNIT_BYTE,
    UNIT_PERMUTE,
    UNIT_BRANCH,
    UNIT_LOCAL_STORE
);

type simple_fixed_unit1_op_t is (
    OP_IMMEDIATE_LOAD_HALFWORD,
    OP_IMMEDIATE_LOAD_HALFWORD_UPPER,
    OP_IMMEDIATE_LOAD_WORD,
    OP_IMMEDIATE_LOAD_ADDRESS,
    OP_ADD_HALFWORD,
    OP_ADD_HALFWORD_IMMEDIATE,
    OP_ADD_WORD,
    OP_ADD_WORD_IMMEDIATE,
    OP_SUBTRACT_FROM_HALFWORD,
    OP_SUBTRACT_FROM_HALFWORD_IMMEDIATE,
    OP_SUBTRACT_FROM_WORD,
    OP_SUBTRACT_FROM_WORD_IMMEDIATE,
    OP_COUNT_LEADING_ZEROS,
    OP_AND,
    OP_OR,
    OP_XOR,
    OP_NAND,
    OP_NOR,
    OP_COMPARE_EQUAL_HALFWORD,
    OP_COMPARE_EQUAL_WORD,
    OP_COMPARE_EQUAL_WORD_IMMEDIATE,
    OP_COMPARE_GREATER_THAN_HALFWORD,
    OP_COMPARE_GREATER_THAN_WORD,
    OP_COMPARE_GREATER_THAN_WORD_IMMEDIATE,
    OP_COMPARE_LOGICAL_GREATER_THAN_HALFWORD,
    OP_COMPARE_LOGICAL_GREATER_THAN_WORD,
    OP_COMPARE_LOGICAL_GREATER_THAN_WORD_IMMEDIATE
);

type simple_fixed_unit2_op_t is (
    OP_SHIFT_LEFT_HALFWORD,
    OP_SHIFT_LEFT_HALFWORD_IMMEDIATE,
    OP_SHIFT_LEFT_WORD,
    OP_SHIFT_LEFT_WORD_IMMEDIATE,
    OP_ROTATE_HALFWORD,
    OP_ROTATE_HALFWORD_IMMEDIATE,
    OP_ROTATE_WORD,
    OP_ROTATE_WORD_IMMEDIATE
);

type single_precision_unit_op_t is (
    OP_MULTIPLY,
    OP_MULTIPLY_UNSIGNED,
    OP_MULTIPLY_IMMEDIATE,
    OP_MULTIPLY_UNSIGNED_IMMEDIATE,
    OP_FLOATING_COMPARE_EQUAL,
    OP_FLOATING_COMPARE_GREATER_THAN,
    OP_FLOATING_ADD,
    OP_FLOATING_SUBTRACT,
    OP_FLOATING_MULTIPLY,
    OP_FLOATING_MULTIPLY_AND_ADD,
    OP_CONVERT_SIGNED_INTEGER_TO_FLOATING,
    OP_CONVERT_FLOATING_TO_SIGNED_INTEGER
);

type byte_unit_op_t is (
    OP_COUNT_ONES_IN_BYTES,
    OP_AVERAGE_BYTES,
    OP_ABSOLUTE_DIFFERENCE_OF_BYTES,
    OP_SUM_BYTES_INTO_HALFWORDS
);

type permute_unit_op_t is (
    OP_GATHER_BITS_FROM_BYTES,
    OP_GATHER_BITS_FROM_HALFWORDS,
    OP_GATHER_BITS_FROM_WORDS
);

type branch_unit_op_t is (
    OP_NULL,
    OP_BRANCH_RELATIVE,
    OP_BRANCH_ABSOLUTE,
    OP_BRANCH_INDIRECT,
    OP_BRANCH_IF_NOT_ZERO_WORD,
    OP_BRANCH_IF_ZERO_WORD,
    OP_BRANCH_IF_NOT_ZERO_HALFWORD,
    OP_BRANCH_IF_ZERO_HALFWORD
);

type local_store_unit_op_t is (
    OP_LOAD_QUADWORD_D,
    OP_LOAD_QUADWORD_X,
    OP_LOAD_QUADWORD_A,
    OP_STORE_QUADWORD_D,
    OP_STORE_QUADWORD_X,
    OP_STORE_QUADWORD_A
);

end package;