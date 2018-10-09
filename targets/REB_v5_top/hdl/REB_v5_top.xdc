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

# local clock for front end (25 MHz from RX reconstructed clock)
create_generated_clock -name clk_25_Mhz -master_clock RXOUTCLK_0 [get_pins dcm_user_clk_0/inst/mmcm_adv_inst/CLKOUT1]

#clocks for 1 wire block genretated from local 100 MHz
#create_generated_clock -name REB_onewire_1Mhz -source [get_pins dcm_user_clk_0/CLK_OUT1] -divide_by 104 [get_pins REB_1wire_sn/clkdivider/clk_gen_reg/Q]
#create_generated_clock -name REB_onewire_50khz -source [get_pins dcm_user_clk_0/CLK_OUT1] -divide_by 20 [get_pins REB_1wire_sn/ow_master_i/jcnt2/pro2.qi_reg[9]/Q]
create_generated_clock -name REB_onewire_1Mhz -source [get_pins dcm_user_clk_0/CLK_OUT1] -divide_by 104 [get_pins REB_1wire_sn/clkdivider/clk_gen_reg/Q]
create_generated_clock -name REB_onewire_50khz -source [get_pins REB_1wire_sn/clkdivider/clk_gen_reg/Q] -divide_by 20 [get_pins {REB_1wire_sn/ow_master_i/jcnt2/pro2.qi_reg[9]/Q}]


#### set clocks interactions ####

# set the input clk for the clk mux as mutually exclusive
set_clock_groups -logically_exclusive -group jc_100mhz_clk -group clk_100_Mhz_local


#set asynchronous clocks

set_clock_groups -asynchronous -group [get_clocks PgpRefClk_P -include_generated_clocks] -group aux_100mhz_clk -group jc_100mhz_clk -group RXOUTCLK_0 -group TXOUTCLK_0 -group {clk_100_Mhz_local clk_25_Mhz} -group {REB_onewire_1Mhz REB_onewire_50khz}


### Pin Assignment ###


## pgp reference clock

set_property PACKAGE_PIN F6 [get_ports PgpRefClk_P]
set_property PACKAGE_PIN F5 [get_ports PgpRefClk_M]

#set_property CLOCK_DEDICATED_ROUTE false [get_nets PgpRefClk]


## PGP serial com lines (Bank 116)

#pgp link 0
set_property PACKAGE_PIN E3 [get_ports PgpRx_M]
set_property PACKAGE_PIN E4 [get_ports PgpRx_P]
set_property PACKAGE_PIN D1 [get_ports PgpTx_M]
set_property PACKAGE_PIN D2 [get_ports PgpTx_P]

#pgp link 1
#set_property PACKAGE_PIN B5 [get_ports PgpRx_m]
#set_property PACKAGE_PIN B6 [get_ports PgpRx_p]
#set_property PACKAGE_PIN A3 [get_ports PgpTx_m]
#set_property PACKAGE_PIN A4 [get_ports PgpTx_p]

#Aux clk
set_property PACKAGE_PIN F17 [get_ports aux_100mhz_clk_in]
#set_property PACKAGE_PIN E17 [get_ports aux_100mhz_clk_in]

