set RUCKUS_DIR $::env(RUCKUS_DIR)
source -quiet ${RUCKUS_DIR}/vivado/env_var.tcl

set_property STEPS.WRITE_BITSTREAM.TCL.PRE ${VIVADO_DIR}/bitstream_pre.tcl [get_runs impl_1]
