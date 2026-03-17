# Advanced Micro Lab – Convolution CNN Project

## Overview

This project implements a Convolutional Neural Network (CNN) for image and keyword recognition tasks on both software (CPU-only) and FPGA-based hardware platforms. The design focuses on exploring the performance of convolution operations using GPIO interfacing and evaluating the benefits and limitations of FPGA acceleration.

---

## Tasks

### Task 1: Small Convolution

* **Input size:** 6 × 6

* **Kernel size:** 3 × 3

* **Data format:**

  * Activations: signed 8-bit two’s complement (carried in 32-bit GPIO writes)
  * Weights: signed 8-bit two’s complement
  * Output: signed 32-bit two’s complement

* **Block Design:** RTL implementation of convolution using GPIO communication between CPU and FPGA.

* **Simulation, Timing, Power, Area Reports:** Generated from Vivado/Vitis environment.

* **Execution:** Output can be observed via the Vitis terminal.

---

### Task 2: Keyword Spotting CNN

* **Input size:** 49 × 10

* **Kernel size:** 10 × 4

* Implemented a CNN-based keyword spotting model using convolution layers.

* **Performance:**

  * Software-only (CPU): ~181 ms
  * FPGA with GPIO interfacing: ~6583.7 ms

> ⚠️ The hardware runtime is significantly slower than expected due to the overhead of serially transferring inputs and weights via GPIO. True hardware acceleration is limited by the interface, not by the FPGA logic. Efficient data transfer methods such as AXI streaming, DMA, or on-chip memory buffering are recommended for future improvements.

---

## Features

* LED indicator for keyword detection: turns on when output is **“GO”**.
* RTL design of CNN layers for FPGA implementation.
* Performance evaluation including timing, power, and area reports.

---

## Tools & Environment

* **Hardware:** FPGA development board (specific board can be mentioned)
* **Software:** Vitis, Vivado
* **Languages:** C/C++ for CPU code, RTL (Verilog/VHDL) for FPGA


