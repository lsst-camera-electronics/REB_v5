// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
// Date        : Fri Sep 14 12:26:21 2018
// Host        : srusso-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx_prj/test_spiflash_programmer_multiboot/ipcore_dir_vivado/bitfile_fifo_in/bitfile_fifo_in_sim_netlist.v
// Design      : bitfile_fifo_in
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bitfile_fifo_in,fifo_generator_v13_0_0,{}" *) (* core_generation_info = "bitfile_fifo_in,fifo_generator_v13_0_0,{x_ipProduct=Vivado 2015.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=fifo_generator,x_ipVersion=13.0,x_ipCoreRevision=0,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_COMMON_CLOCK=0,C_COUNT_TYPE=0,C_DATA_COUNT_WIDTH=9,C_DEFAULT_VALUE=BlankString,C_DIN_WIDTH=32,C_DOUT_RST_VAL=0,C_DOUT_WIDTH=32,C_ENABLE_RLOCS=0,C_FAMILY=kintex7,C_FULL_FLAGS_RST_VAL=0,C_HAS_ALMOST_EMPTY=0,C_HAS_ALMOST_FULL=0,C_HAS_BACKUP=0,C_HAS_DATA_COUNT=0,C_HAS_INT_CLK=0,C_HAS_MEMINIT_FILE=0,C_HAS_OVERFLOW=0,C_HAS_RD_DATA_COUNT=0,C_HAS_RD_RST=0,C_HAS_RST=1,C_HAS_SRST=0,C_HAS_UNDERFLOW=0,C_HAS_VALID=0,C_HAS_WR_ACK=0,C_HAS_WR_DATA_COUNT=0,C_HAS_WR_RST=0,C_IMPLEMENTATION_TYPE=2,C_INIT_WR_PNTR_VAL=0,C_MEMORY_TYPE=2,C_MIF_FILE_NAME=BlankString,C_OPTIMIZATION_MODE=0,C_OVERFLOW_LOW=0,C_PRELOAD_LATENCY=0,C_PRELOAD_REGS=1,C_PRIM_FIFO_TYPE=512x36,C_PROG_EMPTY_THRESH_ASSERT_VAL=4,C_PROG_EMPTY_THRESH_NEGATE_VAL=5,C_PROG_EMPTY_TYPE=0,C_PROG_FULL_THRESH_ASSERT_VAL=511,C_PROG_FULL_THRESH_NEGATE_VAL=510,C_PROG_FULL_TYPE=0,C_RD_DATA_COUNT_WIDTH=9,C_RD_DEPTH=512,C_RD_FREQ=1,C_RD_PNTR_WIDTH=9,C_UNDERFLOW_LOW=0,C_USE_DOUT_RST=1,C_USE_ECC=0,C_USE_EMBEDDED_REG=0,C_USE_PIPELINE_REG=0,C_POWER_SAVING_MODE=0,C_USE_FIFO16_FLAGS=0,C_USE_FWFT_DATA_COUNT=0,C_VALID_LOW=0,C_WR_ACK_LOW=0,C_WR_DATA_COUNT_WIDTH=9,C_WR_DEPTH=512,C_WR_FREQ=1,C_WR_PNTR_WIDTH=9,C_WR_RESPONSE_LATENCY=1,C_MSGON_VAL=1,C_ENABLE_RST_SYNC=1,C_EN_SAFETY_CKT=0,C_ERROR_INJECTION_TYPE=0,C_SYNCHRONIZER_STAGE=2,C_INTERFACE_TYPE=0,C_AXI_TYPE=1,C_HAS_AXI_WR_CHANNEL=1,C_HAS_AXI_RD_CHANNEL=1,C_HAS_SLAVE_CE=0,C_HAS_MASTER_CE=0,C_ADD_NGC_CONSTRAINT=0,C_USE_COMMON_OVERFLOW=0,C_USE_COMMON_UNDERFLOW=0,C_USE_DEFAULT_SETTINGS=0,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=64,C_AXI_LEN_WIDTH=8,C_AXI_LOCK_WIDTH=1,C_HAS_AXI_ID=0,C_HAS_AXI_AWUSER=0,C_HAS_AXI_WUSER=0,C_HAS_AXI_BUSER=0,C_HAS_AXI_ARUSER=0,C_HAS_AXI_RUSER=0,C_AXI_ARUSER_WIDTH=1,C_AXI_AWUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_HAS_AXIS_TDATA=1,C_HAS_AXIS_TID=0,C_HAS_AXIS_TDEST=0,C_HAS_AXIS_TUSER=1,C_HAS_AXIS_TREADY=1,C_HAS_AXIS_TLAST=0,C_HAS_AXIS_TSTRB=0,C_HAS_AXIS_TKEEP=0,C_AXIS_TDATA_WIDTH=8,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_AXIS_TUSER_WIDTH=4,C_AXIS_TSTRB_WIDTH=1,C_AXIS_TKEEP_WIDTH=1,C_WACH_TYPE=0,C_WDCH_TYPE=0,C_WRCH_TYPE=0,C_RACH_TYPE=0,C_RDCH_TYPE=0,C_AXIS_TYPE=0,C_IMPLEMENTATION_TYPE_WACH=1,C_IMPLEMENTATION_TYPE_WDCH=1,C_IMPLEMENTATION_TYPE_WRCH=1,C_IMPLEMENTATION_TYPE_RACH=1,C_IMPLEMENTATION_TYPE_RDCH=1,C_IMPLEMENTATION_TYPE_AXIS=1,C_APPLICATION_TYPE_WACH=0,C_APPLICATION_TYPE_WDCH=0,C_APPLICATION_TYPE_WRCH=0,C_APPLICATION_TYPE_RACH=0,C_APPLICATION_TYPE_RDCH=0,C_APPLICATION_TYPE_AXIS=0,C_PRIM_FIFO_TYPE_WACH=512x36,C_PRIM_FIFO_TYPE_WDCH=1kx36,C_PRIM_FIFO_TYPE_WRCH=512x36,C_PRIM_FIFO_TYPE_RACH=512x36,C_PRIM_FIFO_TYPE_RDCH=1kx36,C_PRIM_FIFO_TYPE_AXIS=1kx18,C_USE_ECC_WACH=0,C_USE_ECC_WDCH=0,C_USE_ECC_WRCH=0,C_USE_ECC_RACH=0,C_USE_ECC_RDCH=0,C_USE_ECC_AXIS=0,C_ERROR_INJECTION_TYPE_WACH=0,C_ERROR_INJECTION_TYPE_WDCH=0,C_ERROR_INJECTION_TYPE_WRCH=0,C_ERROR_INJECTION_TYPE_RACH=0,C_ERROR_INJECTION_TYPE_RDCH=0,C_ERROR_INJECTION_TYPE_AXIS=0,C_DIN_WIDTH_WACH=32,C_DIN_WIDTH_WDCH=64,C_DIN_WIDTH_WRCH=2,C_DIN_WIDTH_RACH=32,C_DIN_WIDTH_RDCH=64,C_DIN_WIDTH_AXIS=1,C_WR_DEPTH_WACH=16,C_WR_DEPTH_WDCH=1024,C_WR_DEPTH_WRCH=16,C_WR_DEPTH_RACH=16,C_WR_DEPTH_RDCH=1024,C_WR_DEPTH_AXIS=1024,C_WR_PNTR_WIDTH_WACH=4,C_WR_PNTR_WIDTH_WDCH=10,C_WR_PNTR_WIDTH_WRCH=4,C_WR_PNTR_WIDTH_RACH=4,C_WR_PNTR_WIDTH_RDCH=10,C_WR_PNTR_WIDTH_AXIS=10,C_HAS_DATA_COUNTS_WACH=0,C_HAS_DATA_COUNTS_WDCH=0,C_HAS_DATA_COUNTS_WRCH=0,C_HAS_DATA_COUNTS_RACH=0,C_HAS_DATA_COUNTS_RDCH=0,C_HAS_DATA_COUNTS_AXIS=0,C_HAS_PROG_FLAGS_WACH=0,C_HAS_PROG_FLAGS_WDCH=0,C_HAS_PROG_FLAGS_WRCH=0,C_HAS_PROG_FLAGS_RACH=0,C_HAS_PROG_FLAGS_RDCH=0,C_HAS_PROG_FLAGS_AXIS=0,C_PROG_FULL_TYPE_WACH=0,C_PROG_FULL_TYPE_WDCH=0,C_PROG_FULL_TYPE_WRCH=0,C_PROG_FULL_TYPE_RACH=0,C_PROG_FULL_TYPE_RDCH=0,C_PROG_FULL_TYPE_AXIS=0,C_PROG_FULL_THRESH_ASSERT_VAL_WACH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WRCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_RACH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_RDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_AXIS=1023,C_PROG_EMPTY_TYPE_WACH=0,C_PROG_EMPTY_TYPE_WDCH=0,C_PROG_EMPTY_TYPE_WRCH=0,C_PROG_EMPTY_TYPE_RACH=0,C_PROG_EMPTY_TYPE_RDCH=0,C_PROG_EMPTY_TYPE_AXIS=0,C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS=1022,C_REG_SLICE_MODE_WACH=0,C_REG_SLICE_MODE_WDCH=0,C_REG_SLICE_MODE_WRCH=0,C_REG_SLICE_MODE_RACH=0,C_REG_SLICE_MODE_RDCH=0,C_REG_SLICE_MODE_AXIS=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "fifo_generator_v13_0_0,Vivado 2015.3" *) 
(* NotValidForBitStream *)
module bitfile_fifo_in
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) 
  bitfile_fifo_in_fifo_generator_v13_0_0 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "clk_x_pntrs" *) 
