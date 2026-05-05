create_clock -name clk -period 9 [get_ports clk]

# manually exclude clk (IMPORTANT)
set_input_delay 2.0 -clock clk [get_ports {a b reset s sync}]

set_output_delay 2.0 -clock clk [all_outputs]

set_clock_transition 0.1 [get_clocks clk]

set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 [all_inputs]
set_load 0.5 [all_outputs]


set_false_path -from [get_ports rst_n]