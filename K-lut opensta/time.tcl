read_verilog Lut_netlist.v

read_liberty /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130B/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

link_design Lut

create_clock -name clk -period 9 [get_ports clk]

# Only synchronous inputs
set_input_delay 2.0 -clock clk [get_ports {a b s sync}]

# Remove async reset from timing
set_false_path -from [get_ports reset]

set_output_delay 2.0 -clock clk [all_outputs]

set_load 0.5 [all_outputs]

# Full timing
report_checks -path_delay max -format full > setup.rpt
report_checks -path_delay min -format full > hold.rpt

# Summary
report_wns > time.rpt
report_tns >> time.rpt