SetActiveLib -work
comp -include "$dsn\src\ADD\SUB.vhd" 
comp -include "$dsn\src\TestBench\adder_subtracter_TB.vhd" 
asim +access +r TESTBENCH_FOR_adder_subtracter 
wave 
wave -noreg A
wave -noreg B
wave -noreg Func
wave -noreg Cin
wave -noreg R
wave -noreg Cout
wave -noreg O_F
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\adder_subtracter_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_adder_subtracter 
