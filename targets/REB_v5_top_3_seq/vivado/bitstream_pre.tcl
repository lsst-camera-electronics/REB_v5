set VIVADO_BUILD_DIR $::env(VIVADO_BUILD_DIR)
source -quiet ${VIVADO_BUILD_DIR}/vivado_env_var_v1.tcl
source -quiet ${VIVADO_BUILD_DIR}/vivado_messages_v1.tcl

set_property BITSTREAM.CONFIG.USERID ${PRJ_VERSION} [current_design]