#### signals for CCD 1 ####
#CCD ADC (Bank 13)
set_property PACKAGE_PIN N16 [get_ports adc_cnv_ccd_1]
set_property PACKAGE_PIN K25 [get_ports adc_sck_ccd_1]
set_property PACKAGE_PIN K26 [get_ports {adc_data_t_ccd_1[0]}]
set_property PACKAGE_PIN L24 [get_ports {adc_data_b_ccd_1[0]}]
set_property PACKAGE_PIN M20 [get_ports {adc_data_t_ccd_1[1]}]
set_property PACKAGE_PIN L25 [get_ports {adc_data_b_ccd_1[1]}]
set_property PACKAGE_PIN M25 [get_ports {adc_data_t_ccd_1[2]}]
set_property PACKAGE_PIN M24 [get_ports {adc_data_b_ccd_1[2]}]
set_property PACKAGE_PIN M26 [get_ports {adc_data_t_ccd_1[3]}]
set_property PACKAGE_PIN N24 [get_ports {adc_data_b_ccd_1[3]}]
set_property PACKAGE_PIN R26 [get_ports {adc_data_t_ccd_1[4]}]
set_property PACKAGE_PIN R25 [get_ports {adc_data_b_ccd_1[4]}]
set_property PACKAGE_PIN N19 [get_ports {adc_data_t_ccd_1[5]}]
set_property PACKAGE_PIN N26 [get_ports {adc_data_b_ccd_1[5]}]
set_property PACKAGE_PIN P19 [get_ports {adc_data_t_ccd_1[6]}]
set_property PACKAGE_PIN P24 [get_ports {adc_data_b_ccd_1[6]}]
set_property PACKAGE_PIN P25 [get_ports {adc_data_t_ccd_1[7]}]
set_property PACKAGE_PIN P26 [get_ports {adc_data_b_ccd_1[7]}]



#ASPIC signals (Bank 32)

set_property PACKAGE_PIN AE20 [get_ports ASPIC_r_up_ccd_1_n]
set_property PACKAGE_PIN AD20 [get_ports ASPIC_r_up_ccd_1_p]
set_property PACKAGE_PIN AD19 [get_ports ASPIC_r_down_ccd_1_n]
set_property PACKAGE_PIN AC19 [get_ports ASPIC_r_down_ccd_1_p]
set_property PACKAGE_PIN AC16 [get_ports ASPIC_clamp_ccd_1_n]
set_property PACKAGE_PIN AB16 [get_ports ASPIC_clamp_ccd_1_p]
set_property PACKAGE_PIN Y16 [get_ports ASPIC_reset_ccd_1_n]
set_property PACKAGE_PIN Y15 [get_ports ASPIC_reset_ccd_1_p]

#(Bank 13)
set_property PACKAGE_PIN R22 [get_ports ASPIC_nap_ccd_1]
set_property PACKAGE_PIN N23 [get_ports ASPIC_pwdn_ccd_1]

#ASPIC control signals

set_property PACKAGE_PIN P23 [get_ports ASPIC_miso_ccd_1]
set_property PACKAGE_PIN T24 [get_ports ASPIC_ss_t_ccd_1]
set_property PACKAGE_PIN T25 [get_ports ASPIC_ss_b_ccd_1]
set_property PACKAGE_PIN R23 [get_ports ASPIC_spi_reset_ccd_1]

set_property PACKAGE_PIN M21 [get_ports ASPIC_sclk_ccd_1]
set_property PACKAGE_PIN M22 [get_ports ASPIC_mosi_ccd_1]


#CCD Clocks signals (Bank 32)

set_property PACKAGE_PIN AD14 [get_ports {par_clk_ccd_1_n[0]}]
set_property PACKAGE_PIN AC14 [get_ports {par_clk_ccd_1_p[0]}]
set_property PACKAGE_PIN AA15 [get_ports {par_clk_ccd_1_n[1]}]
set_property PACKAGE_PIN AA14 [get_ports {par_clk_ccd_1_p[1]}]
set_property PACKAGE_PIN AD16 [get_ports {par_clk_ccd_1_p[2]}]
set_property PACKAGE_PIN AE16 [get_ports {par_clk_ccd_1_n[2]}]
set_property PACKAGE_PIN AF19 [get_ports {par_clk_ccd_1_p[3]}]
set_property PACKAGE_PIN AF20 [get_ports {par_clk_ccd_1_n[3]}]


