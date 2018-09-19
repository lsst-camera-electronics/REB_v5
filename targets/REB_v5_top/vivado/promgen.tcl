# Target PROMGEN script

# Refer to UG835 write_cfgmem for options

set format     "mcs"
set inteface   "spix1"
#set inteface   "spix4"
set size       "256"

## test generating a .mcs file with two .bit files 

#set APP_PATH "$::env(IMPL_DIR)/$::env(PROJECT).bit"
#set loadbit "up 0x00000000 ${APP_PATH} up 0x08000000 ${APP_PATH}" 