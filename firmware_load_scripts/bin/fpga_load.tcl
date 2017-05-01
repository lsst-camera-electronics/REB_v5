#-----------------------------------------------------------
# This script program the FPGA using vivado
# 
#-----------------------------------------------------------#

open_hw
connect_hw_server -url localhost:3121

current_hw_target [get_hw_targets]
#set the dognle speed 
set_property PARAM.FREQUENCY 30000000 [get_hw_targets]
# set to 12000000 for xilinx dongle
open_hw_target

#    set_property PROGRAM.FILE {./REB_v4_top_102c4005.bit}  [lindex [get_hw_devices] 0]
#set_property PROGRAM.FILE ./[lindex $argv 0]  [lindex [get_hw_devices] 0]

set_property PROGRAM.FILE [lindex $argv 0]  [lindex [get_hw_devices] 0]
puts "unsing file"
puts [lindex $argv 0]

program_hw_devices [lindex [get_hw_devices] 0]

close_hw_target
disconnect_hw_server localhost:3121
close_hw