module bitfile_fifo_in_clk_x_pntrs
   (ram_empty_fb_i_reg,
    WR_PNTR_RD,
    v1_reg,
    v1_reg_0,
    RD_PNTR_WR,
    v1_reg_1,
    Q,
    \gc0.count_reg[7] ,
    \gic0.gc0.count_d1_reg[7] ,
    \gic0.gc0.count_reg[7] ,
    \gic0.gc0.count_d2_reg[8] ,
    \gc0.count_d1_reg[0]_rep ,
    \gc0.count_d1_reg[1]_rep ,
    \gc0.count_d1_reg[2]_rep ,
    \gc0.count_d1_reg[3]_rep ,
    \gc0.count_d1_reg[4]_rep ,
    \gc0.count_d1_reg[5]_rep ,
    wr_clk,
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ,
    rd_clk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] );
  output ram_empty_fb_i_reg;
  output [8:0]WR_PNTR_RD;
  output [3:0]v1_reg;
  output [3:0]v1_reg_0;
  output [0:0]RD_PNTR_WR;
  output [3:0]v1_reg_1;
  input [2:0]Q;
  input [7:0]\gc0.count_reg[7] ;
  input [7:0]\gic0.gc0.count_d1_reg[7] ;
  input [7:0]\gic0.gc0.count_reg[7] ;
  input [8:0]\gic0.gc0.count_d2_reg[8] ;
  input \gc0.count_d1_reg[0]_rep ;
  input \gc0.count_d1_reg[1]_rep ;
  input \gc0.count_d1_reg[2]_rep ;
  input \gc0.count_d1_reg[3]_rep ;
  input \gc0.count_d1_reg[4]_rep ;
  input \gc0.count_d1_reg[5]_rep ;
  input wr_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ;
  input rd_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  wire [2:0]Q;
  wire [0:0]RD_PNTR_WR;
  wire [8:0]WR_PNTR_RD;
  wire \gc0.count_d1_reg[0]_rep ;
  wire \gc0.count_d1_reg[1]_rep ;
  wire \gc0.count_d1_reg[2]_rep ;
  wire \gc0.count_d1_reg[3]_rep ;
  wire \gc0.count_d1_reg[4]_rep ;
  wire \gc0.count_d1_reg[5]_rep ;
  wire [7:0]\gc0.count_reg[7] ;
  wire [7:0]\gic0.gc0.count_d1_reg[7] ;
  wire [8:0]\gic0.gc0.count_d2_reg[8] ;
  wire [7:0]\gic0.gc0.count_reg[7] ;
  wire \gsync_stage[2].wr_stg_inst_n_1 ;
  wire \gsync_stage[2].wr_stg_inst_n_2 ;
  wire \gsync_stage[2].wr_stg_inst_n_3 ;
  wire \gsync_stage[2].wr_stg_inst_n_4 ;
  wire \gsync_stage[2].wr_stg_inst_n_5 ;
  wire \gsync_stage[2].wr_stg_inst_n_6 ;
  wire \gsync_stage[2].wr_stg_inst_n_7 ;
  wire \gsync_stage[2].wr_stg_inst_n_8 ;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;
  wire [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ;
  wire [7:0]p_0_in;
  wire [7:0]p_0_in7_out;
  wire [7:0]p_0_out;
  wire [8:8]p_0_out_0;
  wire [8:8]p_1_out;
  wire [8:0]p_2_out;
  wire [8:0]p_3_out;
  wire ram_empty_fb_i_reg;
  wire rd_clk;
  wire [8:0]rd_pntr_gc;
  wire \rd_pntr_gc[0]_i_1_n_0 ;
  wire \rd_pntr_gc[1]_i_1_n_0 ;
  wire \rd_pntr_gc[2]_i_1_n_0 ;
  wire \rd_pntr_gc[3]_i_1_n_0 ;
  wire \rd_pntr_gc[4]_i_1_n_0 ;
  wire \rd_pntr_gc[5]_i_1_n_0 ;
  wire \rd_pntr_gc[6]_i_1_n_0 ;
  wire \rd_pntr_gc[7]_i_1_n_0 ;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]v1_reg_1;
  wire wr_clk;
  wire [8:0]wr_pntr_gc;

  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(WR_PNTR_RD[1]),
        .I1(\gc0.count_reg[7] [1]),
        .I2(WR_PNTR_RD[0]),
        .I3(\gc0.count_reg[7] [0]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(p_0_out[1]),
        .I1(\gic0.gc0.count_d1_reg[7] [1]),
        .I2(p_0_out[0]),
        .I3(\gic0.gc0.count_d1_reg[7] [0]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(p_0_out[1]),
        .I1(\gic0.gc0.count_reg[7] [1]),
        .I2(p_0_out[0]),
        .I3(\gic0.gc0.count_reg[7] [0]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(WR_PNTR_RD[3]),
        .I1(\gc0.count_reg[7] [3]),
        .I2(WR_PNTR_RD[2]),
        .I3(\gc0.count_reg[7] [2]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(p_0_out[3]),
        .I1(\gic0.gc0.count_d1_reg[7] [3]),
        .I2(p_0_out[2]),
        .I3(\gic0.gc0.count_d1_reg[7] [2]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(p_0_out[3]),
        .I1(\gic0.gc0.count_reg[7] [3]),
        .I2(p_0_out[2]),
        .I3(\gic0.gc0.count_reg[7] [2]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(WR_PNTR_RD[5]),
        .I1(\gc0.count_reg[7] [5]),
        .I2(WR_PNTR_RD[4]),
        .I3(\gc0.count_reg[7] [4]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(p_0_out[5]),
        .I1(\gic0.gc0.count_d1_reg[7] [5]),
        .I2(p_0_out[4]),
        .I3(\gic0.gc0.count_d1_reg[7] [4]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(p_0_out[5]),
        .I1(\gic0.gc0.count_reg[7] [5]),
        .I2(p_0_out[4]),
        .I3(\gic0.gc0.count_reg[7] [4]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(WR_PNTR_RD[7]),
        .I1(\gc0.count_reg[7] [7]),
        .I2(WR_PNTR_RD[6]),
        .I3(\gc0.count_reg[7] [6]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(p_0_out[7]),
        .I1(\gic0.gc0.count_d1_reg[7] [7]),
        .I2(p_0_out[6]),
        .I3(\gic0.gc0.count_d1_reg[7] [6]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(p_0_out[7]),
        .I1(\gic0.gc0.count_reg[7] [7]),
        .I2(p_0_out[6]),
        .I3(\gic0.gc0.count_reg[7] [6]),
        .O(v1_reg_1[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(WR_PNTR_RD[8]),
        .I1(Q[2]),
        .O(ram_empty_fb_i_reg));
  bitfile_fifo_in_synchronizer_ff \gsync_stage[1].rd_stg_inst 
       (.D(p_3_out),
        .Q(wr_pntr_gc),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] (\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .rd_clk(rd_clk));
  bitfile_fifo_in_synchronizer_ff_3 \gsync_stage[1].wr_stg_inst 
       (.D(p_2_out),
        .Q(rd_pntr_gc),
        .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] (\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .wr_clk(wr_clk));
  bitfile_fifo_in_synchronizer_ff_4 \gsync_stage[2].rd_stg_inst 
       (.D(p_3_out),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] (\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .out(p_1_out),
        .rd_clk(rd_clk),
        .\wr_pntr_bin_reg[7] (p_0_in));
  bitfile_fifo_in_synchronizer_ff_5 \gsync_stage[2].wr_stg_inst 
       (.D(p_2_out),
        .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] (\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .out(p_0_out_0),
        .\rd_pntr_bin_reg[7] ({\gsync_stage[2].wr_stg_inst_n_1 ,\gsync_stage[2].wr_stg_inst_n_2 ,\gsync_stage[2].wr_stg_inst_n_3 ,\gsync_stage[2].wr_stg_inst_n_4 ,\gsync_stage[2].wr_stg_inst_n_5 ,\gsync_stage[2].wr_stg_inst_n_6 ,\gsync_stage[2].wr_stg_inst_n_7 ,\gsync_stage[2].wr_stg_inst_n_8 }),
        .wr_clk(wr_clk));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_8 ),
        .Q(p_0_out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_7 ),
        .Q(p_0_out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_6 ),
        .Q(p_0_out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_5 ),
        .Q(p_0_out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_4 ),
        .Q(p_0_out[4]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_3 ),
        .Q(p_0_out[5]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_2 ),
        .Q(p_0_out[6]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gsync_stage[2].wr_stg_inst_n_1 ),
        .Q(p_0_out[7]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_bin_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_out_0),
        .Q(RD_PNTR_WR));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[0]_i_1 
       (.I0(\gc0.count_d1_reg[0]_rep ),
        .I1(\gc0.count_d1_reg[1]_rep ),
        .O(\rd_pntr_gc[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[1]_i_1 
       (.I0(\gc0.count_d1_reg[1]_rep ),
        .I1(\gc0.count_d1_reg[2]_rep ),
        .O(\rd_pntr_gc[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[2]_i_1 
       (.I0(\gc0.count_d1_reg[2]_rep ),
        .I1(\gc0.count_d1_reg[3]_rep ),
        .O(\rd_pntr_gc[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[3]_i_1 
       (.I0(\gc0.count_d1_reg[3]_rep ),
        .I1(\gc0.count_d1_reg[4]_rep ),
        .O(\rd_pntr_gc[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[4]_i_1 
       (.I0(\gc0.count_d1_reg[4]_rep ),
        .I1(\gc0.count_d1_reg[5]_rep ),
        .O(\rd_pntr_gc[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[5]_i_1 
       (.I0(\gc0.count_d1_reg[5]_rep ),
        .I1(Q[0]),
        .O(\rd_pntr_gc[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[6]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\rd_pntr_gc[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_gc[7]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(\rd_pntr_gc[7]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[0]_i_1_n_0 ),
        .Q(rd_pntr_gc[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[1]_i_1_n_0 ),
        .Q(rd_pntr_gc[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[2]_i_1_n_0 ),
        .Q(rd_pntr_gc[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[3]_i_1_n_0 ),
        .Q(rd_pntr_gc[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[4]_i_1_n_0 ),
        .Q(rd_pntr_gc[4]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[5]_i_1_n_0 ),
        .Q(rd_pntr_gc[5]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[6]_i_1_n_0 ),
        .Q(rd_pntr_gc[6]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\rd_pntr_gc[7]_i_1_n_0 ),
        .Q(rd_pntr_gc[7]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_pntr_gc_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[2]),
        .Q(rd_pntr_gc[8]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[0]),
        .Q(WR_PNTR_RD[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[1]),
        .Q(WR_PNTR_RD[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[2]),
        .Q(WR_PNTR_RD[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[3]),
        .Q(WR_PNTR_RD[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[4]),
        .Q(WR_PNTR_RD[4]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[5]),
        .Q(WR_PNTR_RD[5]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[6]),
        .Q(WR_PNTR_RD[6]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_in[7]),
        .Q(WR_PNTR_RD[7]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_bin_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_1_out),
        .Q(WR_PNTR_RD[8]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[0]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [0]),
        .I1(\gic0.gc0.count_d2_reg[8] [1]),
        .O(p_0_in7_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[1]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [1]),
        .I1(\gic0.gc0.count_d2_reg[8] [2]),
        .O(p_0_in7_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[2]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [2]),
        .I1(\gic0.gc0.count_d2_reg[8] [3]),
        .O(p_0_in7_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[3]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [3]),
        .I1(\gic0.gc0.count_d2_reg[8] [4]),
        .O(p_0_in7_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[4]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [4]),
        .I1(\gic0.gc0.count_d2_reg[8] [5]),
        .O(p_0_in7_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[5]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [5]),
        .I1(\gic0.gc0.count_d2_reg[8] [6]),
        .O(p_0_in7_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[6]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [6]),
        .I1(\gic0.gc0.count_d2_reg[8] [7]),
        .O(p_0_in7_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_gc[7]_i_1 
       (.I0(\gic0.gc0.count_d2_reg[8] [7]),
        .I1(\gic0.gc0.count_d2_reg[8] [8]),
        .O(p_0_in7_out[7]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[0]),
        .Q(wr_pntr_gc[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[1]),
        .Q(wr_pntr_gc[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[2]),
        .Q(wr_pntr_gc[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[3]),
        .Q(wr_pntr_gc[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[4]),
        .Q(wr_pntr_gc[4]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[5]),
        .Q(wr_pntr_gc[5]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[6]),
        .Q(wr_pntr_gc[6]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(p_0_in7_out[7]),
        .Q(wr_pntr_gc[7]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_pntr_gc_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(\gic0.gc0.count_d2_reg[8] [8]),
        .Q(wr_pntr_gc[8]));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module bitfile_fifo_in_compare
   (comp1,
    v1_reg,
    \gic0.gc0.count_d1_reg[8] );
  output comp1;
  input [3:0]v1_reg;
  input \gic0.gc0.count_d1_reg[8] ;

  wire comp1;
  wire \gic0.gc0.count_d1_reg[8] ;
  wire \gmux.gm[3].gms.ms_n_0 ;
  wire [3:0]v1_reg;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\gmux.gm[3].gms.ms_n_0 ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\gmux.gm[3].gms.ms_n_0 ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],\gic0.gc0.count_d1_reg[8] }));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module bitfile_fifo_in_compare_0
   (comp2,
    v1_reg_0,
    \gic0.gc0.count_reg[8] );
  output comp2;
  input [3:0]v1_reg_0;
  input \gic0.gc0.count_reg[8] ;

  wire comp2;
  wire \gic0.gc0.count_reg[8] ;
  wire \gmux.gm[3].gms.ms_n_0 ;
  wire [3:0]v1_reg_0;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\gmux.gm[3].gms.ms_n_0 ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\gmux.gm[3].gms.ms_n_0 ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp2}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],\gic0.gc0.count_reg[8] }));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module bitfile_fifo_in_compare_1
   (comp0,
    v1_reg_0,
    \wr_pntr_bin_reg[8] );
  output comp0;
  input [3:0]v1_reg_0;
  input \wr_pntr_bin_reg[8] ;

  wire comp0;
  wire \gmux.gm[3].gms.ms_n_0 ;
  wire [3:0]v1_reg_0;
  wire \wr_pntr_bin_reg[8] ;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\gmux.gm[3].gms.ms_n_0 ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\gmux.gm[3].gms.ms_n_0 ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],\wr_pntr_bin_reg[8] }));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module bitfile_fifo_in_compare_2
   (comp1,
    v1_reg,
    \gc0.count_reg[8] );
  output comp1;
  input [3:0]v1_reg;
  input \gc0.count_reg[8] ;

  wire comp1;
  wire \gc0.count_reg[8] ;
  wire \gmux.gm[3].gms.ms_n_0 ;
  wire [3:0]v1_reg;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\gmux.gm[3].gms.ms_n_0 ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\gmux.gm[3].gms.ms_n_0 ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],\gc0.count_reg[8] }));
endmodule

(* ORIG_REF_NAME = "dmem" *) 
module bitfile_fifo_in_dmem
   (Q,
    wr_clk,
    din,
    \gic0.gc0.count_d2_reg[7] ,
    \gc0.count_d1_reg[8] ,
    \gic0.gc0.count_d2_reg[5] ,
    \gic0.gc0.count_d2_reg[8] ,
    \gic0.gc0.count_d2_reg[8]_0 ,
    \gic0.gc0.count_d2_reg[8]_1 ,
    \gic0.gc0.count_d2_reg[7]_0 ,
    \gic0.gc0.count_d2_reg[7]_1 ,
    \gic0.gc0.count_d2_reg[6] ,
    \gic0.gc0.count_d2_reg[7]_2 ,
    \gic0.gc0.count_d2_reg[7]_3 ,
    \gic0.gc0.count_d2_reg[8]_2 ,
    \gic0.gc0.count_d2_reg[8]_3 ,
    \gic0.gc0.count_d2_reg[8]_4 ,
    \gic0.gc0.count_d2_reg[7]_4 ,
    \gic0.gc0.count_d2_reg[7]_5 ,
    \gic0.gc0.count_d2_reg[6]_0 ,
    \gic0.gc0.count_d2_reg[7]_6 ,
    \gic0.gc0.count_d2_reg[7]_7 ,
    \gic0.gc0.count_d2_reg[8]_5 ,
    \gic0.gc0.count_d2_reg[8]_6 ,
    \gic0.gc0.count_d2_reg[8]_7 ,
    \gic0.gc0.count_d2_reg[7]_8 ,
    \gic0.gc0.count_d2_reg[7]_9 ,
    \gic0.gc0.count_d2_reg[6]_1 ,
    \gic0.gc0.count_d2_reg[7]_10 ,
    \gic0.gc0.count_d2_reg[7]_11 ,
    \gic0.gc0.count_d2_reg[8]_8 ,
    \gic0.gc0.count_d2_reg[8]_9 ,
    \gic0.gc0.count_d2_reg[8]_10 ,
    \gic0.gc0.count_d2_reg[7]_12 ,
    \gic0.gc0.count_d2_reg[7]_13 ,
    \gic0.gc0.count_d2_reg[6]_2 ,
    \gic0.gc0.count_d2_reg[7]_14 ,
    \gic0.gc0.count_d2_reg[7]_15 ,
    \gic0.gc0.count_d2_reg[8]_11 ,
    \gic0.gc0.count_d2_reg[8]_12 ,
    \gic0.gc0.count_d2_reg[8]_13 ,
    \gic0.gc0.count_d2_reg[7]_16 ,
    \gic0.gc0.count_d2_reg[7]_17 ,
    \gic0.gc0.count_d2_reg[6]_3 ,
    \gic0.gc0.count_d2_reg[7]_18 ,
    \gic0.gc0.count_d2_reg[7]_19 ,
    \gic0.gc0.count_d2_reg[8]_14 ,
    \gic0.gc0.count_d2_reg[8]_15 ,
    \gic0.gc0.count_d2_reg[8]_16 ,
    \gic0.gc0.count_d2_reg[7]_20 ,
    \gic0.gc0.count_d2_reg[7]_21 ,
    \gic0.gc0.count_d2_reg[6]_4 ,
    \gic0.gc0.count_d2_reg[7]_22 ,
    \gic0.gc0.count_d2_reg[7]_23 ,
    ADDRA,
    \gic0.gc0.count_d2_reg[8]_17 ,
    \gic0.gc0.count_d2_reg[8]_18 ,
    \gic0.gc0.count_d2_reg[8]_19 ,
    \gic0.gc0.count_d2_reg[7]_24 ,
    \gic0.gc0.count_d2_reg[7]_25 ,
    \gic0.gc0.count_d2_reg[6]_5 ,
    \gic0.gc0.count_d2_reg[7]_26 ,
    \gic0.gc0.count_d2_reg[7]_27 ,
    \gic0.gc0.count_d2_reg[8]_20 ,
    \gic0.gc0.count_d2_reg[8]_21 ,
    \gic0.gc0.count_d2_reg[8]_22 ,
    \gic0.gc0.count_d2_reg[7]_28 ,
    \gic0.gc0.count_d2_reg[7]_29 ,
    \gic0.gc0.count_d2_reg[6]_6 ,
    \gic0.gc0.count_d2_reg[7]_30 ,
    \gic0.gc0.count_d2_reg[7]_31 ,
    \gic0.gc0.count_d2_reg[8]_23 ,
    \gic0.gc0.count_d2_reg[8]_24 ,
    \gic0.gc0.count_d2_reg[8]_25 ,
    \gic0.gc0.count_d2_reg[7]_32 ,
    \gic0.gc0.count_d2_reg[7]_33 ,
    \gic0.gc0.count_d2_reg[6]_7 ,
    \gic0.gc0.count_d2_reg[7]_34 ,
    \gic0.gc0.count_d2_reg[7]_35 ,
    \gic0.gc0.count_d2_reg[8]_26 ,
    \gic0.gc0.count_d2_reg[8]_27 ,
    \gic0.gc0.count_d2_reg[8]_28 ,
    \gic0.gc0.count_d2_reg[7]_36 ,
    \gic0.gc0.count_d2_reg[7]_37 ,
    \gic0.gc0.count_d2_reg[6]_8 ,
    \gic0.gc0.count_d2_reg[7]_38 ,
    \gic0.gc0.count_d2_reg[7]_39 ,
    \gic0.gc0.count_d2_reg[7]_40 ,
    \gic0.gc0.count_d2_reg[8]_29 ,
    \gic0.gc0.count_d2_reg[8]_30 ,
    \gic0.gc0.count_d2_reg[8]_31 ,
    \gic0.gc0.count_d2_reg[8]_32 ,
    \gic0.gc0.count_d2_reg[8]_33 ,
    \gic0.gc0.count_d2_reg[8]_34 ,
    \gic0.gc0.count_d2_reg[7]_41 ,
    \gic0.gc0.count_d2_reg[7]_42 ,
    \gic0.gc0.count_d2_reg[7]_43 ,
    \gic0.gc0.count_d2_reg[7]_44 ,
    \gic0.gc0.count_d2_reg[6]_9 ,
    \gic0.gc0.count_d2_reg[6]_10 ,
    \gic0.gc0.count_d2_reg[7]_45 ,
    \gic0.gc0.count_d2_reg[7]_46 ,
    E,
    rd_clk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] );
  output [31:0]Q;
  input wr_clk;
  input [31:0]din;
  input \gic0.gc0.count_d2_reg[7] ;
  input [8:0]\gc0.count_d1_reg[8] ;
  input [5:0]\gic0.gc0.count_d2_reg[5] ;
  input \gic0.gc0.count_d2_reg[8] ;
  input \gic0.gc0.count_d2_reg[8]_0 ;
  input \gic0.gc0.count_d2_reg[8]_1 ;
  input \gic0.gc0.count_d2_reg[7]_0 ;
  input \gic0.gc0.count_d2_reg[7]_1 ;
  input \gic0.gc0.count_d2_reg[6] ;
  input \gic0.gc0.count_d2_reg[7]_2 ;
  input \gic0.gc0.count_d2_reg[7]_3 ;
  input \gic0.gc0.count_d2_reg[8]_2 ;
  input \gic0.gc0.count_d2_reg[8]_3 ;
  input \gic0.gc0.count_d2_reg[8]_4 ;
  input \gic0.gc0.count_d2_reg[7]_4 ;
  input \gic0.gc0.count_d2_reg[7]_5 ;
  input \gic0.gc0.count_d2_reg[6]_0 ;
  input \gic0.gc0.count_d2_reg[7]_6 ;
  input \gic0.gc0.count_d2_reg[7]_7 ;
  input \gic0.gc0.count_d2_reg[8]_5 ;
  input \gic0.gc0.count_d2_reg[8]_6 ;
  input \gic0.gc0.count_d2_reg[8]_7 ;
  input \gic0.gc0.count_d2_reg[7]_8 ;
  input \gic0.gc0.count_d2_reg[7]_9 ;
  input \gic0.gc0.count_d2_reg[6]_1 ;
  input \gic0.gc0.count_d2_reg[7]_10 ;
  input \gic0.gc0.count_d2_reg[7]_11 ;
  input \gic0.gc0.count_d2_reg[8]_8 ;
  input \gic0.gc0.count_d2_reg[8]_9 ;
  input \gic0.gc0.count_d2_reg[8]_10 ;
  input \gic0.gc0.count_d2_reg[7]_12 ;
  input \gic0.gc0.count_d2_reg[7]_13 ;
  input \gic0.gc0.count_d2_reg[6]_2 ;
  input \gic0.gc0.count_d2_reg[7]_14 ;
  input \gic0.gc0.count_d2_reg[7]_15 ;
  input \gic0.gc0.count_d2_reg[8]_11 ;
  input \gic0.gc0.count_d2_reg[8]_12 ;
  input \gic0.gc0.count_d2_reg[8]_13 ;
  input \gic0.gc0.count_d2_reg[7]_16 ;
  input \gic0.gc0.count_d2_reg[7]_17 ;
  input \gic0.gc0.count_d2_reg[6]_3 ;
  input \gic0.gc0.count_d2_reg[7]_18 ;
  input \gic0.gc0.count_d2_reg[7]_19 ;
  input \gic0.gc0.count_d2_reg[8]_14 ;
  input \gic0.gc0.count_d2_reg[8]_15 ;
  input \gic0.gc0.count_d2_reg[8]_16 ;
  input \gic0.gc0.count_d2_reg[7]_20 ;
  input \gic0.gc0.count_d2_reg[7]_21 ;
  input \gic0.gc0.count_d2_reg[6]_4 ;
  input \gic0.gc0.count_d2_reg[7]_22 ;
  input \gic0.gc0.count_d2_reg[7]_23 ;
  input [5:0]ADDRA;
  input \gic0.gc0.count_d2_reg[8]_17 ;
  input \gic0.gc0.count_d2_reg[8]_18 ;
  input \gic0.gc0.count_d2_reg[8]_19 ;
  input \gic0.gc0.count_d2_reg[7]_24 ;
  input \gic0.gc0.count_d2_reg[7]_25 ;
  input \gic0.gc0.count_d2_reg[6]_5 ;
  input \gic0.gc0.count_d2_reg[7]_26 ;
  input \gic0.gc0.count_d2_reg[7]_27 ;
  input \gic0.gc0.count_d2_reg[8]_20 ;
  input \gic0.gc0.count_d2_reg[8]_21 ;
  input \gic0.gc0.count_d2_reg[8]_22 ;
  input \gic0.gc0.count_d2_reg[7]_28 ;
  input \gic0.gc0.count_d2_reg[7]_29 ;
  input \gic0.gc0.count_d2_reg[6]_6 ;
  input \gic0.gc0.count_d2_reg[7]_30 ;
  input \gic0.gc0.count_d2_reg[7]_31 ;
  input \gic0.gc0.count_d2_reg[8]_23 ;
  input \gic0.gc0.count_d2_reg[8]_24 ;
  input \gic0.gc0.count_d2_reg[8]_25 ;
  input \gic0.gc0.count_d2_reg[7]_32 ;
  input \gic0.gc0.count_d2_reg[7]_33 ;
  input \gic0.gc0.count_d2_reg[6]_7 ;
  input \gic0.gc0.count_d2_reg[7]_34 ;
  input \gic0.gc0.count_d2_reg[7]_35 ;
  input \gic0.gc0.count_d2_reg[8]_26 ;
  input \gic0.gc0.count_d2_reg[8]_27 ;
  input \gic0.gc0.count_d2_reg[8]_28 ;
  input \gic0.gc0.count_d2_reg[7]_36 ;
  input \gic0.gc0.count_d2_reg[7]_37 ;
  input \gic0.gc0.count_d2_reg[6]_8 ;
  input \gic0.gc0.count_d2_reg[7]_38 ;
  input \gic0.gc0.count_d2_reg[7]_39 ;
  input \gic0.gc0.count_d2_reg[7]_40 ;
  input \gic0.gc0.count_d2_reg[8]_29 ;
  input \gic0.gc0.count_d2_reg[8]_30 ;
  input \gic0.gc0.count_d2_reg[8]_31 ;
  input \gic0.gc0.count_d2_reg[8]_32 ;
  input \gic0.gc0.count_d2_reg[8]_33 ;
  input \gic0.gc0.count_d2_reg[8]_34 ;
  input \gic0.gc0.count_d2_reg[7]_41 ;
  input \gic0.gc0.count_d2_reg[7]_42 ;
  input \gic0.gc0.count_d2_reg[7]_43 ;
  input \gic0.gc0.count_d2_reg[7]_44 ;
  input \gic0.gc0.count_d2_reg[6]_9 ;
  input \gic0.gc0.count_d2_reg[6]_10 ;
  input \gic0.gc0.count_d2_reg[7]_45 ;
  input \gic0.gc0.count_d2_reg[7]_46 ;
  input [0:0]E;
  input rd_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ;

  wire [5:0]ADDRA;
  wire [0:0]E;
  wire [31:0]Q;
  wire RAM_reg_0_63_0_2_n_0;
  wire RAM_reg_0_63_0_2_n_1;
  wire RAM_reg_0_63_0_2_n_2;
  wire RAM_reg_0_63_12_14_n_0;
  wire RAM_reg_0_63_12_14_n_1;
  wire RAM_reg_0_63_12_14_n_2;
  wire RAM_reg_0_63_15_17_n_0;
  wire RAM_reg_0_63_15_17_n_1;
  wire RAM_reg_0_63_15_17_n_2;
  wire RAM_reg_0_63_18_20_n_0;
  wire RAM_reg_0_63_18_20_n_1;
  wire RAM_reg_0_63_18_20_n_2;
  wire RAM_reg_0_63_21_23_n_0;
  wire RAM_reg_0_63_21_23_n_1;
  wire RAM_reg_0_63_21_23_n_2;
  wire RAM_reg_0_63_24_26_n_0;
  wire RAM_reg_0_63_24_26_n_1;
  wire RAM_reg_0_63_24_26_n_2;
  wire RAM_reg_0_63_27_29_n_0;
  wire RAM_reg_0_63_27_29_n_1;
  wire RAM_reg_0_63_27_29_n_2;
  wire RAM_reg_0_63_30_30_n_0;
  wire RAM_reg_0_63_31_31_n_0;
  wire RAM_reg_0_63_3_5_n_0;
  wire RAM_reg_0_63_3_5_n_1;
  wire RAM_reg_0_63_3_5_n_2;
  wire RAM_reg_0_63_6_8_n_0;
  wire RAM_reg_0_63_6_8_n_1;
  wire RAM_reg_0_63_6_8_n_2;
  wire RAM_reg_0_63_9_11_n_0;
  wire RAM_reg_0_63_9_11_n_1;
  wire RAM_reg_0_63_9_11_n_2;
  wire RAM_reg_128_191_0_2_n_0;
  wire RAM_reg_128_191_0_2_n_1;
  wire RAM_reg_128_191_0_2_n_2;
  wire RAM_reg_128_191_12_14_n_0;
  wire RAM_reg_128_191_12_14_n_1;
  wire RAM_reg_128_191_12_14_n_2;
  wire RAM_reg_128_191_15_17_n_0;
  wire RAM_reg_128_191_15_17_n_1;
  wire RAM_reg_128_191_15_17_n_2;
  wire RAM_reg_128_191_18_20_n_0;
  wire RAM_reg_128_191_18_20_n_1;
  wire RAM_reg_128_191_18_20_n_2;
  wire RAM_reg_128_191_21_23_n_0;
  wire RAM_reg_128_191_21_23_n_1;
  wire RAM_reg_128_191_21_23_n_2;
  wire RAM_reg_128_191_24_26_n_0;
  wire RAM_reg_128_191_24_26_n_1;
  wire RAM_reg_128_191_24_26_n_2;
  wire RAM_reg_128_191_27_29_n_0;
  wire RAM_reg_128_191_27_29_n_1;
  wire RAM_reg_128_191_27_29_n_2;
  wire RAM_reg_128_191_30_30_n_0;
  wire RAM_reg_128_191_31_31_n_0;
  wire RAM_reg_128_191_3_5_n_0;
  wire RAM_reg_128_191_3_5_n_1;
  wire RAM_reg_128_191_3_5_n_2;
  wire RAM_reg_128_191_6_8_n_0;
  wire RAM_reg_128_191_6_8_n_1;
  wire RAM_reg_128_191_6_8_n_2;
  wire RAM_reg_128_191_9_11_n_0;
  wire RAM_reg_128_191_9_11_n_1;
  wire RAM_reg_128_191_9_11_n_2;
  wire RAM_reg_192_255_0_2_n_0;
  wire RAM_reg_192_255_0_2_n_1;
  wire RAM_reg_192_255_0_2_n_2;
  wire RAM_reg_192_255_12_14_n_0;
  wire RAM_reg_192_255_12_14_n_1;
  wire RAM_reg_192_255_12_14_n_2;
  wire RAM_reg_192_255_15_17_n_0;
  wire RAM_reg_192_255_15_17_n_1;
  wire RAM_reg_192_255_15_17_n_2;
  wire RAM_reg_192_255_18_20_n_0;
  wire RAM_reg_192_255_18_20_n_1;
  wire RAM_reg_192_255_18_20_n_2;
  wire RAM_reg_192_255_21_23_n_0;
  wire RAM_reg_192_255_21_23_n_1;
  wire RAM_reg_192_255_21_23_n_2;
  wire RAM_reg_192_255_24_26_n_0;
  wire RAM_reg_192_255_24_26_n_1;
  wire RAM_reg_192_255_24_26_n_2;
  wire RAM_reg_192_255_27_29_n_0;
  wire RAM_reg_192_255_27_29_n_1;
  wire RAM_reg_192_255_27_29_n_2;
  wire RAM_reg_192_255_30_30_n_0;
  wire RAM_reg_192_255_31_31_n_0;
  wire RAM_reg_192_255_3_5_n_0;
  wire RAM_reg_192_255_3_5_n_1;
  wire RAM_reg_192_255_3_5_n_2;
  wire RAM_reg_192_255_6_8_n_0;
  wire RAM_reg_192_255_6_8_n_1;
  wire RAM_reg_192_255_6_8_n_2;
  wire RAM_reg_192_255_9_11_n_0;
  wire RAM_reg_192_255_9_11_n_1;
  wire RAM_reg_192_255_9_11_n_2;
  wire RAM_reg_256_319_0_2_n_0;
  wire RAM_reg_256_319_0_2_n_1;
  wire RAM_reg_256_319_0_2_n_2;
  wire RAM_reg_256_319_12_14_n_0;
  wire RAM_reg_256_319_12_14_n_1;
  wire RAM_reg_256_319_12_14_n_2;
  wire RAM_reg_256_319_15_17_n_0;
  wire RAM_reg_256_319_15_17_n_1;
  wire RAM_reg_256_319_15_17_n_2;
  wire RAM_reg_256_319_18_20_n_0;
  wire RAM_reg_256_319_18_20_n_1;
  wire RAM_reg_256_319_18_20_n_2;
  wire RAM_reg_256_319_21_23_n_0;
  wire RAM_reg_256_319_21_23_n_1;
  wire RAM_reg_256_319_21_23_n_2;
  wire RAM_reg_256_319_24_26_n_0;
  wire RAM_reg_256_319_24_26_n_1;
  wire RAM_reg_256_319_24_26_n_2;
  wire RAM_reg_256_319_27_29_n_0;
  wire RAM_reg_256_319_27_29_n_1;
  wire RAM_reg_256_319_27_29_n_2;
  wire RAM_reg_256_319_30_30_n_0;
  wire RAM_reg_256_319_31_31_n_0;
  wire RAM_reg_256_319_3_5_n_0;
  wire RAM_reg_256_319_3_5_n_1;
  wire RAM_reg_256_319_3_5_n_2;
  wire RAM_reg_256_319_6_8_n_0;
  wire RAM_reg_256_319_6_8_n_1;
  wire RAM_reg_256_319_6_8_n_2;
  wire RAM_reg_256_319_9_11_n_0;
  wire RAM_reg_256_319_9_11_n_1;
  wire RAM_reg_256_319_9_11_n_2;
  wire RAM_reg_320_383_0_2_n_0;
  wire RAM_reg_320_383_0_2_n_1;
  wire RAM_reg_320_383_0_2_n_2;
  wire RAM_reg_320_383_12_14_n_0;
  wire RAM_reg_320_383_12_14_n_1;
  wire RAM_reg_320_383_12_14_n_2;
  wire RAM_reg_320_383_15_17_n_0;
  wire RAM_reg_320_383_15_17_n_1;
  wire RAM_reg_320_383_15_17_n_2;
  wire RAM_reg_320_383_18_20_n_0;
  wire RAM_reg_320_383_18_20_n_1;
  wire RAM_reg_320_383_18_20_n_2;
  wire RAM_reg_320_383_21_23_n_0;
  wire RAM_reg_320_383_21_23_n_1;
  wire RAM_reg_320_383_21_23_n_2;
  wire RAM_reg_320_383_24_26_n_0;
  wire RAM_reg_320_383_24_26_n_1;
  wire RAM_reg_320_383_24_26_n_2;
  wire RAM_reg_320_383_27_29_n_0;
  wire RAM_reg_320_383_27_29_n_1;
  wire RAM_reg_320_383_27_29_n_2;
  wire RAM_reg_320_383_30_30_n_0;
  wire RAM_reg_320_383_31_31_n_0;
  wire RAM_reg_320_383_3_5_n_0;
  wire RAM_reg_320_383_3_5_n_1;
  wire RAM_reg_320_383_3_5_n_2;
  wire RAM_reg_320_383_6_8_n_0;
  wire RAM_reg_320_383_6_8_n_1;
  wire RAM_reg_320_383_6_8_n_2;
  wire RAM_reg_320_383_9_11_n_0;
  wire RAM_reg_320_383_9_11_n_1;
  wire RAM_reg_320_383_9_11_n_2;
  wire RAM_reg_384_447_0_2_n_0;
  wire RAM_reg_384_447_0_2_n_1;
  wire RAM_reg_384_447_0_2_n_2;
  wire RAM_reg_384_447_12_14_n_0;
  wire RAM_reg_384_447_12_14_n_1;
  wire RAM_reg_384_447_12_14_n_2;
  wire RAM_reg_384_447_15_17_n_0;
  wire RAM_reg_384_447_15_17_n_1;
  wire RAM_reg_384_447_15_17_n_2;
  wire RAM_reg_384_447_18_20_n_0;
  wire RAM_reg_384_447_18_20_n_1;
  wire RAM_reg_384_447_18_20_n_2;
  wire RAM_reg_384_447_21_23_n_0;
  wire RAM_reg_384_447_21_23_n_1;
  wire RAM_reg_384_447_21_23_n_2;
  wire RAM_reg_384_447_24_26_n_0;
  wire RAM_reg_384_447_24_26_n_1;
  wire RAM_reg_384_447_24_26_n_2;
  wire RAM_reg_384_447_27_29_n_0;
  wire RAM_reg_384_447_27_29_n_1;
  wire RAM_reg_384_447_27_29_n_2;
  wire RAM_reg_384_447_30_30_n_0;
  wire RAM_reg_384_447_31_31_n_0;
  wire RAM_reg_384_447_3_5_n_0;
  wire RAM_reg_384_447_3_5_n_1;
  wire RAM_reg_384_447_3_5_n_2;
  wire RAM_reg_384_447_6_8_n_0;
  wire RAM_reg_384_447_6_8_n_1;
  wire RAM_reg_384_447_6_8_n_2;
  wire RAM_reg_384_447_9_11_n_0;
  wire RAM_reg_384_447_9_11_n_1;
  wire RAM_reg_384_447_9_11_n_2;
  wire RAM_reg_448_511_0_2_n_0;
  wire RAM_reg_448_511_0_2_n_1;
  wire RAM_reg_448_511_0_2_n_2;
  wire RAM_reg_448_511_12_14_n_0;
  wire RAM_reg_448_511_12_14_n_1;
  wire RAM_reg_448_511_12_14_n_2;
  wire RAM_reg_448_511_15_17_n_0;
  wire RAM_reg_448_511_15_17_n_1;
  wire RAM_reg_448_511_15_17_n_2;
  wire RAM_reg_448_511_18_20_n_0;
  wire RAM_reg_448_511_18_20_n_1;
  wire RAM_reg_448_511_18_20_n_2;
  wire RAM_reg_448_511_21_23_n_0;
  wire RAM_reg_448_511_21_23_n_1;
  wire RAM_reg_448_511_21_23_n_2;
  wire RAM_reg_448_511_24_26_n_0;
  wire RAM_reg_448_511_24_26_n_1;
  wire RAM_reg_448_511_24_26_n_2;
  wire RAM_reg_448_511_27_29_n_0;
  wire RAM_reg_448_511_27_29_n_1;
  wire RAM_reg_448_511_27_29_n_2;
  wire RAM_reg_448_511_30_30_n_0;
  wire RAM_reg_448_511_31_31_n_0;
  wire RAM_reg_448_511_3_5_n_0;
  wire RAM_reg_448_511_3_5_n_1;
  wire RAM_reg_448_511_3_5_n_2;
  wire RAM_reg_448_511_6_8_n_0;
  wire RAM_reg_448_511_6_8_n_1;
  wire RAM_reg_448_511_6_8_n_2;
  wire RAM_reg_448_511_9_11_n_0;
  wire RAM_reg_448_511_9_11_n_1;
  wire RAM_reg_448_511_9_11_n_2;
  wire RAM_reg_64_127_0_2_n_0;
  wire RAM_reg_64_127_0_2_n_1;
  wire RAM_reg_64_127_0_2_n_2;
  wire RAM_reg_64_127_12_14_n_0;
  wire RAM_reg_64_127_12_14_n_1;
  wire RAM_reg_64_127_12_14_n_2;
  wire RAM_reg_64_127_15_17_n_0;
  wire RAM_reg_64_127_15_17_n_1;
  wire RAM_reg_64_127_15_17_n_2;
  wire RAM_reg_64_127_18_20_n_0;
  wire RAM_reg_64_127_18_20_n_1;
  wire RAM_reg_64_127_18_20_n_2;
  wire RAM_reg_64_127_21_23_n_0;
  wire RAM_reg_64_127_21_23_n_1;
  wire RAM_reg_64_127_21_23_n_2;
  wire RAM_reg_64_127_24_26_n_0;
  wire RAM_reg_64_127_24_26_n_1;
  wire RAM_reg_64_127_24_26_n_2;
  wire RAM_reg_64_127_27_29_n_0;
  wire RAM_reg_64_127_27_29_n_1;
  wire RAM_reg_64_127_27_29_n_2;
  wire RAM_reg_64_127_30_30_n_0;
  wire RAM_reg_64_127_31_31_n_0;
  wire RAM_reg_64_127_3_5_n_0;
  wire RAM_reg_64_127_3_5_n_1;
  wire RAM_reg_64_127_3_5_n_2;
  wire RAM_reg_64_127_6_8_n_0;
  wire RAM_reg_64_127_6_8_n_1;
  wire RAM_reg_64_127_6_8_n_2;
  wire RAM_reg_64_127_9_11_n_0;
  wire RAM_reg_64_127_9_11_n_1;
  wire RAM_reg_64_127_9_11_n_2;
  wire [31:0]din;
  wire [8:0]\gc0.count_d1_reg[8] ;
  wire [5:0]\gic0.gc0.count_d2_reg[5] ;
  wire \gic0.gc0.count_d2_reg[6] ;
  wire \gic0.gc0.count_d2_reg[6]_0 ;
  wire \gic0.gc0.count_d2_reg[6]_1 ;
  wire \gic0.gc0.count_d2_reg[6]_10 ;
  wire \gic0.gc0.count_d2_reg[6]_2 ;
  wire \gic0.gc0.count_d2_reg[6]_3 ;
  wire \gic0.gc0.count_d2_reg[6]_4 ;
  wire \gic0.gc0.count_d2_reg[6]_5 ;
  wire \gic0.gc0.count_d2_reg[6]_6 ;
  wire \gic0.gc0.count_d2_reg[6]_7 ;
  wire \gic0.gc0.count_d2_reg[6]_8 ;
  wire \gic0.gc0.count_d2_reg[6]_9 ;
  wire \gic0.gc0.count_d2_reg[7] ;
  wire \gic0.gc0.count_d2_reg[7]_0 ;
  wire \gic0.gc0.count_d2_reg[7]_1 ;
  wire \gic0.gc0.count_d2_reg[7]_10 ;
  wire \gic0.gc0.count_d2_reg[7]_11 ;
  wire \gic0.gc0.count_d2_reg[7]_12 ;
  wire \gic0.gc0.count_d2_reg[7]_13 ;
  wire \gic0.gc0.count_d2_reg[7]_14 ;
  wire \gic0.gc0.count_d2_reg[7]_15 ;
  wire \gic0.gc0.count_d2_reg[7]_16 ;
  wire \gic0.gc0.count_d2_reg[7]_17 ;
  wire \gic0.gc0.count_d2_reg[7]_18 ;
  wire \gic0.gc0.count_d2_reg[7]_19 ;
  wire \gic0.gc0.count_d2_reg[7]_2 ;
  wire \gic0.gc0.count_d2_reg[7]_20 ;
  wire \gic0.gc0.count_d2_reg[7]_21 ;
  wire \gic0.gc0.count_d2_reg[7]_22 ;
  wire \gic0.gc0.count_d2_reg[7]_23 ;
  wire \gic0.gc0.count_d2_reg[7]_24 ;
  wire \gic0.gc0.count_d2_reg[7]_25 ;
  wire \gic0.gc0.count_d2_reg[7]_26 ;
  wire \gic0.gc0.count_d2_reg[7]_27 ;
  wire \gic0.gc0.count_d2_reg[7]_28 ;
  wire \gic0.gc0.count_d2_reg[7]_29 ;
  wire \gic0.gc0.count_d2_reg[7]_3 ;
  wire \gic0.gc0.count_d2_reg[7]_30 ;
  wire \gic0.gc0.count_d2_reg[7]_31 ;
  wire \gic0.gc0.count_d2_reg[7]_32 ;
  wire \gic0.gc0.count_d2_reg[7]_33 ;
  wire \gic0.gc0.count_d2_reg[7]_34 ;
  wire \gic0.gc0.count_d2_reg[7]_35 ;
  wire \gic0.gc0.count_d2_reg[7]_36 ;
  wire \gic0.gc0.count_d2_reg[7]_37 ;
  wire \gic0.gc0.count_d2_reg[7]_38 ;
  wire \gic0.gc0.count_d2_reg[7]_39 ;
  wire \gic0.gc0.count_d2_reg[7]_4 ;
  wire \gic0.gc0.count_d2_reg[7]_40 ;
  wire \gic0.gc0.count_d2_reg[7]_41 ;
  wire \gic0.gc0.count_d2_reg[7]_42 ;
  wire \gic0.gc0.count_d2_reg[7]_43 ;
  wire \gic0.gc0.count_d2_reg[7]_44 ;
  wire \gic0.gc0.count_d2_reg[7]_45 ;
  wire \gic0.gc0.count_d2_reg[7]_46 ;
  wire \gic0.gc0.count_d2_reg[7]_5 ;
  wire \gic0.gc0.count_d2_reg[7]_6 ;
  wire \gic0.gc0.count_d2_reg[7]_7 ;
  wire \gic0.gc0.count_d2_reg[7]_8 ;
  wire \gic0.gc0.count_d2_reg[7]_9 ;
  wire \gic0.gc0.count_d2_reg[8] ;
  wire \gic0.gc0.count_d2_reg[8]_0 ;
  wire \gic0.gc0.count_d2_reg[8]_1 ;
  wire \gic0.gc0.count_d2_reg[8]_10 ;
  wire \gic0.gc0.count_d2_reg[8]_11 ;
  wire \gic0.gc0.count_d2_reg[8]_12 ;
  wire \gic0.gc0.count_d2_reg[8]_13 ;
  wire \gic0.gc0.count_d2_reg[8]_14 ;
  wire \gic0.gc0.count_d2_reg[8]_15 ;
  wire \gic0.gc0.count_d2_reg[8]_16 ;
  wire \gic0.gc0.count_d2_reg[8]_17 ;
  wire \gic0.gc0.count_d2_reg[8]_18 ;
  wire \gic0.gc0.count_d2_reg[8]_19 ;
  wire \gic0.gc0.count_d2_reg[8]_2 ;
  wire \gic0.gc0.count_d2_reg[8]_20 ;
  wire \gic0.gc0.count_d2_reg[8]_21 ;
  wire \gic0.gc0.count_d2_reg[8]_22 ;
  wire \gic0.gc0.count_d2_reg[8]_23 ;
  wire \gic0.gc0.count_d2_reg[8]_24 ;
  wire \gic0.gc0.count_d2_reg[8]_25 ;
  wire \gic0.gc0.count_d2_reg[8]_26 ;
  wire \gic0.gc0.count_d2_reg[8]_27 ;
  wire \gic0.gc0.count_d2_reg[8]_28 ;
  wire \gic0.gc0.count_d2_reg[8]_29 ;
  wire \gic0.gc0.count_d2_reg[8]_3 ;
  wire \gic0.gc0.count_d2_reg[8]_30 ;
  wire \gic0.gc0.count_d2_reg[8]_31 ;
  wire \gic0.gc0.count_d2_reg[8]_32 ;
  wire \gic0.gc0.count_d2_reg[8]_33 ;
  wire \gic0.gc0.count_d2_reg[8]_34 ;
  wire \gic0.gc0.count_d2_reg[8]_4 ;
  wire \gic0.gc0.count_d2_reg[8]_5 ;
  wire \gic0.gc0.count_d2_reg[8]_6 ;
  wire \gic0.gc0.count_d2_reg[8]_7 ;
  wire \gic0.gc0.count_d2_reg[8]_8 ;
  wire \gic0.gc0.count_d2_reg[8]_9 ;
  wire \gpr1.dout_i[0]_i_2_n_0 ;
  wire \gpr1.dout_i[0]_i_3_n_0 ;
  wire \gpr1.dout_i[10]_i_2_n_0 ;
  wire \gpr1.dout_i[10]_i_3_n_0 ;
  wire \gpr1.dout_i[11]_i_2_n_0 ;
  wire \gpr1.dout_i[11]_i_3_n_0 ;
  wire \gpr1.dout_i[12]_i_2_n_0 ;
  wire \gpr1.dout_i[12]_i_3_n_0 ;
  wire \gpr1.dout_i[13]_i_2_n_0 ;
  wire \gpr1.dout_i[13]_i_3_n_0 ;
  wire \gpr1.dout_i[14]_i_2_n_0 ;
  wire \gpr1.dout_i[14]_i_3_n_0 ;
  wire \gpr1.dout_i[15]_i_2_n_0 ;
  wire \gpr1.dout_i[15]_i_3_n_0 ;
  wire \gpr1.dout_i[16]_i_2_n_0 ;
  wire \gpr1.dout_i[16]_i_3_n_0 ;
  wire \gpr1.dout_i[17]_i_2_n_0 ;
  wire \gpr1.dout_i[17]_i_3_n_0 ;
  wire \gpr1.dout_i[18]_i_2_n_0 ;
  wire \gpr1.dout_i[18]_i_3_n_0 ;
  wire \gpr1.dout_i[19]_i_2_n_0 ;
  wire \gpr1.dout_i[19]_i_3_n_0 ;
  wire \gpr1.dout_i[1]_i_2_n_0 ;
  wire \gpr1.dout_i[1]_i_3_n_0 ;
  wire \gpr1.dout_i[20]_i_2_n_0 ;
  wire \gpr1.dout_i[20]_i_3_n_0 ;
  wire \gpr1.dout_i[21]_i_2_n_0 ;
  wire \gpr1.dout_i[21]_i_3_n_0 ;
  wire \gpr1.dout_i[22]_i_2_n_0 ;
  wire \gpr1.dout_i[22]_i_3_n_0 ;
  wire \gpr1.dout_i[23]_i_2_n_0 ;
  wire \gpr1.dout_i[23]_i_3_n_0 ;
  wire \gpr1.dout_i[24]_i_2_n_0 ;
  wire \gpr1.dout_i[24]_i_3_n_0 ;
  wire \gpr1.dout_i[25]_i_2_n_0 ;
  wire \gpr1.dout_i[25]_i_3_n_0 ;
  wire \gpr1.dout_i[26]_i_2_n_0 ;
  wire \gpr1.dout_i[26]_i_3_n_0 ;
  wire \gpr1.dout_i[27]_i_2_n_0 ;
  wire \gpr1.dout_i[27]_i_3_n_0 ;
  wire \gpr1.dout_i[28]_i_2_n_0 ;
  wire \gpr1.dout_i[28]_i_3_n_0 ;
  wire \gpr1.dout_i[29]_i_2_n_0 ;
  wire \gpr1.dout_i[29]_i_3_n_0 ;
  wire \gpr1.dout_i[2]_i_2_n_0 ;
  wire \gpr1.dout_i[2]_i_3_n_0 ;
  wire \gpr1.dout_i[30]_i_2_n_0 ;
  wire \gpr1.dout_i[30]_i_3_n_0 ;
  wire \gpr1.dout_i[31]_i_3_n_0 ;
  wire \gpr1.dout_i[31]_i_4_n_0 ;
  wire \gpr1.dout_i[3]_i_2_n_0 ;
  wire \gpr1.dout_i[3]_i_3_n_0 ;
  wire \gpr1.dout_i[4]_i_2_n_0 ;
  wire \gpr1.dout_i[4]_i_3_n_0 ;
  wire \gpr1.dout_i[5]_i_2_n_0 ;
  wire \gpr1.dout_i[5]_i_3_n_0 ;
  wire \gpr1.dout_i[6]_i_2_n_0 ;
  wire \gpr1.dout_i[6]_i_3_n_0 ;
  wire \gpr1.dout_i[7]_i_2_n_0 ;
  wire \gpr1.dout_i[7]_i_3_n_0 ;
  wire \gpr1.dout_i[8]_i_2_n_0 ;
  wire \gpr1.dout_i[8]_i_3_n_0 ;
  wire \gpr1.dout_i[9]_i_2_n_0 ;
  wire \gpr1.dout_i[9]_i_3_n_0 ;
  wire \gpr1.dout_i_reg[0]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[10]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[11]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[12]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[13]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[14]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[15]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[16]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[17]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[18]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[19]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[1]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[20]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[21]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[22]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[23]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[24]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[25]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[26]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[27]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[28]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[29]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[2]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[30]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[31]_i_2_n_0 ;
  wire \gpr1.dout_i_reg[3]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[4]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[5]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[6]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[7]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[8]_i_1_n_0 ;
  wire \gpr1.dout_i_reg[9]_i_1_n_0 ;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ;
  wire rd_clk;
  wire wr_clk;
  wire NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_0_63_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_128_191_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_128_191_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_128_191_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_192_255_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_192_255_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_192_255_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_256_319_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_256_319_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_256_319_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_320_383_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_320_383_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_320_383_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_384_447_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_384_447_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_384_447_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_448_511_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_448_511_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_448_511_9_11_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_30_30_SPO_UNCONNECTED;
  wire NLW_RAM_reg_64_127_31_31_SPO_UNCONNECTED;
  wire NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED;
  wire NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_0_2_n_0),
        .DOB(RAM_reg_0_63_0_2_n_1),
        .DOC(RAM_reg_0_63_0_2_n_2),
        .DOD(NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7] ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_12_14_n_0),
        .DOB(RAM_reg_0_63_12_14_n_1),
        .DOC(RAM_reg_0_63_12_14_n_2),
        .DOD(NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_15 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_15_17_n_0),
        .DOB(RAM_reg_0_63_15_17_n_1),
        .DOC(RAM_reg_0_63_15_17_n_2),
        .DOD(NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_19 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_18_20_n_0),
        .DOB(RAM_reg_0_63_18_20_n_1),
        .DOC(RAM_reg_0_63_18_20_n_2),
        .DOD(NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_23 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_21_23_n_0),
        .DOB(RAM_reg_0_63_21_23_n_1),
        .DOC(RAM_reg_0_63_21_23_n_2),
        .DOD(NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_27 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_24_26_n_0),
        .DOB(RAM_reg_0_63_24_26_n_1),
        .DOC(RAM_reg_0_63_24_26_n_2),
        .DOD(NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_31 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_27_29_n_0),
        .DOB(RAM_reg_0_63_27_29_n_1),
        .DOC(RAM_reg_0_63_27_29_n_2),
        .DOD(NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_35 ));
  RAM64X1D RAM_reg_0_63_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_0_63_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_0_63_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_39 ));
  RAM64X1D RAM_reg_0_63_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_0_63_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_0_63_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_40 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_3_5_n_0),
        .DOB(RAM_reg_0_63_3_5_n_1),
        .DOC(RAM_reg_0_63_3_5_n_2),
        .DOD(NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_3 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_6_8_n_0),
        .DOB(RAM_reg_0_63_6_8_n_1),
        .DOC(RAM_reg_0_63_6_8_n_2),
        .DOD(NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_7 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_0_63_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_0_63_9_11_n_0),
        .DOB(RAM_reg_0_63_9_11_n_1),
        .DOC(RAM_reg_0_63_9_11_n_2),
        .DOD(NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_11 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_0_2_n_0),
        .DOB(RAM_reg_128_191_0_2_n_1),
        .DOC(RAM_reg_128_191_0_2_n_2),
        .DOD(NLW_RAM_reg_128_191_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_12_14_n_0),
        .DOB(RAM_reg_128_191_12_14_n_1),
        .DOC(RAM_reg_128_191_12_14_n_2),
        .DOD(NLW_RAM_reg_128_191_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_12 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_15_17_n_0),
        .DOB(RAM_reg_128_191_15_17_n_1),
        .DOC(RAM_reg_128_191_15_17_n_2),
        .DOD(NLW_RAM_reg_128_191_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_15 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_18_20_n_0),
        .DOB(RAM_reg_128_191_18_20_n_1),
        .DOC(RAM_reg_128_191_18_20_n_2),
        .DOD(NLW_RAM_reg_128_191_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_18 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_21_23_n_0),
        .DOB(RAM_reg_128_191_21_23_n_1),
        .DOC(RAM_reg_128_191_21_23_n_2),
        .DOD(NLW_RAM_reg_128_191_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_21 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_24_26_n_0),
        .DOB(RAM_reg_128_191_24_26_n_1),
        .DOC(RAM_reg_128_191_24_26_n_2),
        .DOD(NLW_RAM_reg_128_191_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_24 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_27_29_n_0),
        .DOB(RAM_reg_128_191_27_29_n_1),
        .DOC(RAM_reg_128_191_27_29_n_2),
        .DOD(NLW_RAM_reg_128_191_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_27 ));
  RAM64X1D RAM_reg_128_191_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_128_191_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_128_191_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_31 ));
  RAM64X1D RAM_reg_128_191_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_128_191_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_128_191_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_32 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_3_5_n_0),
        .DOB(RAM_reg_128_191_3_5_n_1),
        .DOC(RAM_reg_128_191_3_5_n_2),
        .DOD(NLW_RAM_reg_128_191_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_3 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_6_8_n_0),
        .DOB(RAM_reg_128_191_6_8_n_1),
        .DOC(RAM_reg_128_191_6_8_n_2),
        .DOD(NLW_RAM_reg_128_191_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_6 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_128_191_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_128_191_9_11_n_0),
        .DOB(RAM_reg_128_191_9_11_n_1),
        .DOC(RAM_reg_128_191_9_11_n_2),
        .DOD(NLW_RAM_reg_128_191_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_9 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_0_2_n_0),
        .DOB(RAM_reg_192_255_0_2_n_1),
        .DOC(RAM_reg_192_255_0_2_n_2),
        .DOD(NLW_RAM_reg_192_255_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_1 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_12_14_n_0),
        .DOB(RAM_reg_192_255_12_14_n_1),
        .DOC(RAM_reg_192_255_12_14_n_2),
        .DOD(NLW_RAM_reg_192_255_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_13 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_15_17_n_0),
        .DOB(RAM_reg_192_255_15_17_n_1),
        .DOC(RAM_reg_192_255_15_17_n_2),
        .DOD(NLW_RAM_reg_192_255_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_16 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_18_20_n_0),
        .DOB(RAM_reg_192_255_18_20_n_1),
        .DOC(RAM_reg_192_255_18_20_n_2),
        .DOD(NLW_RAM_reg_192_255_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_19 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_21_23_n_0),
        .DOB(RAM_reg_192_255_21_23_n_1),
        .DOC(RAM_reg_192_255_21_23_n_2),
        .DOD(NLW_RAM_reg_192_255_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_22 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_24_26_n_0),
        .DOB(RAM_reg_192_255_24_26_n_1),
        .DOC(RAM_reg_192_255_24_26_n_2),
        .DOD(NLW_RAM_reg_192_255_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_25 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_27_29_n_0),
        .DOB(RAM_reg_192_255_27_29_n_1),
        .DOC(RAM_reg_192_255_27_29_n_2),
        .DOD(NLW_RAM_reg_192_255_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_28 ));
  RAM64X1D RAM_reg_192_255_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_192_255_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_192_255_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_33 ));
  RAM64X1D RAM_reg_192_255_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_192_255_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_192_255_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_34 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_3_5_n_0),
        .DOB(RAM_reg_192_255_3_5_n_1),
        .DOC(RAM_reg_192_255_3_5_n_2),
        .DOD(NLW_RAM_reg_192_255_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_4 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_6_8_n_0),
        .DOB(RAM_reg_192_255_6_8_n_1),
        .DOC(RAM_reg_192_255_6_8_n_2),
        .DOD(NLW_RAM_reg_192_255_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_7 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_192_255_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_192_255_9_11_n_0),
        .DOB(RAM_reg_192_255_9_11_n_1),
        .DOC(RAM_reg_192_255_9_11_n_2),
        .DOD(NLW_RAM_reg_192_255_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_10 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_0_2_n_0),
        .DOB(RAM_reg_256_319_0_2_n_1),
        .DOC(RAM_reg_256_319_0_2_n_2),
        .DOD(NLW_RAM_reg_256_319_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_12_14_n_0),
        .DOB(RAM_reg_256_319_12_14_n_1),
        .DOC(RAM_reg_256_319_12_14_n_2),
        .DOD(NLW_RAM_reg_256_319_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_16 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_15_17_n_0),
        .DOB(RAM_reg_256_319_15_17_n_1),
        .DOC(RAM_reg_256_319_15_17_n_2),
        .DOD(NLW_RAM_reg_256_319_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_20 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_18_20_n_0),
        .DOB(RAM_reg_256_319_18_20_n_1),
        .DOC(RAM_reg_256_319_18_20_n_2),
        .DOD(NLW_RAM_reg_256_319_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_24 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_21_23_n_0),
        .DOB(RAM_reg_256_319_21_23_n_1),
        .DOC(RAM_reg_256_319_21_23_n_2),
        .DOD(NLW_RAM_reg_256_319_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_28 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_24_26_n_0),
        .DOB(RAM_reg_256_319_24_26_n_1),
        .DOC(RAM_reg_256_319_24_26_n_2),
        .DOD(NLW_RAM_reg_256_319_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_32 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_27_29_n_0),
        .DOB(RAM_reg_256_319_27_29_n_1),
        .DOC(RAM_reg_256_319_27_29_n_2),
        .DOD(NLW_RAM_reg_256_319_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_36 ));
  RAM64X1D RAM_reg_256_319_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_256_319_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_256_319_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_41 ));
  RAM64X1D RAM_reg_256_319_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_256_319_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_256_319_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_42 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_3_5_n_0),
        .DOB(RAM_reg_256_319_3_5_n_1),
        .DOC(RAM_reg_256_319_3_5_n_2),
        .DOD(NLW_RAM_reg_256_319_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_4 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_6_8_n_0),
        .DOB(RAM_reg_256_319_6_8_n_1),
        .DOC(RAM_reg_256_319_6_8_n_2),
        .DOD(NLW_RAM_reg_256_319_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_8 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_256_319_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_256_319_9_11_n_0),
        .DOB(RAM_reg_256_319_9_11_n_1),
        .DOC(RAM_reg_256_319_9_11_n_2),
        .DOD(NLW_RAM_reg_256_319_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_12 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_0_2_n_0),
        .DOB(RAM_reg_320_383_0_2_n_1),
        .DOC(RAM_reg_320_383_0_2_n_2),
        .DOD(NLW_RAM_reg_320_383_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_1 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_12_14_n_0),
        .DOB(RAM_reg_320_383_12_14_n_1),
        .DOC(RAM_reg_320_383_12_14_n_2),
        .DOD(NLW_RAM_reg_320_383_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_17 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_15_17_n_0),
        .DOB(RAM_reg_320_383_15_17_n_1),
        .DOC(RAM_reg_320_383_15_17_n_2),
        .DOD(NLW_RAM_reg_320_383_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_21 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_18_20_n_0),
        .DOB(RAM_reg_320_383_18_20_n_1),
        .DOC(RAM_reg_320_383_18_20_n_2),
        .DOD(NLW_RAM_reg_320_383_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_25 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_21_23_n_0),
        .DOB(RAM_reg_320_383_21_23_n_1),
        .DOC(RAM_reg_320_383_21_23_n_2),
        .DOD(NLW_RAM_reg_320_383_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_29 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_24_26_n_0),
        .DOB(RAM_reg_320_383_24_26_n_1),
        .DOC(RAM_reg_320_383_24_26_n_2),
        .DOD(NLW_RAM_reg_320_383_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_33 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_27_29_n_0),
        .DOB(RAM_reg_320_383_27_29_n_1),
        .DOC(RAM_reg_320_383_27_29_n_2),
        .DOD(NLW_RAM_reg_320_383_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_37 ));
  RAM64X1D RAM_reg_320_383_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_320_383_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_320_383_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_43 ));
  RAM64X1D RAM_reg_320_383_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_320_383_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_320_383_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_44 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_3_5_n_0),
        .DOB(RAM_reg_320_383_3_5_n_1),
        .DOC(RAM_reg_320_383_3_5_n_2),
        .DOD(NLW_RAM_reg_320_383_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_5 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_6_8_n_0),
        .DOB(RAM_reg_320_383_6_8_n_1),
        .DOC(RAM_reg_320_383_6_8_n_2),
        .DOD(NLW_RAM_reg_320_383_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_9 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_320_383_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_320_383_9_11_n_0),
        .DOB(RAM_reg_320_383_9_11_n_1),
        .DOC(RAM_reg_320_383_9_11_n_2),
        .DOD(NLW_RAM_reg_320_383_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_13 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_0_2_n_0),
        .DOB(RAM_reg_384_447_0_2_n_1),
        .DOC(RAM_reg_384_447_0_2_n_2),
        .DOD(NLW_RAM_reg_384_447_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6] ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_12_14_n_0),
        .DOB(RAM_reg_384_447_12_14_n_1),
        .DOC(RAM_reg_384_447_12_14_n_2),
        .DOD(NLW_RAM_reg_384_447_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_3 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_15_17_n_0),
        .DOB(RAM_reg_384_447_15_17_n_1),
        .DOC(RAM_reg_384_447_15_17_n_2),
        .DOD(NLW_RAM_reg_384_447_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_4 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_18_20_n_0),
        .DOB(RAM_reg_384_447_18_20_n_1),
        .DOC(RAM_reg_384_447_18_20_n_2),
        .DOD(NLW_RAM_reg_384_447_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_5 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_21_23_n_0),
        .DOB(RAM_reg_384_447_21_23_n_1),
        .DOC(RAM_reg_384_447_21_23_n_2),
        .DOD(NLW_RAM_reg_384_447_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_6 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_24_26_n_0),
        .DOB(RAM_reg_384_447_24_26_n_1),
        .DOC(RAM_reg_384_447_24_26_n_2),
        .DOD(NLW_RAM_reg_384_447_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_7 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_27_29_n_0),
        .DOB(RAM_reg_384_447_27_29_n_1),
        .DOC(RAM_reg_384_447_27_29_n_2),
        .DOD(NLW_RAM_reg_384_447_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_8 ));
  RAM64X1D RAM_reg_384_447_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_384_447_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_384_447_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_9 ));
  RAM64X1D RAM_reg_384_447_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_384_447_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_384_447_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_10 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_3_5_n_0),
        .DOB(RAM_reg_384_447_3_5_n_1),
        .DOC(RAM_reg_384_447_3_5_n_2),
        .DOD(NLW_RAM_reg_384_447_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_6_8_n_0),
        .DOB(RAM_reg_384_447_6_8_n_1),
        .DOC(RAM_reg_384_447_6_8_n_2),
        .DOD(NLW_RAM_reg_384_447_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_1 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_384_447_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_384_447_9_11_n_0),
        .DOB(RAM_reg_384_447_9_11_n_1),
        .DOC(RAM_reg_384_447_9_11_n_2),
        .DOD(NLW_RAM_reg_384_447_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[6]_2 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_0_2_n_0),
        .DOB(RAM_reg_448_511_0_2_n_1),
        .DOC(RAM_reg_448_511_0_2_n_2),
        .DOD(NLW_RAM_reg_448_511_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_2 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_12_14_n_0),
        .DOB(RAM_reg_448_511_12_14_n_1),
        .DOC(RAM_reg_448_511_12_14_n_2),
        .DOD(NLW_RAM_reg_448_511_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_18 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_15_17_n_0),
        .DOB(RAM_reg_448_511_15_17_n_1),
        .DOC(RAM_reg_448_511_15_17_n_2),
        .DOD(NLW_RAM_reg_448_511_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_22 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_18_20_n_0),
        .DOB(RAM_reg_448_511_18_20_n_1),
        .DOC(RAM_reg_448_511_18_20_n_2),
        .DOD(NLW_RAM_reg_448_511_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_26 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_21_23_n_0),
        .DOB(RAM_reg_448_511_21_23_n_1),
        .DOC(RAM_reg_448_511_21_23_n_2),
        .DOD(NLW_RAM_reg_448_511_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_30 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_24_26_n_0),
        .DOB(RAM_reg_448_511_24_26_n_1),
        .DOC(RAM_reg_448_511_24_26_n_2),
        .DOD(NLW_RAM_reg_448_511_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_34 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_27_29_n_0),
        .DOB(RAM_reg_448_511_27_29_n_1),
        .DOC(RAM_reg_448_511_27_29_n_2),
        .DOD(NLW_RAM_reg_448_511_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_38 ));
  RAM64X1D RAM_reg_448_511_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_448_511_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_448_511_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_45 ));
  RAM64X1D RAM_reg_448_511_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_448_511_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_448_511_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_46 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_3_5_n_0),
        .DOB(RAM_reg_448_511_3_5_n_1),
        .DOC(RAM_reg_448_511_3_5_n_2),
        .DOD(NLW_RAM_reg_448_511_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_6 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_6_8_n_0),
        .DOB(RAM_reg_448_511_6_8_n_1),
        .DOC(RAM_reg_448_511_6_8_n_2),
        .DOD(NLW_RAM_reg_448_511_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_10 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_448_511_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_448_511_9_11_n_0),
        .DOB(RAM_reg_448_511_9_11_n_1),
        .DOC(RAM_reg_448_511_9_11_n_2),
        .DOD(NLW_RAM_reg_448_511_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[7]_14 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_0_2
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[0]),
        .DIB(din[1]),
        .DIC(din[2]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_0_2_n_0),
        .DOB(RAM_reg_64_127_0_2_n_1),
        .DOC(RAM_reg_64_127_0_2_n_2),
        .DOD(NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8] ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_12_14
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[12]),
        .DIB(din[13]),
        .DIC(din[14]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_12_14_n_0),
        .DOB(RAM_reg_64_127_12_14_n_1),
        .DOC(RAM_reg_64_127_12_14_n_2),
        .DOD(NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_11 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_15_17
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[15]),
        .DIB(din[16]),
        .DIC(din[17]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_15_17_n_0),
        .DOB(RAM_reg_64_127_15_17_n_1),
        .DOC(RAM_reg_64_127_15_17_n_2),
        .DOD(NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_14 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_18_20
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[18]),
        .DIB(din[19]),
        .DIC(din[20]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_18_20_n_0),
        .DOB(RAM_reg_64_127_18_20_n_1),
        .DOC(RAM_reg_64_127_18_20_n_2),
        .DOD(NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_17 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_21_23
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[21]),
        .DIB(din[22]),
        .DIC(din[23]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_21_23_n_0),
        .DOB(RAM_reg_64_127_21_23_n_1),
        .DOC(RAM_reg_64_127_21_23_n_2),
        .DOD(NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_20 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_24_26
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[24]),
        .DIB(din[25]),
        .DIC(din[26]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_24_26_n_0),
        .DOB(RAM_reg_64_127_24_26_n_1),
        .DOC(RAM_reg_64_127_24_26_n_2),
        .DOD(NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_23 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_27_29
       (.ADDRA(ADDRA),
        .ADDRB(ADDRA),
        .ADDRC(ADDRA),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[27]),
        .DIB(din[28]),
        .DIC(din[29]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_27_29_n_0),
        .DOB(RAM_reg_64_127_27_29_n_1),
        .DOC(RAM_reg_64_127_27_29_n_2),
        .DOD(NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_26 ));
  RAM64X1D RAM_reg_64_127_30_30
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[30]),
        .DPO(RAM_reg_64_127_30_30_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_64_127_30_30_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_29 ));
  RAM64X1D RAM_reg_64_127_31_31
       (.A0(\gic0.gc0.count_d2_reg[5] [0]),
        .A1(\gic0.gc0.count_d2_reg[5] [1]),
        .A2(\gic0.gc0.count_d2_reg[5] [2]),
        .A3(\gic0.gc0.count_d2_reg[5] [3]),
        .A4(\gic0.gc0.count_d2_reg[5] [4]),
        .A5(\gic0.gc0.count_d2_reg[5] [5]),
        .D(din[31]),
        .DPO(RAM_reg_64_127_31_31_n_0),
        .DPRA0(ADDRA[0]),
        .DPRA1(ADDRA[1]),
        .DPRA2(ADDRA[2]),
        .DPRA3(ADDRA[3]),
        .DPRA4(ADDRA[4]),
        .DPRA5(ADDRA[5]),
        .SPO(NLW_RAM_reg_64_127_31_31_SPO_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_30 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_3_5
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[3]),
        .DIB(din[4]),
        .DIC(din[5]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_3_5_n_0),
        .DOB(RAM_reg_64_127_3_5_n_1),
        .DOC(RAM_reg_64_127_3_5_n_2),
        .DOD(NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_2 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_6_8
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[6]),
        .DIB(din[7]),
        .DIC(din[8]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_6_8_n_0),
        .DOB(RAM_reg_64_127_6_8_n_1),
        .DOC(RAM_reg_64_127_6_8_n_2),
        .DOD(NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_5 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M RAM_reg_64_127_9_11
       (.ADDRA(\gc0.count_d1_reg[8] [5:0]),
        .ADDRB(\gc0.count_d1_reg[8] [5:0]),
        .ADDRC(\gc0.count_d1_reg[8] [5:0]),
        .ADDRD(\gic0.gc0.count_d2_reg[5] ),
        .DIA(din[9]),
        .DIB(din[10]),
        .DIC(din[11]),
        .DID(1'b0),
        .DOA(RAM_reg_64_127_9_11_n_0),
        .DOB(RAM_reg_64_127_9_11_n_1),
        .DOC(RAM_reg_64_127_9_11_n_2),
        .DOD(NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED),
        .WCLK(wr_clk),
        .WE(\gic0.gc0.count_d2_reg[8]_8 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[0]_i_2 
       (.I0(RAM_reg_192_255_0_2_n_0),
        .I1(RAM_reg_128_191_0_2_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_0_2_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_0_2_n_0),
        .O(\gpr1.dout_i[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[0]_i_3 
       (.I0(RAM_reg_448_511_0_2_n_0),
        .I1(RAM_reg_384_447_0_2_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_0_2_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_0_2_n_0),
        .O(\gpr1.dout_i[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[10]_i_2 
       (.I0(RAM_reg_192_255_9_11_n_1),
        .I1(RAM_reg_128_191_9_11_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_9_11_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_9_11_n_1),
        .O(\gpr1.dout_i[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[10]_i_3 
       (.I0(RAM_reg_448_511_9_11_n_1),
        .I1(RAM_reg_384_447_9_11_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_9_11_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_9_11_n_1),
        .O(\gpr1.dout_i[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[11]_i_2 
       (.I0(RAM_reg_192_255_9_11_n_2),
        .I1(RAM_reg_128_191_9_11_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_9_11_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_9_11_n_2),
        .O(\gpr1.dout_i[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[11]_i_3 
       (.I0(RAM_reg_448_511_9_11_n_2),
        .I1(RAM_reg_384_447_9_11_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_9_11_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_9_11_n_2),
        .O(\gpr1.dout_i[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[12]_i_2 
       (.I0(RAM_reg_192_255_12_14_n_0),
        .I1(RAM_reg_128_191_12_14_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_12_14_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_12_14_n_0),
        .O(\gpr1.dout_i[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[12]_i_3 
       (.I0(RAM_reg_448_511_12_14_n_0),
        .I1(RAM_reg_384_447_12_14_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_12_14_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_12_14_n_0),
        .O(\gpr1.dout_i[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[13]_i_2 
       (.I0(RAM_reg_192_255_12_14_n_1),
        .I1(RAM_reg_128_191_12_14_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_12_14_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_12_14_n_1),
        .O(\gpr1.dout_i[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[13]_i_3 
       (.I0(RAM_reg_448_511_12_14_n_1),
        .I1(RAM_reg_384_447_12_14_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_12_14_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_12_14_n_1),
        .O(\gpr1.dout_i[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[14]_i_2 
       (.I0(RAM_reg_192_255_12_14_n_2),
        .I1(RAM_reg_128_191_12_14_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_12_14_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_12_14_n_2),
        .O(\gpr1.dout_i[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[14]_i_3 
       (.I0(RAM_reg_448_511_12_14_n_2),
        .I1(RAM_reg_384_447_12_14_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_12_14_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_12_14_n_2),
        .O(\gpr1.dout_i[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[15]_i_2 
       (.I0(RAM_reg_192_255_15_17_n_0),
        .I1(RAM_reg_128_191_15_17_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_15_17_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_15_17_n_0),
        .O(\gpr1.dout_i[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[15]_i_3 
       (.I0(RAM_reg_448_511_15_17_n_0),
        .I1(RAM_reg_384_447_15_17_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_15_17_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_15_17_n_0),
        .O(\gpr1.dout_i[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[16]_i_2 
       (.I0(RAM_reg_192_255_15_17_n_1),
        .I1(RAM_reg_128_191_15_17_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_15_17_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_15_17_n_1),
        .O(\gpr1.dout_i[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[16]_i_3 
       (.I0(RAM_reg_448_511_15_17_n_1),
        .I1(RAM_reg_384_447_15_17_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_15_17_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_15_17_n_1),
        .O(\gpr1.dout_i[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[17]_i_2 
       (.I0(RAM_reg_192_255_15_17_n_2),
        .I1(RAM_reg_128_191_15_17_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_15_17_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_15_17_n_2),
        .O(\gpr1.dout_i[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[17]_i_3 
       (.I0(RAM_reg_448_511_15_17_n_2),
        .I1(RAM_reg_384_447_15_17_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_15_17_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_15_17_n_2),
        .O(\gpr1.dout_i[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[18]_i_2 
       (.I0(RAM_reg_192_255_18_20_n_0),
        .I1(RAM_reg_128_191_18_20_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_18_20_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_18_20_n_0),
        .O(\gpr1.dout_i[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[18]_i_3 
       (.I0(RAM_reg_448_511_18_20_n_0),
        .I1(RAM_reg_384_447_18_20_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_18_20_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_18_20_n_0),
        .O(\gpr1.dout_i[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[19]_i_2 
       (.I0(RAM_reg_192_255_18_20_n_1),
        .I1(RAM_reg_128_191_18_20_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_18_20_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_18_20_n_1),
        .O(\gpr1.dout_i[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[19]_i_3 
       (.I0(RAM_reg_448_511_18_20_n_1),
        .I1(RAM_reg_384_447_18_20_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_18_20_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_18_20_n_1),
        .O(\gpr1.dout_i[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[1]_i_2 
       (.I0(RAM_reg_192_255_0_2_n_1),
        .I1(RAM_reg_128_191_0_2_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_0_2_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_0_2_n_1),
        .O(\gpr1.dout_i[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[1]_i_3 
       (.I0(RAM_reg_448_511_0_2_n_1),
        .I1(RAM_reg_384_447_0_2_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_0_2_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_0_2_n_1),
        .O(\gpr1.dout_i[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[20]_i_2 
       (.I0(RAM_reg_192_255_18_20_n_2),
        .I1(RAM_reg_128_191_18_20_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_18_20_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_18_20_n_2),
        .O(\gpr1.dout_i[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[20]_i_3 
       (.I0(RAM_reg_448_511_18_20_n_2),
        .I1(RAM_reg_384_447_18_20_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_18_20_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_18_20_n_2),
        .O(\gpr1.dout_i[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[21]_i_2 
       (.I0(RAM_reg_192_255_21_23_n_0),
        .I1(RAM_reg_128_191_21_23_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_21_23_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_21_23_n_0),
        .O(\gpr1.dout_i[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[21]_i_3 
       (.I0(RAM_reg_448_511_21_23_n_0),
        .I1(RAM_reg_384_447_21_23_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_21_23_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_21_23_n_0),
        .O(\gpr1.dout_i[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[22]_i_2 
       (.I0(RAM_reg_192_255_21_23_n_1),
        .I1(RAM_reg_128_191_21_23_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_21_23_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_21_23_n_1),
        .O(\gpr1.dout_i[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[22]_i_3 
       (.I0(RAM_reg_448_511_21_23_n_1),
        .I1(RAM_reg_384_447_21_23_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_21_23_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_21_23_n_1),
        .O(\gpr1.dout_i[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[23]_i_2 
       (.I0(RAM_reg_192_255_21_23_n_2),
        .I1(RAM_reg_128_191_21_23_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_21_23_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_21_23_n_2),
        .O(\gpr1.dout_i[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[23]_i_3 
       (.I0(RAM_reg_448_511_21_23_n_2),
        .I1(RAM_reg_384_447_21_23_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_21_23_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_21_23_n_2),
        .O(\gpr1.dout_i[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[24]_i_2 
       (.I0(RAM_reg_192_255_24_26_n_0),
        .I1(RAM_reg_128_191_24_26_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_24_26_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_24_26_n_0),
        .O(\gpr1.dout_i[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[24]_i_3 
       (.I0(RAM_reg_448_511_24_26_n_0),
        .I1(RAM_reg_384_447_24_26_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_24_26_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_24_26_n_0),
        .O(\gpr1.dout_i[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[25]_i_2 
       (.I0(RAM_reg_192_255_24_26_n_1),
        .I1(RAM_reg_128_191_24_26_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_24_26_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_24_26_n_1),
        .O(\gpr1.dout_i[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[25]_i_3 
       (.I0(RAM_reg_448_511_24_26_n_1),
        .I1(RAM_reg_384_447_24_26_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_24_26_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_24_26_n_1),
        .O(\gpr1.dout_i[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[26]_i_2 
       (.I0(RAM_reg_192_255_24_26_n_2),
        .I1(RAM_reg_128_191_24_26_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_24_26_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_24_26_n_2),
        .O(\gpr1.dout_i[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[26]_i_3 
       (.I0(RAM_reg_448_511_24_26_n_2),
        .I1(RAM_reg_384_447_24_26_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_24_26_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_24_26_n_2),
        .O(\gpr1.dout_i[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[27]_i_2 
       (.I0(RAM_reg_192_255_27_29_n_0),
        .I1(RAM_reg_128_191_27_29_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_27_29_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_27_29_n_0),
        .O(\gpr1.dout_i[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[27]_i_3 
       (.I0(RAM_reg_448_511_27_29_n_0),
        .I1(RAM_reg_384_447_27_29_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_27_29_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_27_29_n_0),
        .O(\gpr1.dout_i[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[28]_i_2 
       (.I0(RAM_reg_192_255_27_29_n_1),
        .I1(RAM_reg_128_191_27_29_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_27_29_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_27_29_n_1),
        .O(\gpr1.dout_i[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[28]_i_3 
       (.I0(RAM_reg_448_511_27_29_n_1),
        .I1(RAM_reg_384_447_27_29_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_27_29_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_27_29_n_1),
        .O(\gpr1.dout_i[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[29]_i_2 
       (.I0(RAM_reg_192_255_27_29_n_2),
        .I1(RAM_reg_128_191_27_29_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_27_29_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_27_29_n_2),
        .O(\gpr1.dout_i[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[29]_i_3 
       (.I0(RAM_reg_448_511_27_29_n_2),
        .I1(RAM_reg_384_447_27_29_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_27_29_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_27_29_n_2),
        .O(\gpr1.dout_i[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[2]_i_2 
       (.I0(RAM_reg_192_255_0_2_n_2),
        .I1(RAM_reg_128_191_0_2_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_0_2_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_0_2_n_2),
        .O(\gpr1.dout_i[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[2]_i_3 
       (.I0(RAM_reg_448_511_0_2_n_2),
        .I1(RAM_reg_384_447_0_2_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_0_2_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_0_2_n_2),
        .O(\gpr1.dout_i[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[30]_i_2 
       (.I0(RAM_reg_192_255_30_30_n_0),
        .I1(RAM_reg_128_191_30_30_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_30_30_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_30_30_n_0),
        .O(\gpr1.dout_i[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[30]_i_3 
       (.I0(RAM_reg_448_511_30_30_n_0),
        .I1(RAM_reg_384_447_30_30_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_30_30_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_30_30_n_0),
        .O(\gpr1.dout_i[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[31]_i_3 
       (.I0(RAM_reg_192_255_31_31_n_0),
        .I1(RAM_reg_128_191_31_31_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_31_31_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_31_31_n_0),
        .O(\gpr1.dout_i[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[31]_i_4 
       (.I0(RAM_reg_448_511_31_31_n_0),
        .I1(RAM_reg_384_447_31_31_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_31_31_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_31_31_n_0),
        .O(\gpr1.dout_i[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[3]_i_2 
       (.I0(RAM_reg_192_255_3_5_n_0),
        .I1(RAM_reg_128_191_3_5_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_3_5_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_3_5_n_0),
        .O(\gpr1.dout_i[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[3]_i_3 
       (.I0(RAM_reg_448_511_3_5_n_0),
        .I1(RAM_reg_384_447_3_5_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_3_5_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_3_5_n_0),
        .O(\gpr1.dout_i[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[4]_i_2 
       (.I0(RAM_reg_192_255_3_5_n_1),
        .I1(RAM_reg_128_191_3_5_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_3_5_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_3_5_n_1),
        .O(\gpr1.dout_i[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[4]_i_3 
       (.I0(RAM_reg_448_511_3_5_n_1),
        .I1(RAM_reg_384_447_3_5_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_3_5_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_3_5_n_1),
        .O(\gpr1.dout_i[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[5]_i_2 
       (.I0(RAM_reg_192_255_3_5_n_2),
        .I1(RAM_reg_128_191_3_5_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_3_5_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_3_5_n_2),
        .O(\gpr1.dout_i[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[5]_i_3 
       (.I0(RAM_reg_448_511_3_5_n_2),
        .I1(RAM_reg_384_447_3_5_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_3_5_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_3_5_n_2),
        .O(\gpr1.dout_i[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[6]_i_2 
       (.I0(RAM_reg_192_255_6_8_n_0),
        .I1(RAM_reg_128_191_6_8_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_6_8_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_6_8_n_0),
        .O(\gpr1.dout_i[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[6]_i_3 
       (.I0(RAM_reg_448_511_6_8_n_0),
        .I1(RAM_reg_384_447_6_8_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_6_8_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_6_8_n_0),
        .O(\gpr1.dout_i[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[7]_i_2 
       (.I0(RAM_reg_192_255_6_8_n_1),
        .I1(RAM_reg_128_191_6_8_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_6_8_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_6_8_n_1),
        .O(\gpr1.dout_i[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[7]_i_3 
       (.I0(RAM_reg_448_511_6_8_n_1),
        .I1(RAM_reg_384_447_6_8_n_1),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_6_8_n_1),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_6_8_n_1),
        .O(\gpr1.dout_i[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[8]_i_2 
       (.I0(RAM_reg_192_255_6_8_n_2),
        .I1(RAM_reg_128_191_6_8_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_6_8_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_6_8_n_2),
        .O(\gpr1.dout_i[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[8]_i_3 
       (.I0(RAM_reg_448_511_6_8_n_2),
        .I1(RAM_reg_384_447_6_8_n_2),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_6_8_n_2),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_6_8_n_2),
        .O(\gpr1.dout_i[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[9]_i_2 
       (.I0(RAM_reg_192_255_9_11_n_0),
        .I1(RAM_reg_128_191_9_11_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_64_127_9_11_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_0_63_9_11_n_0),
        .O(\gpr1.dout_i[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \gpr1.dout_i[9]_i_3 
       (.I0(RAM_reg_448_511_9_11_n_0),
        .I1(RAM_reg_384_447_9_11_n_0),
        .I2(\gc0.count_d1_reg[8] [7]),
        .I3(RAM_reg_320_383_9_11_n_0),
        .I4(\gc0.count_d1_reg[8] [6]),
        .I5(RAM_reg_256_319_9_11_n_0),
        .O(\gpr1.dout_i[9]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[0]_i_1_n_0 ),
        .Q(Q[0]));
  MUXF7 \gpr1.dout_i_reg[0]_i_1 
       (.I0(\gpr1.dout_i[0]_i_2_n_0 ),
        .I1(\gpr1.dout_i[0]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[0]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[10] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[10]_i_1_n_0 ),
        .Q(Q[10]));
  MUXF7 \gpr1.dout_i_reg[10]_i_1 
       (.I0(\gpr1.dout_i[10]_i_2_n_0 ),
        .I1(\gpr1.dout_i[10]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[10]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[11] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[11]_i_1_n_0 ),
        .Q(Q[11]));
  MUXF7 \gpr1.dout_i_reg[11]_i_1 
       (.I0(\gpr1.dout_i[11]_i_2_n_0 ),
        .I1(\gpr1.dout_i[11]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[11]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[12] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[12]_i_1_n_0 ),
        .Q(Q[12]));
  MUXF7 \gpr1.dout_i_reg[12]_i_1 
       (.I0(\gpr1.dout_i[12]_i_2_n_0 ),
        .I1(\gpr1.dout_i[12]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[12]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[13] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[13]_i_1_n_0 ),
        .Q(Q[13]));
  MUXF7 \gpr1.dout_i_reg[13]_i_1 
       (.I0(\gpr1.dout_i[13]_i_2_n_0 ),
        .I1(\gpr1.dout_i[13]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[13]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[14] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[14]_i_1_n_0 ),
        .Q(Q[14]));
  MUXF7 \gpr1.dout_i_reg[14]_i_1 
       (.I0(\gpr1.dout_i[14]_i_2_n_0 ),
        .I1(\gpr1.dout_i[14]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[14]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[15] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[15]_i_1_n_0 ),
        .Q(Q[15]));
  MUXF7 \gpr1.dout_i_reg[15]_i_1 
       (.I0(\gpr1.dout_i[15]_i_2_n_0 ),
        .I1(\gpr1.dout_i[15]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[15]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[16] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[16]_i_1_n_0 ),
        .Q(Q[16]));
  MUXF7 \gpr1.dout_i_reg[16]_i_1 
       (.I0(\gpr1.dout_i[16]_i_2_n_0 ),
        .I1(\gpr1.dout_i[16]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[16]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[17] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[17]_i_1_n_0 ),
        .Q(Q[17]));
  MUXF7 \gpr1.dout_i_reg[17]_i_1 
       (.I0(\gpr1.dout_i[17]_i_2_n_0 ),
        .I1(\gpr1.dout_i[17]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[17]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[18] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[18]_i_1_n_0 ),
        .Q(Q[18]));
  MUXF7 \gpr1.dout_i_reg[18]_i_1 
       (.I0(\gpr1.dout_i[18]_i_2_n_0 ),
        .I1(\gpr1.dout_i[18]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[18]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[19] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[19]_i_1_n_0 ),
        .Q(Q[19]));
  MUXF7 \gpr1.dout_i_reg[19]_i_1 
       (.I0(\gpr1.dout_i[19]_i_2_n_0 ),
        .I1(\gpr1.dout_i[19]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[19]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[1]_i_1_n_0 ),
        .Q(Q[1]));
  MUXF7 \gpr1.dout_i_reg[1]_i_1 
       (.I0(\gpr1.dout_i[1]_i_2_n_0 ),
        .I1(\gpr1.dout_i[1]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[1]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[20] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[20]_i_1_n_0 ),
        .Q(Q[20]));
  MUXF7 \gpr1.dout_i_reg[20]_i_1 
       (.I0(\gpr1.dout_i[20]_i_2_n_0 ),
        .I1(\gpr1.dout_i[20]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[20]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[21] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[21]_i_1_n_0 ),
        .Q(Q[21]));
  MUXF7 \gpr1.dout_i_reg[21]_i_1 
       (.I0(\gpr1.dout_i[21]_i_2_n_0 ),
        .I1(\gpr1.dout_i[21]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[21]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[22] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[22]_i_1_n_0 ),
        .Q(Q[22]));
  MUXF7 \gpr1.dout_i_reg[22]_i_1 
       (.I0(\gpr1.dout_i[22]_i_2_n_0 ),
        .I1(\gpr1.dout_i[22]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[22]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[23] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[23]_i_1_n_0 ),
        .Q(Q[23]));
  MUXF7 \gpr1.dout_i_reg[23]_i_1 
       (.I0(\gpr1.dout_i[23]_i_2_n_0 ),
        .I1(\gpr1.dout_i[23]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[23]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[24] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[24]_i_1_n_0 ),
        .Q(Q[24]));
  MUXF7 \gpr1.dout_i_reg[24]_i_1 
       (.I0(\gpr1.dout_i[24]_i_2_n_0 ),
        .I1(\gpr1.dout_i[24]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[24]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[25] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[25]_i_1_n_0 ),
        .Q(Q[25]));
  MUXF7 \gpr1.dout_i_reg[25]_i_1 
       (.I0(\gpr1.dout_i[25]_i_2_n_0 ),
        .I1(\gpr1.dout_i[25]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[25]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[26] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[26]_i_1_n_0 ),
        .Q(Q[26]));
  MUXF7 \gpr1.dout_i_reg[26]_i_1 
       (.I0(\gpr1.dout_i[26]_i_2_n_0 ),
        .I1(\gpr1.dout_i[26]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[26]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[27] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[27]_i_1_n_0 ),
        .Q(Q[27]));
  MUXF7 \gpr1.dout_i_reg[27]_i_1 
       (.I0(\gpr1.dout_i[27]_i_2_n_0 ),
        .I1(\gpr1.dout_i[27]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[27]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[28] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[28]_i_1_n_0 ),
        .Q(Q[28]));
  MUXF7 \gpr1.dout_i_reg[28]_i_1 
       (.I0(\gpr1.dout_i[28]_i_2_n_0 ),
        .I1(\gpr1.dout_i[28]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[28]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[29] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[29]_i_1_n_0 ),
        .Q(Q[29]));
  MUXF7 \gpr1.dout_i_reg[29]_i_1 
       (.I0(\gpr1.dout_i[29]_i_2_n_0 ),
        .I1(\gpr1.dout_i[29]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[29]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[2]_i_1_n_0 ),
        .Q(Q[2]));
  MUXF7 \gpr1.dout_i_reg[2]_i_1 
       (.I0(\gpr1.dout_i[2]_i_2_n_0 ),
        .I1(\gpr1.dout_i[2]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[2]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[30] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[30]_i_1_n_0 ),
        .Q(Q[30]));
  MUXF7 \gpr1.dout_i_reg[30]_i_1 
       (.I0(\gpr1.dout_i[30]_i_2_n_0 ),
        .I1(\gpr1.dout_i[30]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[30]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[31] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[31]_i_2_n_0 ),
        .Q(Q[31]));
  MUXF7 \gpr1.dout_i_reg[31]_i_2 
       (.I0(\gpr1.dout_i[31]_i_3_n_0 ),
        .I1(\gpr1.dout_i[31]_i_4_n_0 ),
        .O(\gpr1.dout_i_reg[31]_i_2_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[3]_i_1_n_0 ),
        .Q(Q[3]));
  MUXF7 \gpr1.dout_i_reg[3]_i_1 
       (.I0(\gpr1.dout_i[3]_i_2_n_0 ),
        .I1(\gpr1.dout_i[3]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[3]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[4]_i_1_n_0 ),
        .Q(Q[4]));
  MUXF7 \gpr1.dout_i_reg[4]_i_1 
       (.I0(\gpr1.dout_i[4]_i_2_n_0 ),
        .I1(\gpr1.dout_i[4]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[4]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[5] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[5]_i_1_n_0 ),
        .Q(Q[5]));
  MUXF7 \gpr1.dout_i_reg[5]_i_1 
       (.I0(\gpr1.dout_i[5]_i_2_n_0 ),
        .I1(\gpr1.dout_i[5]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[5]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[6] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[6]_i_1_n_0 ),
        .Q(Q[6]));
  MUXF7 \gpr1.dout_i_reg[6]_i_1 
       (.I0(\gpr1.dout_i[6]_i_2_n_0 ),
        .I1(\gpr1.dout_i[6]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[6]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[7] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[7]_i_1_n_0 ),
        .Q(Q[7]));
  MUXF7 \gpr1.dout_i_reg[7]_i_1 
       (.I0(\gpr1.dout_i[7]_i_2_n_0 ),
        .I1(\gpr1.dout_i[7]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[7]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[8] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[8]_i_1_n_0 ),
        .Q(Q[8]));
  MUXF7 \gpr1.dout_i_reg[8]_i_1 
       (.I0(\gpr1.dout_i[8]_i_2_n_0 ),
        .I1(\gpr1.dout_i[8]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[8]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[9] 
       (.C(rd_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] ),
        .D(\gpr1.dout_i_reg[9]_i_1_n_0 ),
        .Q(Q[9]));
  MUXF7 \gpr1.dout_i_reg[9]_i_1 
       (.I0(\gpr1.dout_i[9]_i_2_n_0 ),
        .I1(\gpr1.dout_i[9]_i_3_n_0 ),
        .O(\gpr1.dout_i_reg[9]_i_1_n_0 ),
        .S(\gc0.count_d1_reg[8] [8]));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module bitfile_fifo_in_fifo_generator_ramfifo
   (empty,
    full,
    dout,
    wr_clk,
    rst,
    rd_clk,
    rd_en,
    wr_en,
    din);
  output empty;
  output full;
  output [31:0]dout;
  input wr_clk;
  input rst;
  input rd_clk;
  input rd_en;
  input wr_en;
  input [31:0]din;

  wire RD_RST;
  wire RST;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire \gntv_or_sync_fifo.gcx.clkx_n_0 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_1 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_19 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_20 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_21 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_22 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_23 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_24 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_100 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_101 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_102 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_103 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_104 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_105 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_106 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_107 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_108 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_109 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_110 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_111 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_112 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_113 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_114 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_115 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_116 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_117 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_118 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_119 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_120 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_121 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_17 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_27 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_28 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_29 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_30 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_31 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_32 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_33 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_34 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_35 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_36 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_37 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_38 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_39 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_40 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_41 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_42 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_43 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_44 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_45 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_46 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_47 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_48 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_49 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_50 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_51 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_52 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_53 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_54 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_55 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_56 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_57 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_58 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_59 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_60 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_61 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_62 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_63 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_64 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_65 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_66 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_67 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_68 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_69 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_70 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_71 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_72 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_73 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_74 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_75 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_76 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_77 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_78 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_79 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_80 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_81 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_82 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_83 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_84 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_85 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_86 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_87 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_88 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_89 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_90 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_91 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_92 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_93 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_94 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_95 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_96 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_97 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_98 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_99 ;
  wire [3:0]\gras.rsts/c1/v1_reg ;
  wire [3:0]\gwas.wsts/c1/v1_reg ;
  wire [3:0]\gwas.wsts/c2/v1_reg ;
  wire [8:8]p_0_out;
  wire p_15_out;
  wire [8:0]p_1_out;
  wire [8:0]p_20_out;
  wire [7:0]p_8_out;
  wire [8:0]p_9_out;
  wire rd_clk;
  wire rd_en;
  wire [7:0]rd_pntr_plus1;
  wire [1:1]rd_rst_i;
  wire rst;
  wire rst_full_ff_i;
  wire rstblk_n_4;
  wire wr_clk;
  wire wr_en;
  wire [7:0]wr_pntr_plus2;

  bitfile_fifo_in_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.Q(p_20_out[8:6]),
        .RD_PNTR_WR(p_0_out),
        .WR_PNTR_RD(p_1_out),
        .\gc0.count_d1_reg[0]_rep (\gntv_or_sync_fifo.gl0.rd_n_24 ),
        .\gc0.count_d1_reg[1]_rep (\gntv_or_sync_fifo.gl0.rd_n_23 ),
        .\gc0.count_d1_reg[2]_rep (\gntv_or_sync_fifo.gl0.rd_n_22 ),
        .\gc0.count_d1_reg[3]_rep (\gntv_or_sync_fifo.gl0.rd_n_21 ),
        .\gc0.count_d1_reg[4]_rep (\gntv_or_sync_fifo.gl0.rd_n_20 ),
        .\gc0.count_d1_reg[5]_rep (\gntv_or_sync_fifo.gl0.rd_n_19 ),
        .\gc0.count_reg[7] (rd_pntr_plus1),
        .\gic0.gc0.count_d1_reg[7] (p_8_out),
        .\gic0.gc0.count_d2_reg[8] (p_9_out),
        .\gic0.gc0.count_reg[7] (wr_pntr_plus2),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] (rd_rst_i),
        .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] (rst_full_ff_i),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_0 ),
        .rd_clk(rd_clk),
        .v1_reg(\gras.rsts/c1/v1_reg ),
        .v1_reg_0(\gwas.wsts/c1/v1_reg ),
        .v1_reg_1(\gwas.wsts/c2/v1_reg ),
        .wr_clk(wr_clk));
  bitfile_fifo_in_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.E(\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .Q(RD_RST),
        .WR_PNTR_RD(p_1_out),
        .empty(empty),
        .\gc0.count_d1_reg[7] (rd_pntr_plus1),
        .\goreg_dm.dout_i_reg[31] (p_15_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .\rd_pntr_gc_reg[0] (\gntv_or_sync_fifo.gl0.rd_n_24 ),
        .\rd_pntr_gc_reg[1] (\gntv_or_sync_fifo.gl0.rd_n_23 ),
        .\rd_pntr_gc_reg[2] (\gntv_or_sync_fifo.gl0.rd_n_22 ),
        .\rd_pntr_gc_reg[3] (\gntv_or_sync_fifo.gl0.rd_n_21 ),
        .\rd_pntr_gc_reg[4] (\gntv_or_sync_fifo.gl0.rd_n_20 ),
        .\rd_pntr_gc_reg[5] (\gntv_or_sync_fifo.gl0.rd_n_19 ),
        .\rd_pntr_gc_reg[8] (p_20_out),
        .v1_reg(\gras.rsts/c1/v1_reg ),
        .\wr_pntr_bin_reg[8] (\gntv_or_sync_fifo.gcx.clkx_n_0 ));
  bitfile_fifo_in_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.Q({RST,rst_full_ff_i}),
        .RD_PNTR_WR(p_0_out),
        .full(full),
        .\gic0.gc0.count_d1_reg[7] (wr_pntr_plus2),
        .\gic0.gc0.count_d2_reg[7] (p_8_out),
        .\gpr1.dout_i_reg[0] (\gntv_or_sync_fifo.gl0.wr_n_70 ),
        .\gpr1.dout_i_reg[0]_0 (\gntv_or_sync_fifo.gl0.wr_n_71 ),
        .\gpr1.dout_i_reg[0]_1 (\gntv_or_sync_fifo.gl0.wr_n_72 ),
        .\gpr1.dout_i_reg[0]_2 (\gntv_or_sync_fifo.gl0.wr_n_73 ),
        .\gpr1.dout_i_reg[0]_3 (\gntv_or_sync_fifo.gl0.wr_n_85 ),
        .\gpr1.dout_i_reg[0]_4 (\gntv_or_sync_fifo.gl0.wr_n_97 ),
        .\gpr1.dout_i_reg[0]_5 (\gntv_or_sync_fifo.gl0.wr_n_109 ),
        .\gpr1.dout_i_reg[0]_6 (\gntv_or_sync_fifo.gl0.wr_n_121 ),
        .\gpr1.dout_i_reg[12] (\gntv_or_sync_fifo.gl0.wr_n_54 ),
        .\gpr1.dout_i_reg[12]_0 (\gntv_or_sync_fifo.gl0.wr_n_55 ),
        .\gpr1.dout_i_reg[12]_1 (\gntv_or_sync_fifo.gl0.wr_n_56 ),
        .\gpr1.dout_i_reg[12]_2 (\gntv_or_sync_fifo.gl0.wr_n_57 ),
        .\gpr1.dout_i_reg[12]_3 (\gntv_or_sync_fifo.gl0.wr_n_81 ),
        .\gpr1.dout_i_reg[12]_4 (\gntv_or_sync_fifo.gl0.wr_n_93 ),
        .\gpr1.dout_i_reg[12]_5 (\gntv_or_sync_fifo.gl0.wr_n_105 ),
        .\gpr1.dout_i_reg[12]_6 (\gntv_or_sync_fifo.gl0.wr_n_117 ),
        .\gpr1.dout_i_reg[15] (\gntv_or_sync_fifo.gl0.wr_n_50 ),
        .\gpr1.dout_i_reg[15]_0 (\gntv_or_sync_fifo.gl0.wr_n_51 ),
        .\gpr1.dout_i_reg[15]_1 (\gntv_or_sync_fifo.gl0.wr_n_52 ),
        .\gpr1.dout_i_reg[15]_2 (\gntv_or_sync_fifo.gl0.wr_n_53 ),
        .\gpr1.dout_i_reg[15]_3 (\gntv_or_sync_fifo.gl0.wr_n_80 ),
        .\gpr1.dout_i_reg[15]_4 (\gntv_or_sync_fifo.gl0.wr_n_92 ),
        .\gpr1.dout_i_reg[15]_5 (\gntv_or_sync_fifo.gl0.wr_n_104 ),
        .\gpr1.dout_i_reg[15]_6 (\gntv_or_sync_fifo.gl0.wr_n_116 ),
        .\gpr1.dout_i_reg[18] (\gntv_or_sync_fifo.gl0.wr_n_46 ),
        .\gpr1.dout_i_reg[18]_0 (\gntv_or_sync_fifo.gl0.wr_n_47 ),
        .\gpr1.dout_i_reg[18]_1 (\gntv_or_sync_fifo.gl0.wr_n_48 ),
        .\gpr1.dout_i_reg[18]_2 (\gntv_or_sync_fifo.gl0.wr_n_49 ),
        .\gpr1.dout_i_reg[18]_3 (\gntv_or_sync_fifo.gl0.wr_n_79 ),
        .\gpr1.dout_i_reg[18]_4 (\gntv_or_sync_fifo.gl0.wr_n_91 ),
        .\gpr1.dout_i_reg[18]_5 (\gntv_or_sync_fifo.gl0.wr_n_103 ),
        .\gpr1.dout_i_reg[18]_6 (\gntv_or_sync_fifo.gl0.wr_n_115 ),
        .\gpr1.dout_i_reg[21] (\gntv_or_sync_fifo.gl0.wr_n_42 ),
        .\gpr1.dout_i_reg[21]_0 (\gntv_or_sync_fifo.gl0.wr_n_43 ),
        .\gpr1.dout_i_reg[21]_1 (\gntv_or_sync_fifo.gl0.wr_n_44 ),
        .\gpr1.dout_i_reg[21]_2 (\gntv_or_sync_fifo.gl0.wr_n_45 ),
        .\gpr1.dout_i_reg[21]_3 (\gntv_or_sync_fifo.gl0.wr_n_78 ),
        .\gpr1.dout_i_reg[21]_4 (\gntv_or_sync_fifo.gl0.wr_n_90 ),
        .\gpr1.dout_i_reg[21]_5 (\gntv_or_sync_fifo.gl0.wr_n_102 ),
        .\gpr1.dout_i_reg[21]_6 (\gntv_or_sync_fifo.gl0.wr_n_114 ),
        .\gpr1.dout_i_reg[24] (\gntv_or_sync_fifo.gl0.wr_n_38 ),
        .\gpr1.dout_i_reg[24]_0 (\gntv_or_sync_fifo.gl0.wr_n_39 ),
        .\gpr1.dout_i_reg[24]_1 (\gntv_or_sync_fifo.gl0.wr_n_40 ),
        .\gpr1.dout_i_reg[24]_2 (\gntv_or_sync_fifo.gl0.wr_n_41 ),
        .\gpr1.dout_i_reg[24]_3 (\gntv_or_sync_fifo.gl0.wr_n_77 ),
        .\gpr1.dout_i_reg[24]_4 (\gntv_or_sync_fifo.gl0.wr_n_89 ),
        .\gpr1.dout_i_reg[24]_5 (\gntv_or_sync_fifo.gl0.wr_n_101 ),
        .\gpr1.dout_i_reg[24]_6 (\gntv_or_sync_fifo.gl0.wr_n_113 ),
        .\gpr1.dout_i_reg[27] (\gntv_or_sync_fifo.gl0.wr_n_34 ),
        .\gpr1.dout_i_reg[27]_0 (\gntv_or_sync_fifo.gl0.wr_n_35 ),
        .\gpr1.dout_i_reg[27]_1 (\gntv_or_sync_fifo.gl0.wr_n_36 ),
        .\gpr1.dout_i_reg[27]_2 (\gntv_or_sync_fifo.gl0.wr_n_37 ),
        .\gpr1.dout_i_reg[27]_3 (\gntv_or_sync_fifo.gl0.wr_n_76 ),
        .\gpr1.dout_i_reg[27]_4 (\gntv_or_sync_fifo.gl0.wr_n_88 ),
        .\gpr1.dout_i_reg[27]_5 (\gntv_or_sync_fifo.gl0.wr_n_100 ),
        .\gpr1.dout_i_reg[27]_6 (\gntv_or_sync_fifo.gl0.wr_n_112 ),
        .\gpr1.dout_i_reg[30] (\gntv_or_sync_fifo.gl0.wr_n_27 ),
        .\gpr1.dout_i_reg[30]_0 (\gntv_or_sync_fifo.gl0.wr_n_29 ),
        .\gpr1.dout_i_reg[30]_1 (\gntv_or_sync_fifo.gl0.wr_n_31 ),
        .\gpr1.dout_i_reg[30]_2 (\gntv_or_sync_fifo.gl0.wr_n_33 ),
        .\gpr1.dout_i_reg[30]_3 (\gntv_or_sync_fifo.gl0.wr_n_75 ),
        .\gpr1.dout_i_reg[30]_4 (\gntv_or_sync_fifo.gl0.wr_n_87 ),
        .\gpr1.dout_i_reg[30]_5 (\gntv_or_sync_fifo.gl0.wr_n_99 ),
        .\gpr1.dout_i_reg[30]_6 (\gntv_or_sync_fifo.gl0.wr_n_111 ),
        .\gpr1.dout_i_reg[31] (\gntv_or_sync_fifo.gl0.wr_n_17 ),
        .\gpr1.dout_i_reg[31]_0 (\gntv_or_sync_fifo.gl0.wr_n_28 ),
        .\gpr1.dout_i_reg[31]_1 (\gntv_or_sync_fifo.gl0.wr_n_30 ),
        .\gpr1.dout_i_reg[31]_2 (\gntv_or_sync_fifo.gl0.wr_n_32 ),
        .\gpr1.dout_i_reg[31]_3 (\gntv_or_sync_fifo.gl0.wr_n_74 ),
        .\gpr1.dout_i_reg[31]_4 (\gntv_or_sync_fifo.gl0.wr_n_86 ),
        .\gpr1.dout_i_reg[31]_5 (\gntv_or_sync_fifo.gl0.wr_n_98 ),
        .\gpr1.dout_i_reg[31]_6 (\gntv_or_sync_fifo.gl0.wr_n_110 ),
        .\gpr1.dout_i_reg[3] (\gntv_or_sync_fifo.gl0.wr_n_66 ),
        .\gpr1.dout_i_reg[3]_0 (\gntv_or_sync_fifo.gl0.wr_n_67 ),
        .\gpr1.dout_i_reg[3]_1 (\gntv_or_sync_fifo.gl0.wr_n_68 ),
        .\gpr1.dout_i_reg[3]_2 (\gntv_or_sync_fifo.gl0.wr_n_69 ),
        .\gpr1.dout_i_reg[3]_3 (\gntv_or_sync_fifo.gl0.wr_n_84 ),
        .\gpr1.dout_i_reg[3]_4 (\gntv_or_sync_fifo.gl0.wr_n_96 ),
        .\gpr1.dout_i_reg[3]_5 (\gntv_or_sync_fifo.gl0.wr_n_108 ),
        .\gpr1.dout_i_reg[3]_6 (\gntv_or_sync_fifo.gl0.wr_n_120 ),
        .\gpr1.dout_i_reg[6] (\gntv_or_sync_fifo.gl0.wr_n_62 ),
        .\gpr1.dout_i_reg[6]_0 (\gntv_or_sync_fifo.gl0.wr_n_63 ),
        .\gpr1.dout_i_reg[6]_1 (\gntv_or_sync_fifo.gl0.wr_n_64 ),
        .\gpr1.dout_i_reg[6]_2 (\gntv_or_sync_fifo.gl0.wr_n_65 ),
        .\gpr1.dout_i_reg[6]_3 (\gntv_or_sync_fifo.gl0.wr_n_83 ),
        .\gpr1.dout_i_reg[6]_4 (\gntv_or_sync_fifo.gl0.wr_n_95 ),
        .\gpr1.dout_i_reg[6]_5 (\gntv_or_sync_fifo.gl0.wr_n_107 ),
        .\gpr1.dout_i_reg[6]_6 (\gntv_or_sync_fifo.gl0.wr_n_119 ),
        .\gpr1.dout_i_reg[9] (\gntv_or_sync_fifo.gl0.wr_n_58 ),
        .\gpr1.dout_i_reg[9]_0 (\gntv_or_sync_fifo.gl0.wr_n_59 ),
        .\gpr1.dout_i_reg[9]_1 (\gntv_or_sync_fifo.gl0.wr_n_60 ),
        .\gpr1.dout_i_reg[9]_2 (\gntv_or_sync_fifo.gl0.wr_n_61 ),
        .\gpr1.dout_i_reg[9]_3 (\gntv_or_sync_fifo.gl0.wr_n_82 ),
        .\gpr1.dout_i_reg[9]_4 (\gntv_or_sync_fifo.gl0.wr_n_94 ),
        .\gpr1.dout_i_reg[9]_5 (\gntv_or_sync_fifo.gl0.wr_n_106 ),
        .\gpr1.dout_i_reg[9]_6 (\gntv_or_sync_fifo.gl0.wr_n_118 ),
        .v1_reg(\gwas.wsts/c1/v1_reg ),
        .v1_reg_0(\gwas.wsts/c2/v1_reg ),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .\wr_pntr_gc_reg[8] (p_9_out));
  bitfile_fifo_in_memory \gntv_or_sync_fifo.mem 
       (.E(\gntv_or_sync_fifo.gl0.rd_n_1 ),
        .Q(rstblk_n_4),
        .din(din),
        .dout(dout),
        .\gc0.count_d1_reg[0]_rep (\gntv_or_sync_fifo.gl0.rd_n_24 ),
        .\gc0.count_d1_reg[1]_rep (\gntv_or_sync_fifo.gl0.rd_n_23 ),
        .\gc0.count_d1_reg[2]_rep (\gntv_or_sync_fifo.gl0.rd_n_22 ),
        .\gc0.count_d1_reg[3]_rep (\gntv_or_sync_fifo.gl0.rd_n_21 ),
        .\gc0.count_d1_reg[4]_rep (\gntv_or_sync_fifo.gl0.rd_n_20 ),
        .\gc0.count_d1_reg[5]_rep (\gntv_or_sync_fifo.gl0.rd_n_19 ),
        .\gc0.count_d1_reg[8] (p_20_out),
        .\gic0.gc0.count_d2_reg[5] (p_9_out[5:0]),
        .\gic0.gc0.count_d2_reg[6] (\gntv_or_sync_fifo.gl0.wr_n_109 ),
        .\gic0.gc0.count_d2_reg[6]_0 (\gntv_or_sync_fifo.gl0.wr_n_108 ),
        .\gic0.gc0.count_d2_reg[6]_1 (\gntv_or_sync_fifo.gl0.wr_n_107 ),
        .\gic0.gc0.count_d2_reg[6]_10 (\gntv_or_sync_fifo.gl0.wr_n_98 ),
        .\gic0.gc0.count_d2_reg[6]_2 (\gntv_or_sync_fifo.gl0.wr_n_106 ),
        .\gic0.gc0.count_d2_reg[6]_3 (\gntv_or_sync_fifo.gl0.wr_n_105 ),
        .\gic0.gc0.count_d2_reg[6]_4 (\gntv_or_sync_fifo.gl0.wr_n_104 ),
        .\gic0.gc0.count_d2_reg[6]_5 (\gntv_or_sync_fifo.gl0.wr_n_103 ),
        .\gic0.gc0.count_d2_reg[6]_6 (\gntv_or_sync_fifo.gl0.wr_n_102 ),
        .\gic0.gc0.count_d2_reg[6]_7 (\gntv_or_sync_fifo.gl0.wr_n_101 ),
        .\gic0.gc0.count_d2_reg[6]_8 (\gntv_or_sync_fifo.gl0.wr_n_100 ),
        .\gic0.gc0.count_d2_reg[6]_9 (\gntv_or_sync_fifo.gl0.wr_n_99 ),
        .\gic0.gc0.count_d2_reg[7] (\gntv_or_sync_fifo.gl0.wr_n_73 ),
        .\gic0.gc0.count_d2_reg[7]_0 (\gntv_or_sync_fifo.gl0.wr_n_85 ),
        .\gic0.gc0.count_d2_reg[7]_1 (\gntv_or_sync_fifo.gl0.wr_n_97 ),
        .\gic0.gc0.count_d2_reg[7]_10 (\gntv_or_sync_fifo.gl0.wr_n_119 ),
        .\gic0.gc0.count_d2_reg[7]_11 (\gntv_or_sync_fifo.gl0.wr_n_61 ),
        .\gic0.gc0.count_d2_reg[7]_12 (\gntv_or_sync_fifo.gl0.wr_n_82 ),
        .\gic0.gc0.count_d2_reg[7]_13 (\gntv_or_sync_fifo.gl0.wr_n_94 ),
        .\gic0.gc0.count_d2_reg[7]_14 (\gntv_or_sync_fifo.gl0.wr_n_118 ),
        .\gic0.gc0.count_d2_reg[7]_15 (\gntv_or_sync_fifo.gl0.wr_n_57 ),
        .\gic0.gc0.count_d2_reg[7]_16 (\gntv_or_sync_fifo.gl0.wr_n_81 ),
        .\gic0.gc0.count_d2_reg[7]_17 (\gntv_or_sync_fifo.gl0.wr_n_93 ),
        .\gic0.gc0.count_d2_reg[7]_18 (\gntv_or_sync_fifo.gl0.wr_n_117 ),
        .\gic0.gc0.count_d2_reg[7]_19 (\gntv_or_sync_fifo.gl0.wr_n_53 ),
        .\gic0.gc0.count_d2_reg[7]_2 (\gntv_or_sync_fifo.gl0.wr_n_121 ),
        .\gic0.gc0.count_d2_reg[7]_20 (\gntv_or_sync_fifo.gl0.wr_n_80 ),
        .\gic0.gc0.count_d2_reg[7]_21 (\gntv_or_sync_fifo.gl0.wr_n_92 ),
        .\gic0.gc0.count_d2_reg[7]_22 (\gntv_or_sync_fifo.gl0.wr_n_116 ),
        .\gic0.gc0.count_d2_reg[7]_23 (\gntv_or_sync_fifo.gl0.wr_n_49 ),
        .\gic0.gc0.count_d2_reg[7]_24 (\gntv_or_sync_fifo.gl0.wr_n_79 ),
        .\gic0.gc0.count_d2_reg[7]_25 (\gntv_or_sync_fifo.gl0.wr_n_91 ),
        .\gic0.gc0.count_d2_reg[7]_26 (\gntv_or_sync_fifo.gl0.wr_n_115 ),
        .\gic0.gc0.count_d2_reg[7]_27 (\gntv_or_sync_fifo.gl0.wr_n_45 ),
        .\gic0.gc0.count_d2_reg[7]_28 (\gntv_or_sync_fifo.gl0.wr_n_78 ),
        .\gic0.gc0.count_d2_reg[7]_29 (\gntv_or_sync_fifo.gl0.wr_n_90 ),
        .\gic0.gc0.count_d2_reg[7]_3 (\gntv_or_sync_fifo.gl0.wr_n_69 ),
        .\gic0.gc0.count_d2_reg[7]_30 (\gntv_or_sync_fifo.gl0.wr_n_114 ),
        .\gic0.gc0.count_d2_reg[7]_31 (\gntv_or_sync_fifo.gl0.wr_n_41 ),
        .\gic0.gc0.count_d2_reg[7]_32 (\gntv_or_sync_fifo.gl0.wr_n_77 ),
        .\gic0.gc0.count_d2_reg[7]_33 (\gntv_or_sync_fifo.gl0.wr_n_89 ),
        .\gic0.gc0.count_d2_reg[7]_34 (\gntv_or_sync_fifo.gl0.wr_n_113 ),
        .\gic0.gc0.count_d2_reg[7]_35 (\gntv_or_sync_fifo.gl0.wr_n_37 ),
        .\gic0.gc0.count_d2_reg[7]_36 (\gntv_or_sync_fifo.gl0.wr_n_76 ),
        .\gic0.gc0.count_d2_reg[7]_37 (\gntv_or_sync_fifo.gl0.wr_n_88 ),
        .\gic0.gc0.count_d2_reg[7]_38 (\gntv_or_sync_fifo.gl0.wr_n_112 ),
        .\gic0.gc0.count_d2_reg[7]_39 (\gntv_or_sync_fifo.gl0.wr_n_33 ),
        .\gic0.gc0.count_d2_reg[7]_4 (\gntv_or_sync_fifo.gl0.wr_n_84 ),
        .\gic0.gc0.count_d2_reg[7]_40 (\gntv_or_sync_fifo.gl0.wr_n_32 ),
        .\gic0.gc0.count_d2_reg[7]_41 (\gntv_or_sync_fifo.gl0.wr_n_75 ),
        .\gic0.gc0.count_d2_reg[7]_42 (\gntv_or_sync_fifo.gl0.wr_n_74 ),
        .\gic0.gc0.count_d2_reg[7]_43 (\gntv_or_sync_fifo.gl0.wr_n_87 ),
        .\gic0.gc0.count_d2_reg[7]_44 (\gntv_or_sync_fifo.gl0.wr_n_86 ),
        .\gic0.gc0.count_d2_reg[7]_45 (\gntv_or_sync_fifo.gl0.wr_n_111 ),
        .\gic0.gc0.count_d2_reg[7]_46 (\gntv_or_sync_fifo.gl0.wr_n_110 ),
        .\gic0.gc0.count_d2_reg[7]_5 (\gntv_or_sync_fifo.gl0.wr_n_96 ),
        .\gic0.gc0.count_d2_reg[7]_6 (\gntv_or_sync_fifo.gl0.wr_n_120 ),
        .\gic0.gc0.count_d2_reg[7]_7 (\gntv_or_sync_fifo.gl0.wr_n_65 ),
        .\gic0.gc0.count_d2_reg[7]_8 (\gntv_or_sync_fifo.gl0.wr_n_83 ),
        .\gic0.gc0.count_d2_reg[7]_9 (\gntv_or_sync_fifo.gl0.wr_n_95 ),
        .\gic0.gc0.count_d2_reg[8] (\gntv_or_sync_fifo.gl0.wr_n_72 ),
        .\gic0.gc0.count_d2_reg[8]_0 (\gntv_or_sync_fifo.gl0.wr_n_71 ),
        .\gic0.gc0.count_d2_reg[8]_1 (\gntv_or_sync_fifo.gl0.wr_n_70 ),
        .\gic0.gc0.count_d2_reg[8]_10 (\gntv_or_sync_fifo.gl0.wr_n_58 ),
        .\gic0.gc0.count_d2_reg[8]_11 (\gntv_or_sync_fifo.gl0.wr_n_56 ),
        .\gic0.gc0.count_d2_reg[8]_12 (\gntv_or_sync_fifo.gl0.wr_n_55 ),
        .\gic0.gc0.count_d2_reg[8]_13 (\gntv_or_sync_fifo.gl0.wr_n_54 ),
        .\gic0.gc0.count_d2_reg[8]_14 (\gntv_or_sync_fifo.gl0.wr_n_52 ),
        .\gic0.gc0.count_d2_reg[8]_15 (\gntv_or_sync_fifo.gl0.wr_n_51 ),
        .\gic0.gc0.count_d2_reg[8]_16 (\gntv_or_sync_fifo.gl0.wr_n_50 ),
        .\gic0.gc0.count_d2_reg[8]_17 (\gntv_or_sync_fifo.gl0.wr_n_48 ),
        .\gic0.gc0.count_d2_reg[8]_18 (\gntv_or_sync_fifo.gl0.wr_n_47 ),
        .\gic0.gc0.count_d2_reg[8]_19 (\gntv_or_sync_fifo.gl0.wr_n_46 ),
        .\gic0.gc0.count_d2_reg[8]_2 (\gntv_or_sync_fifo.gl0.wr_n_68 ),
        .\gic0.gc0.count_d2_reg[8]_20 (\gntv_or_sync_fifo.gl0.wr_n_44 ),
        .\gic0.gc0.count_d2_reg[8]_21 (\gntv_or_sync_fifo.gl0.wr_n_43 ),
        .\gic0.gc0.count_d2_reg[8]_22 (\gntv_or_sync_fifo.gl0.wr_n_42 ),
        .\gic0.gc0.count_d2_reg[8]_23 (\gntv_or_sync_fifo.gl0.wr_n_40 ),
        .\gic0.gc0.count_d2_reg[8]_24 (\gntv_or_sync_fifo.gl0.wr_n_39 ),
        .\gic0.gc0.count_d2_reg[8]_25 (\gntv_or_sync_fifo.gl0.wr_n_38 ),
        .\gic0.gc0.count_d2_reg[8]_26 (\gntv_or_sync_fifo.gl0.wr_n_36 ),
        .\gic0.gc0.count_d2_reg[8]_27 (\gntv_or_sync_fifo.gl0.wr_n_35 ),
        .\gic0.gc0.count_d2_reg[8]_28 (\gntv_or_sync_fifo.gl0.wr_n_34 ),
        .\gic0.gc0.count_d2_reg[8]_29 (\gntv_or_sync_fifo.gl0.wr_n_31 ),
        .\gic0.gc0.count_d2_reg[8]_3 (\gntv_or_sync_fifo.gl0.wr_n_67 ),
        .\gic0.gc0.count_d2_reg[8]_30 (\gntv_or_sync_fifo.gl0.wr_n_30 ),
        .\gic0.gc0.count_d2_reg[8]_31 (\gntv_or_sync_fifo.gl0.wr_n_29 ),
        .\gic0.gc0.count_d2_reg[8]_32 (\gntv_or_sync_fifo.gl0.wr_n_28 ),
        .\gic0.gc0.count_d2_reg[8]_33 (\gntv_or_sync_fifo.gl0.wr_n_27 ),
        .\gic0.gc0.count_d2_reg[8]_34 (\gntv_or_sync_fifo.gl0.wr_n_17 ),
        .\gic0.gc0.count_d2_reg[8]_4 (\gntv_or_sync_fifo.gl0.wr_n_66 ),
        .\gic0.gc0.count_d2_reg[8]_5 (\gntv_or_sync_fifo.gl0.wr_n_64 ),
        .\gic0.gc0.count_d2_reg[8]_6 (\gntv_or_sync_fifo.gl0.wr_n_63 ),
        .\gic0.gc0.count_d2_reg[8]_7 (\gntv_or_sync_fifo.gl0.wr_n_62 ),
        .\gic0.gc0.count_d2_reg[8]_8 (\gntv_or_sync_fifo.gl0.wr_n_60 ),
        .\gic0.gc0.count_d2_reg[8]_9 (\gntv_or_sync_fifo.gl0.wr_n_59 ),
        .\gpregsm1.curr_fwft_state_reg[1] (p_15_out),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
  bitfile_fifo_in_reset_blk_ramfifo__parameterized0 rstblk
       (.Q({RST,rst_full_ff_i}),
        .\gc0.count_d1_reg[0]_rep ({RD_RST,rd_rst_i,rstblk_n_4}),
        .rd_clk(rd_clk),
        .rst(rst),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module bitfile_fifo_in_fifo_generator_top
   (empty,
    full,
    dout,
    wr_clk,
    rst,
    rd_clk,
    rd_en,
    wr_en,
    din);
  output empty;
  output full;
  output [31:0]dout;
  input wr_clk;
  input rst;
  input rd_clk;
  input rd_en;
  input wr_en;
  input [31:0]din;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
  wire wr_en;

  bitfile_fifo_in_fifo_generator_ramfifo \grf.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "9" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "32" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "32" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "32" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "kintex7" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "2" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "2" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x36" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) (* C_USE_COMMON_OVERFLOW = "0" *) 
(* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) (* C_USE_DOUT_RST = "1" *) 
(* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) (* C_USE_ECC_RACH = "0" *) 
(* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) (* C_USE_ECC_WDCH = "0" *) 
(* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) (* C_USE_FIFO16_FLAGS = "0" *) 
(* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) (* C_VALID_LOW = "0" *) 
(* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) (* C_WRCH_TYPE = "0" *) 
(* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) (* C_WR_DEPTH = "512" *) 
(* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) (* C_WR_DEPTH_RDCH = "1024" *) 
(* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) (* C_WR_DEPTH_WRCH = "16" *) 
(* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "9" *) (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
(* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) (* C_WR_PNTR_WIDTH_WACH = "4" *) 
(* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) (* C_WR_RESPONSE_LATENCY = "1" *) 
(* ORIG_REF_NAME = "fifo_generator_v13_0_0" *) 
module bitfile_fifo_in_fifo_generator_v13_0_0
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  input [8:0]prog_empty_thresh;
  input [8:0]prog_empty_thresh_assert;
  input [8:0]prog_empty_thresh_negate;
  input [8:0]prog_full_thresh;
  input [8:0]prog_full_thresh_assert;
  input [8:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [31:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [8:0]data_count;
  output [8:0]rd_data_count;
  output [8:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire axi_ar_injectdbiterr;
  wire axi_ar_injectsbiterr;
  wire [3:0]axi_ar_prog_empty_thresh;
  wire [3:0]axi_ar_prog_full_thresh;
  wire axi_aw_injectdbiterr;
  wire axi_aw_injectsbiterr;
  wire [3:0]axi_aw_prog_empty_thresh;
  wire [3:0]axi_aw_prog_full_thresh;
  wire axi_b_injectdbiterr;
  wire axi_b_injectsbiterr;
  wire [3:0]axi_b_prog_empty_thresh;
  wire [3:0]axi_b_prog_full_thresh;
  wire axi_r_injectdbiterr;
  wire axi_r_injectsbiterr;
  wire [9:0]axi_r_prog_empty_thresh;
  wire [9:0]axi_r_prog_full_thresh;
  wire axi_w_injectdbiterr;
  wire axi_w_injectsbiterr;
  wire [9:0]axi_w_prog_empty_thresh;
  wire [9:0]axi_w_prog_full_thresh;
  wire axis_injectdbiterr;
  wire axis_injectsbiterr;
  wire [9:0]axis_prog_empty_thresh;
  wire [9:0]axis_prog_full_thresh;
  wire backup;
  wire backup_marker;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire injectdbiterr;
  wire injectsbiterr;
  wire int_clk;
  wire m_aclk;
  wire m_aclk_en;
  wire m_axi_arready;
  wire m_axi_awready;
  wire [0:0]m_axi_bid;
  wire [1:0]m_axi_bresp;
  wire [0:0]m_axi_buser;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire [0:0]m_axi_rid;
  wire m_axi_rlast;
  wire [1:0]m_axi_rresp;
  wire [0:0]m_axi_ruser;
  wire m_axi_rvalid;
  wire m_axi_wready;
  wire m_axis_tready;
  wire [8:0]prog_empty_thresh;
  wire [8:0]prog_empty_thresh_assert;
  wire [8:0]prog_empty_thresh_negate;
  wire [8:0]prog_full_thresh;
  wire [8:0]prog_full_thresh_assert;
  wire [8:0]prog_full_thresh_negate;
  wire rd_clk;
  wire rd_en;
  wire rd_rst;
  wire rst;
  wire s_aclk;
  wire s_aclk_en;
  wire s_aresetn;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [3:0]s_axi_arregion;
  wire [2:0]s_axi_arsize;
  wire [0:0]s_axi_aruser;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [3:0]s_axi_awregion;
  wire [2:0]s_axi_awsize;
  wire [0:0]s_axi_awuser;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_rready;
  wire [63:0]s_axi_wdata;
  wire [0:0]s_axi_wid;
  wire s_axi_wlast;
  wire [7:0]s_axi_wstrb;
  wire [0:0]s_axi_wuser;
  wire s_axi_wvalid;
  wire [7:0]s_axis_tdata;
  wire [0:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [0:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire [0:0]s_axis_tstrb;
  wire [3:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  bitfile_fifo_in_fifo_generator_v13_0_0_synth inst_fifo_gen
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .m_aclk(m_aclk),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rst(rst),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_0_0_synth" *) 
module bitfile_fifo_in_fifo_generator_v13_0_0_synth
   (dout,
    empty,
    full,
    rd_en,
    wr_en,
    wr_clk,
    rd_clk,
    s_aclk,
    m_aclk,
    rst,
    din,
    s_aresetn);
  output [31:0]dout;
  output empty;
  output full;
  input rd_en;
  input wr_en;
  input wr_clk;
  input rd_clk;
  input s_aclk;
  input m_aclk;
  input rst;
  input [31:0]din;
  input s_aresetn;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire m_aclk;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire s_aclk;
  wire s_aresetn;
  wire wr_clk;
  wire wr_en;

  bitfile_fifo_in_fifo_generator_top \gconvfifo.rf 
       (.din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  bitfile_fifo_in_reset_blk_ramfifo \reset_gen_ic.rstblk_cc 
       (.m_aclk(m_aclk),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module bitfile_fifo_in_memory
   (dout,
    wr_clk,
    din,
    \gic0.gc0.count_d2_reg[7] ,
    \gc0.count_d1_reg[8] ,
    \gic0.gc0.count_d2_reg[5] ,
    \gic0.gc0.count_d2_reg[8] ,
    \gic0.gc0.count_d2_reg[8]_0 ,
    \gic0.gc0.count_d2_reg[8]_1 ,
    \gic0.gc0.count_d2_reg[7]_0 ,
    \gic0.gc0.count_d2_reg[7]_1 ,
    \gic0.gc0.count_d2_reg[6] ,
    \gic0.gc0.count_d2_reg[7]_2 ,
    \gic0.gc0.count_d2_reg[7]_3 ,
    \gic0.gc0.count_d2_reg[8]_2 ,
    \gic0.gc0.count_d2_reg[8]_3 ,
    \gic0.gc0.count_d2_reg[8]_4 ,
    \gic0.gc0.count_d2_reg[7]_4 ,
    \gic0.gc0.count_d2_reg[7]_5 ,
    \gic0.gc0.count_d2_reg[6]_0 ,
    \gic0.gc0.count_d2_reg[7]_6 ,
    \gic0.gc0.count_d2_reg[7]_7 ,
    \gic0.gc0.count_d2_reg[8]_5 ,
    \gic0.gc0.count_d2_reg[8]_6 ,
    \gic0.gc0.count_d2_reg[8]_7 ,
    \gic0.gc0.count_d2_reg[7]_8 ,
    \gic0.gc0.count_d2_reg[7]_9 ,
    \gic0.gc0.count_d2_reg[6]_1 ,
    \gic0.gc0.count_d2_reg[7]_10 ,
    \gic0.gc0.count_d2_reg[7]_11 ,
    \gic0.gc0.count_d2_reg[8]_8 ,
    \gic0.gc0.count_d2_reg[8]_9 ,
    \gic0.gc0.count_d2_reg[8]_10 ,
    \gic0.gc0.count_d2_reg[7]_12 ,
    \gic0.gc0.count_d2_reg[7]_13 ,
    \gic0.gc0.count_d2_reg[6]_2 ,
    \gic0.gc0.count_d2_reg[7]_14 ,
    \gic0.gc0.count_d2_reg[7]_15 ,
    \gic0.gc0.count_d2_reg[8]_11 ,
    \gic0.gc0.count_d2_reg[8]_12 ,
    \gic0.gc0.count_d2_reg[8]_13 ,
    \gic0.gc0.count_d2_reg[7]_16 ,
    \gic0.gc0.count_d2_reg[7]_17 ,
    \gic0.gc0.count_d2_reg[6]_3 ,
    \gic0.gc0.count_d2_reg[7]_18 ,
    \gic0.gc0.count_d2_reg[7]_19 ,
    \gic0.gc0.count_d2_reg[8]_14 ,
    \gic0.gc0.count_d2_reg[8]_15 ,
    \gic0.gc0.count_d2_reg[8]_16 ,
    \gic0.gc0.count_d2_reg[7]_20 ,
    \gic0.gc0.count_d2_reg[7]_21 ,
    \gic0.gc0.count_d2_reg[6]_4 ,
    \gic0.gc0.count_d2_reg[7]_22 ,
    \gic0.gc0.count_d2_reg[7]_23 ,
    \gc0.count_d1_reg[5]_rep ,
    \gc0.count_d1_reg[4]_rep ,
    \gc0.count_d1_reg[3]_rep ,
    \gc0.count_d1_reg[2]_rep ,
    \gc0.count_d1_reg[1]_rep ,
    \gc0.count_d1_reg[0]_rep ,
    \gic0.gc0.count_d2_reg[8]_17 ,
    \gic0.gc0.count_d2_reg[8]_18 ,
    \gic0.gc0.count_d2_reg[8]_19 ,
    \gic0.gc0.count_d2_reg[7]_24 ,
    \gic0.gc0.count_d2_reg[7]_25 ,
    \gic0.gc0.count_d2_reg[6]_5 ,
    \gic0.gc0.count_d2_reg[7]_26 ,
    \gic0.gc0.count_d2_reg[7]_27 ,
    \gic0.gc0.count_d2_reg[8]_20 ,
    \gic0.gc0.count_d2_reg[8]_21 ,
    \gic0.gc0.count_d2_reg[8]_22 ,
    \gic0.gc0.count_d2_reg[7]_28 ,
    \gic0.gc0.count_d2_reg[7]_29 ,
    \gic0.gc0.count_d2_reg[6]_6 ,
    \gic0.gc0.count_d2_reg[7]_30 ,
    \gic0.gc0.count_d2_reg[7]_31 ,
    \gic0.gc0.count_d2_reg[8]_23 ,
    \gic0.gc0.count_d2_reg[8]_24 ,
    \gic0.gc0.count_d2_reg[8]_25 ,
    \gic0.gc0.count_d2_reg[7]_32 ,
    \gic0.gc0.count_d2_reg[7]_33 ,
    \gic0.gc0.count_d2_reg[6]_7 ,
    \gic0.gc0.count_d2_reg[7]_34 ,
    \gic0.gc0.count_d2_reg[7]_35 ,
    \gic0.gc0.count_d2_reg[8]_26 ,
    \gic0.gc0.count_d2_reg[8]_27 ,
    \gic0.gc0.count_d2_reg[8]_28 ,
    \gic0.gc0.count_d2_reg[7]_36 ,
    \gic0.gc0.count_d2_reg[7]_37 ,
    \gic0.gc0.count_d2_reg[6]_8 ,
    \gic0.gc0.count_d2_reg[7]_38 ,
    \gic0.gc0.count_d2_reg[7]_39 ,
    \gic0.gc0.count_d2_reg[7]_40 ,
    \gic0.gc0.count_d2_reg[8]_29 ,
    \gic0.gc0.count_d2_reg[8]_30 ,
    \gic0.gc0.count_d2_reg[8]_31 ,
    \gic0.gc0.count_d2_reg[8]_32 ,
    \gic0.gc0.count_d2_reg[8]_33 ,
    \gic0.gc0.count_d2_reg[8]_34 ,
    \gic0.gc0.count_d2_reg[7]_41 ,
    \gic0.gc0.count_d2_reg[7]_42 ,
    \gic0.gc0.count_d2_reg[7]_43 ,
    \gic0.gc0.count_d2_reg[7]_44 ,
    \gic0.gc0.count_d2_reg[6]_9 ,
    \gic0.gc0.count_d2_reg[6]_10 ,
    \gic0.gc0.count_d2_reg[7]_45 ,
    \gic0.gc0.count_d2_reg[7]_46 ,
    E,
    rd_clk,
    Q,
    \gpregsm1.curr_fwft_state_reg[1] );
  output [31:0]dout;
  input wr_clk;
  input [31:0]din;
  input \gic0.gc0.count_d2_reg[7] ;
  input [8:0]\gc0.count_d1_reg[8] ;
  input [5:0]\gic0.gc0.count_d2_reg[5] ;
  input \gic0.gc0.count_d2_reg[8] ;
  input \gic0.gc0.count_d2_reg[8]_0 ;
  input \gic0.gc0.count_d2_reg[8]_1 ;
  input \gic0.gc0.count_d2_reg[7]_0 ;
  input \gic0.gc0.count_d2_reg[7]_1 ;
  input \gic0.gc0.count_d2_reg[6] ;
  input \gic0.gc0.count_d2_reg[7]_2 ;
  input \gic0.gc0.count_d2_reg[7]_3 ;
  input \gic0.gc0.count_d2_reg[8]_2 ;
  input \gic0.gc0.count_d2_reg[8]_3 ;
  input \gic0.gc0.count_d2_reg[8]_4 ;
  input \gic0.gc0.count_d2_reg[7]_4 ;
  input \gic0.gc0.count_d2_reg[7]_5 ;
  input \gic0.gc0.count_d2_reg[6]_0 ;
  input \gic0.gc0.count_d2_reg[7]_6 ;
  input \gic0.gc0.count_d2_reg[7]_7 ;
  input \gic0.gc0.count_d2_reg[8]_5 ;
  input \gic0.gc0.count_d2_reg[8]_6 ;
  input \gic0.gc0.count_d2_reg[8]_7 ;
  input \gic0.gc0.count_d2_reg[7]_8 ;
  input \gic0.gc0.count_d2_reg[7]_9 ;
  input \gic0.gc0.count_d2_reg[6]_1 ;
  input \gic0.gc0.count_d2_reg[7]_10 ;
  input \gic0.gc0.count_d2_reg[7]_11 ;
  input \gic0.gc0.count_d2_reg[8]_8 ;
  input \gic0.gc0.count_d2_reg[8]_9 ;
  input \gic0.gc0.count_d2_reg[8]_10 ;
  input \gic0.gc0.count_d2_reg[7]_12 ;
  input \gic0.gc0.count_d2_reg[7]_13 ;
  input \gic0.gc0.count_d2_reg[6]_2 ;
  input \gic0.gc0.count_d2_reg[7]_14 ;
  input \gic0.gc0.count_d2_reg[7]_15 ;
  input \gic0.gc0.count_d2_reg[8]_11 ;
  input \gic0.gc0.count_d2_reg[8]_12 ;
  input \gic0.gc0.count_d2_reg[8]_13 ;
  input \gic0.gc0.count_d2_reg[7]_16 ;
  input \gic0.gc0.count_d2_reg[7]_17 ;
  input \gic0.gc0.count_d2_reg[6]_3 ;
  input \gic0.gc0.count_d2_reg[7]_18 ;
  input \gic0.gc0.count_d2_reg[7]_19 ;
  input \gic0.gc0.count_d2_reg[8]_14 ;
  input \gic0.gc0.count_d2_reg[8]_15 ;
  input \gic0.gc0.count_d2_reg[8]_16 ;
  input \gic0.gc0.count_d2_reg[7]_20 ;
  input \gic0.gc0.count_d2_reg[7]_21 ;
  input \gic0.gc0.count_d2_reg[6]_4 ;
  input \gic0.gc0.count_d2_reg[7]_22 ;
  input \gic0.gc0.count_d2_reg[7]_23 ;
  input \gc0.count_d1_reg[5]_rep ;
  input \gc0.count_d1_reg[4]_rep ;
  input \gc0.count_d1_reg[3]_rep ;
  input \gc0.count_d1_reg[2]_rep ;
  input \gc0.count_d1_reg[1]_rep ;
  input \gc0.count_d1_reg[0]_rep ;
  input \gic0.gc0.count_d2_reg[8]_17 ;
  input \gic0.gc0.count_d2_reg[8]_18 ;
  input \gic0.gc0.count_d2_reg[8]_19 ;
  input \gic0.gc0.count_d2_reg[7]_24 ;
  input \gic0.gc0.count_d2_reg[7]_25 ;
  input \gic0.gc0.count_d2_reg[6]_5 ;
  input \gic0.gc0.count_d2_reg[7]_26 ;
  input \gic0.gc0.count_d2_reg[7]_27 ;
  input \gic0.gc0.count_d2_reg[8]_20 ;
  input \gic0.gc0.count_d2_reg[8]_21 ;
  input \gic0.gc0.count_d2_reg[8]_22 ;
  input \gic0.gc0.count_d2_reg[7]_28 ;
  input \gic0.gc0.count_d2_reg[7]_29 ;
  input \gic0.gc0.count_d2_reg[6]_6 ;
  input \gic0.gc0.count_d2_reg[7]_30 ;
  input \gic0.gc0.count_d2_reg[7]_31 ;
  input \gic0.gc0.count_d2_reg[8]_23 ;
  input \gic0.gc0.count_d2_reg[8]_24 ;
  input \gic0.gc0.count_d2_reg[8]_25 ;
  input \gic0.gc0.count_d2_reg[7]_32 ;
  input \gic0.gc0.count_d2_reg[7]_33 ;
  input \gic0.gc0.count_d2_reg[6]_7 ;
  input \gic0.gc0.count_d2_reg[7]_34 ;
  input \gic0.gc0.count_d2_reg[7]_35 ;
  input \gic0.gc0.count_d2_reg[8]_26 ;
  input \gic0.gc0.count_d2_reg[8]_27 ;
  input \gic0.gc0.count_d2_reg[8]_28 ;
  input \gic0.gc0.count_d2_reg[7]_36 ;
  input \gic0.gc0.count_d2_reg[7]_37 ;
  input \gic0.gc0.count_d2_reg[6]_8 ;
  input \gic0.gc0.count_d2_reg[7]_38 ;
  input \gic0.gc0.count_d2_reg[7]_39 ;
  input \gic0.gc0.count_d2_reg[7]_40 ;
  input \gic0.gc0.count_d2_reg[8]_29 ;
  input \gic0.gc0.count_d2_reg[8]_30 ;
  input \gic0.gc0.count_d2_reg[8]_31 ;
  input \gic0.gc0.count_d2_reg[8]_32 ;
  input \gic0.gc0.count_d2_reg[8]_33 ;
  input \gic0.gc0.count_d2_reg[8]_34 ;
  input \gic0.gc0.count_d2_reg[7]_41 ;
  input \gic0.gc0.count_d2_reg[7]_42 ;
  input \gic0.gc0.count_d2_reg[7]_43 ;
  input \gic0.gc0.count_d2_reg[7]_44 ;
  input \gic0.gc0.count_d2_reg[6]_9 ;
  input \gic0.gc0.count_d2_reg[6]_10 ;
  input \gic0.gc0.count_d2_reg[7]_45 ;
  input \gic0.gc0.count_d2_reg[7]_46 ;
  input [0:0]E;
  input rd_clk;
  input [0:0]Q;
  input [0:0]\gpregsm1.curr_fwft_state_reg[1] ;

  wire [0:0]E;
  wire [0:0]Q;
  wire [31:0]din;
  wire [31:0]dout;
  wire [31:0]dout_i;
  wire \gc0.count_d1_reg[0]_rep ;
  wire \gc0.count_d1_reg[1]_rep ;
  wire \gc0.count_d1_reg[2]_rep ;
  wire \gc0.count_d1_reg[3]_rep ;
  wire \gc0.count_d1_reg[4]_rep ;
  wire \gc0.count_d1_reg[5]_rep ;
  wire [8:0]\gc0.count_d1_reg[8] ;
  wire [5:0]\gic0.gc0.count_d2_reg[5] ;
  wire \gic0.gc0.count_d2_reg[6] ;
  wire \gic0.gc0.count_d2_reg[6]_0 ;
  wire \gic0.gc0.count_d2_reg[6]_1 ;
  wire \gic0.gc0.count_d2_reg[6]_10 ;
  wire \gic0.gc0.count_d2_reg[6]_2 ;
  wire \gic0.gc0.count_d2_reg[6]_3 ;
  wire \gic0.gc0.count_d2_reg[6]_4 ;
  wire \gic0.gc0.count_d2_reg[6]_5 ;
  wire \gic0.gc0.count_d2_reg[6]_6 ;
  wire \gic0.gc0.count_d2_reg[6]_7 ;
  wire \gic0.gc0.count_d2_reg[6]_8 ;
  wire \gic0.gc0.count_d2_reg[6]_9 ;
  wire \gic0.gc0.count_d2_reg[7] ;
  wire \gic0.gc0.count_d2_reg[7]_0 ;
  wire \gic0.gc0.count_d2_reg[7]_1 ;
  wire \gic0.gc0.count_d2_reg[7]_10 ;
  wire \gic0.gc0.count_d2_reg[7]_11 ;
  wire \gic0.gc0.count_d2_reg[7]_12 ;
  wire \gic0.gc0.count_d2_reg[7]_13 ;
  wire \gic0.gc0.count_d2_reg[7]_14 ;
  wire \gic0.gc0.count_d2_reg[7]_15 ;
  wire \gic0.gc0.count_d2_reg[7]_16 ;
  wire \gic0.gc0.count_d2_reg[7]_17 ;
  wire \gic0.gc0.count_d2_reg[7]_18 ;
  wire \gic0.gc0.count_d2_reg[7]_19 ;
  wire \gic0.gc0.count_d2_reg[7]_2 ;
  wire \gic0.gc0.count_d2_reg[7]_20 ;
  wire \gic0.gc0.count_d2_reg[7]_21 ;
  wire \gic0.gc0.count_d2_reg[7]_22 ;
  wire \gic0.gc0.count_d2_reg[7]_23 ;
  wire \gic0.gc0.count_d2_reg[7]_24 ;
  wire \gic0.gc0.count_d2_reg[7]_25 ;
  wire \gic0.gc0.count_d2_reg[7]_26 ;
  wire \gic0.gc0.count_d2_reg[7]_27 ;
  wire \gic0.gc0.count_d2_reg[7]_28 ;
  wire \gic0.gc0.count_d2_reg[7]_29 ;
  wire \gic0.gc0.count_d2_reg[7]_3 ;
  wire \gic0.gc0.count_d2_reg[7]_30 ;
  wire \gic0.gc0.count_d2_reg[7]_31 ;
  wire \gic0.gc0.count_d2_reg[7]_32 ;
  wire \gic0.gc0.count_d2_reg[7]_33 ;
  wire \gic0.gc0.count_d2_reg[7]_34 ;
  wire \gic0.gc0.count_d2_reg[7]_35 ;
  wire \gic0.gc0.count_d2_reg[7]_36 ;
  wire \gic0.gc0.count_d2_reg[7]_37 ;
  wire \gic0.gc0.count_d2_reg[7]_38 ;
  wire \gic0.gc0.count_d2_reg[7]_39 ;
  wire \gic0.gc0.count_d2_reg[7]_4 ;
  wire \gic0.gc0.count_d2_reg[7]_40 ;
  wire \gic0.gc0.count_d2_reg[7]_41 ;
  wire \gic0.gc0.count_d2_reg[7]_42 ;
  wire \gic0.gc0.count_d2_reg[7]_43 ;
  wire \gic0.gc0.count_d2_reg[7]_44 ;
  wire \gic0.gc0.count_d2_reg[7]_45 ;
  wire \gic0.gc0.count_d2_reg[7]_46 ;
  wire \gic0.gc0.count_d2_reg[7]_5 ;
  wire \gic0.gc0.count_d2_reg[7]_6 ;
  wire \gic0.gc0.count_d2_reg[7]_7 ;
  wire \gic0.gc0.count_d2_reg[7]_8 ;
  wire \gic0.gc0.count_d2_reg[7]_9 ;
  wire \gic0.gc0.count_d2_reg[8] ;
  wire \gic0.gc0.count_d2_reg[8]_0 ;
  wire \gic0.gc0.count_d2_reg[8]_1 ;
  wire \gic0.gc0.count_d2_reg[8]_10 ;
  wire \gic0.gc0.count_d2_reg[8]_11 ;
  wire \gic0.gc0.count_d2_reg[8]_12 ;
  wire \gic0.gc0.count_d2_reg[8]_13 ;
  wire \gic0.gc0.count_d2_reg[8]_14 ;
  wire \gic0.gc0.count_d2_reg[8]_15 ;
  wire \gic0.gc0.count_d2_reg[8]_16 ;
  wire \gic0.gc0.count_d2_reg[8]_17 ;
  wire \gic0.gc0.count_d2_reg[8]_18 ;
  wire \gic0.gc0.count_d2_reg[8]_19 ;
  wire \gic0.gc0.count_d2_reg[8]_2 ;
  wire \gic0.gc0.count_d2_reg[8]_20 ;
  wire \gic0.gc0.count_d2_reg[8]_21 ;
  wire \gic0.gc0.count_d2_reg[8]_22 ;
  wire \gic0.gc0.count_d2_reg[8]_23 ;
  wire \gic0.gc0.count_d2_reg[8]_24 ;
  wire \gic0.gc0.count_d2_reg[8]_25 ;
  wire \gic0.gc0.count_d2_reg[8]_26 ;
  wire \gic0.gc0.count_d2_reg[8]_27 ;
  wire \gic0.gc0.count_d2_reg[8]_28 ;
  wire \gic0.gc0.count_d2_reg[8]_29 ;
  wire \gic0.gc0.count_d2_reg[8]_3 ;
  wire \gic0.gc0.count_d2_reg[8]_30 ;
  wire \gic0.gc0.count_d2_reg[8]_31 ;
  wire \gic0.gc0.count_d2_reg[8]_32 ;
  wire \gic0.gc0.count_d2_reg[8]_33 ;
  wire \gic0.gc0.count_d2_reg[8]_34 ;
  wire \gic0.gc0.count_d2_reg[8]_4 ;
  wire \gic0.gc0.count_d2_reg[8]_5 ;
  wire \gic0.gc0.count_d2_reg[8]_6 ;
  wire \gic0.gc0.count_d2_reg[8]_7 ;
  wire \gic0.gc0.count_d2_reg[8]_8 ;
  wire \gic0.gc0.count_d2_reg[8]_9 ;
  wire [0:0]\gpregsm1.curr_fwft_state_reg[1] ;
  wire rd_clk;
  wire wr_clk;

  bitfile_fifo_in_dmem \gdm.dm 
       (.ADDRA({\gc0.count_d1_reg[5]_rep ,\gc0.count_d1_reg[4]_rep ,\gc0.count_d1_reg[3]_rep ,\gc0.count_d1_reg[2]_rep ,\gc0.count_d1_reg[1]_rep ,\gc0.count_d1_reg[0]_rep }),
        .E(E),
        .Q(dout_i),
        .din(din),
        .\gc0.count_d1_reg[8] (\gc0.count_d1_reg[8] ),
        .\gic0.gc0.count_d2_reg[5] (\gic0.gc0.count_d2_reg[5] ),
        .\gic0.gc0.count_d2_reg[6] (\gic0.gc0.count_d2_reg[6] ),
        .\gic0.gc0.count_d2_reg[6]_0 (\gic0.gc0.count_d2_reg[6]_0 ),
        .\gic0.gc0.count_d2_reg[6]_1 (\gic0.gc0.count_d2_reg[6]_1 ),
        .\gic0.gc0.count_d2_reg[6]_10 (\gic0.gc0.count_d2_reg[6]_10 ),
        .\gic0.gc0.count_d2_reg[6]_2 (\gic0.gc0.count_d2_reg[6]_2 ),
        .\gic0.gc0.count_d2_reg[6]_3 (\gic0.gc0.count_d2_reg[6]_3 ),
        .\gic0.gc0.count_d2_reg[6]_4 (\gic0.gc0.count_d2_reg[6]_4 ),
        .\gic0.gc0.count_d2_reg[6]_5 (\gic0.gc0.count_d2_reg[6]_5 ),
        .\gic0.gc0.count_d2_reg[6]_6 (\gic0.gc0.count_d2_reg[6]_6 ),
        .\gic0.gc0.count_d2_reg[6]_7 (\gic0.gc0.count_d2_reg[6]_7 ),
        .\gic0.gc0.count_d2_reg[6]_8 (\gic0.gc0.count_d2_reg[6]_8 ),
        .\gic0.gc0.count_d2_reg[6]_9 (\gic0.gc0.count_d2_reg[6]_9 ),
        .\gic0.gc0.count_d2_reg[7] (\gic0.gc0.count_d2_reg[7] ),
        .\gic0.gc0.count_d2_reg[7]_0 (\gic0.gc0.count_d2_reg[7]_0 ),
        .\gic0.gc0.count_d2_reg[7]_1 (\gic0.gc0.count_d2_reg[7]_1 ),
        .\gic0.gc0.count_d2_reg[7]_10 (\gic0.gc0.count_d2_reg[7]_10 ),
        .\gic0.gc0.count_d2_reg[7]_11 (\gic0.gc0.count_d2_reg[7]_11 ),
        .\gic0.gc0.count_d2_reg[7]_12 (\gic0.gc0.count_d2_reg[7]_12 ),
        .\gic0.gc0.count_d2_reg[7]_13 (\gic0.gc0.count_d2_reg[7]_13 ),
        .\gic0.gc0.count_d2_reg[7]_14 (\gic0.gc0.count_d2_reg[7]_14 ),
        .\gic0.gc0.count_d2_reg[7]_15 (\gic0.gc0.count_d2_reg[7]_15 ),
        .\gic0.gc0.count_d2_reg[7]_16 (\gic0.gc0.count_d2_reg[7]_16 ),
        .\gic0.gc0.count_d2_reg[7]_17 (\gic0.gc0.count_d2_reg[7]_17 ),
        .\gic0.gc0.count_d2_reg[7]_18 (\gic0.gc0.count_d2_reg[7]_18 ),
        .\gic0.gc0.count_d2_reg[7]_19 (\gic0.gc0.count_d2_reg[7]_19 ),
        .\gic0.gc0.count_d2_reg[7]_2 (\gic0.gc0.count_d2_reg[7]_2 ),
        .\gic0.gc0.count_d2_reg[7]_20 (\gic0.gc0.count_d2_reg[7]_20 ),
        .\gic0.gc0.count_d2_reg[7]_21 (\gic0.gc0.count_d2_reg[7]_21 ),
        .\gic0.gc0.count_d2_reg[7]_22 (\gic0.gc0.count_d2_reg[7]_22 ),
        .\gic0.gc0.count_d2_reg[7]_23 (\gic0.gc0.count_d2_reg[7]_23 ),
        .\gic0.gc0.count_d2_reg[7]_24 (\gic0.gc0.count_d2_reg[7]_24 ),
        .\gic0.gc0.count_d2_reg[7]_25 (\gic0.gc0.count_d2_reg[7]_25 ),
        .\gic0.gc0.count_d2_reg[7]_26 (\gic0.gc0.count_d2_reg[7]_26 ),
        .\gic0.gc0.count_d2_reg[7]_27 (\gic0.gc0.count_d2_reg[7]_27 ),
        .\gic0.gc0.count_d2_reg[7]_28 (\gic0.gc0.count_d2_reg[7]_28 ),
        .\gic0.gc0.count_d2_reg[7]_29 (\gic0.gc0.count_d2_reg[7]_29 ),
        .\gic0.gc0.count_d2_reg[7]_3 (\gic0.gc0.count_d2_reg[7]_3 ),
        .\gic0.gc0.count_d2_reg[7]_30 (\gic0.gc0.count_d2_reg[7]_30 ),
        .\gic0.gc0.count_d2_reg[7]_31 (\gic0.gc0.count_d2_reg[7]_31 ),
        .\gic0.gc0.count_d2_reg[7]_32 (\gic0.gc0.count_d2_reg[7]_32 ),
        .\gic0.gc0.count_d2_reg[7]_33 (\gic0.gc0.count_d2_reg[7]_33 ),
        .\gic0.gc0.count_d2_reg[7]_34 (\gic0.gc0.count_d2_reg[7]_34 ),
        .\gic0.gc0.count_d2_reg[7]_35 (\gic0.gc0.count_d2_reg[7]_35 ),
        .\gic0.gc0.count_d2_reg[7]_36 (\gic0.gc0.count_d2_reg[7]_36 ),
        .\gic0.gc0.count_d2_reg[7]_37 (\gic0.gc0.count_d2_reg[7]_37 ),
        .\gic0.gc0.count_d2_reg[7]_38 (\gic0.gc0.count_d2_reg[7]_38 ),
        .\gic0.gc0.count_d2_reg[7]_39 (\gic0.gc0.count_d2_reg[7]_39 ),
        .\gic0.gc0.count_d2_reg[7]_4 (\gic0.gc0.count_d2_reg[7]_4 ),
        .\gic0.gc0.count_d2_reg[7]_40 (\gic0.gc0.count_d2_reg[7]_40 ),
        .\gic0.gc0.count_d2_reg[7]_41 (\gic0.gc0.count_d2_reg[7]_41 ),
        .\gic0.gc0.count_d2_reg[7]_42 (\gic0.gc0.count_d2_reg[7]_42 ),
        .\gic0.gc0.count_d2_reg[7]_43 (\gic0.gc0.count_d2_reg[7]_43 ),
        .\gic0.gc0.count_d2_reg[7]_44 (\gic0.gc0.count_d2_reg[7]_44 ),
        .\gic0.gc0.count_d2_reg[7]_45 (\gic0.gc0.count_d2_reg[7]_45 ),
        .\gic0.gc0.count_d2_reg[7]_46 (\gic0.gc0.count_d2_reg[7]_46 ),
        .\gic0.gc0.count_d2_reg[7]_5 (\gic0.gc0.count_d2_reg[7]_5 ),
        .\gic0.gc0.count_d2_reg[7]_6 (\gic0.gc0.count_d2_reg[7]_6 ),
        .\gic0.gc0.count_d2_reg[7]_7 (\gic0.gc0.count_d2_reg[7]_7 ),
        .\gic0.gc0.count_d2_reg[7]_8 (\gic0.gc0.count_d2_reg[7]_8 ),
        .\gic0.gc0.count_d2_reg[7]_9 (\gic0.gc0.count_d2_reg[7]_9 ),
        .\gic0.gc0.count_d2_reg[8] (\gic0.gc0.count_d2_reg[8] ),
        .\gic0.gc0.count_d2_reg[8]_0 (\gic0.gc0.count_d2_reg[8]_0 ),
        .\gic0.gc0.count_d2_reg[8]_1 (\gic0.gc0.count_d2_reg[8]_1 ),
        .\gic0.gc0.count_d2_reg[8]_10 (\gic0.gc0.count_d2_reg[8]_10 ),
        .\gic0.gc0.count_d2_reg[8]_11 (\gic0.gc0.count_d2_reg[8]_11 ),
        .\gic0.gc0.count_d2_reg[8]_12 (\gic0.gc0.count_d2_reg[8]_12 ),
        .\gic0.gc0.count_d2_reg[8]_13 (\gic0.gc0.count_d2_reg[8]_13 ),
        .\gic0.gc0.count_d2_reg[8]_14 (\gic0.gc0.count_d2_reg[8]_14 ),
        .\gic0.gc0.count_d2_reg[8]_15 (\gic0.gc0.count_d2_reg[8]_15 ),
        .\gic0.gc0.count_d2_reg[8]_16 (\gic0.gc0.count_d2_reg[8]_16 ),
        .\gic0.gc0.count_d2_reg[8]_17 (\gic0.gc0.count_d2_reg[8]_17 ),
        .\gic0.gc0.count_d2_reg[8]_18 (\gic0.gc0.count_d2_reg[8]_18 ),
        .\gic0.gc0.count_d2_reg[8]_19 (\gic0.gc0.count_d2_reg[8]_19 ),
        .\gic0.gc0.count_d2_reg[8]_2 (\gic0.gc0.count_d2_reg[8]_2 ),
        .\gic0.gc0.count_d2_reg[8]_20 (\gic0.gc0.count_d2_reg[8]_20 ),
        .\gic0.gc0.count_d2_reg[8]_21 (\gic0.gc0.count_d2_reg[8]_21 ),
        .\gic0.gc0.count_d2_reg[8]_22 (\gic0.gc0.count_d2_reg[8]_22 ),
        .\gic0.gc0.count_d2_reg[8]_23 (\gic0.gc0.count_d2_reg[8]_23 ),
        .\gic0.gc0.count_d2_reg[8]_24 (\gic0.gc0.count_d2_reg[8]_24 ),
        .\gic0.gc0.count_d2_reg[8]_25 (\gic0.gc0.count_d2_reg[8]_25 ),
        .\gic0.gc0.count_d2_reg[8]_26 (\gic0.gc0.count_d2_reg[8]_26 ),
        .\gic0.gc0.count_d2_reg[8]_27 (\gic0.gc0.count_d2_reg[8]_27 ),
        .\gic0.gc0.count_d2_reg[8]_28 (\gic0.gc0.count_d2_reg[8]_28 ),
        .\gic0.gc0.count_d2_reg[8]_29 (\gic0.gc0.count_d2_reg[8]_29 ),
        .\gic0.gc0.count_d2_reg[8]_3 (\gic0.gc0.count_d2_reg[8]_3 ),
        .\gic0.gc0.count_d2_reg[8]_30 (\gic0.gc0.count_d2_reg[8]_30 ),
        .\gic0.gc0.count_d2_reg[8]_31 (\gic0.gc0.count_d2_reg[8]_31 ),
        .\gic0.gc0.count_d2_reg[8]_32 (\gic0.gc0.count_d2_reg[8]_32 ),
        .\gic0.gc0.count_d2_reg[8]_33 (\gic0.gc0.count_d2_reg[8]_33 ),
        .\gic0.gc0.count_d2_reg[8]_34 (\gic0.gc0.count_d2_reg[8]_34 ),
        .\gic0.gc0.count_d2_reg[8]_4 (\gic0.gc0.count_d2_reg[8]_4 ),
        .\gic0.gc0.count_d2_reg[8]_5 (\gic0.gc0.count_d2_reg[8]_5 ),
        .\gic0.gc0.count_d2_reg[8]_6 (\gic0.gc0.count_d2_reg[8]_6 ),
        .\gic0.gc0.count_d2_reg[8]_7 (\gic0.gc0.count_d2_reg[8]_7 ),
        .\gic0.gc0.count_d2_reg[8]_8 (\gic0.gc0.count_d2_reg[8]_8 ),
        .\gic0.gc0.count_d2_reg[8]_9 (\gic0.gc0.count_d2_reg[8]_9 ),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] (Q),
        .rd_clk(rd_clk),
        .wr_clk(wr_clk));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[0] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[0]),
        .Q(dout[0]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[10] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[10]),
        .Q(dout[10]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[11] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[11]),
        .Q(dout[11]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[12] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[12]),
        .Q(dout[12]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[13] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[13]),
        .Q(dout[13]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[14] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[14]),
        .Q(dout[14]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[15] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[15]),
        .Q(dout[15]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[16] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[16]),
        .Q(dout[16]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[17] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[17]),
        .Q(dout[17]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[18] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[18]),
        .Q(dout[18]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[19] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[19]),
        .Q(dout[19]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[1] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[1]),
        .Q(dout[1]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[20] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[20]),
        .Q(dout[20]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[21] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[21]),
        .Q(dout[21]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[22] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[22]),
        .Q(dout[22]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[23] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[23]),
        .Q(dout[23]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[24] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[24]),
        .Q(dout[24]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[25] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[25]),
        .Q(dout[25]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[26] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[26]),
        .Q(dout[26]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[27] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[27]),
        .Q(dout[27]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[28] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[28]),
        .Q(dout[28]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[29] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[29]),
        .Q(dout[29]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[2] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[2]),
        .Q(dout[2]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[30] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[30]),
        .Q(dout[30]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[31] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[31]),
        .Q(dout[31]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[3] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[3]),
        .Q(dout[3]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[4] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[4]),
        .Q(dout[4]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[5] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[5]),
        .Q(dout[5]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[6] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[6]),
        .Q(dout[6]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[7] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[7]),
        .Q(dout[7]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[8] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[8]),
        .Q(dout[8]));
  FDCE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[9] 
       (.C(rd_clk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .CLR(Q),
        .D(dout_i[9]),
        .Q(dout[9]));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module bitfile_fifo_in_rd_bin_cntr
   (ram_empty_fb_i_reg,
    Q,
    v1_reg,
    \rd_pntr_gc_reg[8] ,
    \rd_pntr_gc_reg[5] ,
    \rd_pntr_gc_reg[4] ,
    \rd_pntr_gc_reg[3] ,
    \rd_pntr_gc_reg[2] ,
    \rd_pntr_gc_reg[1] ,
    \rd_pntr_gc_reg[0] ,
    WR_PNTR_RD,
    ram_empty_fb_i_reg_0,
    rd_clk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] );
  output ram_empty_fb_i_reg;
  output [7:0]Q;
  output [3:0]v1_reg;
  output [8:0]\rd_pntr_gc_reg[8] ;
  output \rd_pntr_gc_reg[5] ;
  output \rd_pntr_gc_reg[4] ;
  output \rd_pntr_gc_reg[3] ;
  output \rd_pntr_gc_reg[2] ;
  output \rd_pntr_gc_reg[1] ;
  output \rd_pntr_gc_reg[0] ;
  input [8:0]WR_PNTR_RD;
  input ram_empty_fb_i_reg_0;
  input rd_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;

  wire [7:0]Q;
  wire [8:0]WR_PNTR_RD;
  wire \gc0.count[8]_i_2_n_0 ;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;
  wire [8:0]plusOp;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire rd_clk;
  wire \rd_pntr_gc_reg[0] ;
  wire \rd_pntr_gc_reg[1] ;
  wire \rd_pntr_gc_reg[2] ;
  wire \rd_pntr_gc_reg[3] ;
  wire \rd_pntr_gc_reg[4] ;
  wire \rd_pntr_gc_reg[5] ;
  wire [8:0]\rd_pntr_gc_reg[8] ;
  wire [8:8]rd_pntr_plus1;
  wire [3:0]v1_reg;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \gc0.count[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gc0.count[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \gc0.count[5]_i_1 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \gc0.count[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(\gc0.count[8]_i_2_n_0 ),
        .I3(Q[5]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gc0.count[7]_i_1 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\gc0.count[8]_i_2_n_0 ),
        .I3(Q[4]),
        .I4(Q[6]),
        .O(plusOp[7]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \gc0.count[8]_i_1 
       (.I0(rd_pntr_plus1),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(\gc0.count[8]_i_2_n_0 ),
        .I4(Q[5]),
        .I5(Q[7]),
        .O(plusOp[8]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \gc0.count[8]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\gc0.count[8]_i_2_n_0 ));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[0]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[0]),
        .Q(\rd_pntr_gc_reg[8] [0]));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[0]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0]_rep 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[0]),
        .Q(\rd_pntr_gc_reg[0] ));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[1]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[1]),
        .Q(\rd_pntr_gc_reg[8] [1]));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[1]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1]_rep 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[1]),
        .Q(\rd_pntr_gc_reg[1] ));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[2]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[2]),
        .Q(\rd_pntr_gc_reg[8] [2]));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[2]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2]_rep 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[2]),
        .Q(\rd_pntr_gc_reg[2] ));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[3]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[3]),
        .Q(\rd_pntr_gc_reg[8] [3]));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[3]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3]_rep 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[3]),
        .Q(\rd_pntr_gc_reg[3] ));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[4]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[4]),
        .Q(\rd_pntr_gc_reg[8] [4]));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[4]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4]_rep 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[4]),
        .Q(\rd_pntr_gc_reg[4] ));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[5]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[5]),
        .Q(\rd_pntr_gc_reg[8] [5]));
  (* ORIG_CELL_NAME = "gc0.count_d1_reg[5]" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5]_rep 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[5]),
        .Q(\rd_pntr_gc_reg[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[6]),
        .Q(\rd_pntr_gc_reg[8] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[7]),
        .Q(\rd_pntr_gc_reg[8] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(rd_pntr_plus1),
        .Q(\rd_pntr_gc_reg[8] [8]));
  FDPE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .D(plusOp[0]),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(rd_clk),
        .CE(ram_empty_fb_i_reg_0),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[8]),
        .Q(rd_pntr_plus1));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(\rd_pntr_gc_reg[1] ),
        .I1(WR_PNTR_RD[1]),
        .I2(\rd_pntr_gc_reg[0] ),
        .I3(WR_PNTR_RD[0]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(\rd_pntr_gc_reg[3] ),
        .I1(WR_PNTR_RD[3]),
        .I2(\rd_pntr_gc_reg[2] ),
        .I3(WR_PNTR_RD[2]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(\rd_pntr_gc_reg[5] ),
        .I1(WR_PNTR_RD[5]),
        .I2(\rd_pntr_gc_reg[4] ),
        .I3(WR_PNTR_RD[4]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(\rd_pntr_gc_reg[8] [7]),
        .I1(WR_PNTR_RD[7]),
        .I2(\rd_pntr_gc_reg[8] [6]),
        .I3(WR_PNTR_RD[6]),
        .O(v1_reg[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(rd_pntr_plus1),
        .I1(WR_PNTR_RD[8]),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module bitfile_fifo_in_rd_fwft
   (empty,
    E,
    \gc0.count_reg[8] ,
    ram_empty_fb_i_reg,
    \goreg_dm.dout_i_reg[31] ,
    rd_clk,
    Q,
    p_18_out,
    rd_en,
    comp0,
    comp1);
  output empty;
  output [0:0]E;
  output \gc0.count_reg[8] ;
  output ram_empty_fb_i_reg;
  output [0:0]\goreg_dm.dout_i_reg[31] ;
  input rd_clk;
  input [0:0]Q;
  input p_18_out;
  input rd_en;
  input comp0;
  input comp1;

  wire [0:0]E;
  wire [0:0]Q;
  wire comp0;
  wire comp1;
  wire [0:0]curr_fwft_state;
  wire empty;
  wire empty_fwft_fb;
  wire empty_fwft_i0;
  wire \gc0.count_reg[8] ;
  wire [0:0]\goreg_dm.dout_i_reg[31] ;
  wire \gpregsm1.curr_fwft_state[0]_i_1_n_0 ;
  wire \gpregsm1.curr_fwft_state[1]_i_1_n_0 ;
  wire \gpregsm1.curr_fwft_state_reg_n_0_[1] ;
  wire p_18_out;
  wire ram_empty_fb_i_reg;
  wire rd_clk;
  wire rd_en;

  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    empty_fwft_fb_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .PRE(Q),
        .Q(empty_fwft_fb));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hBA22)) 
    empty_fwft_i_i_1
       (.I0(empty_fwft_fb),
        .I1(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I2(rd_en),
        .I3(curr_fwft_state),
        .O(empty_fwft_i0));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .PRE(Q),
        .Q(empty));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h5515)) 
    \gc0.count_d1[8]_i_1 
       (.I0(p_18_out),
        .I1(curr_fwft_state),
        .I2(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I3(rd_en),
        .O(\gc0.count_reg[8] ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \goreg_dm.dout_i[31]_i_1 
       (.I0(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I1(rd_en),
        .I2(curr_fwft_state),
        .O(\goreg_dm.dout_i_reg[31] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h5515)) 
    \gpr1.dout_i[31]_i_1 
       (.I0(p_18_out),
        .I1(curr_fwft_state),
        .I2(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I3(rd_en),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I1(rd_en),
        .I2(curr_fwft_state),
        .O(\gpregsm1.curr_fwft_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h08FF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state),
        .I1(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I2(rd_en),
        .I3(p_18_out),
        .O(\gpregsm1.curr_fwft_state[1]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(Q),
        .D(\gpregsm1.curr_fwft_state[0]_i_1_n_0 ),
        .Q(curr_fwft_state));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(Q),
        .D(\gpregsm1.curr_fwft_state[1]_i_1_n_0 ),
        .Q(\gpregsm1.curr_fwft_state_reg_n_0_[1] ));
  LUT6 #(
    .INIT(64'hBBBBABBBAAAAAAAA)) 
    ram_empty_fb_i_i_1
       (.I0(comp0),
        .I1(p_18_out),
        .I2(curr_fwft_state),
        .I3(\gpregsm1.curr_fwft_state_reg_n_0_[1] ),
        .I4(rd_en),
        .I5(comp1),
        .O(ram_empty_fb_i_reg));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module bitfile_fifo_in_rd_logic
   (empty,
    E,
    \gc0.count_d1_reg[7] ,
    \rd_pntr_gc_reg[8] ,
    \rd_pntr_gc_reg[5] ,
    \rd_pntr_gc_reg[4] ,
    \rd_pntr_gc_reg[3] ,
    \rd_pntr_gc_reg[2] ,
    \rd_pntr_gc_reg[1] ,
    \rd_pntr_gc_reg[0] ,
    \goreg_dm.dout_i_reg[31] ,
    \wr_pntr_bin_reg[8] ,
    v1_reg,
    rd_clk,
    Q,
    rd_en,
    WR_PNTR_RD);
  output empty;
  output [0:0]E;
  output [7:0]\gc0.count_d1_reg[7] ;
  output [8:0]\rd_pntr_gc_reg[8] ;
  output \rd_pntr_gc_reg[5] ;
  output \rd_pntr_gc_reg[4] ;
  output \rd_pntr_gc_reg[3] ;
  output \rd_pntr_gc_reg[2] ;
  output \rd_pntr_gc_reg[1] ;
  output \rd_pntr_gc_reg[0] ;
  output [0:0]\goreg_dm.dout_i_reg[31] ;
  input \wr_pntr_bin_reg[8] ;
  input [3:0]v1_reg;
  input rd_clk;
  input [0:0]Q;
  input rd_en;
  input [8:0]WR_PNTR_RD;

  wire [0:0]E;
  wire [0:0]Q;
  wire [8:0]WR_PNTR_RD;
  wire [3:0]\c0/v1_reg ;
  wire comp0;
  wire comp1;
  wire empty;
  wire [7:0]\gc0.count_d1_reg[7] ;
  wire [0:0]\goreg_dm.dout_i_reg[31] ;
  wire \gr1.rfwft_n_2 ;
  wire \gr1.rfwft_n_3 ;
  wire p_18_out;
  wire rd_clk;
  wire rd_en;
  wire \rd_pntr_gc_reg[0] ;
  wire \rd_pntr_gc_reg[1] ;
  wire \rd_pntr_gc_reg[2] ;
  wire \rd_pntr_gc_reg[3] ;
  wire \rd_pntr_gc_reg[4] ;
  wire \rd_pntr_gc_reg[5] ;
  wire [8:0]\rd_pntr_gc_reg[8] ;
  wire rpntr_n_0;
  wire [3:0]v1_reg;
  wire \wr_pntr_bin_reg[8] ;

  bitfile_fifo_in_rd_fwft \gr1.rfwft 
       (.E(E),
        .Q(Q),
        .comp0(comp0),
        .comp1(comp1),
        .empty(empty),
        .\gc0.count_reg[8] (\gr1.rfwft_n_2 ),
        .\goreg_dm.dout_i_reg[31] (\goreg_dm.dout_i_reg[31] ),
        .p_18_out(p_18_out),
        .ram_empty_fb_i_reg(\gr1.rfwft_n_3 ),
        .rd_clk(rd_clk),
        .rd_en(rd_en));
  bitfile_fifo_in_rd_status_flags_as \gras.rsts 
       (.Q(Q),
        .comp0(comp0),
        .comp1(comp1),
        .\gc0.count_reg[8] (rpntr_n_0),
        .p_18_out(p_18_out),
        .ram_empty_fb_i_reg_0(\gr1.rfwft_n_3 ),
        .rd_clk(rd_clk),
        .v1_reg(v1_reg),
        .v1_reg_0(\c0/v1_reg ),
        .\wr_pntr_bin_reg[8] (\wr_pntr_bin_reg[8] ));
  bitfile_fifo_in_rd_bin_cntr rpntr
       (.Q(\gc0.count_d1_reg[7] ),
        .WR_PNTR_RD(WR_PNTR_RD),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] (Q),
        .ram_empty_fb_i_reg(rpntr_n_0),
        .ram_empty_fb_i_reg_0(\gr1.rfwft_n_2 ),
        .rd_clk(rd_clk),
        .\rd_pntr_gc_reg[0] (\rd_pntr_gc_reg[0] ),
        .\rd_pntr_gc_reg[1] (\rd_pntr_gc_reg[1] ),
        .\rd_pntr_gc_reg[2] (\rd_pntr_gc_reg[2] ),
        .\rd_pntr_gc_reg[3] (\rd_pntr_gc_reg[3] ),
        .\rd_pntr_gc_reg[4] (\rd_pntr_gc_reg[4] ),
        .\rd_pntr_gc_reg[5] (\rd_pntr_gc_reg[5] ),
        .\rd_pntr_gc_reg[8] (\rd_pntr_gc_reg[8] ),
        .v1_reg(\c0/v1_reg ));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_as" *) 
module bitfile_fifo_in_rd_status_flags_as
   (comp0,
    comp1,
    p_18_out,
    v1_reg_0,
    \wr_pntr_bin_reg[8] ,
    v1_reg,
    \gc0.count_reg[8] ,
    ram_empty_fb_i_reg_0,
    rd_clk,
    Q);
  output comp0;
  output comp1;
  output p_18_out;
  input [3:0]v1_reg_0;
  input \wr_pntr_bin_reg[8] ;
  input [3:0]v1_reg;
  input \gc0.count_reg[8] ;
  input ram_empty_fb_i_reg_0;
  input rd_clk;
  input [0:0]Q;

  wire [0:0]Q;
  wire comp0;
  wire comp1;
  wire \gc0.count_reg[8] ;
  wire p_18_out;
  wire ram_empty_fb_i_reg_0;
  wire rd_clk;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire \wr_pntr_bin_reg[8] ;

  bitfile_fifo_in_compare_1 c0
       (.comp0(comp0),
        .v1_reg_0(v1_reg_0),
        .\wr_pntr_bin_reg[8] (\wr_pntr_bin_reg[8] ));
  bitfile_fifo_in_compare_2 c1
       (.comp1(comp1),
        .\gc0.count_reg[8] (\gc0.count_reg[8] ),
        .v1_reg(v1_reg));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(ram_empty_fb_i_reg_0),
        .PRE(Q),
        .Q(p_18_out));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module bitfile_fifo_in_reset_blk_ramfifo
   (s_aclk,
    m_aclk,
    s_aresetn);
  input s_aclk;
  input m_aclk;
  input s_aresetn;

  wire inverted_reset;
  wire m_aclk;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_d3;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg2;
  wire s_aclk;
  wire s_aresetn;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(inverted_reset),
        .Q(rst_d1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .PRE(inverted_reset),
        .Q(rst_d2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .PRE(inverted_reset),
        .Q(rst_d3));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(inverted_reset),
        .Q(rst_rd_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(rst_rd_reg1),
        .PRE(inverted_reset),
        .Q(rst_rd_reg2));
  LUT1 #(
    .INIT(2'h1)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg1_i_1 
       (.I0(s_aresetn),
        .O(inverted_reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(inverted_reset),
        .Q(rst_wr_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_wr_reg1),
        .PRE(inverted_reset),
        .Q(rst_wr_reg2));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module bitfile_fifo_in_reset_blk_ramfifo__parameterized0
   (Q,
    \gc0.count_d1_reg[0]_rep ,
    wr_clk,
    rst,
    rd_clk);
  output [1:0]Q;
  output [2:0]\gc0.count_d1_reg[0]_rep ;
  input wr_clk;
  input rst;
  input rd_clk;

  wire [1:0]Q;
  wire [2:0]\gc0.count_d1_reg[0]_rep ;
  wire \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0 ;
  wire \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0 ;
  wire \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1_n_0 ;
  wire \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0 ;
  wire rd_clk;
  wire rd_rst_asreg;
  wire rd_rst_asreg_d2;
  wire rst;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_rd_reg2;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg1;
  (* async_reg = "true" *) (* msgon = "true" *) wire rst_wr_reg2;
  wire wr_clk;
  wire wr_rst_asreg;
  wire wr_rst_asreg_d2;

  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(rd_rst_asreg),
        .Q(\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0 ),
        .Q(rd_rst_asreg_d2),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 
       (.I0(rd_rst_asreg),
        .I1(\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0 ),
        .O(\ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1_n_0 ),
        .PRE(rst_rd_reg2),
        .Q(rd_rst_asreg));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 
       (.I0(rd_rst_asreg),
        .I1(rd_rst_asreg_d2),
        .O(\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0 ),
        .Q(\gc0.count_d1_reg[0]_rep [0]));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0 ),
        .Q(\gc0.count_d1_reg[0]_rep [1]));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0 ),
        .Q(\gc0.count_d1_reg[0]_rep [2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(rst),
        .Q(rst_rd_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(rst_rd_reg1),
        .PRE(rst),
        .Q(rst_rd_reg2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(rst),
        .Q(rst_wr_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rst_wr_reg1),
        .PRE(rst),
        .Q(rst_wr_reg2));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(wr_rst_asreg),
        .Q(\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0 ),
        .Q(wr_rst_asreg_d2),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 
       (.I0(wr_rst_asreg),
        .I1(\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0 ),
        .O(\ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1_n_0 ),
        .PRE(rst_wr_reg2),
        .Q(wr_rst_asreg));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 
       (.I0(wr_rst_asreg),
        .I1(wr_rst_asreg_d2),
        .O(\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0 ),
        .Q(Q[0]));
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0 ),
        .Q(Q[1]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module bitfile_fifo_in_synchronizer_ff
   (D,
    Q,
    rd_clk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] );
  output [8:0]D;
  input [8:0]Q;
  input rd_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  wire [8:0]Q;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;
  wire rd_clk;

  assign D[8:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[4]),
        .Q(Q_reg[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[5]),
        .Q(Q_reg[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[6]),
        .Q(Q_reg[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[7]),
        .Q(Q_reg[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[8]),
        .Q(Q_reg[8]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module bitfile_fifo_in_synchronizer_ff_3
   (D,
    Q,
    wr_clk,
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] );
  output [8:0]D;
  input [8:0]Q;
  input wr_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ;

  wire [8:0]Q;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ;
  wire wr_clk;

  assign D[8:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[4]),
        .Q(Q_reg[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[5]),
        .Q(Q_reg[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[6]),
        .Q(Q_reg[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[7]),
        .Q(Q_reg[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(Q[8]),
        .Q(Q_reg[8]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module bitfile_fifo_in_synchronizer_ff_4
   (out,
    \wr_pntr_bin_reg[7] ,
    D,
    rd_clk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] );
  output [0:0]out;
  output [7:0]\wr_pntr_bin_reg[7] ;
  input [8:0]D;
  input rd_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  wire [8:0]D;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;
  wire rd_clk;
  wire \wr_pntr_bin[2]_i_2_n_0 ;
  wire [7:0]\wr_pntr_bin_reg[7] ;

  assign out[0] = Q_reg[8];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[4]),
        .Q(Q_reg[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[5]),
        .Q(Q_reg[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[6]),
        .Q(Q_reg[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[7]),
        .Q(Q_reg[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D[8]),
        .Q(Q_reg[8]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \wr_pntr_bin[0]_i_1 
       (.I0(Q_reg[1]),
        .I1(Q_reg[0]),
        .I2(\wr_pntr_bin[2]_i_2_n_0 ),
        .I3(Q_reg[3]),
        .I4(Q_reg[2]),
        .I5(Q_reg[8]),
        .O(\wr_pntr_bin_reg[7] [0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \wr_pntr_bin[1]_i_1 
       (.I0(\wr_pntr_bin[2]_i_2_n_0 ),
        .I1(Q_reg[3]),
        .I2(Q_reg[2]),
        .I3(Q_reg[8]),
        .I4(Q_reg[1]),
        .O(\wr_pntr_bin_reg[7] [1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \wr_pntr_bin[2]_i_1 
       (.I0(Q_reg[8]),
        .I1(Q_reg[2]),
        .I2(Q_reg[3]),
        .I3(\wr_pntr_bin[2]_i_2_n_0 ),
        .O(\wr_pntr_bin_reg[7] [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \wr_pntr_bin[2]_i_2 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[5]),
        .I3(Q_reg[4]),
        .O(\wr_pntr_bin[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \wr_pntr_bin[3]_i_1 
       (.I0(Q_reg[5]),
        .I1(Q_reg[3]),
        .I2(Q_reg[4]),
        .I3(Q_reg[8]),
        .I4(Q_reg[6]),
        .I5(Q_reg[7]),
        .O(\wr_pntr_bin_reg[7] [3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \wr_pntr_bin[4]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[4]),
        .I2(Q_reg[5]),
        .I3(Q_reg[8]),
        .I4(Q_reg[7]),
        .O(\wr_pntr_bin_reg[7] [4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \wr_pntr_bin[5]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[5]),
        .I2(Q_reg[8]),
        .I3(Q_reg[7]),
        .O(\wr_pntr_bin_reg[7] [5]));
  LUT3 #(
    .INIT(8'h96)) 
    \wr_pntr_bin[6]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[8]),
        .O(\wr_pntr_bin_reg[7] [6]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_pntr_bin[7]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[8]),
        .O(\wr_pntr_bin_reg[7] [7]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module bitfile_fifo_in_synchronizer_ff_5
   (out,
    \rd_pntr_bin_reg[7] ,
    D,
    wr_clk,
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] );
  output [0:0]out;
  output [7:0]\rd_pntr_bin_reg[7] ;
  input [8:0]D;
  input wr_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ;

  wire [8:0]D;
  (* async_reg = "true" *) (* msgon = "true" *) wire [8:0]Q_reg;
  wire [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ;
  wire \rd_pntr_bin[2]_i_2_n_0 ;
  wire [7:0]\rd_pntr_bin_reg[7] ;
  wire wr_clk;

  assign out[0] = Q_reg[8];
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[4]),
        .Q(Q_reg[4]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[5]),
        .Q(Q_reg[5]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[6]),
        .Q(Q_reg[6]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[7]),
        .Q(Q_reg[7]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] ),
        .D(D[8]),
        .Q(Q_reg[8]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \rd_pntr_bin[0]_i_1 
       (.I0(Q_reg[1]),
        .I1(Q_reg[0]),
        .I2(\rd_pntr_bin[2]_i_2_n_0 ),
        .I3(Q_reg[3]),
        .I4(Q_reg[2]),
        .I5(Q_reg[8]),
        .O(\rd_pntr_bin_reg[7] [0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \rd_pntr_bin[1]_i_1 
       (.I0(\rd_pntr_bin[2]_i_2_n_0 ),
        .I1(Q_reg[3]),
        .I2(Q_reg[2]),
        .I3(Q_reg[8]),
        .I4(Q_reg[1]),
        .O(\rd_pntr_bin_reg[7] [1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \rd_pntr_bin[2]_i_1 
       (.I0(Q_reg[8]),
        .I1(Q_reg[2]),
        .I2(Q_reg[3]),
        .I3(\rd_pntr_bin[2]_i_2_n_0 ),
        .O(\rd_pntr_bin_reg[7] [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \rd_pntr_bin[2]_i_2 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[5]),
        .I3(Q_reg[4]),
        .O(\rd_pntr_bin[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \rd_pntr_bin[3]_i_1 
       (.I0(Q_reg[5]),
        .I1(Q_reg[3]),
        .I2(Q_reg[4]),
        .I3(Q_reg[8]),
        .I4(Q_reg[6]),
        .I5(Q_reg[7]),
        .O(\rd_pntr_bin_reg[7] [3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \rd_pntr_bin[4]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[4]),
        .I2(Q_reg[5]),
        .I3(Q_reg[8]),
        .I4(Q_reg[7]),
        .O(\rd_pntr_bin_reg[7] [4]));
  LUT4 #(
    .INIT(16'h6996)) 
    \rd_pntr_bin[5]_i_1 
       (.I0(Q_reg[6]),
        .I1(Q_reg[5]),
        .I2(Q_reg[8]),
        .I3(Q_reg[7]),
        .O(\rd_pntr_bin_reg[7] [5]));
  LUT3 #(
    .INIT(8'h96)) 
    \rd_pntr_bin[6]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[6]),
        .I2(Q_reg[8]),
        .O(\rd_pntr_bin_reg[7] [6]));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_pntr_bin[7]_i_1 
       (.I0(Q_reg[7]),
        .I1(Q_reg[8]),
        .O(\rd_pntr_bin_reg[7] [7]));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module bitfile_fifo_in_wr_bin_cntr
   (ram_full_i_reg,
    ram_full_i_reg_0,
    ram_full_i_reg_1,
    Q,
    \gpr1.dout_i_reg[31] ,
    \wr_pntr_gc_reg[8] ,
    \gpr1.dout_i_reg[30] ,
    \gpr1.dout_i_reg[31]_0 ,
    \gpr1.dout_i_reg[30]_0 ,
    \gpr1.dout_i_reg[31]_1 ,
    \gpr1.dout_i_reg[30]_1 ,
    \gpr1.dout_i_reg[31]_2 ,
    \gpr1.dout_i_reg[30]_2 ,
    \gpr1.dout_i_reg[27] ,
    \gpr1.dout_i_reg[27]_0 ,
    \gpr1.dout_i_reg[27]_1 ,
    \gpr1.dout_i_reg[27]_2 ,
    \gpr1.dout_i_reg[24] ,
    \gpr1.dout_i_reg[24]_0 ,
    \gpr1.dout_i_reg[24]_1 ,
    \gpr1.dout_i_reg[24]_2 ,
    \gpr1.dout_i_reg[21] ,
    \gpr1.dout_i_reg[21]_0 ,
    \gpr1.dout_i_reg[21]_1 ,
    \gpr1.dout_i_reg[21]_2 ,
    \gpr1.dout_i_reg[18] ,
    \gpr1.dout_i_reg[18]_0 ,
    \gpr1.dout_i_reg[18]_1 ,
    \gpr1.dout_i_reg[18]_2 ,
    \gpr1.dout_i_reg[15] ,
    \gpr1.dout_i_reg[15]_0 ,
    \gpr1.dout_i_reg[15]_1 ,
    \gpr1.dout_i_reg[15]_2 ,
    \gpr1.dout_i_reg[12] ,
    \gpr1.dout_i_reg[12]_0 ,
    \gpr1.dout_i_reg[12]_1 ,
    \gpr1.dout_i_reg[12]_2 ,
    \gpr1.dout_i_reg[9] ,
    \gpr1.dout_i_reg[9]_0 ,
    \gpr1.dout_i_reg[9]_1 ,
    \gpr1.dout_i_reg[9]_2 ,
    \gpr1.dout_i_reg[6] ,
    \gpr1.dout_i_reg[6]_0 ,
    \gpr1.dout_i_reg[6]_1 ,
    \gpr1.dout_i_reg[6]_2 ,
    \gpr1.dout_i_reg[3] ,
    \gpr1.dout_i_reg[3]_0 ,
    \gpr1.dout_i_reg[3]_1 ,
    \gpr1.dout_i_reg[3]_2 ,
    \gpr1.dout_i_reg[0] ,
    \gpr1.dout_i_reg[0]_0 ,
    \gpr1.dout_i_reg[0]_1 ,
    \gpr1.dout_i_reg[0]_2 ,
    \gpr1.dout_i_reg[31]_3 ,
    \gpr1.dout_i_reg[30]_3 ,
    \gpr1.dout_i_reg[27]_3 ,
    \gpr1.dout_i_reg[24]_3 ,
    \gpr1.dout_i_reg[21]_3 ,
    \gpr1.dout_i_reg[18]_3 ,
    \gpr1.dout_i_reg[15]_3 ,
    \gpr1.dout_i_reg[12]_3 ,
    \gpr1.dout_i_reg[9]_3 ,
    \gpr1.dout_i_reg[6]_3 ,
    \gpr1.dout_i_reg[3]_3 ,
    \gpr1.dout_i_reg[0]_3 ,
    \gpr1.dout_i_reg[31]_4 ,
    \gpr1.dout_i_reg[30]_4 ,
    \gpr1.dout_i_reg[27]_4 ,
    \gpr1.dout_i_reg[24]_4 ,
    \gpr1.dout_i_reg[21]_4 ,
    \gpr1.dout_i_reg[18]_4 ,
    \gpr1.dout_i_reg[15]_4 ,
    \gpr1.dout_i_reg[12]_4 ,
    \gpr1.dout_i_reg[9]_4 ,
    \gpr1.dout_i_reg[6]_4 ,
    \gpr1.dout_i_reg[3]_4 ,
    \gpr1.dout_i_reg[0]_4 ,
    \gpr1.dout_i_reg[31]_5 ,
    \gpr1.dout_i_reg[30]_5 ,
    \gpr1.dout_i_reg[27]_5 ,
    \gpr1.dout_i_reg[24]_5 ,
    \gpr1.dout_i_reg[21]_5 ,
    \gpr1.dout_i_reg[18]_5 ,
    \gpr1.dout_i_reg[15]_5 ,
    \gpr1.dout_i_reg[12]_5 ,
    \gpr1.dout_i_reg[9]_5 ,
    \gpr1.dout_i_reg[6]_5 ,
    \gpr1.dout_i_reg[3]_5 ,
    \gpr1.dout_i_reg[0]_5 ,
    \gpr1.dout_i_reg[31]_6 ,
    \gpr1.dout_i_reg[30]_6 ,
    \gpr1.dout_i_reg[27]_6 ,
    \gpr1.dout_i_reg[24]_6 ,
    \gpr1.dout_i_reg[21]_6 ,
    \gpr1.dout_i_reg[18]_6 ,
    \gpr1.dout_i_reg[15]_6 ,
    \gpr1.dout_i_reg[12]_6 ,
    \gpr1.dout_i_reg[9]_6 ,
    \gpr1.dout_i_reg[6]_6 ,
    \gpr1.dout_i_reg[3]_6 ,
    \gpr1.dout_i_reg[0]_6 ,
    \gic0.gc0.count_d2_reg[7]_0 ,
    comp1,
    wr_en,
    p_0_out,
    comp2,
    RD_PNTR_WR,
    E,
    wr_clk,
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] );
  output ram_full_i_reg;
  output ram_full_i_reg_0;
  output ram_full_i_reg_1;
  output [7:0]Q;
  output \gpr1.dout_i_reg[31] ;
  output [8:0]\wr_pntr_gc_reg[8] ;
  output \gpr1.dout_i_reg[30] ;
  output \gpr1.dout_i_reg[31]_0 ;
  output \gpr1.dout_i_reg[30]_0 ;
  output \gpr1.dout_i_reg[31]_1 ;
  output \gpr1.dout_i_reg[30]_1 ;
  output \gpr1.dout_i_reg[31]_2 ;
  output \gpr1.dout_i_reg[30]_2 ;
  output \gpr1.dout_i_reg[27] ;
  output \gpr1.dout_i_reg[27]_0 ;
  output \gpr1.dout_i_reg[27]_1 ;
  output \gpr1.dout_i_reg[27]_2 ;
  output \gpr1.dout_i_reg[24] ;
  output \gpr1.dout_i_reg[24]_0 ;
  output \gpr1.dout_i_reg[24]_1 ;
  output \gpr1.dout_i_reg[24]_2 ;
  output \gpr1.dout_i_reg[21] ;
  output \gpr1.dout_i_reg[21]_0 ;
  output \gpr1.dout_i_reg[21]_1 ;
  output \gpr1.dout_i_reg[21]_2 ;
  output \gpr1.dout_i_reg[18] ;
  output \gpr1.dout_i_reg[18]_0 ;
  output \gpr1.dout_i_reg[18]_1 ;
  output \gpr1.dout_i_reg[18]_2 ;
  output \gpr1.dout_i_reg[15] ;
  output \gpr1.dout_i_reg[15]_0 ;
  output \gpr1.dout_i_reg[15]_1 ;
  output \gpr1.dout_i_reg[15]_2 ;
  output \gpr1.dout_i_reg[12] ;
  output \gpr1.dout_i_reg[12]_0 ;
  output \gpr1.dout_i_reg[12]_1 ;
  output \gpr1.dout_i_reg[12]_2 ;
  output \gpr1.dout_i_reg[9] ;
  output \gpr1.dout_i_reg[9]_0 ;
  output \gpr1.dout_i_reg[9]_1 ;
  output \gpr1.dout_i_reg[9]_2 ;
  output \gpr1.dout_i_reg[6] ;
  output \gpr1.dout_i_reg[6]_0 ;
  output \gpr1.dout_i_reg[6]_1 ;
  output \gpr1.dout_i_reg[6]_2 ;
  output \gpr1.dout_i_reg[3] ;
  output \gpr1.dout_i_reg[3]_0 ;
  output \gpr1.dout_i_reg[3]_1 ;
  output \gpr1.dout_i_reg[3]_2 ;
  output \gpr1.dout_i_reg[0] ;
  output \gpr1.dout_i_reg[0]_0 ;
  output \gpr1.dout_i_reg[0]_1 ;
  output \gpr1.dout_i_reg[0]_2 ;
  output \gpr1.dout_i_reg[31]_3 ;
  output \gpr1.dout_i_reg[30]_3 ;
  output \gpr1.dout_i_reg[27]_3 ;
  output \gpr1.dout_i_reg[24]_3 ;
  output \gpr1.dout_i_reg[21]_3 ;
  output \gpr1.dout_i_reg[18]_3 ;
  output \gpr1.dout_i_reg[15]_3 ;
  output \gpr1.dout_i_reg[12]_3 ;
  output \gpr1.dout_i_reg[9]_3 ;
  output \gpr1.dout_i_reg[6]_3 ;
  output \gpr1.dout_i_reg[3]_3 ;
  output \gpr1.dout_i_reg[0]_3 ;
  output \gpr1.dout_i_reg[31]_4 ;
  output \gpr1.dout_i_reg[30]_4 ;
  output \gpr1.dout_i_reg[27]_4 ;
  output \gpr1.dout_i_reg[24]_4 ;
  output \gpr1.dout_i_reg[21]_4 ;
  output \gpr1.dout_i_reg[18]_4 ;
  output \gpr1.dout_i_reg[15]_4 ;
  output \gpr1.dout_i_reg[12]_4 ;
  output \gpr1.dout_i_reg[9]_4 ;
  output \gpr1.dout_i_reg[6]_4 ;
  output \gpr1.dout_i_reg[3]_4 ;
  output \gpr1.dout_i_reg[0]_4 ;
  output \gpr1.dout_i_reg[31]_5 ;
  output \gpr1.dout_i_reg[30]_5 ;
  output \gpr1.dout_i_reg[27]_5 ;
  output \gpr1.dout_i_reg[24]_5 ;
  output \gpr1.dout_i_reg[21]_5 ;
  output \gpr1.dout_i_reg[18]_5 ;
  output \gpr1.dout_i_reg[15]_5 ;
  output \gpr1.dout_i_reg[12]_5 ;
  output \gpr1.dout_i_reg[9]_5 ;
  output \gpr1.dout_i_reg[6]_5 ;
  output \gpr1.dout_i_reg[3]_5 ;
  output \gpr1.dout_i_reg[0]_5 ;
  output \gpr1.dout_i_reg[31]_6 ;
  output \gpr1.dout_i_reg[30]_6 ;
  output \gpr1.dout_i_reg[27]_6 ;
  output \gpr1.dout_i_reg[24]_6 ;
  output \gpr1.dout_i_reg[21]_6 ;
  output \gpr1.dout_i_reg[18]_6 ;
  output \gpr1.dout_i_reg[15]_6 ;
  output \gpr1.dout_i_reg[12]_6 ;
  output \gpr1.dout_i_reg[9]_6 ;
  output \gpr1.dout_i_reg[6]_6 ;
  output \gpr1.dout_i_reg[3]_6 ;
  output \gpr1.dout_i_reg[0]_6 ;
  output [7:0]\gic0.gc0.count_d2_reg[7]_0 ;
  input comp1;
  input wr_en;
  input p_0_out;
  input comp2;
  input [0:0]RD_PNTR_WR;
  input [0:0]E;
  input wr_clk;
  input [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ;

  wire [0:0]E;
  wire [7:0]Q;
  wire [0:0]RD_PNTR_WR;
  wire comp1;
  wire comp2;
  wire \gic0.gc0.count[8]_i_2_n_0 ;
  wire [7:0]\gic0.gc0.count_d2_reg[7]_0 ;
  wire \gpr1.dout_i_reg[0] ;
  wire \gpr1.dout_i_reg[0]_0 ;
  wire \gpr1.dout_i_reg[0]_1 ;
  wire \gpr1.dout_i_reg[0]_2 ;
  wire \gpr1.dout_i_reg[0]_3 ;
  wire \gpr1.dout_i_reg[0]_4 ;
  wire \gpr1.dout_i_reg[0]_5 ;
  wire \gpr1.dout_i_reg[0]_6 ;
  wire \gpr1.dout_i_reg[12] ;
  wire \gpr1.dout_i_reg[12]_0 ;
  wire \gpr1.dout_i_reg[12]_1 ;
  wire \gpr1.dout_i_reg[12]_2 ;
  wire \gpr1.dout_i_reg[12]_3 ;
  wire \gpr1.dout_i_reg[12]_4 ;
  wire \gpr1.dout_i_reg[12]_5 ;
  wire \gpr1.dout_i_reg[12]_6 ;
  wire \gpr1.dout_i_reg[15] ;
  wire \gpr1.dout_i_reg[15]_0 ;
  wire \gpr1.dout_i_reg[15]_1 ;
  wire \gpr1.dout_i_reg[15]_2 ;
  wire \gpr1.dout_i_reg[15]_3 ;
  wire \gpr1.dout_i_reg[15]_4 ;
  wire \gpr1.dout_i_reg[15]_5 ;
  wire \gpr1.dout_i_reg[15]_6 ;
  wire \gpr1.dout_i_reg[18] ;
  wire \gpr1.dout_i_reg[18]_0 ;
  wire \gpr1.dout_i_reg[18]_1 ;
  wire \gpr1.dout_i_reg[18]_2 ;
  wire \gpr1.dout_i_reg[18]_3 ;
  wire \gpr1.dout_i_reg[18]_4 ;
  wire \gpr1.dout_i_reg[18]_5 ;
  wire \gpr1.dout_i_reg[18]_6 ;
  wire \gpr1.dout_i_reg[21] ;
  wire \gpr1.dout_i_reg[21]_0 ;
  wire \gpr1.dout_i_reg[21]_1 ;
  wire \gpr1.dout_i_reg[21]_2 ;
  wire \gpr1.dout_i_reg[21]_3 ;
  wire \gpr1.dout_i_reg[21]_4 ;
  wire \gpr1.dout_i_reg[21]_5 ;
  wire \gpr1.dout_i_reg[21]_6 ;
  wire \gpr1.dout_i_reg[24] ;
  wire \gpr1.dout_i_reg[24]_0 ;
  wire \gpr1.dout_i_reg[24]_1 ;
  wire \gpr1.dout_i_reg[24]_2 ;
  wire \gpr1.dout_i_reg[24]_3 ;
  wire \gpr1.dout_i_reg[24]_4 ;
  wire \gpr1.dout_i_reg[24]_5 ;
  wire \gpr1.dout_i_reg[24]_6 ;
  wire \gpr1.dout_i_reg[27] ;
  wire \gpr1.dout_i_reg[27]_0 ;
  wire \gpr1.dout_i_reg[27]_1 ;
  wire \gpr1.dout_i_reg[27]_2 ;
  wire \gpr1.dout_i_reg[27]_3 ;
  wire \gpr1.dout_i_reg[27]_4 ;
  wire \gpr1.dout_i_reg[27]_5 ;
  wire \gpr1.dout_i_reg[27]_6 ;
  wire \gpr1.dout_i_reg[30] ;
  wire \gpr1.dout_i_reg[30]_0 ;
  wire \gpr1.dout_i_reg[30]_1 ;
  wire \gpr1.dout_i_reg[30]_2 ;
  wire \gpr1.dout_i_reg[30]_3 ;
  wire \gpr1.dout_i_reg[30]_4 ;
  wire \gpr1.dout_i_reg[30]_5 ;
  wire \gpr1.dout_i_reg[30]_6 ;
  wire \gpr1.dout_i_reg[31] ;
  wire \gpr1.dout_i_reg[31]_0 ;
  wire \gpr1.dout_i_reg[31]_1 ;
  wire \gpr1.dout_i_reg[31]_2 ;
  wire \gpr1.dout_i_reg[31]_3 ;
  wire \gpr1.dout_i_reg[31]_4 ;
  wire \gpr1.dout_i_reg[31]_5 ;
  wire \gpr1.dout_i_reg[31]_6 ;
  wire \gpr1.dout_i_reg[3] ;
  wire \gpr1.dout_i_reg[3]_0 ;
  wire \gpr1.dout_i_reg[3]_1 ;
  wire \gpr1.dout_i_reg[3]_2 ;
  wire \gpr1.dout_i_reg[3]_3 ;
  wire \gpr1.dout_i_reg[3]_4 ;
  wire \gpr1.dout_i_reg[3]_5 ;
  wire \gpr1.dout_i_reg[3]_6 ;
  wire \gpr1.dout_i_reg[6] ;
  wire \gpr1.dout_i_reg[6]_0 ;
  wire \gpr1.dout_i_reg[6]_1 ;
  wire \gpr1.dout_i_reg[6]_2 ;
  wire \gpr1.dout_i_reg[6]_3 ;
  wire \gpr1.dout_i_reg[6]_4 ;
  wire \gpr1.dout_i_reg[6]_5 ;
  wire \gpr1.dout_i_reg[6]_6 ;
  wire \gpr1.dout_i_reg[9] ;
  wire \gpr1.dout_i_reg[9]_0 ;
  wire \gpr1.dout_i_reg[9]_1 ;
  wire \gpr1.dout_i_reg[9]_2 ;
  wire \gpr1.dout_i_reg[9]_3 ;
  wire \gpr1.dout_i_reg[9]_4 ;
  wire \gpr1.dout_i_reg[9]_5 ;
  wire \gpr1.dout_i_reg[9]_6 ;
  wire [0:0]\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ;
  wire p_0_out;
  wire [8:8]p_8_out;
  wire [8:0]plusOp__0;
  wire ram_full_i_reg;
  wire ram_full_i_reg_0;
  wire ram_full_i_reg_1;
  wire wr_clk;
  wire wr_en;
  wire [8:0]\wr_pntr_gc_reg[8] ;
  wire [8:8]wr_pntr_plus2;

  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[0]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[12]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[15]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[18]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[21]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[24]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[27]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[30]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[31]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[3]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[6]_2 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    RAM_reg_0_63_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(\wr_pntr_gc_reg[8] [8]),
        .I3(wr_en),
        .I4(p_0_out),
        .O(\gpr1.dout_i_reg[9]_2 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[12]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[15]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[18]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[21]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[24]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[27]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[30]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[31]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[3]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[6]_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_128_191_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [6]),
        .I4(\wr_pntr_gc_reg[8] [7]),
        .O(\gpr1.dout_i_reg[9]_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[0] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[12] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[15] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[18] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[21] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[24] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[27] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[30] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[31] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[3] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[6] ));
  LUT5 #(
    .INIT(32'h04000000)) 
    RAM_reg_192_255_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[9] ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[0]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[12]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[15]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[18]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[21]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[24]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[27]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[30]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[31]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[3]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[6]_3 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    RAM_reg_256_319_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[9]_3 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[0]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[12]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[15]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[18]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[21]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[24]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[27]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[30]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[31]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[3]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[6]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_320_383_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[9]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[0]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[12]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[15]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[18]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[21]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[24]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[27]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[30]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[31]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[3]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[6]_5 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    RAM_reg_384_447_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [6]),
        .I1(\wr_pntr_gc_reg[8] [7]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[9]_5 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[0]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[12]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[15]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[18]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[21]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[24]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[27]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[30]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[31]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[3]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[6]_6 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    RAM_reg_448_511_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [7]),
        .I1(\wr_pntr_gc_reg[8] [6]),
        .I2(wr_en),
        .I3(p_0_out),
        .I4(\wr_pntr_gc_reg[8] [8]),
        .O(\gpr1.dout_i_reg[9]_6 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_0_2_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[0]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_12_14_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[12]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_15_17_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[15]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_18_20_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[18]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_21_23_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[21]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_24_26_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[24]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_27_29_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[27]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_30_30_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[30]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_31_31_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[31]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_3_5_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[3]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_6_8_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[6]_1 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    RAM_reg_64_127_9_11_i_1
       (.I0(\wr_pntr_gc_reg[8] [8]),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(\wr_pntr_gc_reg[8] [7]),
        .I4(\wr_pntr_gc_reg[8] [6]),
        .O(\gpr1.dout_i_reg[9]_1 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp__0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \gic0.gc0.count[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gic0.gc0.count[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \gic0.gc0.count[5]_i_1 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(plusOp__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \gic0.gc0.count[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(\gic0.gc0.count[8]_i_2_n_0 ),
        .I3(Q[5]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gic0.gc0.count[7]_i_1 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\gic0.gc0.count[8]_i_2_n_0 ),
        .I3(Q[4]),
        .I4(Q[6]),
        .O(plusOp__0[7]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \gic0.gc0.count[8]_i_1 
       (.I0(wr_pntr_plus2),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(\gic0.gc0.count[8]_i_2_n_0 ),
        .I4(Q[5]),
        .I5(Q[7]),
        .O(plusOp__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \gic0.gc0.count[8]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\gic0.gc0.count[8]_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_d1_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(Q[0]),
        .PRE(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[1]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[2]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[3]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[4]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[5]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[6]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(Q[7]),
        .Q(\gic0.gc0.count_d2_reg[7]_0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(wr_pntr_plus2),
        .Q(p_8_out));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [0]),
        .Q(\wr_pntr_gc_reg[8] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [1]),
        .Q(\wr_pntr_gc_reg[8] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [2]),
        .Q(\wr_pntr_gc_reg[8] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [3]),
        .Q(\wr_pntr_gc_reg[8] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [4]),
        .Q(\wr_pntr_gc_reg[8] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [5]),
        .Q(\wr_pntr_gc_reg[8] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [6]),
        .Q(\wr_pntr_gc_reg[8] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(\gic0.gc0.count_d2_reg[7]_0 [7]),
        .Q(\wr_pntr_gc_reg[8] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(p_8_out),
        .Q(\wr_pntr_gc_reg[8] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[0]),
        .Q(Q[0]));
  FDPE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(plusOp__0[1]),
        .PRE(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[4] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[5] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[6] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[7] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[8] 
       (.C(wr_clk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ),
        .D(plusOp__0[8]),
        .Q(wr_pntr_plus2));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(p_8_out),
        .I1(RD_PNTR_WR),
        .O(ram_full_i_reg_0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(wr_pntr_plus2),
        .I1(RD_PNTR_WR),
        .O(ram_full_i_reg_1));
  LUT4 #(
    .INIT(16'hAEAA)) 
    ram_full_i_i_1
       (.I0(comp1),
        .I1(wr_en),
        .I2(p_0_out),
        .I3(comp2),
        .O(ram_full_i_reg));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module bitfile_fifo_in_wr_logic
   (full,
    \gic0.gc0.count_d2_reg[7] ,
    \gic0.gc0.count_d1_reg[7] ,
    \gpr1.dout_i_reg[31] ,
    \wr_pntr_gc_reg[8] ,
    \gpr1.dout_i_reg[30] ,
    \gpr1.dout_i_reg[31]_0 ,
    \gpr1.dout_i_reg[30]_0 ,
    \gpr1.dout_i_reg[31]_1 ,
    \gpr1.dout_i_reg[30]_1 ,
    \gpr1.dout_i_reg[31]_2 ,
    \gpr1.dout_i_reg[30]_2 ,
    \gpr1.dout_i_reg[27] ,
    \gpr1.dout_i_reg[27]_0 ,
    \gpr1.dout_i_reg[27]_1 ,
    \gpr1.dout_i_reg[27]_2 ,
    \gpr1.dout_i_reg[24] ,
    \gpr1.dout_i_reg[24]_0 ,
    \gpr1.dout_i_reg[24]_1 ,
    \gpr1.dout_i_reg[24]_2 ,
    \gpr1.dout_i_reg[21] ,
    \gpr1.dout_i_reg[21]_0 ,
    \gpr1.dout_i_reg[21]_1 ,
    \gpr1.dout_i_reg[21]_2 ,
    \gpr1.dout_i_reg[18] ,
    \gpr1.dout_i_reg[18]_0 ,
    \gpr1.dout_i_reg[18]_1 ,
    \gpr1.dout_i_reg[18]_2 ,
    \gpr1.dout_i_reg[15] ,
    \gpr1.dout_i_reg[15]_0 ,
    \gpr1.dout_i_reg[15]_1 ,
    \gpr1.dout_i_reg[15]_2 ,
    \gpr1.dout_i_reg[12] ,
    \gpr1.dout_i_reg[12]_0 ,
    \gpr1.dout_i_reg[12]_1 ,
    \gpr1.dout_i_reg[12]_2 ,
    \gpr1.dout_i_reg[9] ,
    \gpr1.dout_i_reg[9]_0 ,
    \gpr1.dout_i_reg[9]_1 ,
    \gpr1.dout_i_reg[9]_2 ,
    \gpr1.dout_i_reg[6] ,
    \gpr1.dout_i_reg[6]_0 ,
    \gpr1.dout_i_reg[6]_1 ,
    \gpr1.dout_i_reg[6]_2 ,
    \gpr1.dout_i_reg[3] ,
    \gpr1.dout_i_reg[3]_0 ,
    \gpr1.dout_i_reg[3]_1 ,
    \gpr1.dout_i_reg[3]_2 ,
    \gpr1.dout_i_reg[0] ,
    \gpr1.dout_i_reg[0]_0 ,
    \gpr1.dout_i_reg[0]_1 ,
    \gpr1.dout_i_reg[0]_2 ,
    \gpr1.dout_i_reg[31]_3 ,
    \gpr1.dout_i_reg[30]_3 ,
    \gpr1.dout_i_reg[27]_3 ,
    \gpr1.dout_i_reg[24]_3 ,
    \gpr1.dout_i_reg[21]_3 ,
    \gpr1.dout_i_reg[18]_3 ,
    \gpr1.dout_i_reg[15]_3 ,
    \gpr1.dout_i_reg[12]_3 ,
    \gpr1.dout_i_reg[9]_3 ,
    \gpr1.dout_i_reg[6]_3 ,
    \gpr1.dout_i_reg[3]_3 ,
    \gpr1.dout_i_reg[0]_3 ,
    \gpr1.dout_i_reg[31]_4 ,
    \gpr1.dout_i_reg[30]_4 ,
    \gpr1.dout_i_reg[27]_4 ,
    \gpr1.dout_i_reg[24]_4 ,
    \gpr1.dout_i_reg[21]_4 ,
    \gpr1.dout_i_reg[18]_4 ,
    \gpr1.dout_i_reg[15]_4 ,
    \gpr1.dout_i_reg[12]_4 ,
    \gpr1.dout_i_reg[9]_4 ,
    \gpr1.dout_i_reg[6]_4 ,
    \gpr1.dout_i_reg[3]_4 ,
    \gpr1.dout_i_reg[0]_4 ,
    \gpr1.dout_i_reg[31]_5 ,
    \gpr1.dout_i_reg[30]_5 ,
    \gpr1.dout_i_reg[27]_5 ,
    \gpr1.dout_i_reg[24]_5 ,
    \gpr1.dout_i_reg[21]_5 ,
    \gpr1.dout_i_reg[18]_5 ,
    \gpr1.dout_i_reg[15]_5 ,
    \gpr1.dout_i_reg[12]_5 ,
    \gpr1.dout_i_reg[9]_5 ,
    \gpr1.dout_i_reg[6]_5 ,
    \gpr1.dout_i_reg[3]_5 ,
    \gpr1.dout_i_reg[0]_5 ,
    \gpr1.dout_i_reg[31]_6 ,
    \gpr1.dout_i_reg[30]_6 ,
    \gpr1.dout_i_reg[27]_6 ,
    \gpr1.dout_i_reg[24]_6 ,
    \gpr1.dout_i_reg[21]_6 ,
    \gpr1.dout_i_reg[18]_6 ,
    \gpr1.dout_i_reg[15]_6 ,
    \gpr1.dout_i_reg[12]_6 ,
    \gpr1.dout_i_reg[9]_6 ,
    \gpr1.dout_i_reg[6]_6 ,
    \gpr1.dout_i_reg[3]_6 ,
    \gpr1.dout_i_reg[0]_6 ,
    v1_reg,
    v1_reg_0,
    wr_clk,
    Q,
    wr_en,
    RD_PNTR_WR);
  output full;
  output [7:0]\gic0.gc0.count_d2_reg[7] ;
  output [7:0]\gic0.gc0.count_d1_reg[7] ;
  output \gpr1.dout_i_reg[31] ;
  output [8:0]\wr_pntr_gc_reg[8] ;
  output \gpr1.dout_i_reg[30] ;
  output \gpr1.dout_i_reg[31]_0 ;
  output \gpr1.dout_i_reg[30]_0 ;
  output \gpr1.dout_i_reg[31]_1 ;
  output \gpr1.dout_i_reg[30]_1 ;
  output \gpr1.dout_i_reg[31]_2 ;
  output \gpr1.dout_i_reg[30]_2 ;
  output \gpr1.dout_i_reg[27] ;
  output \gpr1.dout_i_reg[27]_0 ;
  output \gpr1.dout_i_reg[27]_1 ;
  output \gpr1.dout_i_reg[27]_2 ;
  output \gpr1.dout_i_reg[24] ;
  output \gpr1.dout_i_reg[24]_0 ;
  output \gpr1.dout_i_reg[24]_1 ;
  output \gpr1.dout_i_reg[24]_2 ;
  output \gpr1.dout_i_reg[21] ;
  output \gpr1.dout_i_reg[21]_0 ;
  output \gpr1.dout_i_reg[21]_1 ;
  output \gpr1.dout_i_reg[21]_2 ;
  output \gpr1.dout_i_reg[18] ;
  output \gpr1.dout_i_reg[18]_0 ;
  output \gpr1.dout_i_reg[18]_1 ;
  output \gpr1.dout_i_reg[18]_2 ;
  output \gpr1.dout_i_reg[15] ;
  output \gpr1.dout_i_reg[15]_0 ;
  output \gpr1.dout_i_reg[15]_1 ;
  output \gpr1.dout_i_reg[15]_2 ;
  output \gpr1.dout_i_reg[12] ;
  output \gpr1.dout_i_reg[12]_0 ;
  output \gpr1.dout_i_reg[12]_1 ;
  output \gpr1.dout_i_reg[12]_2 ;
  output \gpr1.dout_i_reg[9] ;
  output \gpr1.dout_i_reg[9]_0 ;
  output \gpr1.dout_i_reg[9]_1 ;
  output \gpr1.dout_i_reg[9]_2 ;
  output \gpr1.dout_i_reg[6] ;
  output \gpr1.dout_i_reg[6]_0 ;
  output \gpr1.dout_i_reg[6]_1 ;
  output \gpr1.dout_i_reg[6]_2 ;
  output \gpr1.dout_i_reg[3] ;
  output \gpr1.dout_i_reg[3]_0 ;
  output \gpr1.dout_i_reg[3]_1 ;
  output \gpr1.dout_i_reg[3]_2 ;
  output \gpr1.dout_i_reg[0] ;
  output \gpr1.dout_i_reg[0]_0 ;
  output \gpr1.dout_i_reg[0]_1 ;
  output \gpr1.dout_i_reg[0]_2 ;
  output \gpr1.dout_i_reg[31]_3 ;
  output \gpr1.dout_i_reg[30]_3 ;
  output \gpr1.dout_i_reg[27]_3 ;
  output \gpr1.dout_i_reg[24]_3 ;
  output \gpr1.dout_i_reg[21]_3 ;
  output \gpr1.dout_i_reg[18]_3 ;
  output \gpr1.dout_i_reg[15]_3 ;
  output \gpr1.dout_i_reg[12]_3 ;
  output \gpr1.dout_i_reg[9]_3 ;
  output \gpr1.dout_i_reg[6]_3 ;
  output \gpr1.dout_i_reg[3]_3 ;
  output \gpr1.dout_i_reg[0]_3 ;
  output \gpr1.dout_i_reg[31]_4 ;
  output \gpr1.dout_i_reg[30]_4 ;
  output \gpr1.dout_i_reg[27]_4 ;
  output \gpr1.dout_i_reg[24]_4 ;
  output \gpr1.dout_i_reg[21]_4 ;
  output \gpr1.dout_i_reg[18]_4 ;
  output \gpr1.dout_i_reg[15]_4 ;
  output \gpr1.dout_i_reg[12]_4 ;
  output \gpr1.dout_i_reg[9]_4 ;
  output \gpr1.dout_i_reg[6]_4 ;
  output \gpr1.dout_i_reg[3]_4 ;
  output \gpr1.dout_i_reg[0]_4 ;
  output \gpr1.dout_i_reg[31]_5 ;
  output \gpr1.dout_i_reg[30]_5 ;
  output \gpr1.dout_i_reg[27]_5 ;
  output \gpr1.dout_i_reg[24]_5 ;
  output \gpr1.dout_i_reg[21]_5 ;
  output \gpr1.dout_i_reg[18]_5 ;
  output \gpr1.dout_i_reg[15]_5 ;
  output \gpr1.dout_i_reg[12]_5 ;
  output \gpr1.dout_i_reg[9]_5 ;
  output \gpr1.dout_i_reg[6]_5 ;
  output \gpr1.dout_i_reg[3]_5 ;
  output \gpr1.dout_i_reg[0]_5 ;
  output \gpr1.dout_i_reg[31]_6 ;
  output \gpr1.dout_i_reg[30]_6 ;
  output \gpr1.dout_i_reg[27]_6 ;
  output \gpr1.dout_i_reg[24]_6 ;
  output \gpr1.dout_i_reg[21]_6 ;
  output \gpr1.dout_i_reg[18]_6 ;
  output \gpr1.dout_i_reg[15]_6 ;
  output \gpr1.dout_i_reg[12]_6 ;
  output \gpr1.dout_i_reg[9]_6 ;
  output \gpr1.dout_i_reg[6]_6 ;
  output \gpr1.dout_i_reg[3]_6 ;
  output \gpr1.dout_i_reg[0]_6 ;
  input [3:0]v1_reg;
  input [3:0]v1_reg_0;
  input wr_clk;
  input [1:0]Q;
  input wr_en;
  input [0:0]RD_PNTR_WR;

  wire [1:0]Q;
  wire [0:0]RD_PNTR_WR;
  wire comp1;
  wire comp2;
  wire full;
  wire [7:0]\gic0.gc0.count_d1_reg[7] ;
  wire [7:0]\gic0.gc0.count_d2_reg[7] ;
  wire \gpr1.dout_i_reg[0] ;
  wire \gpr1.dout_i_reg[0]_0 ;
  wire \gpr1.dout_i_reg[0]_1 ;
  wire \gpr1.dout_i_reg[0]_2 ;
  wire \gpr1.dout_i_reg[0]_3 ;
  wire \gpr1.dout_i_reg[0]_4 ;
  wire \gpr1.dout_i_reg[0]_5 ;
  wire \gpr1.dout_i_reg[0]_6 ;
  wire \gpr1.dout_i_reg[12] ;
  wire \gpr1.dout_i_reg[12]_0 ;
  wire \gpr1.dout_i_reg[12]_1 ;
  wire \gpr1.dout_i_reg[12]_2 ;
  wire \gpr1.dout_i_reg[12]_3 ;
  wire \gpr1.dout_i_reg[12]_4 ;
  wire \gpr1.dout_i_reg[12]_5 ;
  wire \gpr1.dout_i_reg[12]_6 ;
  wire \gpr1.dout_i_reg[15] ;
  wire \gpr1.dout_i_reg[15]_0 ;
  wire \gpr1.dout_i_reg[15]_1 ;
  wire \gpr1.dout_i_reg[15]_2 ;
  wire \gpr1.dout_i_reg[15]_3 ;
  wire \gpr1.dout_i_reg[15]_4 ;
  wire \gpr1.dout_i_reg[15]_5 ;
  wire \gpr1.dout_i_reg[15]_6 ;
  wire \gpr1.dout_i_reg[18] ;
  wire \gpr1.dout_i_reg[18]_0 ;
  wire \gpr1.dout_i_reg[18]_1 ;
  wire \gpr1.dout_i_reg[18]_2 ;
  wire \gpr1.dout_i_reg[18]_3 ;
  wire \gpr1.dout_i_reg[18]_4 ;
  wire \gpr1.dout_i_reg[18]_5 ;
  wire \gpr1.dout_i_reg[18]_6 ;
  wire \gpr1.dout_i_reg[21] ;
  wire \gpr1.dout_i_reg[21]_0 ;
  wire \gpr1.dout_i_reg[21]_1 ;
  wire \gpr1.dout_i_reg[21]_2 ;
  wire \gpr1.dout_i_reg[21]_3 ;
  wire \gpr1.dout_i_reg[21]_4 ;
  wire \gpr1.dout_i_reg[21]_5 ;
  wire \gpr1.dout_i_reg[21]_6 ;
  wire \gpr1.dout_i_reg[24] ;
  wire \gpr1.dout_i_reg[24]_0 ;
  wire \gpr1.dout_i_reg[24]_1 ;
  wire \gpr1.dout_i_reg[24]_2 ;
  wire \gpr1.dout_i_reg[24]_3 ;
  wire \gpr1.dout_i_reg[24]_4 ;
  wire \gpr1.dout_i_reg[24]_5 ;
  wire \gpr1.dout_i_reg[24]_6 ;
  wire \gpr1.dout_i_reg[27] ;
  wire \gpr1.dout_i_reg[27]_0 ;
  wire \gpr1.dout_i_reg[27]_1 ;
  wire \gpr1.dout_i_reg[27]_2 ;
  wire \gpr1.dout_i_reg[27]_3 ;
  wire \gpr1.dout_i_reg[27]_4 ;
  wire \gpr1.dout_i_reg[27]_5 ;
  wire \gpr1.dout_i_reg[27]_6 ;
  wire \gpr1.dout_i_reg[30] ;
  wire \gpr1.dout_i_reg[30]_0 ;
  wire \gpr1.dout_i_reg[30]_1 ;
  wire \gpr1.dout_i_reg[30]_2 ;
  wire \gpr1.dout_i_reg[30]_3 ;
  wire \gpr1.dout_i_reg[30]_4 ;
  wire \gpr1.dout_i_reg[30]_5 ;
  wire \gpr1.dout_i_reg[30]_6 ;
  wire \gpr1.dout_i_reg[31] ;
  wire \gpr1.dout_i_reg[31]_0 ;
  wire \gpr1.dout_i_reg[31]_1 ;
  wire \gpr1.dout_i_reg[31]_2 ;
  wire \gpr1.dout_i_reg[31]_3 ;
  wire \gpr1.dout_i_reg[31]_4 ;
  wire \gpr1.dout_i_reg[31]_5 ;
  wire \gpr1.dout_i_reg[31]_6 ;
  wire \gpr1.dout_i_reg[3] ;
  wire \gpr1.dout_i_reg[3]_0 ;
  wire \gpr1.dout_i_reg[3]_1 ;
  wire \gpr1.dout_i_reg[3]_2 ;
  wire \gpr1.dout_i_reg[3]_3 ;
  wire \gpr1.dout_i_reg[3]_4 ;
  wire \gpr1.dout_i_reg[3]_5 ;
  wire \gpr1.dout_i_reg[3]_6 ;
  wire \gpr1.dout_i_reg[6] ;
  wire \gpr1.dout_i_reg[6]_0 ;
  wire \gpr1.dout_i_reg[6]_1 ;
  wire \gpr1.dout_i_reg[6]_2 ;
  wire \gpr1.dout_i_reg[6]_3 ;
  wire \gpr1.dout_i_reg[6]_4 ;
  wire \gpr1.dout_i_reg[6]_5 ;
  wire \gpr1.dout_i_reg[6]_6 ;
  wire \gpr1.dout_i_reg[9] ;
  wire \gpr1.dout_i_reg[9]_0 ;
  wire \gpr1.dout_i_reg[9]_1 ;
  wire \gpr1.dout_i_reg[9]_2 ;
  wire \gpr1.dout_i_reg[9]_3 ;
  wire \gpr1.dout_i_reg[9]_4 ;
  wire \gpr1.dout_i_reg[9]_5 ;
  wire \gpr1.dout_i_reg[9]_6 ;
  wire p_0_out;
  wire p_3_out;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire wpntr_n_0;
  wire wpntr_n_1;
  wire wpntr_n_2;
  wire wr_clk;
  wire wr_en;
  wire [8:0]\wr_pntr_gc_reg[8] ;

  bitfile_fifo_in_wr_status_flags_as \gwas.wsts 
       (.E(p_3_out),
        .Q(Q[0]),
        .comp1(comp1),
        .comp2(comp2),
        .full(full),
        .\gic0.gc0.count_d1_reg[8] (wpntr_n_1),
        .\gic0.gc0.count_reg[8] (wpntr_n_2),
        .p_0_out(p_0_out),
        .ram_full_fb_i_reg_0(wpntr_n_0),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  bitfile_fifo_in_wr_bin_cntr wpntr
       (.E(p_3_out),
        .Q(\gic0.gc0.count_d1_reg[7] ),
        .RD_PNTR_WR(RD_PNTR_WR),
        .comp1(comp1),
        .comp2(comp2),
        .\gic0.gc0.count_d2_reg[7]_0 (\gic0.gc0.count_d2_reg[7] ),
        .\gpr1.dout_i_reg[0] (\gpr1.dout_i_reg[0] ),
        .\gpr1.dout_i_reg[0]_0 (\gpr1.dout_i_reg[0]_0 ),
        .\gpr1.dout_i_reg[0]_1 (\gpr1.dout_i_reg[0]_1 ),
        .\gpr1.dout_i_reg[0]_2 (\gpr1.dout_i_reg[0]_2 ),
        .\gpr1.dout_i_reg[0]_3 (\gpr1.dout_i_reg[0]_3 ),
        .\gpr1.dout_i_reg[0]_4 (\gpr1.dout_i_reg[0]_4 ),
        .\gpr1.dout_i_reg[0]_5 (\gpr1.dout_i_reg[0]_5 ),
        .\gpr1.dout_i_reg[0]_6 (\gpr1.dout_i_reg[0]_6 ),
        .\gpr1.dout_i_reg[12] (\gpr1.dout_i_reg[12] ),
        .\gpr1.dout_i_reg[12]_0 (\gpr1.dout_i_reg[12]_0 ),
        .\gpr1.dout_i_reg[12]_1 (\gpr1.dout_i_reg[12]_1 ),
        .\gpr1.dout_i_reg[12]_2 (\gpr1.dout_i_reg[12]_2 ),
        .\gpr1.dout_i_reg[12]_3 (\gpr1.dout_i_reg[12]_3 ),
        .\gpr1.dout_i_reg[12]_4 (\gpr1.dout_i_reg[12]_4 ),
        .\gpr1.dout_i_reg[12]_5 (\gpr1.dout_i_reg[12]_5 ),
        .\gpr1.dout_i_reg[12]_6 (\gpr1.dout_i_reg[12]_6 ),
        .\gpr1.dout_i_reg[15] (\gpr1.dout_i_reg[15] ),
        .\gpr1.dout_i_reg[15]_0 (\gpr1.dout_i_reg[15]_0 ),
        .\gpr1.dout_i_reg[15]_1 (\gpr1.dout_i_reg[15]_1 ),
        .\gpr1.dout_i_reg[15]_2 (\gpr1.dout_i_reg[15]_2 ),
        .\gpr1.dout_i_reg[15]_3 (\gpr1.dout_i_reg[15]_3 ),
        .\gpr1.dout_i_reg[15]_4 (\gpr1.dout_i_reg[15]_4 ),
        .\gpr1.dout_i_reg[15]_5 (\gpr1.dout_i_reg[15]_5 ),
        .\gpr1.dout_i_reg[15]_6 (\gpr1.dout_i_reg[15]_6 ),
        .\gpr1.dout_i_reg[18] (\gpr1.dout_i_reg[18] ),
        .\gpr1.dout_i_reg[18]_0 (\gpr1.dout_i_reg[18]_0 ),
        .\gpr1.dout_i_reg[18]_1 (\gpr1.dout_i_reg[18]_1 ),
        .\gpr1.dout_i_reg[18]_2 (\gpr1.dout_i_reg[18]_2 ),
        .\gpr1.dout_i_reg[18]_3 (\gpr1.dout_i_reg[18]_3 ),
        .\gpr1.dout_i_reg[18]_4 (\gpr1.dout_i_reg[18]_4 ),
        .\gpr1.dout_i_reg[18]_5 (\gpr1.dout_i_reg[18]_5 ),
        .\gpr1.dout_i_reg[18]_6 (\gpr1.dout_i_reg[18]_6 ),
        .\gpr1.dout_i_reg[21] (\gpr1.dout_i_reg[21] ),
        .\gpr1.dout_i_reg[21]_0 (\gpr1.dout_i_reg[21]_0 ),
        .\gpr1.dout_i_reg[21]_1 (\gpr1.dout_i_reg[21]_1 ),
        .\gpr1.dout_i_reg[21]_2 (\gpr1.dout_i_reg[21]_2 ),
        .\gpr1.dout_i_reg[21]_3 (\gpr1.dout_i_reg[21]_3 ),
        .\gpr1.dout_i_reg[21]_4 (\gpr1.dout_i_reg[21]_4 ),
        .\gpr1.dout_i_reg[21]_5 (\gpr1.dout_i_reg[21]_5 ),
        .\gpr1.dout_i_reg[21]_6 (\gpr1.dout_i_reg[21]_6 ),
        .\gpr1.dout_i_reg[24] (\gpr1.dout_i_reg[24] ),
        .\gpr1.dout_i_reg[24]_0 (\gpr1.dout_i_reg[24]_0 ),
        .\gpr1.dout_i_reg[24]_1 (\gpr1.dout_i_reg[24]_1 ),
        .\gpr1.dout_i_reg[24]_2 (\gpr1.dout_i_reg[24]_2 ),
        .\gpr1.dout_i_reg[24]_3 (\gpr1.dout_i_reg[24]_3 ),
        .\gpr1.dout_i_reg[24]_4 (\gpr1.dout_i_reg[24]_4 ),
        .\gpr1.dout_i_reg[24]_5 (\gpr1.dout_i_reg[24]_5 ),
        .\gpr1.dout_i_reg[24]_6 (\gpr1.dout_i_reg[24]_6 ),
        .\gpr1.dout_i_reg[27] (\gpr1.dout_i_reg[27] ),
        .\gpr1.dout_i_reg[27]_0 (\gpr1.dout_i_reg[27]_0 ),
        .\gpr1.dout_i_reg[27]_1 (\gpr1.dout_i_reg[27]_1 ),
        .\gpr1.dout_i_reg[27]_2 (\gpr1.dout_i_reg[27]_2 ),
        .\gpr1.dout_i_reg[27]_3 (\gpr1.dout_i_reg[27]_3 ),
        .\gpr1.dout_i_reg[27]_4 (\gpr1.dout_i_reg[27]_4 ),
        .\gpr1.dout_i_reg[27]_5 (\gpr1.dout_i_reg[27]_5 ),
        .\gpr1.dout_i_reg[27]_6 (\gpr1.dout_i_reg[27]_6 ),
        .\gpr1.dout_i_reg[30] (\gpr1.dout_i_reg[30] ),
        .\gpr1.dout_i_reg[30]_0 (\gpr1.dout_i_reg[30]_0 ),
        .\gpr1.dout_i_reg[30]_1 (\gpr1.dout_i_reg[30]_1 ),
        .\gpr1.dout_i_reg[30]_2 (\gpr1.dout_i_reg[30]_2 ),
        .\gpr1.dout_i_reg[30]_3 (\gpr1.dout_i_reg[30]_3 ),
        .\gpr1.dout_i_reg[30]_4 (\gpr1.dout_i_reg[30]_4 ),
        .\gpr1.dout_i_reg[30]_5 (\gpr1.dout_i_reg[30]_5 ),
        .\gpr1.dout_i_reg[30]_6 (\gpr1.dout_i_reg[30]_6 ),
        .\gpr1.dout_i_reg[31] (\gpr1.dout_i_reg[31] ),
        .\gpr1.dout_i_reg[31]_0 (\gpr1.dout_i_reg[31]_0 ),
        .\gpr1.dout_i_reg[31]_1 (\gpr1.dout_i_reg[31]_1 ),
        .\gpr1.dout_i_reg[31]_2 (\gpr1.dout_i_reg[31]_2 ),
        .\gpr1.dout_i_reg[31]_3 (\gpr1.dout_i_reg[31]_3 ),
        .\gpr1.dout_i_reg[31]_4 (\gpr1.dout_i_reg[31]_4 ),
        .\gpr1.dout_i_reg[31]_5 (\gpr1.dout_i_reg[31]_5 ),
        .\gpr1.dout_i_reg[31]_6 (\gpr1.dout_i_reg[31]_6 ),
        .\gpr1.dout_i_reg[3] (\gpr1.dout_i_reg[3] ),
        .\gpr1.dout_i_reg[3]_0 (\gpr1.dout_i_reg[3]_0 ),
        .\gpr1.dout_i_reg[3]_1 (\gpr1.dout_i_reg[3]_1 ),
        .\gpr1.dout_i_reg[3]_2 (\gpr1.dout_i_reg[3]_2 ),
        .\gpr1.dout_i_reg[3]_3 (\gpr1.dout_i_reg[3]_3 ),
        .\gpr1.dout_i_reg[3]_4 (\gpr1.dout_i_reg[3]_4 ),
        .\gpr1.dout_i_reg[3]_5 (\gpr1.dout_i_reg[3]_5 ),
        .\gpr1.dout_i_reg[3]_6 (\gpr1.dout_i_reg[3]_6 ),
        .\gpr1.dout_i_reg[6] (\gpr1.dout_i_reg[6] ),
        .\gpr1.dout_i_reg[6]_0 (\gpr1.dout_i_reg[6]_0 ),
        .\gpr1.dout_i_reg[6]_1 (\gpr1.dout_i_reg[6]_1 ),
        .\gpr1.dout_i_reg[6]_2 (\gpr1.dout_i_reg[6]_2 ),
        .\gpr1.dout_i_reg[6]_3 (\gpr1.dout_i_reg[6]_3 ),
        .\gpr1.dout_i_reg[6]_4 (\gpr1.dout_i_reg[6]_4 ),
        .\gpr1.dout_i_reg[6]_5 (\gpr1.dout_i_reg[6]_5 ),
        .\gpr1.dout_i_reg[6]_6 (\gpr1.dout_i_reg[6]_6 ),
        .\gpr1.dout_i_reg[9] (\gpr1.dout_i_reg[9] ),
        .\gpr1.dout_i_reg[9]_0 (\gpr1.dout_i_reg[9]_0 ),
        .\gpr1.dout_i_reg[9]_1 (\gpr1.dout_i_reg[9]_1 ),
        .\gpr1.dout_i_reg[9]_2 (\gpr1.dout_i_reg[9]_2 ),
        .\gpr1.dout_i_reg[9]_3 (\gpr1.dout_i_reg[9]_3 ),
        .\gpr1.dout_i_reg[9]_4 (\gpr1.dout_i_reg[9]_4 ),
        .\gpr1.dout_i_reg[9]_5 (\gpr1.dout_i_reg[9]_5 ),
        .\gpr1.dout_i_reg[9]_6 (\gpr1.dout_i_reg[9]_6 ),
        .\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] (Q[1]),
        .p_0_out(p_0_out),
        .ram_full_i_reg(wpntr_n_0),
        .ram_full_i_reg_0(wpntr_n_1),
        .ram_full_i_reg_1(wpntr_n_2),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .\wr_pntr_gc_reg[8] (\wr_pntr_gc_reg[8] ));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_as" *) 
module bitfile_fifo_in_wr_status_flags_as
   (comp1,
    comp2,
    full,
    p_0_out,
    E,
    v1_reg,
    \gic0.gc0.count_d1_reg[8] ,
    v1_reg_0,
    \gic0.gc0.count_reg[8] ,
    ram_full_fb_i_reg_0,
    wr_clk,
    Q,
    wr_en);
  output comp1;
  output comp2;
  output full;
  output p_0_out;
  output [0:0]E;
  input [3:0]v1_reg;
  input \gic0.gc0.count_d1_reg[8] ;
  input [3:0]v1_reg_0;
  input \gic0.gc0.count_reg[8] ;
  input ram_full_fb_i_reg_0;
  input wr_clk;
  input [0:0]Q;
  input wr_en;

  wire [0:0]E;
  wire [0:0]Q;
  wire comp1;
  wire comp2;
  wire full;
  wire \gic0.gc0.count_d1_reg[8] ;
  wire \gic0.gc0.count_reg[8] ;
  wire p_0_out;
  wire ram_full_fb_i_reg_0;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire wr_clk;
  wire wr_en;

  bitfile_fifo_in_compare c1
       (.comp1(comp1),
        .\gic0.gc0.count_d1_reg[8] (\gic0.gc0.count_d1_reg[8] ),
        .v1_reg(v1_reg));
  bitfile_fifo_in_compare_0 c2
       (.comp2(comp2),
        .\gic0.gc0.count_reg[8] (\gic0.gc0.count_reg[8] ),
        .v1_reg_0(v1_reg_0));
  LUT2 #(
    .INIT(4'h2)) 
    \gic0.gc0.count_d1[8]_i_1 
       (.I0(wr_en),
        .I1(p_0_out),
        .O(E));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(Q),
        .D(ram_full_fb_i_reg_0),
        .Q(p_0_out));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(wr_clk),
        .CE(1'b1),
        .CLR(Q),
        .D(ram_full_fb_i_reg_0),
        .Q(full));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
