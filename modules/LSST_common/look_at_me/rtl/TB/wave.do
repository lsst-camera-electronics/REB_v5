onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /reb_interrupt_top_tb/clk
add wave -noupdate /reb_interrupt_top_tb/reset
#TreeUpdate [SetDefaultTree]
#quietly WaveActivateNextPane
add wave -noupdate /reb_interrupt_top_tb/edge_en
add wave -noupdate /reb_interrupt_top_tb/interrupt_bus_in
add wave -noupdate /reb_interrupt_top_tb/interrupt_bus_out
add wave -noupdate /reb_interrupt_top_tb/interrupt_bus_width 
add wave -noupdate /reb_interrupt_top_tb/interrupt_en_out
add wave -noupdate /reb_interrupt_top_tb/mask_bus_in
add wave -noupdate /reb_interrupt_top_tb/mask_bus_in_en
add wave -noupdate /reb_interrupt_top_tb/mask_bus_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {217 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 152
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1312500 ps}
