# Cadence Genus Synthesis TCL Script for 16-bit Carry Save Adder
# This script sets up library paths, reads RTL files, elaborates the design,
# applies SDC timing constraints, performs synthesis optimization,
# and generates reports (area, timing, power) and outputs (netlist, sdf).
# Designed for a standard 90nm digital library and customizable for other processes.
  set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib/
  set_db library slow.lib
  set_db init_hdl_search_path {./carry_save_adder.v}
  read_hdl carry_save_adder.v
  elaborate carry_save_adder
  read_sdc input_constraints.sdc
  syn_generic
  syn_map
  syn_opt
  write_hdl > outputs/carry_save_adder_netlist.v
  write_sdf > outputs/carry_save_adder.sdf
  write_sdc > outputs/carry_save_adder_syn.sdc
  report_area > reports/area.rpt
  report_timing > reports/timing.rpt
  report_power > reports/power.rpt
  gui_show
