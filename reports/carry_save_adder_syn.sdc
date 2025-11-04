# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Thu Oct 30 14:43:42 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design carry_save_adder

set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
