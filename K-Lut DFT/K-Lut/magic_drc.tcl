
#cd  ~/shams_sem10/sta_tut/sky130A/libs.tech/magic
#magic -T sky130A -d XR
lef read /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
lef read  /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
gds read /home/asiclab/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds
def read /home/asiclab/shams_sem10/sta_tut/reports_lab7_aya/final_layout.def
load Lut
gds write /home/asiclab/shams_sem10/sta_tut/reports_lab7_aya/Lut.gds
drc count
drc check
drc count
quit
