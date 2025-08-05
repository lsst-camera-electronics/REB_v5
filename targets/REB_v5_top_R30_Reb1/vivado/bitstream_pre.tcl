set RUCKUS_DIR $::env(RUCKUS_DIR)
source -quiet ${RUCKUS_DIR}/vivado/env_var.tcl
source -quiet ${RUCKUS_DIR}/vivado/messages.tcl

set_property BITSTREAM.CONFIG.USERID ${PRJ_VERSION} [current_design]