set_property PACKAGE_PIN AE15 [get_ports {ser_clk_ccd_1_n[0]}]
set_property PACKAGE_PIN AD15 [get_ports {ser_clk_ccd_1_p[0]}]
set_property PACKAGE_PIN AF18 [get_ports {ser_clk_ccd_1_n[1]}]
set_property PACKAGE_PIN AE18 [get_ports {ser_clk_ccd_1_p[1]}]
set_property PACKAGE_PIN AF14 [get_ports {ser_clk_ccd_1_p[2]}]
set_property PACKAGE_PIN AF15 [get_ports {ser_clk_ccd_1_n[2]}]


set_property PACKAGE_PIN AF17 [get_ports reset_gate_ccd_1_n]
set_property PACKAGE_PIN AE17 [get_ports reset_gate_ccd_1_p]


## bias DAC ccd1 (bank 12)
set_property PACKAGE_PIN AB24 [get_ports ldac_C_BIAS_ccd_1]
set_property PACKAGE_PIN AA23 [get_ports din_C_BIAS_ccd_1]
set_property PACKAGE_PIN Y23 [get_ports sync_C_BIAS_ccd_1]
set_property PACKAGE_PIN AA24 [get_ports sclk_C_BIAS_ccd_1]




##### signals for CCD 2 ####
##CCD ADC (Bank 15)

set_property PACKAGE_PIN K15 [get_ports adc_cnv_ccd_2]
set_property PACKAGE_PIN C16 [get_ports adc_sck_ccd_2]

set_property PACKAGE_PIN A17 [get_ports {adc_data_t_ccd_2[0]}]
set_property PACKAGE_PIN A18 [get_ports {adc_data_b_ccd_2[0]}]
set_property PACKAGE_PIN B16 [get_ports {adc_data_t_ccd_2[1]}]
set_property PACKAGE_PIN A19 [get_ports {adc_data_b_ccd_2[1]}]
set_property PACKAGE_PIN B19 [get_ports {adc_data_t_ccd_2[2]}]
set_property PACKAGE_PIN B17 [get_ports {adc_data_b_ccd_2[2]}]
set_property PACKAGE_PIN C17 [get_ports {adc_data_t_ccd_2[3]}]
set_property PACKAGE_PIN C19 [get_ports {adc_data_b_ccd_2[3]}]
set_property PACKAGE_PIN J15 [get_ports {adc_data_t_ccd_2[4]}]
set_property PACKAGE_PIN H16 [get_ports {adc_data_b_ccd_2[4]}]
set_property PACKAGE_PIN C18 [get_ports {adc_data_t_ccd_2[5]}]
set_property PACKAGE_PIN D15 [get_ports {adc_data_b_ccd_2[5]}]
set_property PACKAGE_PIN D16 [get_ports {adc_data_t_ccd_2[6]}]
set_property PACKAGE_PIN F15 [get_ports {adc_data_b_ccd_2[6]}]
set_property PACKAGE_PIN G15 [get_ports {adc_data_t_ccd_2[7]}]
set_property PACKAGE_PIN G16 [get_ports {adc_data_b_ccd_2[7]}]

##ASPIC signals (Bank 33)

set_property PACKAGE_PIN AC7 [get_ports ASPIC_r_up_ccd_2_n]
set_property PACKAGE_PIN AB7 [get_ports ASPIC_r_up_ccd_2_p]
set_property PACKAGE_PIN AB9 [get_ports ASPIC_r_down_ccd_2_n]
set_property PACKAGE_PIN AA9 [get_ports ASPIC_r_down_ccd_2_p]
set_property PACKAGE_PIN AD9 [get_ports ASPIC_clamp_ccd_2_n]
set_property PACKAGE_PIN AC9 [get_ports ASPIC_clamp_ccd_2_p]
set_property PACKAGE_PIN AD8 [get_ports ASPIC_reset_ccd_2_n]
set_property PACKAGE_PIN AC8 [get_ports ASPIC_reset_ccd_2_p]

##(Bank 15)
set_property PACKAGE_PIN H17 [get_ports ASPIC_nap_ccd_2]
##(Bank 13)
set_property PACKAGE_PIN N22 [get_ports ASPIC_pwdn_ccd_2]

