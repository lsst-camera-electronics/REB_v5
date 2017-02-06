
# StdLib
set_property ASYNC_REG true [get_cells -hierarchical *crossDomainSyncReg_reg*]

# MGT signals
set_property PACKAGE_PIN AK6 [get_ports {PgpTxA_P[0]}]

set_property PACKAGE_PIN AF5 [get_ports {PgpRefClk_M[0]}]

# Timing Constraints
# 250 MHz RefClk
create_clock -period 4.000 -name pgpRefClkP [get_ports {PgpRefClk_P[0]}]
create_clock -period 8.000 -name stableClk [get_pins U_rebSim/U_LsstSci/U_PGPCore/IBUFDS_GTE2_Inst/ODIV2]
create_clock -period 6.400 -name gtClk [get_pins U_rebSim/U_LsstSci/U_PGPCore/BUFG_2/O]
create_clock -period 6.400 -name pgpClk [get_pins U_rebSim/U_LsstSci/U_PGPCore/BUFG_3/O]

create_clock -period 10.000 -name beeClk [get_pins {U_rebSim/U_BeeClk/clkOut[0]}]

set_clock_groups -asynchronous -group [get_clocks stableClk] -group [get_clocks gtClk] -group [get_clocks pgpClk] -group [get_clocks beeClk]


# FPGA Hardware Configuration
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]



create_debug_core u_ila_0_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0_0]
set_property port_width 1 [get_debug_ports u_ila_0_0/clk]
connect_debug_port u_ila_0_0/clk [get_nets [list {U_rebSim/U_BeeClk/clkOut[0]}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[0]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[1]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[2]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[3]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[4]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[5]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[6]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[7]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[8]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[9]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[10]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[11]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[12]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[13]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[14]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[15]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[16]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[17]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[18]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[19]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[20]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[21]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[22]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[23]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[24]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[25]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[26]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[27]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[28]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[29]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[30]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataRd[31]}]]
create_debug_core u_ila_1_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1_0]
set_property port_width 1 [get_debug_ports u_ila_1_0/clk]
connect_debug_port u_ila_1_0/clk [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/locClk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_1_0/probe0]
connect_debug_port u_ila_1_0/probe0 [get_nets [list {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[0]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[1]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[2]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[3]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[4]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[5]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[6]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[7]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[8]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[9]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[10]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[11]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[12]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[13]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[14]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxData[15]}]]
create_debug_port u_ila_0_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[0]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[1]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[2]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[3]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[4]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[5]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[6]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[7]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[8]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[9]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[10]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[11]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[12]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[13]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[14]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[15]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[16]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[17]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[18]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[19]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[20]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[21]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[22]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[23]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[24]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[25]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[26]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[27]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[28]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[29]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[30]} {U_rebSim/U_LsstSci/U_LsstSciCore/RegDataWr[31]}]]
create_debug_port u_ila_0_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list U_rebSim/U_LsstSci/U_LsstSciCore/RegAck]]
create_debug_port u_ila_0_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list U_rebSim/U_LsstSci/U_LsstSciCore/RegFail]]
create_debug_port u_ila_0_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list U_rebSim/U_LsstSci/U_LsstSciCore/RegOp]]
create_debug_port u_ila_0_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list U_rebSim/U_LsstSci/U_LsstSciCore/RegReq]]
create_debug_port u_ila_0_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0_0/probe6]
connect_debug_port u_ila_0_0/probe6 [get_nets [list U_rebSim/U_LsstSci/U_LsstSciCore/RegRst]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_1_0/probe1]
connect_debug_port u_ila_1_0/probe1 [get_nets [list {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[0]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[1]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[2]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[3]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[4]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[5]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[6]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[7]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[8]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[9]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[10]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[11]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[12]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[13]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[14]} {U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxData[15]}]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe2]
connect_debug_port u_ila_1_0/probe2 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxEOC]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe3]
connect_debug_port u_ila_1_0/probe3 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxEOF]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe4]
connect_debug_port u_ila_1_0/probe4 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxEOFE]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe5]
connect_debug_port u_ila_1_0/probe5 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxPause]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe6]
connect_debug_port u_ila_1_0/probe6 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxSOC]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe7]
connect_debug_port u_ila_1_0/probe7 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/cellRxSOF]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe8]
connect_debug_port u_ila_1_0/probe8 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxEOC]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe9]
connect_debug_port u_ila_1_0/probe9 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxEOF]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe10]
connect_debug_port u_ila_1_0/probe10 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxEOFE]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe11]
connect_debug_port u_ila_1_0/probe11 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxPause]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe12]
connect_debug_port u_ila_1_0/probe12 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxSOC]]
create_debug_port u_ila_1_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_1_0/probe13]
connect_debug_port u_ila_1_0/probe13 [get_nets [list U_rebSim/U_LsstSci/U_PGPCore/Pgp2Gtx7MultiLane_Inst/Pgp2RxWrapper_1/Pgp2Rx_1/U_Pgp2RxCell/cellRxSOF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_0_clkOut[0]]
