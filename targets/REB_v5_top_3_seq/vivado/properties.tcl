set VIVADO_BUILD_DIR $::env(VIVADO_BUILD_DIR)
source -quiet ${VIVADO_BUILD_DIR}/vivado_env_var_v1.tcl

set_property STEPS.WRITE_BITSTREAM.TCL.PRE ${VIVADO_DIR}/bitstream_pre.tcl [get_runs impl_1]
