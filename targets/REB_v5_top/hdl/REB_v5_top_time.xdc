# External Primary clocks
create_clock -period 4.000 -name PgpRefClk_P -waveform {0.000 2.000} [get_ports PgpRefClk_P]
create_clock -period 10.000 -name jc_100mhz_clk -waveform {0.000 5.000} [get_ports jc_refclk_in_p]
create_clock -period 10.000 -name aux_100mhz_clk -waveform {0.000 5.000} [get_ports aux_100mhz_clk_in]

# Internal Primary clocks
create_clock -period 6.400 -name RXOUTCLK_A -waveform {0.000 3.200} [get_pins LsstSci_0/LsstPgpFrontEnd_Inst/PgpCore[0].Pgp2bGtx7Fixedlat_Inst/Gtx7Core_1/gtxe2_i/RXOUTCLK]
create_clock -period 6.400 -name RXOUTCLK_B -waveform {0.000 3.200} [get_pins LsstSci_0/LsstPgpFrontEnd_Inst/PgpCore[1].Pgp2bGtx7Fixedlat_Inst/Gtx7Core_1/gtxe2_i/RXOUTCLK]
create_clock -period 6.400 -name TXOUTCLK_A -waveform {0.000 3.200} [get_pins LsstSci_0/LsstPgpFrontEnd_Inst/PgpCore[0].Pgp2bGtx7Fixedlat_Inst/Gtx7Core_1/gtxe2_i/TXOUTCLK]
create_clock -period 6.400 -name TXOUTCLK_B -waveform {0.000 3.200} [get_pins LsstSci_0/LsstPgpFrontEnd_Inst/PgpCore[1].Pgp2bGtx7Fixedlat_Inst/Gtx7Core_1/gtxe2_i/TXOUTCLK]

# Local clocks derived from RXOUT clocks
create_generated_clock -name stable_clk -source [get_pins ClockManager_stable_clk/MmcmGen.U_Mmcm/CLKIN1] -master_clock [get_clocks PgpRefClk_P] [get_pins ClockManager_stable_clk/MmcmGen.U_Mmcm/CLKOUT0]
create_generated_clock -name sys_clk_local_from_A -source [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKIN1] -master_clock [get_clocks RXOUTCLK_A] [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKOUT0]
create_generated_clock -name sys_clk_local_from_B -source [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKIN1] -master_clock [get_clocks RXOUTCLK_B] [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKOUT0]
create_generated_clock -name multiboot_clk_from_A -source [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKIN1] -master_clock [get_clocks RXOUTCLK_A] [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKOUT1]
create_generated_clock -name multiboot_clk_from_B -source [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKIN1] -master_clock [get_clocks RXOUTCLK_B] [get_pins ClockManager_sys_clk/MmcmGen.U_Mmcm/CLKOUT1]

#### Set clock interactions ####
# Ensure mutual exclusivity for the RXOUT and derived clocks
set_clock_groups -logically_exclusive -group sys_clk_local_from_A -group sys_clk_local_from_B
set_clock_groups -logically_exclusive -group multiboot_clk_from_A -group multiboot_clk_from_B

# Cover mutual exclusions between A derived and B derived clocks
set_clock_groups -logically_exclusive -group sys_clk_local_from_A -group multiboot_clk_from_B
set_clock_groups -logically_exclusive -group multiboot_clk_from_A -group sys_clk_local_from_B

# Set exclusivity for RXOUT clocks in relation to their derived clocks
set_clock_groups -logically_exclusive -group RXOUTCLK_A -group {sys_clk_local_from_A multiboot_clk_from_A}
set_clock_groups -logically_exclusive -group RXOUTCLK_B -group {sys_clk_local_from_B multiboot_clk_from_B}


#### Set asynchronous clocks ####
set_clock_groups -asynchronous -group stable_clk -group [get_clocks PgpRefClk_P -include_generated_clocks] -group aux_100mhz_clk -group jc_100mhz_clk -group RXOUTCLK_A -group RXOUTCLK_B -group TXOUTCLK_A -group TXOUTCLK_B -group {sys_clk_local_from_A sys_clk_local_from_B multiboot_clk_from_A multiboot_clk_from_B}
