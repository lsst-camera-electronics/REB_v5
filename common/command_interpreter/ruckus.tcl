# Load RUCKUS library
source $::env(RUCKUS_PROC_TCL)

# Load Source Code
loadSource -lib common -path "$::DIR_PATH/rtl/REB_v5_commands_package.vhd"
loadSource -lib common -path "$::DIR_PATH/rtl/REB_v5_cmd_interpreter.vhd"
