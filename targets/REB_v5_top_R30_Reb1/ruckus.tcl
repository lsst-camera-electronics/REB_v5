# Load RUCKUS environment and library
source -quiet $::env(RUCKUS_DIR)/vivado_proc.tcl

# Load common and sub-module ruckus.tcl files
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/surf
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/lsst_sci
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/lsst_reb
loadRuckusTcl $::env(PROJ_DIR)/../../common

# Load local Source Code and constraints
loadSource      -path "$::DIR_PATH/hdl/REB_v5_top_R30_Reb1.vhd"
loadConstraints -path "$::DIR_PATH/hdl/REB_v5_top_R30_Reb1_phys.xdc"
loadConstraints -path "$::DIR_PATH/hdl/REB_v5_top_R30_Reb1_time.xdc"
