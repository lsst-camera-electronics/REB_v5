

# StdLib
set_property ASYNC_REG true [get_cells -hierarchical *crossDomainSyncReg_reg*]

# FPGA Port Definitions
set_property PACKAGE_PIN A15 [get_ports Pwron_Rst_L]
set_property IOSTANDARD LVCMOS33 [get_ports Pwron_Rst_L]

# MGT signals
# Ch0
set_property PACKAGE_PIN D2 [get_ports PgpTx_P]

# Ch1
#set_property PACKAGE_PIN B5       [get_ports PgpRx_M]
#set_property PACKAGE_PIN B6       [get_ports PgpRx_P]
#set_property PACKAGE_PIN A3       [get_ports PgpTx_M]
#set_property PACKAGE_PIN A4       [get_ports PgpTx_P]

set_property PACKAGE_PIN F5 [get_ports PgpRefClk_M]

# Test Points and LEDs
set_property PACKAGE_PIN H24 [get_ports Test_3]
set_property PACKAGE_PIN H23 [get_ports Test_2]
set_property PACKAGE_PIN G21 [get_ports Test_1]
set_property PACKAGE_PIN H21 [get_ports Test_0]
set_property IOSTANDARD LVCMOS33 [get_ports Test_3]
set_property IOSTANDARD LVCMOS33 [get_ports Test_2]
set_property IOSTANDARD LVCMOS33 [get_ports Test_1]
set_property IOSTANDARD LVCMOS33 [get_ports Test_0]

set_property PACKAGE_PIN P16 [get_ports TestLed_5]
set_property PACKAGE_PIN T19 [get_ports TestLed_4]
set_property PACKAGE_PIN T18 [get_ports TestLed_3]
set_property PACKAGE_PIN U20 [get_ports TestLed_2]
set_property PACKAGE_PIN U19 [get_ports TestLed_1]
set_property PACKAGE_PIN T23 [get_ports TestLed_0]
set_property IOSTANDARD LVCMOS33 [get_ports TestLed_5]
set_property IOSTANDARD LVCMOS33 [get_ports TestLed_4]
set_property IOSTANDARD LVCMOS33 [get_ports TestLed_3]
set_property IOSTANDARD LVCMOS33 [get_ports TestLed_2]
set_property IOSTANDARD LVCMOS33 [get_ports TestLed_1]
set_property IOSTANDARD LVCMOS33 [get_ports TestLed_0]

set_property PACKAGE_PIN R16 [get_ports R_Addr0]
set_property PACKAGE_PIN R17 [get_ports R_Addr1]
set_property PACKAGE_PIN N18 [get_ports R_Addr2]
set_property PACKAGE_PIN M19 [get_ports R_Addr3]
set_property PACKAGE_PIN T17 [get_ports R_Addr4]
set_property PACKAGE_PIN R18 [get_ports R_Addr5]
set_property PACKAGE_PIN P18 [get_ports R_Addr6]
set_property PACKAGE_PIN U16 [get_ports R_Addr7]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr0]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr1]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr2]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr3]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr4]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr5]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr6]
set_property IOSTANDARD LVCMOS33 [get_ports R_Addr7]

set_property PULLUP true [get_ports R_Addr0]
set_property PULLUP true [get_ports R_Addr1]
set_property PULLUP true [get_ports R_Addr2]
set_property PULLUP true [get_ports R_Addr3]
set_property PULLUP true [get_ports R_Addr4]
set_property PULLUP true [get_ports R_Addr5]
set_property PULLUP true [get_ports R_Addr6]
set_property PULLUP true [get_ports R_Addr7]

# Timing Constraints
# 125 MHz RefClk
#create_clock -name pgpRefClkP -period  8.000 [get_ports {PgpRefClk_P}]
#create_clock -name stableClk  -period 16.000 [get_pins {U_LsstSci/U_PGPCore/IBUFDS_GTE2_Inst/ODIV2}]

# 250 MHz RefClk
create_clock -period 4.000 -name pgpRefClkP [get_ports PgpRefClk_P]
create_clock -period 8.000 -name stableClk [get_pins U_LsstSci/U_PGPCore/IBUFDS_GTE2_Inst/ODIV2]
create_clock -period 6.400 -name gtClk [get_pins U_LsstSci/U_PGPCore/BUFG_2/O]
create_clock -period 6.400 -name pgpClk [get_pins U_LsstSci/U_PGPCore/BUFG_3/O]

create_clock -period 10.000 -name beeClk [get_pins {U_BeeClk/clkOut[0]}]

set_clock_groups -asynchronous -group [get_clocks stableClk] -group [get_clocks gtClk] -group [get_clocks pgpClk] -group [get_clocks beeClk]


# FPGA Hardware Configuration
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

