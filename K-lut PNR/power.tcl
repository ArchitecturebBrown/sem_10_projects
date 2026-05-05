read_verilog Lut_netlist.v

read_liberty /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
link_design Lut

create_clock -name clk -period 10.0 [get_ports clk]

set_input_delay 2.0 -clock clk [get_ports {a[*]}]
set_input_delay 2.0 -clock clk [get_ports {b[*]}]
set_input_delay 2.0 -clock clk [get_ports {s[*]}]
set_input_delay 2.0 -clock clk [get_ports sync]
set_input_delay 2.0 -clock clk [get_ports reset]

set_output_delay 2.0 -clock clk [get_ports {out[*]}]

set_load 0.5 [get_ports {out[*]}]

set_power_activity -input_port [get_ports {a[*]}] -activity 0.2
set_power_activity -input_port [get_ports {b[*]}] -activity 0.2
set_power_activity -input_port [get_ports {s[*]}] -activity 0.01
set_power_activity -input_port [get_ports sync] -activity 0.05
set_power_activity -input_port [get_ports clk] -activity 1.0
set_power_activity -input_port [get_ports reset] -activity 0.01

report_power > power.rpt