#ASPIC control signals
set_property PACKAGE_PIN G17 [get_ports ASPIC_miso_ccd_2]
set_property PACKAGE_PIN D19 [get_ports ASPIC_ss_t_ccd_2]
set_property PACKAGE_PIN D20 [get_ports ASPIC_ss_b_ccd_2]
set_property PACKAGE_PIN H18 [get_ports ASPIC_spi_reset_ccd_2]
set_property PACKAGE_PIN E15 [get_ports ASPIC_sclk_ccd_2]
set_property PACKAGE_PIN E16 [get_ports ASPIC_mosi_ccd_2]

##CCD Clocks signals (Bank 33)
set_property PACKAGE_PIN AF8 [get_ports {par_clk_ccd_2_n[0]}]
set_property PACKAGE_PIN AE8 [get_ports {par_clk_ccd_2_p[0]}]
set_property PACKAGE_PIN AF7 [get_ports {par_clk_ccd_2_n[1]}]
set_property PACKAGE_PIN AE7 [get_ports {par_clk_ccd_2_p[1]}]
set_property PACKAGE_PIN AF10 [get_ports {par_clk_ccd_2_p[2]}]
set_property PACKAGE_PIN AF9 [get_ports {par_clk_ccd_2_n[2]}]
set_property PACKAGE_PIN Y11 [get_ports {par_clk_ccd_2_p[3]}]
set_property PACKAGE_PIN Y10 [get_ports {par_clk_ccd_2_n[3]}]

set_property PACKAGE_PIN Y7 [get_ports {ser_clk_ccd_2_n[0]}]
set_property PACKAGE_PIN Y8 [get_ports {ser_clk_ccd_2_p[0]}]
set_property PACKAGE_PIN W9 [get_ports {ser_clk_ccd_2_n[1]}]
set_property PACKAGE_PIN W10 [get_ports {ser_clk_ccd_2_p[1]}]
set_property PACKAGE_PIN V8 [get_ports {ser_clk_ccd_2_p[2]}]
set_property PACKAGE_PIN V7 [get_ports {ser_clk_ccd_2_n[2]}]
set_property PACKAGE_PIN W11 [get_ports reset_gate_ccd_2_n]
set_property PACKAGE_PIN V11 [get_ports reset_gate_ccd_2_p]

## bias DAC ccd2 (bank 12)

set_property PACKAGE_PIN AC23 [get_ports ldac_C_BIAS_ccd_2]
set_property PACKAGE_PIN AA22 [get_ports din_C_BIAS_ccd_2]
set_property PACKAGE_PIN AC24 [get_ports sync_C_BIAS_ccd_2]
set_property PACKAGE_PIN W20 [get_ports sclk_C_BIAS_ccd_2]



##### signals for CCD 3 ####
##CCD ADC (Bank 16)

set_property PACKAGE_PIN J8 [get_ports adc_cnv_ccd_3]
set_property PACKAGE_PIN H9 [get_ports adc_sck_ccd_3]

set_property PACKAGE_PIN A9 [get_ports {adc_data_t_ccd_3[0]}]
set_property PACKAGE_PIN D8 [get_ports {adc_data_b_ccd_3[0]}]
set_property PACKAGE_PIN F8 [get_ports {adc_data_t_ccd_3[1]}]
set_property PACKAGE_PIN D9 [get_ports {adc_data_b_ccd_3[1]}]
set_property PACKAGE_PIN G9 [get_ports {adc_data_t_ccd_3[2]}]
set_property PACKAGE_PIN F9 [get_ports {adc_data_b_ccd_3[2]}]
set_property PACKAGE_PIN G10 [get_ports {adc_data_t_ccd_3[3]}]
set_property PACKAGE_PIN H8 [get_ports {adc_data_b_ccd_3[3]}]
set_property PACKAGE_PIN J13 [get_ports {adc_data_t_ccd_3[4]}]
set_property PACKAGE_PIN J11 [get_ports {adc_data_b_ccd_3[4]}]
set_property PACKAGE_PIN G14 [get_ports {adc_data_t_ccd_3[5]}]
set_property PACKAGE_PIN H11 [get_ports {adc_data_b_ccd_3[5]}]
set_property PACKAGE_PIN H12 [get_ports {adc_data_t_ccd_3[6]}]
set_property PACKAGE_PIN H13 [get_ports {adc_data_b_ccd_3[6]}]
set_property PACKAGE_PIN H14 [get_ports {adc_data_t_ccd_3[7]}]
set_property PACKAGE_PIN J10 [get_ports {adc_data_b_ccd_3[7]}]

