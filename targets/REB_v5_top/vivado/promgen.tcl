# Target PROMGEN script

# Refer to UG835 write_cfgmem for options

set format     "mcs"
# this command only works if in the xdc file there is the directive to set SPIx4
set inteface   "spix4"
set size       "256"


set APP_PATH "$::env(IMPL_DIR)/$::env(PROJECT).bit"
set loadbit "up 0x00000000 ${APP_PATH}" 
set loaddata "up 0x00FF0000 $::env(IMAGES_DIR)/watchdog_timer_barrier.bin up 0x017F0000 $::env(IMAGES_DIR)/watchdog_timer_barrier.bin up 0x01FF0000 $::env(IMAGES_DIR)/watchdog_timer_barrier.bin"