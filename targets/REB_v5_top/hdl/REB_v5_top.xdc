#### Timing constraints ####

#### Define input clocks ####

# clock from the quartz (250 MHz)
create_clock -period 4.000 -name PgpRefClk_P -waveform {0.000 2.000} [get_ports PgpRefClk_P]

#clock form the aux quartz (100 MHz)
create_clock -period 10.000 -name aux_100mhz_clk -waveform {0.000 5.000} [get_ports aux_100mhz_clk_in]

# clock from the external PLL (configurable. Now is 100 MHz)
create_clock -period 10.000 -name jc_100mhz_clk -waveform {0.000 5.000} [get_ports jc_refclk_in_p]

# GTX RX reconstructed clock (156.25 MHz)
create_clock -period 6.400 -name RXOUTCLK_0 -waveform {0.000 3.200} [get_pins LsstSci_0/LsstPgpFrontEnd_Inst/Pgp2bGtx7Fixedlat_Inst/Gtx7Core_1/gtxe2_i/RXOUTCLK]

# GTX TX reconstructed clock (156.25 MHz)
create_clock -period 6.400 -name TXOUTCLK_0 -waveform {0.000 3.200} [get_pins LsstSci_0/LsstPgpFrontEnd_Inst/Pgp2bGtx7Fixedlat_Inst/Gtx7Core_1/gtxe2_i/TXOUTCLK]


#### Renaming Generated clocks (report clock network to see unconstrained clk) ####

# stable clock for GTX (100 MHz from board main quartz)
#create_generated_clock -name stable_clk [get_pins ClockManager_local_100MHz/MmcmGen.U_Mmcm/CLKIN1] -master_clock [get_clocks PgpRefClk_P]

# local clock for front end (100 MHz from RX reconstructed clock)
create_generated_clock -name clk_100_Mhz_local -master_clock RXOUTCLK_0 [get_pins dcm_user_clk_0/inst/mmcm_adv_inst/CLKOUT0]

# local clock for front end (50 MHz from RX reconstructed clock)
create_generated_clock -name clk_50_Mhz -master_clock RXOUTCLK_0 [get_pins dcm_user_clk_0/inst/mmcm_adv_inst/CLKOUT1]

#clocks for 1 wire block genretated from local 100 MHz
#create_generated_clock -name REB_onewire_1Mhz -source [get_pins dcm_user_clk_0/CLK_OUT1] -divide_by 104 [get_pins REB_1wire_sn/clkdivider/clk_gen_reg/Q]
#create_generated_clock -name REB_onewire_50khz -source [get_pins dcm_user_clk_0/CLK_OUT1] -divide_by 20 [get_pins REB_1wire_sn/ow_master_i/jcnt2/pro2.qi_reg[9]/Q]
create_generated_clock -name REB_onewire_1Mhz -source [get_pins dcm_user_clk_0/CLK_OUT1] -divide_by 104 [get_pins REB_1wire_sn/clkdivider/clk_gen_reg/Q]
create_generated_clock -name REB_onewire_50khz -source [get_pins REB_1wire_sn/clkdivider/clk_gen_reg/Q] -divide_by 20 [get_pins {REB_1wire_sn/ow_master_i/jcnt2/pro2.qi_reg[9]/Q}]


#### set clocks interactions ####

# set the input clk for the clk mux as mutually exclusive
set_clock_groups -logically_exclusive -group jc_100mhz_clk -group clk_100_Mhz_local


#set asynchronous clocks

set_clock_groups -asynchronous -group [get_clocks PgpRefClk_P -include_generated_clocks] -group aux_100mhz_clk -group jc_100mhz_clk -group RXOUTCLK_0 -group TXOUTCLK_0 -group {clk_100_Mhz_local clk_50_Mhz} -group {REB_onewire_1Mhz REB_onewire_50khz}


### Pin Assignment ###


## pgp reference clock


#set_property CLOCK_DEDICATED_ROUTE false [get_nets PgpRefClk]


## PGP serial com lines (Bank 116)

#pgp link 0