##ASPIC signals (Bank 18)

set_property PACKAGE_PIN Y1 [get_ports ASPIC_r_up_ccd_3_n]
set_property PACKAGE_PIN W1 [get_ports ASPIC_r_up_ccd_3_p]
set_property PACKAGE_PIN AC2 [get_ports ASPIC_r_down_ccd_3_n]
set_property PACKAGE_PIN AB2 [get_ports ASPIC_r_down_ccd_3_p]
set_property PACKAGE_PIN AA2 [get_ports ASPIC_clamp_ccd_3_n]
set_property PACKAGE_PIN AA3 [get_ports ASPIC_clamp_ccd_3_p]
set_property PACKAGE_PIN AC1 [get_ports ASPIC_reset_ccd_3_n]
set_property PACKAGE_PIN AB1 [get_ports ASPIC_reset_ccd_3_p]

##(Bank 16)
set_property PACKAGE_PIN E11 [get_ports ASPIC_nap_ccd_3]
##(Bank 13)
set_property PACKAGE_PIN N21 [get_ports ASPIC_pwdn_ccd_3]

#ASPIC control signals

set_property PACKAGE_PIN G11 [get_ports ASPIC_miso_ccd_3]
set_property PACKAGE_PIN F14 [get_ports ASPIC_ss_t_ccd_3]
set_property PACKAGE_PIN F13 [get_ports ASPIC_ss_b_ccd_3]
set_property PACKAGE_PIN D11 [get_ports ASPIC_spi_reset_ccd_3]
set_property PACKAGE_PIN C9 [get_ports ASPIC_sclk_ccd_3]
set_property PACKAGE_PIN B9 [get_ports ASPIC_mosi_ccd_3]


##CCD Clocks signals (Bank 34)
set_property PACKAGE_PIN V1 [get_ports {par_clk_ccd_3_n[0]}]
set_property PACKAGE_PIN V2 [get_ports {par_clk_ccd_3_p[0]}]
set_property PACKAGE_PIN Y2 [get_ports {par_clk_ccd_3_n[1]}]
set_property PACKAGE_PIN Y3 [get_ports {par_clk_ccd_3_p[1]}]
set_property PACKAGE_PIN V4 [get_ports {par_clk_ccd_3_p[2]}]
set_property PACKAGE_PIN W4 [get_ports {par_clk_ccd_3_n[2]}]
set_property PACKAGE_PIN AD1 [get_ports {par_clk_ccd_3_p[3]}]
set_property PACKAGE_PIN AE1 [get_ports {par_clk_ccd_3_n[3]}]

set_property PACKAGE_PIN AF4 [get_ports {ser_clk_ccd_3_n[0]}]
set_property PACKAGE_PIN AF5 [get_ports {ser_clk_ccd_3_p[0]}]
set_property PACKAGE_PIN AE2 [get_ports {ser_clk_ccd_3_n[1]}]
set_property PACKAGE_PIN AE3 [get_ports {ser_clk_ccd_3_p[1]}]
set_property PACKAGE_PIN U2 [get_ports {ser_clk_ccd_3_p[2]}]
set_property PACKAGE_PIN U1 [get_ports {ser_clk_ccd_3_n[2]}]
set_property PACKAGE_PIN AF2 [get_ports reset_gate_ccd_3_n]
set_property PACKAGE_PIN AF3 [get_ports reset_gate_ccd_3_p]

