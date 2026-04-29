# Load RUCKUS environment and library
source -quiet $::env(RUCKUS_DIR)/vivado_proc.tcl

loadRuckusTcl $::env(PROJ_DIR)/../../submodules/surf
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/lsst_sci
loadRuckusTcl $::env(PROJ_DIR)/../../submodules/lsst_reb
loadRuckusTcl $::env(PROJ_DIR)/../../common

loadSource      -path "$::DIR_PATH/hdl/REB_v5_6p4ns_3_seq.vhd"
loadConstraints -path $::env(PROJ_DIR)/../../common/reb_v5_base/rtl/REB_v5_natural_time.xdc
