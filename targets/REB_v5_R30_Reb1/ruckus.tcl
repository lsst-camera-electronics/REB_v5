# Load RUCKUS environment and library
source -quiet $::env(RUCKUS_DIR)/vivado_proc.tcl

loadRuckusTcl $::env(PROJ_DIR)/../../submodules/surf
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/lsst_sci
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/lsst_reb
loadRuckusTcl $::env(PROJ_DIR)/../../common

loadSource -path "$::DIR_PATH/hdl/REB_v5_R30_Reb1.vhd"
