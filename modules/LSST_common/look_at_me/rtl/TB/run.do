vlib work
vmap unisim /home/srusso/vivado_2018_3_libsim/unisim

vcom -93 ../generic_reg_ce_init.vhd
vcom -93 ../generic_reg_ce_init_1.vhd
vcom -93 ../REB_interrupt_top.vhd
vcom -93 REB_interrupt_top_tb.vhd

vsim -voptargs=+acc work.reb_interrupt_top_tb(dut)

#set NumericStdNoWarnings 1
#set StdArithNoWarnings 1

do wave.do
run 1.5us
wave zoomfull
radix -hex



