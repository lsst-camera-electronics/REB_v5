# Load RUCKUS library
source $::env(RUCKUS_PROC_TCL)

# Load Source Code
loadSource -lib common -dir "$::DIR_PATH/rtl/"
loadConstraints        -dir "$::DIR_PATH/rtl/"
