# VHDL Fixed-Point NPU Portfolio (MNIST)

[![VHDL](https://img.shields.io/badge/Language-VHDL-orange.svg)](https://en.wikipedia.org/wiki/VHDL)
[![Target-FPGA](https://img.shields.io/badge/Target-FPGA-blue.svg)]()
[![Target-ASIC](https://img.shields.io/badge/Target-ASIC-green.svg)]()

A high-performance hardware accelerator for Deep Neural Network (DNN) inference, specifically optimized for the MNIST digit recognition task. This project demonstrates a complete silicon realization flow, transitioning from **RTL specification** to a **sign-off ready GDSII layout**.
![asic_layout](https://github.com/user-attachments/assets/35d83fc6-dd9d-4fc9-8118-a104b72f59bf)

## 🎨 Physical Implementation Showcase![Uploading asic_layout.jpg…]()


The figure below shows the final GDSII layout generated using **Cadence Innovus**. The design achieved full routing closure with zero geometry DRC violations.

<p align="center">
  <img src="images/layout_view.png" width="500" title="ASIC Layout View">
  <br>
  <i>Final GDSII Layout: Optimized for 45nm Technology Node</i>
</p>

## 🛠 Technical Highlights

- **Architecture**: 784 → 30 → 30 → 10 → 10 MLP topology featuring pipelined MAC units and local weight storage to minimize off-chip memory access.
- **Precision Strategy**: 16-bit fixed-point arithmetic, achieving **94.4% classification accuracy** while drastically reducing hardware overhead compared to FP32.
- **Inter-layer Streaming**: Implemented a hardwired inter-layer streaming architecture that eliminates intermediate buffering, effectively mitigating the "Memory Wall."
- **Routing Optimization**: Utilized a serialized data transfer mechanism between layers to significantly reduce routing density and congestion.
- **Robust CTS**: Hierarchical Clock Tree Synthesis (CTS) using **Non-Default Rules (NDR)**:
  - **Trunk**: 2W2S rule with **VSS Shielding** on metal layers M7-M10 to ensure signal integrity.
  - **Leaf**: 2W1S rule on M1-M4 to preserve routability in dense standard cell areas.

## 📊 Post-Layout PPA Metrics (Sign-off)

| Category | Specification / Result |
| --- | --- |
| **Technology Node** | 45 nm |
| **Instance Count** | ~251,710 instances |
| **Core Area** | ~0.36 mm² (approx. 600μm x 600μm) |
| **Core Utilization** | 60% |
| **Clock Frequency** | 100 MHz (Target) / **222 MHz (Max Projected)** |
| **Total Power** | 83.74 mW (@100MHz, 0.2 Switching Activity) |
| **Classification Accuracy**| 94.4% (Tested on 1,000 images) |

## 📂 Repository Structure
- `ASIC-based Fixed-Point NPU for MNIST`: Synthesis (Genus) and P&R (Innovus) scripts, SDC constraints, and PPA reports.
- `FPGA-based Fixed-Point NPU for MNIST`: Optimized RTL code for Xilinx/Intel FPGA implementation.
- `miniVGA`: Peripheral logic for real-time inference visualization.