## bias DAC ccd3 (bank 12)
set_property PACKAGE_PIN AD24 [get_ports ldac_C_BIAS_ccd_3]
set_property PACKAGE_PIN AD23 [get_ports din_C_BIAS_ccd_3]
set_property PACKAGE_PIN AB22 [get_ports sync_C_BIAS_ccd_3]
set_property PACKAGE_PIN AC22 [get_ports sclk_C_BIAS_ccd_3]

##### DREB V & I sensors (Bank 14)  #####
set_property PACKAGE_PIN G24 [get_ports LTC2945_SCL]
set_property PACKAGE_PIN F24 [get_ports LTC2945_SDA]
#assigned to unconnected pin
set_property PACKAGE_PIN E25 [get_ports LTC2945n15_SCL]
#assigned to unconnected pin
set_property PACKAGE_PIN D25 [get_ports LTC2945n15_SDA]


#####Temperature ####
##DREB PCB temperature (Bank 14)
set_property PACKAGE_PIN G26 [get_ports sda_temp0]
set_property PACKAGE_PIN G25 [get_ports scl_temp0]


##REB PCB temperature (Bank 16)
set_property PACKAGE_PIN B11 [get_ports sda_temp1]
set_property PACKAGE_PIN B12 [get_ports scl_temp1]
set_property PACKAGE_PIN A14 [get_ports sda_temp2]
set_property PACKAGE_PIN B14 [get_ports scl_temp2]


##bias and Temp ADC## Bank 12
set_property PACKAGE_PIN V22 [get_ports bias_t_adc_miso]
set_property PACKAGE_PIN U21 [get_ports bias_t_adc_cs]
set_property PACKAGE_PIN U24 [get_ports bias_t_adc_sclk]
set_property PACKAGE_PIN U22 [get_ports bias_t_adc_mosi]
set_property PACKAGE_PIN U25 [get_ports bias_t_adc_shdn]

set_property PACKAGE_PIN W23 [get_ports bias_t_adc_sam_mux_en]
set_property PACKAGE_PIN V23 [get_ports bias_t_adc_bias_mux_en]

set_property PACKAGE_PIN V24 [get_ports {bias_t_adc_bias_mux_sel[0]}]
set_property PACKAGE_PIN U26 [get_ports {bias_t_adc_bias_mux_sel[1]}]
set_property PACKAGE_PIN V26 [get_ports {bias_t_adc_bias_mux_sel[2]}]
set_property PACKAGE_PIN C24 [get_ports {bias_t_adc_sam_mux_sel[0]}]
set_property PACKAGE_PIN D21 [get_ports {bias_t_adc_sam_mux_sel[1]}]
set_property PACKAGE_PIN C22 [get_ports {bias_t_adc_sam_mux_sel[2]}]

##CCD temperatures (Bank 14)
# mod to correct a name inversion on the schematics
set_property PACKAGE_PIN D26 [get_ports csb_24ADC]
set_property PACKAGE_PIN A24 [get_ports sclk_24ADC]
set_property PACKAGE_PIN A23 [get_ports din_24ADC]
set_property PACKAGE_PIN B26 [get_ports dout_24ADC]

##### DAC ####
##clock rails DAC (Bank 12)
set_property PACKAGE_PIN AA25 [get_ports ldac_RAILS]
set_property PACKAGE_PIN AB25 [get_ports din_RAILS]
set_property PACKAGE_PIN W26 [get_ports sync_RAILS_dac0]
set_property PACKAGE_PIN V21 [get_ports sync_RAILS_dac1]
set_property PACKAGE_PIN W21 [get_ports sclk_RAILS]


##Heaters (bank 12)

