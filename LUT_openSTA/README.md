# Look-Up Table (LUT) Implementation – Lab Report 6

## Overview

This project presents the design and implementation of a Look-Up Table (LUT) as part of the Advanced Microelectronics Lab. The design focuses on achieving correct functionality, meeting timing constraints, and analyzing power consumption.

## Tools and Technologies Used

* **Hardware Description Language:** Verilog
* **Simulation:** Icarus Verilog
* **Waveform Viewer:** GTKWave
* **Static Timing Analysis:** OpenSTA
* **Technology Library / PDK:** Sky130A

## Design Description

The LUT design is primarily combinational, performing arithmetic and logical operations such as:

* AND
* OR
* Addition
* Subtraction

A single register stage is used to store the output on the clock edge.

## Simulation

The design was verified through simulation using:

* Icarus Verilog for compilation and execution
* GTKWave for waveform visualization

The results confirm that the design behaves as expected.

## Timing Analysis

Timing analysis was performed using OpenSTA:

* Setup Slack: ~ +0.10 ns
* Hold Slack: ~ +2.07 ns
* Worst Negative Slack (WNS): 0.00
* Total Negative Slack (TNS): 0.00

This indicates that the design is fully timing-clean with no violations.

## Power Analysis

Power consumption breakdown:

* Leakage Power: ~99.5%
* Internal Power: ~0.3%
* Switching Power: ~0.2%

Leakage power dominates the overall consumption.

## Design Characteristics

* Combinational Logic: ~73.5%
* Sequential Logic: ~26.5%

This distribution aligns with the nature of the LUT implementation.

## Conclusion

The LUT design is:

* Functionally correct
* Timing compliant
* Successfully verified through simulation

The implementation using the Sky130A PDK demonstrates reliable and efficient performance.

## Authors

* Shams Tarek
* Aya El Bakri
* Hanna Mounir

---
