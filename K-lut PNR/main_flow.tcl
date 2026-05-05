# ============================================================
# main_flow.tcl
# OpenROAD Physical Design Flow for Lut
# Floorplan -> Placement -> CTS -> PDN -> Routing -> Extraction
# ============================================================


# ============================================================
# 1. Read technology and library files
# ============================================================

read_lef /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef

read_lef /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

read_liberty /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib


# ============================================================
# 2. Read synthesized netlist and constraints
# ============================================================

read_verilog Lut_netlist.v

link_design Lut

read_sdc constraint.sdc


# ============================================================
# 3. Initial timing check before physical implementation
# ============================================================

report_checks -path_delay max -format full > openroad_initial_setup.rpt
report_checks -path_delay min -format full > openroad_initial_hold.rpt


# ============================================================
# 4. Floorplanning
# ============================================================

initialize_floorplan -site unithd -utilization 40 -core_space 40

make_tracks

place_pins -hor_layers met3 -ver_layers met4 -random

# Take screenshot here manually from GUI:
# 01_floorplan.png


# ============================================================
# 5. Placement
# ============================================================

global_placement -density 0.5

detailed_placement

check_placement

repair_design

# Take screenshot here manually from GUI:
# 02_after_placement.png


# ============================================================
# 6. Wire RC before CTS
# ============================================================

set_wire_rc -signal -layer met2

set_wire_rc -clock -layer met3

catch { report_clock_skew > pre_cts_clock_skew.rpt }

catch { report_clock_latency > pre_cts_clock_latency.rpt }

# ============================================================
# 7. Clock Tree Synthesis
# ============================================================

clock_tree_synthesis \
  -root_buf sky130_fd_sc_hd__clkbuf_16 \
    -buf_list "sky130_fd_sc_hd__clkbuf_8 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_2"

    catch { report_clock_skew > post_cts_clock_skew.rpt }

    catch { report_clock_latency > post_cts_clock_latency.rpt }

    # Take screenshot from Clock Tree Viewer:
    # 03_clock_tree.png


    # ============================================================
    # 8. Post-CTS placement repair
    # ============================================================

    global_placement -density 0.60

    detailed_placement

    repair_design

    detailed_placement


    # ============================================================
    # 9. Tapcells and filler preparation
    # ============================================================

    tapcell \
      -tapcell_master sky130_fd_sc_hd__tapvpwrvgnd_1 \
        -endcap_master sky130_fd_sc_hd__decap_4
    
    # ============================================================
    # 10. Power grid / PDN
    # ============================================================

    add_global_connection -net VDD -pin_pattern VPWR -power

    add_global_connection -net VSS -pin_pattern VGND -ground

    set_voltage_domain -name CORE -power VDD -ground VSS

    define_pdn_grid -name grid -voltage_domains CORE

    add_pdn_stripe -grid grid -layer met1 -width 0.48 -followpins

    add_pdn_stripe -grid grid -layer met4 -width 1.6 -pitch 50.0

    add_pdn_stripe -grid grid -layer met5 -width 1.6 -pitch 50.0

    add_pdn_connect -grid grid -layers {met1 met4}

    add_pdn_connect -grid grid -layers {met4 met5}

    pdngen


    # ============================================================
    # 11. Routing
    # ============================================================

    set_wire_rc -signal -layer met2

    set_wire_rc -clock -layer met4

    catch { set_routing_layers -signal met1-met5 }

    global_route

    catch { report_global_route_congestion > congestion.rpt }

    detailed_route

    filler_placement {sky130_fd_sc_hd__fill_*}

    # Take final layout screenshot here:
    # 04_final_routed_layout.png


    # ============================================================
    # 12. Parasitic extraction
    # ============================================================

    extract_parasitics -ext_model_file "/home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/openlane/rules.openrcx.sky130A.min.calibre"

    estimate_parasitics -global_routing


    # ============================================================
    # 13. Post-layout timing reports
    # ============================================================

    report_checks -path_delay max -format full > post_setup.rpt

    report_checks -path_delay min -format full > post_hold.rpt

    catch { report_wns > post_timing_summary.rpt }

    catch { report_tns >> post_timing_summary.rpt }

    catch { report_worst_slack -max >> post_timing_summary.rpt }

    catch { report_worst_slack -min >> post_timing_summary.rpt }

    # ============================================================
    # 14. Post-layout power activity
    # ============================================================

    set_power_activity -input_port [get_ports {a[*]}] -activity 0.2

    set_power_activity -input_port [get_ports {b[*]}] -activity 0.2

    set_power_activity -input_port [get_ports {s[*]}] -activity 0.01

    set_power_activity -input_port [get_ports sync] -activity 0.05

    set_power_activity -input_port [get_ports clk] -activity 1.0

    set_power_activity -input_port [get_ports reset] -activity 0.01


    # ============================================================
    # 15. Post-layout power and area reports
    # ============================================================

    report_power > post_power.rpt

    catch { report_design_area > post_area.rpt }


    # ============================================================
    # 16. Final output files
    # ============================================================

    write_def final.def

    write_verilog final.v

    write_spef final.spef

    # Extra copies using the names from your pasted script
    write_def out.def

    write_verilog out.v

   write_spef out.spef