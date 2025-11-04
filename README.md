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
  [simulated waveform]
  <img width="1493" height="827" alt="image" src="https://github.com/user-attachments/assets/897261ca-5e4b-4015-b62d-7b41c58d11fc" />

  


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
- after implemting the genus tool we will get the genus tool window from that we can get the schematic view  [schematic view]
- ![WhatsApp Image 2025-10-25 at 11 55 07_f61e69f9](https://github.com/user-attachments/assets/405ba833-5299-49ce-9a17-111953c63461)

- again in terminal generate the reports of area, power,timing 

- - Inspect reports of [report_area](reports/report_area.txt),[report_power](reports/report_power.txt),[report_timing](reports/report_timing.txt)
  - the final report 
<img width="1482" height="733" alt="image" src="https://github.com/user-attachments/assets/e959161a-e909-451a-9217-53d98b084730" />


## Physical Design and Layout in *Cadence Innovus*

The physical design phase converts the synthesized **netlist** into an optimized **layout** that meets timing, power, and area constraints.  
Below is the complete flow used to implement the **16-bit Carry Save Adder (CSA)** using *Cadence Innovus*.

---

### 1. Import Design
- Import synthesized **Verilog netlist**, **SDC constraints**, and **library files (.lib, .lef)**.  
- Load **technology LEF** to define process layers and DRC rules.  
- Set up the design environment and initialize the design.[View netlist source code](reports/carry_save_adder_netlist.v)
  [View output constraints code](reports/carry_save_adder_syn.sdc)
### 2. Floorplanning
- Define core area, aspect ratio, and die size.
- Place I/O pins, macros, and power rings (VDD/VSS).
- Plan power grids and placement blockages if needed.
    [floor planning]
  <img width="1008" height="845" alt="image" src="https://github.com/user-attachments/assets/abc420b7-0021-4d56-a777-2b1013fa52f1" />


### 3. Power Planning
- Generate power and ground rings around the core.
- Add power stripes for uniform power distribution.
 - Perform IR-drop checks and verify connectivity.
    [power planning]
   ![WhatsApp Image 2025-11-04 at 22 26 06_e995f4a6](https://github.com/user-attachments/assets/558efc1f-7652-4e60-8971-21756c72c103)


### 4. Placement
- Place all standard cells automatically using the Innovus placer.
- Run placement optimization to reduce wire length and congestion.
- Verify placement legality (no overlaps or boundary violations).
  
### 5. Routing
- Perform global routing to estimate congestion and routing resources.
- Execute detailed routing to connect all signal and power nets.
- Check for shorts, opens, and antenna effects.
### 6. nano-Route Optimization
- Run Static Timing Analysis (STA) after routing.
- Fix setup/hold violations using cell resizing or buffer insertion.
- Re-check DRC and LVS before final sign-off.
-  [routing]
-  ![WhatsApp Image 2025-11-04 at 22 26 06_5d340ec3](https://github.com/user-attachments/assets/35ca2dbe-0203-4126-af0f-adaf3510bd86)

### 7. Verification and Sign-off
- Generate final DRC and LVS reports to ensure layout correctness.
- Perform timing closure and power verification.
- Confirm zero DRC errors and LVS match with the schematic.
  ### 8. GDSII Generation
- Export the final layout as a GDSII file ready for fabrication.
- Also export LEF and DEF files for integration or verification.
- Optionally, back-annotate parasitics (.spef) for post-layout simulation.
- saveDesign csa_final.enc
- streamOut csa_final.gds -mapFile streamOut.map -merge {stdcell.gds}
  ### 9. Review and Visualization
- Inspect the final layout visually using the Layout Viewer
 - Capture and include screenshots of:
- Floorplan view
- Placed cells[cellview]
- ![WhatsApp Image 2025-11-04 at 22 25 43_72ef429a](https://github.com/user-attachments/assets/ea627941-47b5-4833-8db2-3564fd3e9ed4)

- Routed layout
- Final GDSII view [View output constraints code](reports/carry_save_adder.gds)
- final 3D view[3Dview]
  ![WhatsApp Image 2025-10-25 at 11 55 07_885d0b61](https://github.com/user-attachments/assets/a2213931-c5ef-4b18-b5d0-258a8c36d0b6)

## Comparison of carry save adder  with other adders
| **Parameter**              | **Ripple Carry Adder (RCA)**                                                   | **Carry Save Adder (CSA)**                                                                                 | **Carry Look-Ahead Adder (CLA)**                                 |
| -------------------------- | ------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| **Architecture**           | Serial connection of full adders where each carry propagates to the next stage | Parallel full adders that compute partial sum and carry separately (no carry propagation within the block) | Uses generate and propagate logic to compute carries in parallel |
| **Carry Propagation**      | Sequential — carry ripples through all stages                                  | No carry propagation within the adder; carry saved for next stage                                          | Parallel carry generation — avoids ripple delay                  |
| **Computation Speed**      | Slow (O(n) delay)                                                              | Fast (O(1) delay per bit stage, but requires post-processing)                                              | Very fast (logarithmic O(log n) delay)                           |
| **Delay (16-bit Example)** | ~7–8 ns                                                                        | ~3–4 ns                                                                                                    | ~2–3 ns                                                          |
| **Hardware Complexity**    | Simple — minimal logic                                                         | Moderate — extra adders to save carries                                                                    | High — complex carry logic network                               |
| **Area**                   | Smallest                                                                       | Moderate                                                                                                   | Large (due to additional carry logic)                            |
| **Power Consumption**      | Low                                                                            | Moderate                                                                                                   | High (due to large fan-in gates and more transitions)            |
| **Scalability**            | Scales linearly with bit size (delay increases significantly)                  | Scales well for multi-operand addition                                                                     | Becomes more complex for large bit-widths                        |
| **Best Used For**          | Low-power, simple ALUs                                                         | Fast multi-operand addition (e.g., multipliers, MAC units)                                                 | High-speed arithmetic units (e.g., CPUs, DSPs)                   |
| **Design Complexity**      | Very simple                                                                    | Medium                                                                                                     | Complex                                                          |
| **Implementation Type**    | Ripple-based sequential logic                                                  | Parallel adder array                                                                                       | Parallel carry generation                                        |
| **Overall Performance**    | Slow but area-efficient                                                        | High-speed, area–power tradeoff                                                                            | Highest speed, area-intensive                                    |

## Author

[GURRAM GOWTHAM,Murahari Venkat]




