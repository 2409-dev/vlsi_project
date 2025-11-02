# VLSI-PROJECT
# 16-BIT CARRY SAVE ADDER -semi-custom ASIC flow using cadence
This project implements a 16-bit carry save adder (CSA) designed and verified through a full semi-custom ASIC flow using Cadence tools, from RTL simulation to synthesis and physical layout.
## DESIGN FLOW
- **the main steps followed are:/**
    -  `RTL development(verilog)`
    -  `functional verification(simVision / Modelsim)`
    -  `synthesis(genus tool implementation)`
    -  `netlist to schematic view`
    -  `place and route(innovus tool implementation)`
    -  `DRC/VERIFY CONNECTIVITY and GDSII Generation`

## Project Structure

- **Verilog/**
  - `carry_save_adder.v` : RTL code for the 16-bit carry save adder.[View carry_save_adder.v source code](carry_save_adder.v)

  - `full_adder.v` : Full adder module used in the CSA.
- **Testbench/**
  - `carry_save_adder_tb.v` : Verilog testbench for functional simulation.[View carry_save_adder.v source code](carry_save_adder_tb.v)
- **TCL/**
  - `run.tcl` : TCL script for synthesis in Cadence Genus.[View run.tcl source code](run.tcl)
- **Constraints/**
  - `input_constraints.sdc` : SDC file defining timing and physical constraints.[View input_constraints.sdc source code](input_constraints.sdc)

## Project Description

The 16-bit carry save adder design inputs three 16-bit binary numbers and outputs sum and carry vectors. The design is modular, built using generically instantiated full adders. The project verifies functionality via simulation, synthesizes RTL into a gate-level netlist, and completes the layout, preparing for fabrication.

This repository includes all source and auxiliary files needed for each phase of the ASIC design flow implemented with Cadence's suite of tools.

## Design and Implementation Flow

The project follows these main steps:

### 1. RTL Simulation with NCLaunch

- Use the NCLaunch tool from Cadence to compile and simulate the Verilog RTL and testbench (`carry_save_adder_tb.v`).
- This simulation step validates functional correctness of the design by generating waveform files (.vcd or .wlf) that can be inspected with waveform viewers.
- Example command inside NCLaunch environmentie incisive tool:
- by opening NCLAUNCH-NEW in terminal with opened cadence tools
  1.next click on the MULTIPLE STEP
  2.create cds.lib
  3.don't include any libraries
  4.save the worklib
  5.A set of tools are shown in the nclaunch window which refer to the VHDL COMPILER,VERILOOG COMPILER,ELABORATOR, SIMULATOR
  6.LAUNCH THE SIMULAtor to get the waveforms.
  [simulated waveform](images/waveform.jpg)


- - Verify output using waveform viewer to check sum and carry signals for various test vectors.

### 2. Synthesis using Cadence Genus

- Implement the synthesis step by running the TCL script `genus.tcl` in the Genus synthesis tool.
- The TCL script performs the following tasks:
- Reads the RTL design files.
- Reads the SDC timing constraints from `input_constraints.sdc`.
- Executes synthesis commands including elaboration, mapping, optimization, and writing out reports.
- This step generates:
- Gate-level netlist
- Timing, power, and area reports
- Schematic view of the synthesized design
- Run Genus with: source run.tcl
- after implemting the genus tool we will get the genus tool window from that we can get the schematic view  [schematic view](images/schematicview.jpg)
- again in terminal generate the reports of area, power,timing 

- - Inspect reports of [report_area](reports/report_area.txt),[report_power](reports/report_power.txt),[report_timing](reports/report_timing.txt)
  - the final report   [report](images/reports.jpg)

### 3. Physical Design and Layout in Cadence Innovus

- Import the synthesized netlist and constraint files into Cadence Innovus for physical design implementation.
- Perform floorplanning, placement, clock tree synthesis (CTS), routing, and optimization.
- Generate the final GDSII layout ready for tape-out.
- Review layout and DRC/LVS reports within Innovus.
- Export LEF, DEF files as necessary for verification and fabrication.

## Constraints

- The `input_constraints.sdc` file configures a 100 MHz clock period, input and output delays, and accounts for clock uncertainty.
- These constraints are critical for timing-driven synthesis and layout.


## Author

[GURRAM GOWTHAM]

## License

Specify your preferred license (e.g., MIT, GPL, or proprietary).

---

This README provides a comprehensive guide to your semi-custom ASIC carry save adder design, describing the key project components and stepwise flow using Cadence tools.


