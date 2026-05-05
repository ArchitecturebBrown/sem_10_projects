# K-LUT Physical Design Flow (PNR & CTS)

## Project Overview
This repository contains the full physical design flow for a K-indexed Look-Up Table (K-LUT) using the **OpenROAD** toolchain and the **SKY130** process technology. The project covers the transition from a synthesized gate-level netlist to a fully routed, DRC-clean layout ready for physical verification.

## Lab Objectives
- Perform floorplanning, placement, Clock Tree Synthesis (CTS), and routing for the K-LUT design.
- Analyze post-layout metrics including timing (STA), area, and power consumption.
- Compare post-layout results with pre-layout estimates to understand the impact of physical implementation.

## Physical Design Tasks

### 1. Floorplan & Placement
- **Initialization:** Set floorplan utilization to 40% and placed IO pins around the die boundary.
- **Physical Cells:** Inserted tapcells and welltie cells to prevent latch-up.
- **PDN:** Generated the Power Distribution Network (PDN).
- **Placement:** Executed global and detailed placement of standard cells.

### 2. Clock Tree Synthesis (CTS)
- Built a balanced clock tree using SKY130 clock buffers (`sky130_fd_sc_hd__clkbuf_*`).
- Achieved a rise network latency of **0.05 ns** and fall latency of **0.03 ns**.
- Verified clock tree integrity using the OpenROAD Clock Tree Viewer.

### 3. Global & Detailed Routing
- **Signal Routing:** Performed routing across metal layers met1 through met5.
- **Completion:** Inserted filler cells and performed detailed routing to ensure a DRC-clean design.
- **Verification:** Confirmed zero DRC violations in the final layout.

### 4. Post-Layout Analysis
A comprehensive comparison was performed between the synthesized netlist (Pre-layout) and the final routed design (Post-layout).

| Metric | Pre-layout | Post-layout |
| :--- | :--- | :--- |
| **Worst Setup Slack** | 1.16 ns (MET) | 5.41 ns (MET) |
| **Worst Hold Slack** | 1.72 ns (MET) | 0.84 ns (MET) |
| **WNS / TNS** | 0.00 ns / 0.00 ns | 0.00 ns / 0.00 ns |
| **Critical Path** | b[1] → out[4] | b[1] → out[4] |
| **Design Area** | 526.76 µm² | 848.00 µm² |
| **Total Power** | 0.176 mW | 0.258 mW |

**Key Findings:**
- **Area:** The 61% increase in area is due to the addition of physical implementation elements such as tap cells, filler cells, clock buffers, and routing metal resources.
- **Power:** Total power increased post-layout, with switching power remaining the dominant component.
- **Timing:** Both setup and hold constraints were successfully met post-layout.

## Team Members
- Shams Tarek
- Aya El Bakri
- Hanna Mounir

## Resources
- **GitHub Repository:** [https://github.com/Hanna-Mounir/Advanced_micro_lab](https://github.com/Hanna-Mounir/Advanced_micro_lab)
