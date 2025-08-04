# Load RUCKUS environment and library
source $::env(RUCKUS_PROC_TCL)

# Load ruckus files
loadRuckusTcl "$::DIR_PATH/command_interpreter"
loadRuckusTcl "$::DIR_PATH/reb_v5_base"
