# Look-Up Table (LUT) Physical Design Flow



## Overview



This project presents Part 2 of the Look-Up Table (LUT) implementation. The objective is to complete the physical design flow of the synthesized LUT design using OpenROAD. The flow includes floorplanning, placement, clock tree synthesis, routing, parasitic extraction, post-layout timing analysis, power analysis, and comparison with the pre-layout results.


---


## Tools and Technologies Used



- Hardware Description Language: Verilog

- Synthesis: Yosys

- Static Timing Analysis: OpenSTA

- Physical Design: OpenROAD

- Technology Library / PDK: Sky130A

- Standard Cell Library: sky130_fd_sc_hd


---



## Design Description



The implemented LUT is a mixed combinational-sequential design. It supports arithmetic and logical operations such as:



- AND

- OR

- Addition

- Subtraction



The design includes combinational logic and registered behavior controlled through the synchronization signal. The synthesized gate-level netlist is used as input to the openROAD physical design flow.

---

## Physical Design Flow
The physical design flow was implemented using `main_flowes the following stages:
1. Reading LEF, Liberty, Verilog netlist, and SDC constraint files
2. Floorplanning
3. IO pin placement
4. Globa
5. Detailed placement
6. Clock tree synthesis using SKY130 clock buffers
7. Tapcell and filler cell insertion
8. Power distribution network generation
9. Global routing
10. Detailed routing
11. Parasitic extraction
12. Post-layout timing and power analysis
13. Final DEF, Verilog, and SPEF generation

---

## Timing Analysis

Pre-layout and post-layout static timing analysis were performed using OpenSTA/OpenROAD.

| Metric | Pre-layout | Post-layout |
|---|---:|---:|
| Setup Slack | 1.16 ns MET | 5.41 ns MET |
| Hold Slack | 1.72 ns MET | 0.84 ns MET |
| WNS | 0.00 ns | 0.00 ns |
| TNS | 0.00 ns | 0.00 ns |
| Critical Setup Path | b[1] → out[4] | b[1] → out[4] |

The results show that both pre-layout and post-layout timing constraints are satisfied.

---

## Power Analysis

Power analysis was performed before and after physical implementation.

| Power Component | Pre-layout | Post-layout |
|---|---:|---:|
| Internal Power | 3.79e-05 W | 1.01e-04 W |
| Switching Power | 1.38e-04 W | 1.57e-04 W |
| Leakage Power | 2.02e-10 W | 3.64e-10 W |
| Total Power | 1.76e-04 W | 2.58e-04 W |

The total power increased after physical implementation due to layout-dependent effects and parasitic extraction.

---

## Area Analysis

| Metric | Pre-layout | Post-layout |
|---|---:|---:|
| Area | 526.7552 µm² | 848 µm² |

The post-layout area is larger because the physical implementation includes additional layout-related cells such as clock buffers, tap cells, filler cells, and routing resources.

---

## DRC Status

The DRC Viewer showed no listed violations after detailed routing. Therefore, the final routed layout is considered DRC-clean for this OpenROAD run.

---

## Generated Output Files

The final physical design flow generated the following important output files:

- `final.def`
- `final.v`
- `final.spef`

---

## Project Files

Important files included in this submission:

- `Lut.v`
- `Lut_tb.v`
- `synth.ys`
- `constraint.sdc`
- `time.tcl`
- `power.tcl`
- `main_flow.tcl`
- `final.def`
- `final.v`
- `final.spef`
- `pre_setup.rpt`
- `pre_hold.rpt`
- `pre_power.rpt`
- `post_setup.rpt`
- `post_hold.rpt`
- `post_power.rpt`

---

## Conclusion

The LUT physical design flow was successfully completed using OpenROAD. The design was floorplanned, placed, clock-tree synthesized, routed, and analyzed after layout. The design meets both setup and hold timing constraints after physical implementation. The final post-layout area is 848 µm² and the total post-layout power is 2.58e-04 W.

---

## Authors

- Shams Tarek
- Aya El Bakri
- Hanna Mounir
