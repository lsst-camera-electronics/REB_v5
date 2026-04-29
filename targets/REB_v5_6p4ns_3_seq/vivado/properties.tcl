set RUCKUS_DIR $::env(RUCKUS_DIR)
source -quiet ${RUCKUS_DIR}/vivado/env_var.tcl

set_property STEPS.WRITE_BITSTREAM.TCL.PRE ${VIVADO_DIR}/bitstream_pre.tcl [get_runs impl_1]

# Set implementation strategy (per-step directives disabled to give tools more freedom)
set_property strategy Performance_Explore [get_runs impl_1]