set_property PACKAGE_PIN AC26 [get_ports ldac_HTR]
set_property PACKAGE_PIN Y25 [get_ports din_HTR]
set_property PACKAGE_PIN W24 [get_ports sync_HTR]
set_property PACKAGE_PIN AB26 [get_ports sclk_HTR]


### Backbias sw
#(Bank15)
set_property PACKAGE_PIN L19 [get_ports backbias_clamp]
set_property PACKAGE_PIN J19 [get_ports backbias_ssbe]

### Jitter Cleaner
#(Bank14)
set_property PACKAGE_PIN C21 [get_ports jc_miso]
set_property PACKAGE_PIN B20 [get_ports jc_mosi]
set_property PACKAGE_PIN A20 [get_ports jc_sclk]
set_property PACKAGE_PIN B21 [get_ports jc_cs]
#set_property PACKAGE_PIN F25 [get_ports jc_oe]
set_property PACKAGE_PIN E26 [get_ports jc_reset]
#set_property PACKAGE_PIN E21 [get_ports jc_sel0]
#set_property PACKAGE_PIN E22 [get_ports jc_sel1]
set_property PACKAGE_PIN J26 [get_ports jc_lol]
set_property PACKAGE_PIN H26 [get_ports jc_los0]

set_property PACKAGE_PIN AC18 [get_ports jc_refclk_out_p]
set_property PACKAGE_PIN AD18 [get_ports jc_refclk_out_n]
set_property PACKAGE_PIN AB11 [get_ports jc_refclk_in_p]
set_property PACKAGE_PIN AC11 [get_ports jc_refclk_in_n]

#### Remote Update
#Bank 14
set_property PACKAGE_PIN C23 [get_ports ru_outSpiCsB]
set_property PACKAGE_PIN B24 [get_ports ru_outSpiMosi]
set_property PACKAGE_PIN A25 [get_ports ru_inSpiMiso]
set_property PACKAGE_PIN B22 [get_ports ru_outSpiWpB]
set_property PACKAGE_PIN A22 [get_ports ru_outSpiHoldB]


#### MISC ####
#Resistors (Bank 13)
set_property PACKAGE_PIN R16 [get_ports {r_add[0]}]
set_property PULLUP true [get_ports {r_add[0]}]
set_property PACKAGE_PIN R17 [get_ports {r_add[1]}]
set_property PULLUP true [get_ports {r_add[1]}]
set_property PACKAGE_PIN N18 [get_ports {r_add[2]}]
set_property PULLUP true [get_ports {r_add[2]}]
set_property PACKAGE_PIN M19 [get_ports {r_add[3]}]
set_property PULLUP true [get_ports {r_add[3]}]
set_property PACKAGE_PIN T17 [get_ports {r_add[4]}]
set_property PULLUP true [get_ports {r_add[4]}]
set_property PACKAGE_PIN R18 [get_ports {r_add[5]}]
set_property PULLUP true [get_ports {r_add[5]}]
set_property PACKAGE_PIN P18 [get_ports {r_add[6]}]
set_property PULLUP true [get_ports {r_add[6]}]
set_property PACKAGE_PIN U16 [get_ports {r_add[7]}]
set_property PULLUP true [get_ports {r_add[7]}]

#Test Points (Bank 14)
set_property PACKAGE_PIN J25 [get_ports {TEST[0]}]
set_property PACKAGE_PIN J24 [get_ports {TEST[1]}]
set_property PACKAGE_PIN H24 [get_ports {TEST[2]}]
set_property PACKAGE_PIN H23 [get_ports {TEST[3]}]
set_property PACKAGE_PIN L23 [get_ports {TEST[4]}]
set_property PACKAGE_PIN K23 [get_ports {TEST[5]}]
set_property PACKAGE_PIN J23 [get_ports {TEST[6]}]
set_property PACKAGE_PIN L22 [get_ports {TEST[7]}]
set_property PACKAGE_PIN K22 [get_ports {TEST[8]}]
set_property PACKAGE_PIN H22 [get_ports {TEST[9]}]
set_property PACKAGE_PIN J21 [get_ports {TEST[10]}]
set_property PACKAGE_PIN H21 [get_ports {TEST[11]}]
set_property PACKAGE_PIN G21 [get_ports {TEST[12]}]

