# 1. Load Layout
set layout [readnet spice /home/asiclab/shams_sem10/sta_tut/Lab8/k_lut_extracted2.spice]

# 2. Load Source (Library then Verilog)
readnet spice "/home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice"
set source [readnet verilog "/home/asiclab/shams_sem10/sta_tut/Lab8/reports_lab7_aya/final_layout.v"]

# 3. Setup File
set setup_file "/home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/netgen/sky130A_setup.tcl"

# 4. Ignore Fillers
foreach cell {fill_1 fill_2 fill_4 fill_8 tapvpwrvgnd_1 decap_3 decap_4 decap_6 decap_8} {
    netgen::ignore class sky130_fd_sc_hd__$cell
}

# 5. Run LVS 
# We use -nosort because the 79 vs 385 mismatch will cause a Segfault otherwise.
lvs "$layout Lut" "$source Lut" $setup_file Lut_lvs.report -nosort