#pgp link 1
#set_property PACKAGE_PIN B5 [get_ports PgpRx_m]
#set_property PACKAGE_PIN B6 [get_ports PgpRx_p]
#set_property PACKAGE_PIN A3 [get_ports PgpTx_m]
#set_property PACKAGE_PIN A4 [get_ports PgpTx_p]

#Aux clk
#set_property PACKAGE_PIN E17 [get_ports aux_100mhz_clk_in]

#### signals for CCD 1 ####
#CCD ADC (Bank 13)



#ASPIC signals (Bank 32)


#(Bank 13)

#ASPIC control signals




#CCD Clocks signals (Bank 32)







## bias DAC ccd1 (bank 12)




##### signals for CCD 2 ####
##CCD ADC (Bank 15)



##ASPIC signals (Bank 33)


##(Bank 15)
##(Bank 13)

#ASPIC control signals

##CCD Clocks signals (Bank 33)


## bias DAC ccd2 (bank 12)




##### signals for CCD 3 ####
##CCD ADC (Bank 16)



##ASPIC signals (Bank 18)


##(Bank 16)
##(Bank 13)

#ASPIC control signals



##CCD Clocks signals (Bank 34)


## bias DAC ccd3 (bank 12)

##### DREB V & I sensors (Bank 14)  #####
#assigned to unconnected pin
#assigned to unconnected pin


#####Temperature ####
##DREB PCB temperature (Bank 14)


##REB PCB temperature (Bank 16)


##bias and Temp ADC## Bank 12



##CCD temperatures (Bank 14)
# mod to correct a name inversion on the schematics

##### DAC ####
##clock rails DAC (Bank 12)


##Heaters (bank 12)



### Backbias sw
#(Bank15)

### Jitter Cleaner
#(Bank14)
#set_property PACKAGE_PIN F25 [get_ports jc_oe]
#set_property PACKAGE_PIN E21 [get_ports jc_sel0]
#set_property PACKAGE_PIN E22 [get_ports jc_sel1]



#### MISC ####
#Resistors (Bank 13)

#Test Points (Bank 14)

#Led (Bank 13)

# Power on reset (Bank 16)

# Power down CCD ADC opamp (Bank 2)

# sync for power supply (Bank 34)

#REB serial number (Bank 12)




#### set voltages ####

#set_property IOSTANDARD LVDS [get_ports {Pgp*}]
set_property IOSTANDARD LVDS [get_ports ASPIC_r*]
set_property IOSTANDARD LVDS [get_ports ASPIC_clamp*]
set_property IOSTANDARD LVDS [get_ports par_clk*]
set_property IOSTANDARD LVDS [get_ports ser_clk*]
set_property IOSTANDARD LVDS [get_ports reset_gate*]
set_property IOSTANDARD LVDS [get_ports jc_refclk*]
set_property IOSTANDARD LVDS [get_ports gpio_*]



set_property IOSTANDARD LVCMOS33 [get_ports adc_*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_nap_ccd_*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_miso_ccd_*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_ss_*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_spi_reset_ccd_*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_sclk_ccd_*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_mosi_ccd_*]
set_property IOSTANDARD LVCMOS33 [get_ports *C_BIAS*]
set_property IOSTANDARD LVCMOS33 [get_ports LTC2945*]
set_property IOSTANDARD LVCMOS33 [get_ports sda*]
set_property IOSTANDARD LVCMOS33 [get_ports scl*]
set_property IOSTANDARD LVCMOS33 [get_ports bias_t*]
set_property IOSTANDARD LVCMOS33 [get_ports *24ADC]
set_property IOSTANDARD LVCMOS33 [get_ports *RAILS*]
set_property IOSTANDARD LVCMOS33 [get_ports *HTR*]
set_property IOSTANDARD LVCMOS33 [get_ports backbias*]
set_property IOSTANDARD LVCMOS33 [get_ports r_add*]
set_property IOSTANDARD LVCMOS33 [get_ports TEST*]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_pwdn_ccd_*]
#set_property IOSTANDARD LVCMOS33 [get_ports jc_oe]

#### set flash SPI speed ####
#more command options are in UG908 programming and debugging appendix A


#### set hardware configuration ####
## setting to avoid warning CFGBVS in vivado DRC





