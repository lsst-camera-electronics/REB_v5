# Load RUCKUS library
source $::env(RUCKUS_PROC_TCL)

# Load Source Code
loadSource -lib common -dir  "$::DIR_PATH/rtl/"
# Ensure physical constraints are loaded before timing constraints
loadConstraints        -path "$::DIR_PATH/rtl/REB_v5_phys.xdc"
# Load specific timing constraints from tarket ruckus.tcl
# loadConstraints        -path "$::DIR_PATH/rtl/REB_v5_time.xdc"
# loadConstraints        -path "$::DIR_PATH/rtl/REB_v5_natural_time.xdc"
