read_lef /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

read_verilog Lab6/Lut_netlist.v
read_liberty /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

link_design Lut
read_sdc Lab6/constraint.sdc

# ==========================================
# TASK 1: FLOORPLAN & PLACEMENT
# ==========================================

# 1. Initialize Floorplan
initialize_floorplan \
    -utilization 30 \
    -aspect_ratio 1.0 \
    -core_space 10.0 \
    -site unithd
make_tracks

# 2. IO Pin Placement
place_pins -hor_layers met3 -ver_layers met4 -random

# 4. Power Distribution Network (PDN)
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {VPWR} -power
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {VGND} -ground
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {VPB}
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {VNB}
global_connect

set_voltage_domain -name CORE -power VDD -ground VSS
define_pdn_grid -name grid -voltage_domains CORE

# Standard cell rails
add_pdn_stripe -grid grid -layer met1 -width 0.48 -followpins
# Vertical and Horizontal stripes (Necessary for a robust grid)
add_pdn_stripe -grid grid -layer met4 -width 1.6 -pitch 50.0
add_pdn_stripe -grid grid -layer met5 -width 1.6 -pitch 50.0

add_pdn_connect -grid grid -layers {met1 met4}
add_pdn_connect -grid grid -layers {met4 met5}
pdngen

# 3. Tapcells (Distance added for DRC compliance)
tapcell \
  -tapcell_master sky130_fd_sc_hd__tapvpwrvgnd_1 \
  -endcap_master sky130_fd_sc_hd__decap_4 \
  -distance 13

# 5. Placement
global_placement -density 0.5

detailed_placement \
    -max_displacement {500 500} \
    -report_file_name reports_lab7_aya/1_placement_legalization.rpt

check_placement -verbose
repair_design

# Save Placement State
write_def reports_lab7_aya/1_placement.def
write_db  reports_lab7_aya/1_placement.odb

# ==========================================
# TASK 2: CLOCK TREE SYNTHESIS (CTS)
# ==========================================

# --- ADD BEFORE CTS ---
report_clock_skew > reports_lab7_aya/2_pre_cts_skew.rpt
report_clock_latency > reports_lab7_aya/2_pre_cts_latency.rpt

# 1. Setup Wire RC
set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

# 2. Run CTS
clock_tree_synthesis \
  -root_buf sky130_fd_sc_hd__clkbuf_16 \
  -buf_list "sky130_fd_sc_hd__clkbuf_8 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_2"

# 3. Post-CTS Refinement
set_propagated_clock [all_clocks]

detailed_placement \
    -max_displacement {500 500} \
    -report_file_name reports_lab7_aya/task2_dpl_after_cts.rpt

check_placement -verbose
repair_design

# Post-CTS Reports
report_clock_skew > reports_lab7_aya/2_post_cts_skew.rpt
report_clock_latency > reports_lab7_aya/2_post_cts_latency.rpt
report_design_area > reports_lab7_aya/2_post_cts_area.rpt
report_checks -path_delay max > reports_lab7_aya/2_post_cts_setup.rpt
report_checks -path_delay min > reports_lab7_aya/2_post_cts_hold.rpt

# ==========================================
# Task 3 – Global & Detailed Routing
# ==========================================

set_routing_layers -signal met1-met5

set_wire_rc -signal -layer met2
set_wire_rc -clock  -layer met3

global_route
detailed_route

filler_placement "sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8"

extract_parasitics -ext_model_file "/home/asiclab/.ciel/ciel/sky130/versions/7b70722e33c03fcb5dabcf4d479fb0822d9251c9/sky130A/libs.tech/librelane/rules.openrcx.sky130A.min.calibre"
write_spef reports_lab7_aya/3_post_layout_extraction.spef
read_spef  reports_lab7_aya/3_post_layout_extraction.spef

check_antennas -report_file reports_lab7_aya/antenna.rpt

# Final Post-Route Analysis
report_checks -path_delay max > reports_lab7_aya/3_post_layout_setup.rpt
report_checks -path_delay min > reports_lab7_aya/3_post_layout_hold.rpt
report_clock_skew > reports_lab7_aya/3_post_layout_skew.rpt
report_clock_latency > reports_lab7_aya/3_post_layout_latency.rpt
report_design_area > reports_lab7_aya/3_post_layout_area.rpt
report_power > reports_lab7_aya/3_post_layout_power.rpt

# Comparison Table Data
report_checks -path_delay max -format full_clock_expanded > reports_lab7_aya/3_post_layout_wns.rpt
report_tns > reports_lab7_aya/3_post_layout_tns.rpt

# Save Final Layout Deliverables
write_db  reports_lab7_aya/final_layout.odb
write_def reports_lab7_aya/final_layout.def
write_verilog reports_lab7_aya/final_layout.v
write_spef reports_lab7_aya/final_layout.spef