#Led (Bank 13)
set_property PACKAGE_PIN T23 [get_ports {TEST_LED[0]}]
set_property PACKAGE_PIN U19 [get_ports {TEST_LED[1]}]
set_property PACKAGE_PIN U20 [get_ports {TEST_LED[2]}]
set_property PACKAGE_PIN T18 [get_ports {TEST_LED[3]}]
set_property PACKAGE_PIN T19 [get_ports {TEST_LED[4]}]
set_property PACKAGE_PIN P16 [get_ports {TEST_LED[5]}]

# Power on reset (Bank 16)
set_property PACKAGE_PIN A15 [get_ports Pwron_Rst_L]

# Power down CCD ADC opamp (Bank 2)
set_property PACKAGE_PIN J14 [get_ports CCD_OPAMP_PD]

# sync for power supply (Bank 34)
set_property PACKAGE_PIN AC6 [get_ports PWR_SYNC1]

#REB serial number (Bank 12)
set_property PACKAGE_PIN A12 [get_ports reb_sn_onewire]

set_property PACKAGE_PIN AB4 [get_ports gpio_n]
set_property PACKAGE_PIN AA4 [get_ports gpio_p]


#### set voltages ####

#set_property IOSTANDARD LVDS [get_ports {Pgp*}]
set_property IOSTANDARD LVDS [get_ports ASPIC_r*]
set_property IOSTANDARD LVDS [get_ports ASPIC_clamp*]
set_property IOSTANDARD LVDS [get_ports par_clk*]
set_property IOSTANDARD LVDS [get_ports ser_clk*]
set_property IOSTANDARD LVDS [get_ports reset_gate*]
set_property IOSTANDARD LVDS [get_ports jc_refclk*]
set_property IOSTANDARD LVDS [get_ports gpio_*]

set_property IOSTANDARD LVCMOS33 [get_ports aux_100mhz_clk_in]


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
set_property IOSTANDARD LVCMOS33 [get_ports Pwron_Rst_L]
set_property IOSTANDARD LVCMOS33 [get_ports CCD_OPAMP_PD]
set_property IOSTANDARD LVCMOS18 [get_ports PWR_SYNC1]
set_property IOSTANDARD LVCMOS33 [get_ports reb_sn_onewire]
set_property IOSTANDARD LVCMOS33 [get_ports ASPIC_pwdn_ccd_*]
set_property IOSTANDARD LVCMOS33 [get_ports jc_miso]
set_property IOSTANDARD LVCMOS33 [get_ports jc_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports jc_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports jc_cs]
set_property IOSTANDARD LVCMOS33 [get_ports jc_los0]
set_property IOSTANDARD LVCMOS33 [get_ports jc_lol]
set_property IOSTANDARD LVCMOS33 [get_ports jc_reset]
#set_property IOSTANDARD LVCMOS33 [get_ports jc_oe]


set_property IOSTANDARD LVCMOS33 [get_ports ru_*]


#### set Bitstream Config Parameters ####

## set flash SPI speed
#more command options are in UG908 programming and debugging appendix A
# set SPI clk speed during boot 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
# set SPI bus width during boot 
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

## watchdog for triggeringring the fallback reboot in  case of error 
set_property BITSTREAM.CONFIG.TIMER_CFG 0x4007A120 [current_design]

## set Flash SPI address width
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]

## set multiboot config
#enalble fallback
set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]

# set jump address at boot time. The FPGA duirng boot will jup to this address
#and load the image that starts form there 
#set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'h00800000 [current_design]

#### set hardware configuration ####
## setting to avoid warning CFGBVS in vivado DRC
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]













