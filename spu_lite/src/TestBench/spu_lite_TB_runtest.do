SetActiveLib -work
comp -include "$dsn\src\spu_lite.vhd" 
comp -include "$dsn\src\TestBench\spu_lite_TB.vhd" 
asim +access +r TESTBENCH_FOR_spu_lite 
wave 
wave -noreg clk
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\spu_lite_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_spu_lite 
