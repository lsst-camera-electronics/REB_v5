// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Jan 28 15:52:23 2016
// Host        : lsst-daq01 running 64-bit Red Hat Enterprise Linux Server release 6.7 (Santiago)
// Command     : write_verilog -force -mode funcsim
//               /u1/srusso/Xilinx_prj/LSST_prj/DREB_prj/REB_v3_vivado_15_2/REB_v3_vivado_15_2/REB_v3_vivado_15_2.srcs/sources_1/ip/dual_port_ram_ip/dual_port_ram_ip_funcsim.v
// Design      : dual_port_ram_ip
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tffg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dual_port_ram_ip,dist_mem_gen_v8_0,{}" *) (* core_generation_info = "dual_port_ram_ip,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=8,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_FAMILY=kintex7,C_ADDR_WIDTH=10,C_DEFAULT_DATA=0,C_DEPTH=1024,C_HAS_CLK=1,C_HAS_D=1,C_HAS_DPO=1,C_HAS_DPRA=1,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=1,C_MEM_INIT_FILE=no_coe_file_loaded,C_ELABORATION_DIR=./,C_MEM_TYPE=2,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=0,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=32,C_PARSER_TYPE=1}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "dist_mem_gen_v8_0,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module dual_port_ram_ip
   (a,
    d,
    dpra,
    clk,
    we,
    spo,
    dpo);
  input [9:0]a;
  input [31:0]d;
  input [9:0]dpra;
  input clk;
  input we;
  output [31:0]spo;
  output [31:0]dpo;

  wire [9:0]a;
  wire clk;
  wire [31:0]d;
  wire [31:0]dpo;
  wire [9:0]dpra;
  wire [31:0]spo;
  wire we;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* DONT_TOUCH *) 
  (* c_addr_width = "10" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1024" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_dpo = "1" *) 
  (* c_has_dpra = "1" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qdpo = "0" *) 
  (* c_has_qdpo_ce = "0" *) 
  (* c_has_qdpo_clk = "0" *) 
  (* c_has_qdpo_rst = "0" *) 
  (* c_has_qdpo_srst = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qce_joined = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_reg_dpra_input = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  dual_port_ram_ip_dist_mem_gen_v8_0 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(dpo),
        .dpra(dpra),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(we));
endmodule

(* C_ADDR_WIDTH = "10" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "1024" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "kintex7" *) (* C_HAS_CLK = "1" *) 
(* C_HAS_D = "1" *) (* C_HAS_DPO = "1" *) (* C_HAS_DPRA = "1" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "1" *) 
(* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_MEM_TYPE = "2" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "0" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "32" *) (* ORIG_REF_NAME = "dist_mem_gen_v8_0" *) 
module dual_port_ram_ip_dist_mem_gen_v8_0
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [9:0]a;
  input [31:0]d;
  input [9:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [31:0]spo;
  output [31:0]dpo;
  output [31:0]qspo;
  output [31:0]qdpo;

  wire \<const0> ;
  wire [9:0]a;
  wire clk;
  wire [31:0]d;
  wire [31:0]dpo;
  wire [9:0]dpra;
  wire [31:0]spo;
  wire we;

  assign qdpo[31] = \<const0> ;
  assign qdpo[30] = \<const0> ;
  assign qdpo[29] = \<const0> ;
  assign qdpo[28] = \<const0> ;
  assign qdpo[27] = \<const0> ;
  assign qdpo[26] = \<const0> ;
  assign qdpo[25] = \<const0> ;
  assign qdpo[24] = \<const0> ;
  assign qdpo[23] = \<const0> ;
  assign qdpo[22] = \<const0> ;
  assign qdpo[21] = \<const0> ;
  assign qdpo[20] = \<const0> ;
  assign qdpo[19] = \<const0> ;
  assign qdpo[18] = \<const0> ;
  assign qdpo[17] = \<const0> ;
  assign qdpo[16] = \<const0> ;
  assign qdpo[15] = \<const0> ;
  assign qdpo[14] = \<const0> ;
  assign qdpo[13] = \<const0> ;
  assign qdpo[12] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[31] = \<const0> ;
  assign qspo[30] = \<const0> ;
  assign qspo[29] = \<const0> ;
  assign qspo[28] = \<const0> ;
  assign qspo[27] = \<const0> ;
  assign qspo[26] = \<const0> ;
  assign qspo[25] = \<const0> ;
  assign qspo[24] = \<const0> ;
  assign qspo[23] = \<const0> ;
  assign qspo[22] = \<const0> ;
  assign qspo[21] = \<const0> ;
  assign qspo[20] = \<const0> ;
  assign qspo[19] = \<const0> ;
  assign qspo[18] = \<const0> ;
  assign qspo[17] = \<const0> ;
  assign qspo[16] = \<const0> ;
  assign qspo[15] = \<const0> ;
  assign qspo[14] = \<const0> ;
  assign qspo[13] = \<const0> ;
  assign qspo[12] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  dual_port_ram_ip_dist_mem_gen_v8_0_synth \synth_options.dist_mem_inst 
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(dpo),
        .dpra(dpra),
        .spo(spo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_synth" *) 
module dual_port_ram_ip_dist_mem_gen_v8_0_synth
   (spo,
    dpo,
    clk,
    d,
    a,
    dpra,
    we);
  output [31:0]spo;
  output [31:0]dpo;
  input clk;
  input [31:0]d;
  input [9:0]a;
  input [9:0]dpra;
  input we;

  wire [9:0]a;
  wire clk;
  wire [31:0]d;
  wire [31:0]dpo;
  wire [9:0]dpra;
  wire [31:0]spo;
  wire we;

  dual_port_ram_ip_dpram \gen_dp_ram.dpram_inst 
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(dpo),
        .dpra(dpra),
        .spo(spo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "dpram" *) 
module dual_port_ram_ip_dpram
   (spo,
    dpo,
    clk,
    d,
    a,
    dpra,
    we);
  output [31:0]spo;
  output [31:0]dpo;
  input clk;
  input [31:0]d;
  input [9:0]a;
  input [9:0]dpra;
  input we;

  wire [9:0]a;
  wire clk;
  wire [31:0]d;
  wire [31:0]dpo;
  wire \dpo[0]_INST_0_i_1_n_0 ;
  wire \dpo[0]_INST_0_i_2_n_0 ;
  wire \dpo[10]_INST_0_i_1_n_0 ;
  wire \dpo[10]_INST_0_i_2_n_0 ;
  wire \dpo[11]_INST_0_i_1_n_0 ;
  wire \dpo[11]_INST_0_i_2_n_0 ;
  wire \dpo[12]_INST_0_i_1_n_0 ;
  wire \dpo[12]_INST_0_i_2_n_0 ;
  wire \dpo[13]_INST_0_i_1_n_0 ;
  wire \dpo[13]_INST_0_i_2_n_0 ;
  wire \dpo[14]_INST_0_i_1_n_0 ;
  wire \dpo[14]_INST_0_i_2_n_0 ;
  wire \dpo[15]_INST_0_i_1_n_0 ;
  wire \dpo[15]_INST_0_i_2_n_0 ;
  wire \dpo[16]_INST_0_i_1_n_0 ;
  wire \dpo[16]_INST_0_i_2_n_0 ;
  wire \dpo[17]_INST_0_i_1_n_0 ;
  wire \dpo[17]_INST_0_i_2_n_0 ;
  wire \dpo[18]_INST_0_i_1_n_0 ;
  wire \dpo[18]_INST_0_i_2_n_0 ;
  wire \dpo[19]_INST_0_i_1_n_0 ;
  wire \dpo[19]_INST_0_i_2_n_0 ;
  wire \dpo[1]_INST_0_i_1_n_0 ;
  wire \dpo[1]_INST_0_i_2_n_0 ;
  wire \dpo[20]_INST_0_i_1_n_0 ;
  wire \dpo[20]_INST_0_i_2_n_0 ;
  wire \dpo[21]_INST_0_i_1_n_0 ;
  wire \dpo[21]_INST_0_i_2_n_0 ;
  wire \dpo[22]_INST_0_i_1_n_0 ;
  wire \dpo[22]_INST_0_i_2_n_0 ;
  wire \dpo[23]_INST_0_i_1_n_0 ;
  wire \dpo[23]_INST_0_i_2_n_0 ;
  wire \dpo[24]_INST_0_i_1_n_0 ;
  wire \dpo[24]_INST_0_i_2_n_0 ;
  wire \dpo[25]_INST_0_i_1_n_0 ;
  wire \dpo[25]_INST_0_i_2_n_0 ;
  wire \dpo[26]_INST_0_i_1_n_0 ;
  wire \dpo[26]_INST_0_i_2_n_0 ;
  wire \dpo[27]_INST_0_i_1_n_0 ;
  wire \dpo[27]_INST_0_i_2_n_0 ;
  wire \dpo[28]_INST_0_i_1_n_0 ;
  wire \dpo[28]_INST_0_i_2_n_0 ;
  wire \dpo[29]_INST_0_i_1_n_0 ;
  wire \dpo[29]_INST_0_i_2_n_0 ;
  wire \dpo[2]_INST_0_i_1_n_0 ;
  wire \dpo[2]_INST_0_i_2_n_0 ;
  wire \dpo[30]_INST_0_i_1_n_0 ;
  wire \dpo[30]_INST_0_i_2_n_0 ;
  wire \dpo[31]_INST_0_i_1_n_0 ;
  wire \dpo[31]_INST_0_i_2_n_0 ;
  wire \dpo[3]_INST_0_i_1_n_0 ;
  wire \dpo[3]_INST_0_i_2_n_0 ;
  wire \dpo[4]_INST_0_i_1_n_0 ;
  wire \dpo[4]_INST_0_i_2_n_0 ;
  wire \dpo[5]_INST_0_i_1_n_0 ;
  wire \dpo[5]_INST_0_i_2_n_0 ;
  wire \dpo[6]_INST_0_i_1_n_0 ;
  wire \dpo[6]_INST_0_i_2_n_0 ;
  wire \dpo[7]_INST_0_i_1_n_0 ;
  wire \dpo[7]_INST_0_i_2_n_0 ;
  wire \dpo[8]_INST_0_i_1_n_0 ;
  wire \dpo[8]_INST_0_i_2_n_0 ;
  wire \dpo[9]_INST_0_i_1_n_0 ;
  wire \dpo[9]_INST_0_i_2_n_0 ;
  wire [9:0]dpra;
  (* RTL_KEEP = "true" *) wire [31:0]qdpo_int;
  (* RTL_KEEP = "true" *) wire [31:0]qspo_int;
  wire ram_reg_0_127_0_0_i_1_n_0;
  wire ram_reg_0_127_0_0_n_0;
  wire ram_reg_0_127_0_0_n_1;
  wire ram_reg_0_127_10_10_n_0;
  wire ram_reg_0_127_10_10_n_1;
  wire ram_reg_0_127_11_11_n_0;
  wire ram_reg_0_127_11_11_n_1;
  wire ram_reg_0_127_12_12_n_0;
  wire ram_reg_0_127_12_12_n_1;
  wire ram_reg_0_127_13_13_n_0;
  wire ram_reg_0_127_13_13_n_1;
  wire ram_reg_0_127_14_14_n_0;
  wire ram_reg_0_127_14_14_n_1;
  wire ram_reg_0_127_15_15_n_0;
  wire ram_reg_0_127_15_15_n_1;
  wire ram_reg_0_127_16_16_n_0;
  wire ram_reg_0_127_16_16_n_1;
  wire ram_reg_0_127_17_17_n_0;
  wire ram_reg_0_127_17_17_n_1;
  wire ram_reg_0_127_18_18_n_0;
  wire ram_reg_0_127_18_18_n_1;
  wire ram_reg_0_127_19_19_n_0;
  wire ram_reg_0_127_19_19_n_1;
  wire ram_reg_0_127_1_1_n_0;
  wire ram_reg_0_127_1_1_n_1;
  wire ram_reg_0_127_20_20_n_0;
  wire ram_reg_0_127_20_20_n_1;
  wire ram_reg_0_127_21_21_n_0;
  wire ram_reg_0_127_21_21_n_1;
  wire ram_reg_0_127_22_22_n_0;
  wire ram_reg_0_127_22_22_n_1;
  wire ram_reg_0_127_23_23_n_0;
  wire ram_reg_0_127_23_23_n_1;
  wire ram_reg_0_127_24_24_n_0;
  wire ram_reg_0_127_24_24_n_1;
  wire ram_reg_0_127_25_25_n_0;
  wire ram_reg_0_127_25_25_n_1;
  wire ram_reg_0_127_26_26_n_0;
  wire ram_reg_0_127_26_26_n_1;
  wire ram_reg_0_127_27_27_n_0;
  wire ram_reg_0_127_27_27_n_1;
  wire ram_reg_0_127_28_28_n_0;
  wire ram_reg_0_127_28_28_n_1;
  wire ram_reg_0_127_29_29_n_0;
  wire ram_reg_0_127_29_29_n_1;
  wire ram_reg_0_127_2_2_n_0;
  wire ram_reg_0_127_2_2_n_1;
  wire ram_reg_0_127_30_30_n_0;
  wire ram_reg_0_127_30_30_n_1;
  wire ram_reg_0_127_31_31_n_0;
  wire ram_reg_0_127_31_31_n_1;
  wire ram_reg_0_127_3_3_n_0;
  wire ram_reg_0_127_3_3_n_1;
  wire ram_reg_0_127_4_4_n_0;
  wire ram_reg_0_127_4_4_n_1;
  wire ram_reg_0_127_5_5_n_0;
  wire ram_reg_0_127_5_5_n_1;
  wire ram_reg_0_127_6_6_n_0;
  wire ram_reg_0_127_6_6_n_1;
  wire ram_reg_0_127_7_7_n_0;
  wire ram_reg_0_127_7_7_n_1;
  wire ram_reg_0_127_8_8_n_0;
  wire ram_reg_0_127_8_8_n_1;
  wire ram_reg_0_127_9_9_n_0;
  wire ram_reg_0_127_9_9_n_1;
  wire ram_reg_128_255_0_0_i_1_n_0;
  wire ram_reg_128_255_0_0_n_0;
  wire ram_reg_128_255_0_0_n_1;
  wire ram_reg_128_255_10_10_n_0;
  wire ram_reg_128_255_10_10_n_1;
  wire ram_reg_128_255_11_11_n_0;
  wire ram_reg_128_255_11_11_n_1;
  wire ram_reg_128_255_12_12_n_0;
  wire ram_reg_128_255_12_12_n_1;
  wire ram_reg_128_255_13_13_n_0;
  wire ram_reg_128_255_13_13_n_1;
  wire ram_reg_128_255_14_14_n_0;
  wire ram_reg_128_255_14_14_n_1;
  wire ram_reg_128_255_15_15_n_0;
  wire ram_reg_128_255_15_15_n_1;
  wire ram_reg_128_255_16_16_n_0;
  wire ram_reg_128_255_16_16_n_1;
  wire ram_reg_128_255_17_17_n_0;
  wire ram_reg_128_255_17_17_n_1;
  wire ram_reg_128_255_18_18_n_0;
  wire ram_reg_128_255_18_18_n_1;
  wire ram_reg_128_255_19_19_n_0;
  wire ram_reg_128_255_19_19_n_1;
  wire ram_reg_128_255_1_1_n_0;
  wire ram_reg_128_255_1_1_n_1;
  wire ram_reg_128_255_20_20_n_0;
  wire ram_reg_128_255_20_20_n_1;
  wire ram_reg_128_255_21_21_n_0;
  wire ram_reg_128_255_21_21_n_1;
  wire ram_reg_128_255_22_22_n_0;
  wire ram_reg_128_255_22_22_n_1;
  wire ram_reg_128_255_23_23_n_0;
  wire ram_reg_128_255_23_23_n_1;
  wire ram_reg_128_255_24_24_n_0;
  wire ram_reg_128_255_24_24_n_1;
  wire ram_reg_128_255_25_25_n_0;
  wire ram_reg_128_255_25_25_n_1;
  wire ram_reg_128_255_26_26_n_0;
  wire ram_reg_128_255_26_26_n_1;
  wire ram_reg_128_255_27_27_n_0;
  wire ram_reg_128_255_27_27_n_1;
  wire ram_reg_128_255_28_28_n_0;
  wire ram_reg_128_255_28_28_n_1;
  wire ram_reg_128_255_29_29_n_0;
  wire ram_reg_128_255_29_29_n_1;
  wire ram_reg_128_255_2_2_n_0;
  wire ram_reg_128_255_2_2_n_1;
  wire ram_reg_128_255_30_30_n_0;
  wire ram_reg_128_255_30_30_n_1;
  wire ram_reg_128_255_31_31_n_0;
  wire ram_reg_128_255_31_31_n_1;
  wire ram_reg_128_255_3_3_n_0;
  wire ram_reg_128_255_3_3_n_1;
  wire ram_reg_128_255_4_4_n_0;
  wire ram_reg_128_255_4_4_n_1;
  wire ram_reg_128_255_5_5_n_0;
  wire ram_reg_128_255_5_5_n_1;
  wire ram_reg_128_255_6_6_n_0;
  wire ram_reg_128_255_6_6_n_1;
  wire ram_reg_128_255_7_7_n_0;
  wire ram_reg_128_255_7_7_n_1;
  wire ram_reg_128_255_8_8_n_0;
  wire ram_reg_128_255_8_8_n_1;
  wire ram_reg_128_255_9_9_n_0;
  wire ram_reg_128_255_9_9_n_1;
  wire ram_reg_256_383_0_0_i_1_n_0;
  wire ram_reg_256_383_0_0_n_0;
  wire ram_reg_256_383_0_0_n_1;
  wire ram_reg_256_383_10_10_n_0;
  wire ram_reg_256_383_10_10_n_1;
  wire ram_reg_256_383_11_11_n_0;
  wire ram_reg_256_383_11_11_n_1;
  wire ram_reg_256_383_12_12_n_0;
  wire ram_reg_256_383_12_12_n_1;
  wire ram_reg_256_383_13_13_n_0;
  wire ram_reg_256_383_13_13_n_1;
  wire ram_reg_256_383_14_14_n_0;
  wire ram_reg_256_383_14_14_n_1;
  wire ram_reg_256_383_15_15_n_0;
  wire ram_reg_256_383_15_15_n_1;
  wire ram_reg_256_383_16_16_n_0;
  wire ram_reg_256_383_16_16_n_1;
  wire ram_reg_256_383_17_17_n_0;
  wire ram_reg_256_383_17_17_n_1;
  wire ram_reg_256_383_18_18_n_0;
  wire ram_reg_256_383_18_18_n_1;
  wire ram_reg_256_383_19_19_n_0;
  wire ram_reg_256_383_19_19_n_1;
  wire ram_reg_256_383_1_1_n_0;
  wire ram_reg_256_383_1_1_n_1;
  wire ram_reg_256_383_20_20_n_0;
  wire ram_reg_256_383_20_20_n_1;
  wire ram_reg_256_383_21_21_n_0;
  wire ram_reg_256_383_21_21_n_1;
  wire ram_reg_256_383_22_22_n_0;
  wire ram_reg_256_383_22_22_n_1;
  wire ram_reg_256_383_23_23_n_0;
  wire ram_reg_256_383_23_23_n_1;
  wire ram_reg_256_383_24_24_n_0;
  wire ram_reg_256_383_24_24_n_1;
  wire ram_reg_256_383_25_25_n_0;
  wire ram_reg_256_383_25_25_n_1;
  wire ram_reg_256_383_26_26_n_0;
  wire ram_reg_256_383_26_26_n_1;
  wire ram_reg_256_383_27_27_n_0;
  wire ram_reg_256_383_27_27_n_1;
  wire ram_reg_256_383_28_28_n_0;
  wire ram_reg_256_383_28_28_n_1;
  wire ram_reg_256_383_29_29_n_0;
  wire ram_reg_256_383_29_29_n_1;
  wire ram_reg_256_383_2_2_n_0;
  wire ram_reg_256_383_2_2_n_1;
  wire ram_reg_256_383_30_30_n_0;
  wire ram_reg_256_383_30_30_n_1;
  wire ram_reg_256_383_31_31_n_0;
  wire ram_reg_256_383_31_31_n_1;
  wire ram_reg_256_383_3_3_n_0;
  wire ram_reg_256_383_3_3_n_1;
  wire ram_reg_256_383_4_4_n_0;
  wire ram_reg_256_383_4_4_n_1;
  wire ram_reg_256_383_5_5_n_0;
  wire ram_reg_256_383_5_5_n_1;
  wire ram_reg_256_383_6_6_n_0;
  wire ram_reg_256_383_6_6_n_1;
  wire ram_reg_256_383_7_7_n_0;
  wire ram_reg_256_383_7_7_n_1;
  wire ram_reg_256_383_8_8_n_0;
  wire ram_reg_256_383_8_8_n_1;
  wire ram_reg_256_383_9_9_n_0;
  wire ram_reg_256_383_9_9_n_1;
  wire ram_reg_384_511_0_0_i_1_n_0;
  wire ram_reg_384_511_0_0_n_0;
  wire ram_reg_384_511_0_0_n_1;
  wire ram_reg_384_511_10_10_n_0;
  wire ram_reg_384_511_10_10_n_1;
  wire ram_reg_384_511_11_11_n_0;
  wire ram_reg_384_511_11_11_n_1;
  wire ram_reg_384_511_12_12_n_0;
  wire ram_reg_384_511_12_12_n_1;
  wire ram_reg_384_511_13_13_n_0;
  wire ram_reg_384_511_13_13_n_1;
  wire ram_reg_384_511_14_14_n_0;
  wire ram_reg_384_511_14_14_n_1;
  wire ram_reg_384_511_15_15_n_0;
  wire ram_reg_384_511_15_15_n_1;
  wire ram_reg_384_511_16_16_n_0;
  wire ram_reg_384_511_16_16_n_1;
  wire ram_reg_384_511_17_17_n_0;
  wire ram_reg_384_511_17_17_n_1;
  wire ram_reg_384_511_18_18_n_0;
  wire ram_reg_384_511_18_18_n_1;
  wire ram_reg_384_511_19_19_n_0;
  wire ram_reg_384_511_19_19_n_1;
  wire ram_reg_384_511_1_1_n_0;
  wire ram_reg_384_511_1_1_n_1;
  wire ram_reg_384_511_20_20_n_0;
  wire ram_reg_384_511_20_20_n_1;
  wire ram_reg_384_511_21_21_n_0;
  wire ram_reg_384_511_21_21_n_1;
  wire ram_reg_384_511_22_22_n_0;
  wire ram_reg_384_511_22_22_n_1;
  wire ram_reg_384_511_23_23_n_0;
  wire ram_reg_384_511_23_23_n_1;
  wire ram_reg_384_511_24_24_n_0;
  wire ram_reg_384_511_24_24_n_1;
  wire ram_reg_384_511_25_25_n_0;
  wire ram_reg_384_511_25_25_n_1;
  wire ram_reg_384_511_26_26_n_0;
  wire ram_reg_384_511_26_26_n_1;
  wire ram_reg_384_511_27_27_n_0;
  wire ram_reg_384_511_27_27_n_1;
  wire ram_reg_384_511_28_28_n_0;
  wire ram_reg_384_511_28_28_n_1;
  wire ram_reg_384_511_29_29_n_0;
  wire ram_reg_384_511_29_29_n_1;
  wire ram_reg_384_511_2_2_n_0;
  wire ram_reg_384_511_2_2_n_1;
  wire ram_reg_384_511_30_30_n_0;
  wire ram_reg_384_511_30_30_n_1;
  wire ram_reg_384_511_31_31_n_0;
  wire ram_reg_384_511_31_31_n_1;
  wire ram_reg_384_511_3_3_n_0;
  wire ram_reg_384_511_3_3_n_1;
  wire ram_reg_384_511_4_4_n_0;
  wire ram_reg_384_511_4_4_n_1;
  wire ram_reg_384_511_5_5_n_0;
  wire ram_reg_384_511_5_5_n_1;
  wire ram_reg_384_511_6_6_n_0;
  wire ram_reg_384_511_6_6_n_1;
  wire ram_reg_384_511_7_7_n_0;
  wire ram_reg_384_511_7_7_n_1;
  wire ram_reg_384_511_8_8_n_0;
  wire ram_reg_384_511_8_8_n_1;
  wire ram_reg_384_511_9_9_n_0;
  wire ram_reg_384_511_9_9_n_1;
  wire ram_reg_512_639_0_0_i_1_n_0;
  wire ram_reg_512_639_0_0_n_0;
  wire ram_reg_512_639_0_0_n_1;
  wire ram_reg_512_639_10_10_n_0;
  wire ram_reg_512_639_10_10_n_1;
  wire ram_reg_512_639_11_11_n_0;
  wire ram_reg_512_639_11_11_n_1;
  wire ram_reg_512_639_12_12_n_0;
  wire ram_reg_512_639_12_12_n_1;
  wire ram_reg_512_639_13_13_n_0;
  wire ram_reg_512_639_13_13_n_1;
  wire ram_reg_512_639_14_14_n_0;
  wire ram_reg_512_639_14_14_n_1;
  wire ram_reg_512_639_15_15_n_0;
  wire ram_reg_512_639_15_15_n_1;
  wire ram_reg_512_639_16_16_n_0;
  wire ram_reg_512_639_16_16_n_1;
  wire ram_reg_512_639_17_17_n_0;
  wire ram_reg_512_639_17_17_n_1;
  wire ram_reg_512_639_18_18_n_0;
  wire ram_reg_512_639_18_18_n_1;
  wire ram_reg_512_639_19_19_n_0;
  wire ram_reg_512_639_19_19_n_1;
  wire ram_reg_512_639_1_1_n_0;
  wire ram_reg_512_639_1_1_n_1;
  wire ram_reg_512_639_20_20_n_0;
  wire ram_reg_512_639_20_20_n_1;
  wire ram_reg_512_639_21_21_n_0;
  wire ram_reg_512_639_21_21_n_1;
  wire ram_reg_512_639_22_22_n_0;
  wire ram_reg_512_639_22_22_n_1;
  wire ram_reg_512_639_23_23_n_0;
  wire ram_reg_512_639_23_23_n_1;
  wire ram_reg_512_639_24_24_n_0;
  wire ram_reg_512_639_24_24_n_1;
  wire ram_reg_512_639_25_25_n_0;
  wire ram_reg_512_639_25_25_n_1;
  wire ram_reg_512_639_26_26_n_0;
  wire ram_reg_512_639_26_26_n_1;
  wire ram_reg_512_639_27_27_n_0;
  wire ram_reg_512_639_27_27_n_1;
  wire ram_reg_512_639_28_28_n_0;
  wire ram_reg_512_639_28_28_n_1;
  wire ram_reg_512_639_29_29_n_0;
  wire ram_reg_512_639_29_29_n_1;
  wire ram_reg_512_639_2_2_n_0;
  wire ram_reg_512_639_2_2_n_1;
  wire ram_reg_512_639_30_30_n_0;
  wire ram_reg_512_639_30_30_n_1;
  wire ram_reg_512_639_31_31_n_0;
  wire ram_reg_512_639_31_31_n_1;
  wire ram_reg_512_639_3_3_n_0;
  wire ram_reg_512_639_3_3_n_1;
  wire ram_reg_512_639_4_4_n_0;
  wire ram_reg_512_639_4_4_n_1;
  wire ram_reg_512_639_5_5_n_0;
  wire ram_reg_512_639_5_5_n_1;
  wire ram_reg_512_639_6_6_n_0;
  wire ram_reg_512_639_6_6_n_1;
  wire ram_reg_512_639_7_7_n_0;
  wire ram_reg_512_639_7_7_n_1;
  wire ram_reg_512_639_8_8_n_0;
  wire ram_reg_512_639_8_8_n_1;
  wire ram_reg_512_639_9_9_n_0;
  wire ram_reg_512_639_9_9_n_1;
  wire ram_reg_640_767_0_0_i_1_n_0;
  wire ram_reg_640_767_0_0_n_0;
  wire ram_reg_640_767_0_0_n_1;
  wire ram_reg_640_767_10_10_n_0;
  wire ram_reg_640_767_10_10_n_1;
  wire ram_reg_640_767_11_11_n_0;
  wire ram_reg_640_767_11_11_n_1;
  wire ram_reg_640_767_12_12_n_0;
  wire ram_reg_640_767_12_12_n_1;
  wire ram_reg_640_767_13_13_n_0;
  wire ram_reg_640_767_13_13_n_1;
  wire ram_reg_640_767_14_14_n_0;
  wire ram_reg_640_767_14_14_n_1;
  wire ram_reg_640_767_15_15_n_0;
  wire ram_reg_640_767_15_15_n_1;
  wire ram_reg_640_767_16_16_n_0;
  wire ram_reg_640_767_16_16_n_1;
  wire ram_reg_640_767_17_17_n_0;
  wire ram_reg_640_767_17_17_n_1;
  wire ram_reg_640_767_18_18_n_0;
  wire ram_reg_640_767_18_18_n_1;
  wire ram_reg_640_767_19_19_n_0;
  wire ram_reg_640_767_19_19_n_1;
  wire ram_reg_640_767_1_1_n_0;
  wire ram_reg_640_767_1_1_n_1;
  wire ram_reg_640_767_20_20_n_0;
  wire ram_reg_640_767_20_20_n_1;
  wire ram_reg_640_767_21_21_n_0;
  wire ram_reg_640_767_21_21_n_1;
  wire ram_reg_640_767_22_22_n_0;
  wire ram_reg_640_767_22_22_n_1;
  wire ram_reg_640_767_23_23_n_0;
  wire ram_reg_640_767_23_23_n_1;
  wire ram_reg_640_767_24_24_n_0;
  wire ram_reg_640_767_24_24_n_1;
  wire ram_reg_640_767_25_25_n_0;
  wire ram_reg_640_767_25_25_n_1;
  wire ram_reg_640_767_26_26_n_0;
  wire ram_reg_640_767_26_26_n_1;
  wire ram_reg_640_767_27_27_n_0;
  wire ram_reg_640_767_27_27_n_1;
  wire ram_reg_640_767_28_28_n_0;
  wire ram_reg_640_767_28_28_n_1;
  wire ram_reg_640_767_29_29_n_0;
  wire ram_reg_640_767_29_29_n_1;
  wire ram_reg_640_767_2_2_n_0;
  wire ram_reg_640_767_2_2_n_1;
  wire ram_reg_640_767_30_30_n_0;
  wire ram_reg_640_767_30_30_n_1;
  wire ram_reg_640_767_31_31_n_0;
  wire ram_reg_640_767_31_31_n_1;
  wire ram_reg_640_767_3_3_n_0;
  wire ram_reg_640_767_3_3_n_1;
  wire ram_reg_640_767_4_4_n_0;
  wire ram_reg_640_767_4_4_n_1;
  wire ram_reg_640_767_5_5_n_0;
  wire ram_reg_640_767_5_5_n_1;
  wire ram_reg_640_767_6_6_n_0;
  wire ram_reg_640_767_6_6_n_1;
  wire ram_reg_640_767_7_7_n_0;
  wire ram_reg_640_767_7_7_n_1;
  wire ram_reg_640_767_8_8_n_0;
  wire ram_reg_640_767_8_8_n_1;
  wire ram_reg_640_767_9_9_n_0;
  wire ram_reg_640_767_9_9_n_1;
  wire ram_reg_768_895_0_0_i_1_n_0;
  wire ram_reg_768_895_0_0_n_0;
  wire ram_reg_768_895_0_0_n_1;
  wire ram_reg_768_895_10_10_n_0;
  wire ram_reg_768_895_10_10_n_1;
  wire ram_reg_768_895_11_11_n_0;
  wire ram_reg_768_895_11_11_n_1;
  wire ram_reg_768_895_12_12_n_0;
  wire ram_reg_768_895_12_12_n_1;
  wire ram_reg_768_895_13_13_n_0;
  wire ram_reg_768_895_13_13_n_1;
  wire ram_reg_768_895_14_14_n_0;
  wire ram_reg_768_895_14_14_n_1;
  wire ram_reg_768_895_15_15_n_0;
  wire ram_reg_768_895_15_15_n_1;
  wire ram_reg_768_895_16_16_n_0;
  wire ram_reg_768_895_16_16_n_1;
  wire ram_reg_768_895_17_17_n_0;
  wire ram_reg_768_895_17_17_n_1;
  wire ram_reg_768_895_18_18_n_0;
  wire ram_reg_768_895_18_18_n_1;
  wire ram_reg_768_895_19_19_n_0;
  wire ram_reg_768_895_19_19_n_1;
  wire ram_reg_768_895_1_1_n_0;
  wire ram_reg_768_895_1_1_n_1;
  wire ram_reg_768_895_20_20_n_0;
  wire ram_reg_768_895_20_20_n_1;
  wire ram_reg_768_895_21_21_n_0;
  wire ram_reg_768_895_21_21_n_1;
  wire ram_reg_768_895_22_22_n_0;
  wire ram_reg_768_895_22_22_n_1;
  wire ram_reg_768_895_23_23_n_0;
  wire ram_reg_768_895_23_23_n_1;
  wire ram_reg_768_895_24_24_n_0;
  wire ram_reg_768_895_24_24_n_1;
  wire ram_reg_768_895_25_25_n_0;
  wire ram_reg_768_895_25_25_n_1;
  wire ram_reg_768_895_26_26_n_0;
  wire ram_reg_768_895_26_26_n_1;
  wire ram_reg_768_895_27_27_n_0;
  wire ram_reg_768_895_27_27_n_1;
  wire ram_reg_768_895_28_28_n_0;
  wire ram_reg_768_895_28_28_n_1;
  wire ram_reg_768_895_29_29_n_0;
  wire ram_reg_768_895_29_29_n_1;
  wire ram_reg_768_895_2_2_n_0;
  wire ram_reg_768_895_2_2_n_1;
  wire ram_reg_768_895_30_30_n_0;
  wire ram_reg_768_895_30_30_n_1;
  wire ram_reg_768_895_31_31_n_0;
  wire ram_reg_768_895_31_31_n_1;
  wire ram_reg_768_895_3_3_n_0;
  wire ram_reg_768_895_3_3_n_1;
  wire ram_reg_768_895_4_4_n_0;
  wire ram_reg_768_895_4_4_n_1;
  wire ram_reg_768_895_5_5_n_0;
  wire ram_reg_768_895_5_5_n_1;
  wire ram_reg_768_895_6_6_n_0;
  wire ram_reg_768_895_6_6_n_1;
  wire ram_reg_768_895_7_7_n_0;
  wire ram_reg_768_895_7_7_n_1;
  wire ram_reg_768_895_8_8_n_0;
  wire ram_reg_768_895_8_8_n_1;
  wire ram_reg_768_895_9_9_n_0;
  wire ram_reg_768_895_9_9_n_1;
  wire ram_reg_896_1023_0_0_i_1_n_0;
  wire ram_reg_896_1023_0_0_n_0;
  wire ram_reg_896_1023_0_0_n_1;
  wire ram_reg_896_1023_10_10_n_0;
  wire ram_reg_896_1023_10_10_n_1;
  wire ram_reg_896_1023_11_11_n_0;
  wire ram_reg_896_1023_11_11_n_1;
  wire ram_reg_896_1023_12_12_n_0;
  wire ram_reg_896_1023_12_12_n_1;
  wire ram_reg_896_1023_13_13_n_0;
  wire ram_reg_896_1023_13_13_n_1;
  wire ram_reg_896_1023_14_14_n_0;
  wire ram_reg_896_1023_14_14_n_1;
  wire ram_reg_896_1023_15_15_n_0;
  wire ram_reg_896_1023_15_15_n_1;
  wire ram_reg_896_1023_16_16_n_0;
  wire ram_reg_896_1023_16_16_n_1;
  wire ram_reg_896_1023_17_17_n_0;
  wire ram_reg_896_1023_17_17_n_1;
  wire ram_reg_896_1023_18_18_n_0;
  wire ram_reg_896_1023_18_18_n_1;
  wire ram_reg_896_1023_19_19_n_0;
  wire ram_reg_896_1023_19_19_n_1;
  wire ram_reg_896_1023_1_1_n_0;
  wire ram_reg_896_1023_1_1_n_1;
  wire ram_reg_896_1023_20_20_n_0;
  wire ram_reg_896_1023_20_20_n_1;
  wire ram_reg_896_1023_21_21_n_0;
  wire ram_reg_896_1023_21_21_n_1;
  wire ram_reg_896_1023_22_22_n_0;
  wire ram_reg_896_1023_22_22_n_1;
  wire ram_reg_896_1023_23_23_n_0;
  wire ram_reg_896_1023_23_23_n_1;
  wire ram_reg_896_1023_24_24_n_0;
  wire ram_reg_896_1023_24_24_n_1;
  wire ram_reg_896_1023_25_25_n_0;
  wire ram_reg_896_1023_25_25_n_1;
  wire ram_reg_896_1023_26_26_n_0;
  wire ram_reg_896_1023_26_26_n_1;
  wire ram_reg_896_1023_27_27_n_0;
  wire ram_reg_896_1023_27_27_n_1;
  wire ram_reg_896_1023_28_28_n_0;
  wire ram_reg_896_1023_28_28_n_1;
  wire ram_reg_896_1023_29_29_n_0;
  wire ram_reg_896_1023_29_29_n_1;
  wire ram_reg_896_1023_2_2_n_0;
  wire ram_reg_896_1023_2_2_n_1;
  wire ram_reg_896_1023_30_30_n_0;
  wire ram_reg_896_1023_30_30_n_1;
  wire ram_reg_896_1023_31_31_n_0;
  wire ram_reg_896_1023_31_31_n_1;
  wire ram_reg_896_1023_3_3_n_0;
  wire ram_reg_896_1023_3_3_n_1;
  wire ram_reg_896_1023_4_4_n_0;
  wire ram_reg_896_1023_4_4_n_1;
  wire ram_reg_896_1023_5_5_n_0;
  wire ram_reg_896_1023_5_5_n_1;
  wire ram_reg_896_1023_6_6_n_0;
  wire ram_reg_896_1023_6_6_n_1;
  wire ram_reg_896_1023_7_7_n_0;
  wire ram_reg_896_1023_7_7_n_1;
  wire ram_reg_896_1023_8_8_n_0;
  wire ram_reg_896_1023_8_8_n_1;
  wire ram_reg_896_1023_9_9_n_0;
  wire ram_reg_896_1023_9_9_n_1;
  wire [31:0]spo;
  wire \spo[0]_INST_0_i_1_n_0 ;
  wire \spo[0]_INST_0_i_2_n_0 ;
  wire \spo[10]_INST_0_i_1_n_0 ;
  wire \spo[10]_INST_0_i_2_n_0 ;
  wire \spo[11]_INST_0_i_1_n_0 ;
  wire \spo[11]_INST_0_i_2_n_0 ;
  wire \spo[12]_INST_0_i_1_n_0 ;
  wire \spo[12]_INST_0_i_2_n_0 ;
  wire \spo[13]_INST_0_i_1_n_0 ;
  wire \spo[13]_INST_0_i_2_n_0 ;
  wire \spo[14]_INST_0_i_1_n_0 ;
  wire \spo[14]_INST_0_i_2_n_0 ;
  wire \spo[15]_INST_0_i_1_n_0 ;
  wire \spo[15]_INST_0_i_2_n_0 ;
  wire \spo[16]_INST_0_i_1_n_0 ;
  wire \spo[16]_INST_0_i_2_n_0 ;
  wire \spo[17]_INST_0_i_1_n_0 ;
  wire \spo[17]_INST_0_i_2_n_0 ;
  wire \spo[18]_INST_0_i_1_n_0 ;
  wire \spo[18]_INST_0_i_2_n_0 ;
  wire \spo[19]_INST_0_i_1_n_0 ;
  wire \spo[19]_INST_0_i_2_n_0 ;
  wire \spo[1]_INST_0_i_1_n_0 ;
  wire \spo[1]_INST_0_i_2_n_0 ;
  wire \spo[20]_INST_0_i_1_n_0 ;
  wire \spo[20]_INST_0_i_2_n_0 ;
  wire \spo[21]_INST_0_i_1_n_0 ;
  wire \spo[21]_INST_0_i_2_n_0 ;
  wire \spo[22]_INST_0_i_1_n_0 ;
  wire \spo[22]_INST_0_i_2_n_0 ;
  wire \spo[23]_INST_0_i_1_n_0 ;
  wire \spo[23]_INST_0_i_2_n_0 ;
  wire \spo[24]_INST_0_i_1_n_0 ;
  wire \spo[24]_INST_0_i_2_n_0 ;
  wire \spo[25]_INST_0_i_1_n_0 ;
  wire \spo[25]_INST_0_i_2_n_0 ;
  wire \spo[26]_INST_0_i_1_n_0 ;
  wire \spo[26]_INST_0_i_2_n_0 ;
  wire \spo[27]_INST_0_i_1_n_0 ;
  wire \spo[27]_INST_0_i_2_n_0 ;
  wire \spo[28]_INST_0_i_1_n_0 ;
  wire \spo[28]_INST_0_i_2_n_0 ;
  wire \spo[29]_INST_0_i_1_n_0 ;
  wire \spo[29]_INST_0_i_2_n_0 ;
  wire \spo[2]_INST_0_i_1_n_0 ;
  wire \spo[2]_INST_0_i_2_n_0 ;
  wire \spo[30]_INST_0_i_1_n_0 ;
  wire \spo[30]_INST_0_i_2_n_0 ;
  wire \spo[31]_INST_0_i_1_n_0 ;
  wire \spo[31]_INST_0_i_2_n_0 ;
  wire \spo[3]_INST_0_i_1_n_0 ;
  wire \spo[3]_INST_0_i_2_n_0 ;
  wire \spo[4]_INST_0_i_1_n_0 ;
  wire \spo[4]_INST_0_i_2_n_0 ;
  wire \spo[5]_INST_0_i_1_n_0 ;
  wire \spo[5]_INST_0_i_2_n_0 ;
  wire \spo[6]_INST_0_i_1_n_0 ;
  wire \spo[6]_INST_0_i_2_n_0 ;
  wire \spo[7]_INST_0_i_1_n_0 ;
  wire \spo[7]_INST_0_i_2_n_0 ;
  wire \spo[8]_INST_0_i_1_n_0 ;
  wire \spo[8]_INST_0_i_2_n_0 ;
  wire \spo[9]_INST_0_i_1_n_0 ;
  wire \spo[9]_INST_0_i_2_n_0 ;
  wire we;

  MUXF7 \dpo[0]_INST_0 
       (.I0(\dpo[0]_INST_0_i_1_n_0 ),
        .I1(\dpo[0]_INST_0_i_2_n_0 ),
        .O(dpo[0]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[0]_INST_0_i_1 
       (.I0(ram_reg_384_511_0_0_n_0),
        .I1(ram_reg_256_383_0_0_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_0_0_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_0_0_n_0),
        .O(\dpo[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[0]_INST_0_i_2 
       (.I0(ram_reg_896_1023_0_0_n_0),
        .I1(ram_reg_768_895_0_0_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_0_0_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_0_0_n_0),
        .O(\dpo[0]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[10]_INST_0 
       (.I0(\dpo[10]_INST_0_i_1_n_0 ),
        .I1(\dpo[10]_INST_0_i_2_n_0 ),
        .O(dpo[10]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[10]_INST_0_i_1 
       (.I0(ram_reg_384_511_10_10_n_0),
        .I1(ram_reg_256_383_10_10_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_10_10_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_10_10_n_0),
        .O(\dpo[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[10]_INST_0_i_2 
       (.I0(ram_reg_896_1023_10_10_n_0),
        .I1(ram_reg_768_895_10_10_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_10_10_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_10_10_n_0),
        .O(\dpo[10]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[11]_INST_0 
       (.I0(\dpo[11]_INST_0_i_1_n_0 ),
        .I1(\dpo[11]_INST_0_i_2_n_0 ),
        .O(dpo[11]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[11]_INST_0_i_1 
       (.I0(ram_reg_384_511_11_11_n_0),
        .I1(ram_reg_256_383_11_11_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_11_11_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_11_11_n_0),
        .O(\dpo[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[11]_INST_0_i_2 
       (.I0(ram_reg_896_1023_11_11_n_0),
        .I1(ram_reg_768_895_11_11_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_11_11_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_11_11_n_0),
        .O(\dpo[11]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[12]_INST_0 
       (.I0(\dpo[12]_INST_0_i_1_n_0 ),
        .I1(\dpo[12]_INST_0_i_2_n_0 ),
        .O(dpo[12]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[12]_INST_0_i_1 
       (.I0(ram_reg_384_511_12_12_n_0),
        .I1(ram_reg_256_383_12_12_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_12_12_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_12_12_n_0),
        .O(\dpo[12]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[12]_INST_0_i_2 
       (.I0(ram_reg_896_1023_12_12_n_0),
        .I1(ram_reg_768_895_12_12_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_12_12_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_12_12_n_0),
        .O(\dpo[12]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[13]_INST_0 
       (.I0(\dpo[13]_INST_0_i_1_n_0 ),
        .I1(\dpo[13]_INST_0_i_2_n_0 ),
        .O(dpo[13]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[13]_INST_0_i_1 
       (.I0(ram_reg_384_511_13_13_n_0),
        .I1(ram_reg_256_383_13_13_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_13_13_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_13_13_n_0),
        .O(\dpo[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[13]_INST_0_i_2 
       (.I0(ram_reg_896_1023_13_13_n_0),
        .I1(ram_reg_768_895_13_13_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_13_13_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_13_13_n_0),
        .O(\dpo[13]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[14]_INST_0 
       (.I0(\dpo[14]_INST_0_i_1_n_0 ),
        .I1(\dpo[14]_INST_0_i_2_n_0 ),
        .O(dpo[14]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[14]_INST_0_i_1 
       (.I0(ram_reg_384_511_14_14_n_0),
        .I1(ram_reg_256_383_14_14_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_14_14_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_14_14_n_0),
        .O(\dpo[14]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[14]_INST_0_i_2 
       (.I0(ram_reg_896_1023_14_14_n_0),
        .I1(ram_reg_768_895_14_14_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_14_14_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_14_14_n_0),
        .O(\dpo[14]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[15]_INST_0 
       (.I0(\dpo[15]_INST_0_i_1_n_0 ),
        .I1(\dpo[15]_INST_0_i_2_n_0 ),
        .O(dpo[15]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[15]_INST_0_i_1 
       (.I0(ram_reg_384_511_15_15_n_0),
        .I1(ram_reg_256_383_15_15_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_15_15_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_15_15_n_0),
        .O(\dpo[15]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[15]_INST_0_i_2 
       (.I0(ram_reg_896_1023_15_15_n_0),
        .I1(ram_reg_768_895_15_15_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_15_15_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_15_15_n_0),
        .O(\dpo[15]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[16]_INST_0 
       (.I0(\dpo[16]_INST_0_i_1_n_0 ),
        .I1(\dpo[16]_INST_0_i_2_n_0 ),
        .O(dpo[16]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[16]_INST_0_i_1 
       (.I0(ram_reg_384_511_16_16_n_0),
        .I1(ram_reg_256_383_16_16_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_16_16_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_16_16_n_0),
        .O(\dpo[16]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[16]_INST_0_i_2 
       (.I0(ram_reg_896_1023_16_16_n_0),
        .I1(ram_reg_768_895_16_16_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_16_16_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_16_16_n_0),
        .O(\dpo[16]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[17]_INST_0 
       (.I0(\dpo[17]_INST_0_i_1_n_0 ),
        .I1(\dpo[17]_INST_0_i_2_n_0 ),
        .O(dpo[17]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[17]_INST_0_i_1 
       (.I0(ram_reg_384_511_17_17_n_0),
        .I1(ram_reg_256_383_17_17_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_17_17_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_17_17_n_0),
        .O(\dpo[17]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[17]_INST_0_i_2 
       (.I0(ram_reg_896_1023_17_17_n_0),
        .I1(ram_reg_768_895_17_17_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_17_17_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_17_17_n_0),
        .O(\dpo[17]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[18]_INST_0 
       (.I0(\dpo[18]_INST_0_i_1_n_0 ),
        .I1(\dpo[18]_INST_0_i_2_n_0 ),
        .O(dpo[18]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[18]_INST_0_i_1 
       (.I0(ram_reg_384_511_18_18_n_0),
        .I1(ram_reg_256_383_18_18_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_18_18_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_18_18_n_0),
        .O(\dpo[18]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[18]_INST_0_i_2 
       (.I0(ram_reg_896_1023_18_18_n_0),
        .I1(ram_reg_768_895_18_18_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_18_18_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_18_18_n_0),
        .O(\dpo[18]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[19]_INST_0 
       (.I0(\dpo[19]_INST_0_i_1_n_0 ),
        .I1(\dpo[19]_INST_0_i_2_n_0 ),
        .O(dpo[19]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[19]_INST_0_i_1 
       (.I0(ram_reg_384_511_19_19_n_0),
        .I1(ram_reg_256_383_19_19_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_19_19_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_19_19_n_0),
        .O(\dpo[19]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[19]_INST_0_i_2 
       (.I0(ram_reg_896_1023_19_19_n_0),
        .I1(ram_reg_768_895_19_19_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_19_19_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_19_19_n_0),
        .O(\dpo[19]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[1]_INST_0 
       (.I0(\dpo[1]_INST_0_i_1_n_0 ),
        .I1(\dpo[1]_INST_0_i_2_n_0 ),
        .O(dpo[1]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[1]_INST_0_i_1 
       (.I0(ram_reg_384_511_1_1_n_0),
        .I1(ram_reg_256_383_1_1_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_1_1_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_1_1_n_0),
        .O(\dpo[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[1]_INST_0_i_2 
       (.I0(ram_reg_896_1023_1_1_n_0),
        .I1(ram_reg_768_895_1_1_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_1_1_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_1_1_n_0),
        .O(\dpo[1]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[20]_INST_0 
       (.I0(\dpo[20]_INST_0_i_1_n_0 ),
        .I1(\dpo[20]_INST_0_i_2_n_0 ),
        .O(dpo[20]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[20]_INST_0_i_1 
       (.I0(ram_reg_384_511_20_20_n_0),
        .I1(ram_reg_256_383_20_20_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_20_20_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_20_20_n_0),
        .O(\dpo[20]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[20]_INST_0_i_2 
       (.I0(ram_reg_896_1023_20_20_n_0),
        .I1(ram_reg_768_895_20_20_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_20_20_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_20_20_n_0),
        .O(\dpo[20]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[21]_INST_0 
       (.I0(\dpo[21]_INST_0_i_1_n_0 ),
        .I1(\dpo[21]_INST_0_i_2_n_0 ),
        .O(dpo[21]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[21]_INST_0_i_1 
       (.I0(ram_reg_384_511_21_21_n_0),
        .I1(ram_reg_256_383_21_21_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_21_21_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_21_21_n_0),
        .O(\dpo[21]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[21]_INST_0_i_2 
       (.I0(ram_reg_896_1023_21_21_n_0),
        .I1(ram_reg_768_895_21_21_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_21_21_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_21_21_n_0),
        .O(\dpo[21]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[22]_INST_0 
       (.I0(\dpo[22]_INST_0_i_1_n_0 ),
        .I1(\dpo[22]_INST_0_i_2_n_0 ),
        .O(dpo[22]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[22]_INST_0_i_1 
       (.I0(ram_reg_384_511_22_22_n_0),
        .I1(ram_reg_256_383_22_22_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_22_22_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_22_22_n_0),
        .O(\dpo[22]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[22]_INST_0_i_2 
       (.I0(ram_reg_896_1023_22_22_n_0),
        .I1(ram_reg_768_895_22_22_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_22_22_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_22_22_n_0),
        .O(\dpo[22]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[23]_INST_0 
       (.I0(\dpo[23]_INST_0_i_1_n_0 ),
        .I1(\dpo[23]_INST_0_i_2_n_0 ),
        .O(dpo[23]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[23]_INST_0_i_1 
       (.I0(ram_reg_384_511_23_23_n_0),
        .I1(ram_reg_256_383_23_23_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_23_23_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_23_23_n_0),
        .O(\dpo[23]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[23]_INST_0_i_2 
       (.I0(ram_reg_896_1023_23_23_n_0),
        .I1(ram_reg_768_895_23_23_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_23_23_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_23_23_n_0),
        .O(\dpo[23]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[24]_INST_0 
       (.I0(\dpo[24]_INST_0_i_1_n_0 ),
        .I1(\dpo[24]_INST_0_i_2_n_0 ),
        .O(dpo[24]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[24]_INST_0_i_1 
       (.I0(ram_reg_384_511_24_24_n_0),
        .I1(ram_reg_256_383_24_24_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_24_24_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_24_24_n_0),
        .O(\dpo[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[24]_INST_0_i_2 
       (.I0(ram_reg_896_1023_24_24_n_0),
        .I1(ram_reg_768_895_24_24_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_24_24_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_24_24_n_0),
        .O(\dpo[24]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[25]_INST_0 
       (.I0(\dpo[25]_INST_0_i_1_n_0 ),
        .I1(\dpo[25]_INST_0_i_2_n_0 ),
        .O(dpo[25]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[25]_INST_0_i_1 
       (.I0(ram_reg_384_511_25_25_n_0),
        .I1(ram_reg_256_383_25_25_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_25_25_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_25_25_n_0),
        .O(\dpo[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[25]_INST_0_i_2 
       (.I0(ram_reg_896_1023_25_25_n_0),
        .I1(ram_reg_768_895_25_25_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_25_25_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_25_25_n_0),
        .O(\dpo[25]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[26]_INST_0 
       (.I0(\dpo[26]_INST_0_i_1_n_0 ),
        .I1(\dpo[26]_INST_0_i_2_n_0 ),
        .O(dpo[26]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[26]_INST_0_i_1 
       (.I0(ram_reg_384_511_26_26_n_0),
        .I1(ram_reg_256_383_26_26_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_26_26_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_26_26_n_0),
        .O(\dpo[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[26]_INST_0_i_2 
       (.I0(ram_reg_896_1023_26_26_n_0),
        .I1(ram_reg_768_895_26_26_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_26_26_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_26_26_n_0),
        .O(\dpo[26]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[27]_INST_0 
       (.I0(\dpo[27]_INST_0_i_1_n_0 ),
        .I1(\dpo[27]_INST_0_i_2_n_0 ),
        .O(dpo[27]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[27]_INST_0_i_1 
       (.I0(ram_reg_384_511_27_27_n_0),
        .I1(ram_reg_256_383_27_27_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_27_27_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_27_27_n_0),
        .O(\dpo[27]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[27]_INST_0_i_2 
       (.I0(ram_reg_896_1023_27_27_n_0),
        .I1(ram_reg_768_895_27_27_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_27_27_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_27_27_n_0),
        .O(\dpo[27]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[28]_INST_0 
       (.I0(\dpo[28]_INST_0_i_1_n_0 ),
        .I1(\dpo[28]_INST_0_i_2_n_0 ),
        .O(dpo[28]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[28]_INST_0_i_1 
       (.I0(ram_reg_384_511_28_28_n_0),
        .I1(ram_reg_256_383_28_28_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_28_28_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_28_28_n_0),
        .O(\dpo[28]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[28]_INST_0_i_2 
       (.I0(ram_reg_896_1023_28_28_n_0),
        .I1(ram_reg_768_895_28_28_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_28_28_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_28_28_n_0),
        .O(\dpo[28]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[29]_INST_0 
       (.I0(\dpo[29]_INST_0_i_1_n_0 ),
        .I1(\dpo[29]_INST_0_i_2_n_0 ),
        .O(dpo[29]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[29]_INST_0_i_1 
       (.I0(ram_reg_384_511_29_29_n_0),
        .I1(ram_reg_256_383_29_29_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_29_29_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_29_29_n_0),
        .O(\dpo[29]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[29]_INST_0_i_2 
       (.I0(ram_reg_896_1023_29_29_n_0),
        .I1(ram_reg_768_895_29_29_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_29_29_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_29_29_n_0),
        .O(\dpo[29]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[2]_INST_0 
       (.I0(\dpo[2]_INST_0_i_1_n_0 ),
        .I1(\dpo[2]_INST_0_i_2_n_0 ),
        .O(dpo[2]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[2]_INST_0_i_1 
       (.I0(ram_reg_384_511_2_2_n_0),
        .I1(ram_reg_256_383_2_2_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_2_2_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_2_2_n_0),
        .O(\dpo[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[2]_INST_0_i_2 
       (.I0(ram_reg_896_1023_2_2_n_0),
        .I1(ram_reg_768_895_2_2_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_2_2_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_2_2_n_0),
        .O(\dpo[2]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[30]_INST_0 
       (.I0(\dpo[30]_INST_0_i_1_n_0 ),
        .I1(\dpo[30]_INST_0_i_2_n_0 ),
        .O(dpo[30]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[30]_INST_0_i_1 
       (.I0(ram_reg_384_511_30_30_n_0),
        .I1(ram_reg_256_383_30_30_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_30_30_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_30_30_n_0),
        .O(\dpo[30]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[30]_INST_0_i_2 
       (.I0(ram_reg_896_1023_30_30_n_0),
        .I1(ram_reg_768_895_30_30_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_30_30_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_30_30_n_0),
        .O(\dpo[30]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[31]_INST_0 
       (.I0(\dpo[31]_INST_0_i_1_n_0 ),
        .I1(\dpo[31]_INST_0_i_2_n_0 ),
        .O(dpo[31]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[31]_INST_0_i_1 
       (.I0(ram_reg_384_511_31_31_n_0),
        .I1(ram_reg_256_383_31_31_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_31_31_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_31_31_n_0),
        .O(\dpo[31]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[31]_INST_0_i_2 
       (.I0(ram_reg_896_1023_31_31_n_0),
        .I1(ram_reg_768_895_31_31_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_31_31_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_31_31_n_0),
        .O(\dpo[31]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[3]_INST_0 
       (.I0(\dpo[3]_INST_0_i_1_n_0 ),
        .I1(\dpo[3]_INST_0_i_2_n_0 ),
        .O(dpo[3]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[3]_INST_0_i_1 
       (.I0(ram_reg_384_511_3_3_n_0),
        .I1(ram_reg_256_383_3_3_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_3_3_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_3_3_n_0),
        .O(\dpo[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[3]_INST_0_i_2 
       (.I0(ram_reg_896_1023_3_3_n_0),
        .I1(ram_reg_768_895_3_3_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_3_3_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_3_3_n_0),
        .O(\dpo[3]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[4]_INST_0 
       (.I0(\dpo[4]_INST_0_i_1_n_0 ),
        .I1(\dpo[4]_INST_0_i_2_n_0 ),
        .O(dpo[4]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[4]_INST_0_i_1 
       (.I0(ram_reg_384_511_4_4_n_0),
        .I1(ram_reg_256_383_4_4_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_4_4_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_4_4_n_0),
        .O(\dpo[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[4]_INST_0_i_2 
       (.I0(ram_reg_896_1023_4_4_n_0),
        .I1(ram_reg_768_895_4_4_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_4_4_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_4_4_n_0),
        .O(\dpo[4]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[5]_INST_0 
       (.I0(\dpo[5]_INST_0_i_1_n_0 ),
        .I1(\dpo[5]_INST_0_i_2_n_0 ),
        .O(dpo[5]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[5]_INST_0_i_1 
       (.I0(ram_reg_384_511_5_5_n_0),
        .I1(ram_reg_256_383_5_5_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_5_5_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_5_5_n_0),
        .O(\dpo[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[5]_INST_0_i_2 
       (.I0(ram_reg_896_1023_5_5_n_0),
        .I1(ram_reg_768_895_5_5_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_5_5_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_5_5_n_0),
        .O(\dpo[5]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[6]_INST_0 
       (.I0(\dpo[6]_INST_0_i_1_n_0 ),
        .I1(\dpo[6]_INST_0_i_2_n_0 ),
        .O(dpo[6]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[6]_INST_0_i_1 
       (.I0(ram_reg_384_511_6_6_n_0),
        .I1(ram_reg_256_383_6_6_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_6_6_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_6_6_n_0),
        .O(\dpo[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[6]_INST_0_i_2 
       (.I0(ram_reg_896_1023_6_6_n_0),
        .I1(ram_reg_768_895_6_6_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_6_6_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_6_6_n_0),
        .O(\dpo[6]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[7]_INST_0 
       (.I0(\dpo[7]_INST_0_i_1_n_0 ),
        .I1(\dpo[7]_INST_0_i_2_n_0 ),
        .O(dpo[7]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[7]_INST_0_i_1 
       (.I0(ram_reg_384_511_7_7_n_0),
        .I1(ram_reg_256_383_7_7_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_7_7_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_7_7_n_0),
        .O(\dpo[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[7]_INST_0_i_2 
       (.I0(ram_reg_896_1023_7_7_n_0),
        .I1(ram_reg_768_895_7_7_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_7_7_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_7_7_n_0),
        .O(\dpo[7]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[8]_INST_0 
       (.I0(\dpo[8]_INST_0_i_1_n_0 ),
        .I1(\dpo[8]_INST_0_i_2_n_0 ),
        .O(dpo[8]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[8]_INST_0_i_1 
       (.I0(ram_reg_384_511_8_8_n_0),
        .I1(ram_reg_256_383_8_8_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_8_8_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_8_8_n_0),
        .O(\dpo[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[8]_INST_0_i_2 
       (.I0(ram_reg_896_1023_8_8_n_0),
        .I1(ram_reg_768_895_8_8_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_8_8_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_8_8_n_0),
        .O(\dpo[8]_INST_0_i_2_n_0 ));
  MUXF7 \dpo[9]_INST_0 
       (.I0(\dpo[9]_INST_0_i_1_n_0 ),
        .I1(\dpo[9]_INST_0_i_2_n_0 ),
        .O(dpo[9]),
        .S(dpra[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[9]_INST_0_i_1 
       (.I0(ram_reg_384_511_9_9_n_0),
        .I1(ram_reg_256_383_9_9_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_128_255_9_9_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_0_127_9_9_n_0),
        .O(\dpo[9]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \dpo[9]_INST_0_i_2 
       (.I0(ram_reg_896_1023_9_9_n_0),
        .I1(ram_reg_768_895_9_9_n_0),
        .I2(dpra[8]),
        .I3(ram_reg_640_767_9_9_n_0),
        .I4(dpra[7]),
        .I5(ram_reg_512_639_9_9_n_0),
        .O(\dpo[9]_INST_0_i_2_n_0 ));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[0]),
        .Q(qdpo_int[0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[10]),
        .Q(qdpo_int[10]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[11]),
        .Q(qdpo_int[11]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[12]),
        .Q(qdpo_int[12]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[13]),
        .Q(qdpo_int[13]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[14]),
        .Q(qdpo_int[14]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[15]),
        .Q(qdpo_int[15]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[16]),
        .Q(qdpo_int[16]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[17]),
        .Q(qdpo_int[17]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[18]),
        .Q(qdpo_int[18]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[19]),
        .Q(qdpo_int[19]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[1]),
        .Q(qdpo_int[1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[20]),
        .Q(qdpo_int[20]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[21]),
        .Q(qdpo_int[21]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[22]),
        .Q(qdpo_int[22]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[23]),
        .Q(qdpo_int[23]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[24]),
        .Q(qdpo_int[24]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[25]),
        .Q(qdpo_int[25]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[26]),
        .Q(qdpo_int[26]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[27]),
        .Q(qdpo_int[27]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[28]),
        .Q(qdpo_int[28]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[29]),
        .Q(qdpo_int[29]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[2]),
        .Q(qdpo_int[2]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[30]),
        .Q(qdpo_int[30]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[31]),
        .Q(qdpo_int[31]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[3]),
        .Q(qdpo_int[3]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[4]),
        .Q(qdpo_int[4]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[5]),
        .Q(qdpo_int[5]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[6]),
        .Q(qdpo_int[6]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[7]),
        .Q(qdpo_int[7]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[8]),
        .Q(qdpo_int[8]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qdpo_int_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[9]),
        .Q(qdpo_int[9]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[0]),
        .Q(qspo_int[0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[10]),
        .Q(qspo_int[10]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[11]),
        .Q(qspo_int[11]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[12]),
        .Q(qspo_int[12]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[13]),
        .Q(qspo_int[13]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[14]),
        .Q(qspo_int[14]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[15]),
        .Q(qspo_int[15]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[16]),
        .Q(qspo_int[16]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[17]),
        .Q(qspo_int[17]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[18]),
        .Q(qspo_int[18]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[19]),
        .Q(qspo_int[19]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[1]),
        .Q(qspo_int[1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[20]),
        .Q(qspo_int[20]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[21]),
        .Q(qspo_int[21]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[22]),
        .Q(qspo_int[22]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[23]),
        .Q(qspo_int[23]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[24]),
        .Q(qspo_int[24]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[25]),
        .Q(qspo_int[25]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[26]),
        .Q(qspo_int[26]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[27]),
        .Q(qspo_int[27]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[28]),
        .Q(qspo_int[28]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[29]),
        .Q(qspo_int[29]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[2]),
        .Q(qspo_int[2]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[30]),
        .Q(qspo_int[30]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[31]),
        .Q(qspo_int[31]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[3]),
        .Q(qspo_int[3]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[4]),
        .Q(qspo_int[4]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[5]),
        .Q(qspo_int[5]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[6]),
        .Q(qspo_int[6]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[7]),
        .Q(qspo_int[7]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[8]),
        .Q(qspo_int[8]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \qspo_int_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[9]),
        .Q(qspo_int[9]),
        .R(1'b0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_0_127_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    ram_reg_0_127_0_0_i_1
       (.I0(we),
        .I1(a[9]),
        .I2(a[7]),
        .I3(a[8]),
        .O(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_0_127_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_0_127_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_0_127_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_0_127_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_0_127_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_0_127_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_0_127_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_0_127_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_0_127_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_0_127_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_0_127_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_0_127_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_0_127_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_0_127_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_0_127_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_0_127_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_0_127_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_0_127_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_0_127_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_0_127_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_0_127_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_0_127_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_0_127_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_0_127_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_0_127_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_0_127_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_0_127_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_0_127_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_0_127_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_0_127_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_0_127_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_0_127_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_0_127_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_0_127_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_128_255_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    ram_reg_128_255_0_0_i_1
       (.I0(a[8]),
        .I1(a[9]),
        .I2(a[7]),
        .I3(we),
        .O(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_128_255_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_128_255_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_128_255_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_128_255_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_128_255_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_128_255_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_128_255_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_128_255_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_128_255_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_128_255_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_128_255_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_128_255_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_128_255_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_128_255_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_128_255_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_128_255_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_128_255_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_128_255_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_128_255_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_128_255_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_128_255_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_128_255_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_128_255_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_128_255_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_128_255_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_128_255_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_128_255_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_128_255_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_128_255_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_128_255_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_128_255_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_128_255_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_128_255_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_128_255_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_256_383_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    ram_reg_256_383_0_0_i_1
       (.I0(a[7]),
        .I1(a[9]),
        .I2(a[8]),
        .I3(we),
        .O(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_256_383_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_256_383_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_256_383_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_256_383_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_256_383_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_256_383_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_256_383_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_256_383_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_256_383_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_256_383_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_256_383_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_256_383_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_256_383_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_256_383_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_256_383_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_256_383_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_256_383_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_256_383_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_256_383_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_256_383_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_256_383_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_256_383_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_256_383_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_256_383_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_256_383_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_256_383_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_256_383_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_256_383_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_256_383_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_256_383_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_256_383_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_256_383_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_256_383_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_256_383_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_384_511_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    ram_reg_384_511_0_0_i_1
       (.I0(we),
        .I1(a[9]),
        .I2(a[7]),
        .I3(a[8]),
        .O(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_384_511_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_384_511_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_384_511_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_384_511_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_384_511_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_384_511_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_384_511_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_384_511_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_384_511_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_384_511_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_384_511_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_384_511_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_384_511_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_384_511_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_384_511_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_384_511_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_384_511_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_384_511_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_384_511_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_384_511_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_384_511_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_384_511_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_384_511_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_384_511_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_384_511_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_384_511_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_384_511_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_384_511_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_384_511_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_384_511_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_384_511_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_384_511_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_384_511_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_384_511_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_512_639_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    ram_reg_512_639_0_0_i_1
       (.I0(a[7]),
        .I1(a[8]),
        .I2(a[9]),
        .I3(we),
        .O(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_512_639_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_512_639_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_512_639_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_512_639_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_512_639_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_512_639_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_512_639_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_512_639_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_512_639_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_512_639_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_512_639_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_512_639_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_512_639_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_512_639_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_512_639_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_512_639_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_512_639_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_512_639_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_512_639_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_512_639_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_512_639_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_512_639_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_512_639_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_512_639_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_512_639_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_512_639_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_512_639_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_512_639_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_512_639_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_512_639_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_512_639_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_512_639_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_512_639_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_512_639_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_640_767_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    ram_reg_640_767_0_0_i_1
       (.I0(we),
        .I1(a[8]),
        .I2(a[7]),
        .I3(a[9]),
        .O(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_640_767_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_640_767_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_640_767_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_640_767_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_640_767_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_640_767_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_640_767_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_640_767_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_640_767_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_640_767_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_640_767_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_640_767_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_640_767_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_640_767_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_640_767_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_640_767_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_640_767_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_640_767_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_640_767_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_640_767_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_640_767_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_640_767_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_640_767_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_640_767_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_640_767_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_640_767_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_640_767_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_640_767_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_640_767_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_640_767_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_640_767_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_640_767_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_640_767_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_640_767_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_768_895_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    ram_reg_768_895_0_0_i_1
       (.I0(we),
        .I1(a[7]),
        .I2(a[8]),
        .I3(a[9]),
        .O(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_768_895_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_768_895_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_768_895_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_768_895_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_768_895_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_768_895_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_768_895_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_768_895_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_768_895_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_768_895_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_768_895_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_768_895_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_768_895_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_768_895_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_768_895_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_768_895_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_768_895_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_768_895_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_768_895_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_768_895_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_768_895_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_768_895_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_768_895_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_768_895_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_768_895_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_768_895_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_768_895_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_768_895_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_768_895_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_768_895_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_768_895_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_768_895_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_768_895_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_768_895_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(ram_reg_896_1023_0_0_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_0_0_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    ram_reg_896_1023_0_0_i_1
       (.I0(a[9]),
        .I1(we),
        .I2(a[7]),
        .I3(a[8]),
        .O(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_10_10
       (.A(a[6:0]),
        .D(d[10]),
        .DPO(ram_reg_896_1023_10_10_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_10_10_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_11_11
       (.A(a[6:0]),
        .D(d[11]),
        .DPO(ram_reg_896_1023_11_11_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_11_11_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_12_12
       (.A(a[6:0]),
        .D(d[12]),
        .DPO(ram_reg_896_1023_12_12_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_12_12_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_13_13
       (.A(a[6:0]),
        .D(d[13]),
        .DPO(ram_reg_896_1023_13_13_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_13_13_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_14_14
       (.A(a[6:0]),
        .D(d[14]),
        .DPO(ram_reg_896_1023_14_14_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_14_14_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_15_15
       (.A(a[6:0]),
        .D(d[15]),
        .DPO(ram_reg_896_1023_15_15_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_15_15_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_16_16
       (.A(a[6:0]),
        .D(d[16]),
        .DPO(ram_reg_896_1023_16_16_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_16_16_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_17_17
       (.A(a[6:0]),
        .D(d[17]),
        .DPO(ram_reg_896_1023_17_17_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_17_17_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_18_18
       (.A(a[6:0]),
        .D(d[18]),
        .DPO(ram_reg_896_1023_18_18_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_18_18_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_19_19
       (.A(a[6:0]),
        .D(d[19]),
        .DPO(ram_reg_896_1023_19_19_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_19_19_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(ram_reg_896_1023_1_1_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_1_1_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_20_20
       (.A(a[6:0]),
        .D(d[20]),
        .DPO(ram_reg_896_1023_20_20_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_20_20_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_21_21
       (.A(a[6:0]),
        .D(d[21]),
        .DPO(ram_reg_896_1023_21_21_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_21_21_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_22_22
       (.A(a[6:0]),
        .D(d[22]),
        .DPO(ram_reg_896_1023_22_22_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_22_22_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_23_23
       (.A(a[6:0]),
        .D(d[23]),
        .DPO(ram_reg_896_1023_23_23_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_23_23_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_24_24
       (.A(a[6:0]),
        .D(d[24]),
        .DPO(ram_reg_896_1023_24_24_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_24_24_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_25_25
       (.A(a[6:0]),
        .D(d[25]),
        .DPO(ram_reg_896_1023_25_25_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_25_25_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_26_26
       (.A(a[6:0]),
        .D(d[26]),
        .DPO(ram_reg_896_1023_26_26_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_26_26_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_27_27
       (.A(a[6:0]),
        .D(d[27]),
        .DPO(ram_reg_896_1023_27_27_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_27_27_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_28_28
       (.A(a[6:0]),
        .D(d[28]),
        .DPO(ram_reg_896_1023_28_28_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_28_28_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_29_29
       (.A(a[6:0]),
        .D(d[29]),
        .DPO(ram_reg_896_1023_29_29_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_29_29_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(ram_reg_896_1023_2_2_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_2_2_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_30_30
       (.A(a[6:0]),
        .D(d[30]),
        .DPO(ram_reg_896_1023_30_30_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_30_30_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_31_31
       (.A(a[6:0]),
        .D(d[31]),
        .DPO(ram_reg_896_1023_31_31_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_31_31_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(ram_reg_896_1023_3_3_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_3_3_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(ram_reg_896_1023_4_4_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_4_4_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_5_5
       (.A(a[6:0]),
        .D(d[5]),
        .DPO(ram_reg_896_1023_5_5_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_5_5_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_6_6
       (.A(a[6:0]),
        .D(d[6]),
        .DPO(ram_reg_896_1023_6_6_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_6_6_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_7_7
       (.A(a[6:0]),
        .D(d[7]),
        .DPO(ram_reg_896_1023_7_7_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_7_7_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_8_8
       (.A(a[6:0]),
        .D(d[8]),
        .DPO(ram_reg_896_1023_8_8_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_8_8_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
    ram_reg_896_1023_9_9
       (.A(a[6:0]),
        .D(d[9]),
        .DPO(ram_reg_896_1023_9_9_n_0),
        .DPRA(dpra[6:0]),
        .SPO(ram_reg_896_1023_9_9_n_1),
        .WCLK(clk),
        .WE(ram_reg_896_1023_0_0_i_1_n_0));
  MUXF7 \spo[0]_INST_0 
       (.I0(\spo[0]_INST_0_i_1_n_0 ),
        .I1(\spo[0]_INST_0_i_2_n_0 ),
        .O(spo[0]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[0]_INST_0_i_1 
       (.I0(ram_reg_384_511_0_0_n_1),
        .I1(ram_reg_256_383_0_0_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_0_0_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_0_0_n_1),
        .O(\spo[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[0]_INST_0_i_2 
       (.I0(ram_reg_896_1023_0_0_n_1),
        .I1(ram_reg_768_895_0_0_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_0_0_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_0_0_n_1),
        .O(\spo[0]_INST_0_i_2_n_0 ));
  MUXF7 \spo[10]_INST_0 
       (.I0(\spo[10]_INST_0_i_1_n_0 ),
        .I1(\spo[10]_INST_0_i_2_n_0 ),
        .O(spo[10]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[10]_INST_0_i_1 
       (.I0(ram_reg_384_511_10_10_n_1),
        .I1(ram_reg_256_383_10_10_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_10_10_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_10_10_n_1),
        .O(\spo[10]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[10]_INST_0_i_2 
       (.I0(ram_reg_896_1023_10_10_n_1),
        .I1(ram_reg_768_895_10_10_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_10_10_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_10_10_n_1),
        .O(\spo[10]_INST_0_i_2_n_0 ));
  MUXF7 \spo[11]_INST_0 
       (.I0(\spo[11]_INST_0_i_1_n_0 ),
        .I1(\spo[11]_INST_0_i_2_n_0 ),
        .O(spo[11]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[11]_INST_0_i_1 
       (.I0(ram_reg_384_511_11_11_n_1),
        .I1(ram_reg_256_383_11_11_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_11_11_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_11_11_n_1),
        .O(\spo[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[11]_INST_0_i_2 
       (.I0(ram_reg_896_1023_11_11_n_1),
        .I1(ram_reg_768_895_11_11_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_11_11_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_11_11_n_1),
        .O(\spo[11]_INST_0_i_2_n_0 ));
  MUXF7 \spo[12]_INST_0 
       (.I0(\spo[12]_INST_0_i_1_n_0 ),
        .I1(\spo[12]_INST_0_i_2_n_0 ),
        .O(spo[12]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[12]_INST_0_i_1 
       (.I0(ram_reg_384_511_12_12_n_1),
        .I1(ram_reg_256_383_12_12_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_12_12_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_12_12_n_1),
        .O(\spo[12]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[12]_INST_0_i_2 
       (.I0(ram_reg_896_1023_12_12_n_1),
        .I1(ram_reg_768_895_12_12_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_12_12_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_12_12_n_1),
        .O(\spo[12]_INST_0_i_2_n_0 ));
  MUXF7 \spo[13]_INST_0 
       (.I0(\spo[13]_INST_0_i_1_n_0 ),
        .I1(\spo[13]_INST_0_i_2_n_0 ),
        .O(spo[13]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[13]_INST_0_i_1 
       (.I0(ram_reg_384_511_13_13_n_1),
        .I1(ram_reg_256_383_13_13_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_13_13_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_13_13_n_1),
        .O(\spo[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[13]_INST_0_i_2 
       (.I0(ram_reg_896_1023_13_13_n_1),
        .I1(ram_reg_768_895_13_13_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_13_13_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_13_13_n_1),
        .O(\spo[13]_INST_0_i_2_n_0 ));
  MUXF7 \spo[14]_INST_0 
       (.I0(\spo[14]_INST_0_i_1_n_0 ),
        .I1(\spo[14]_INST_0_i_2_n_0 ),
        .O(spo[14]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[14]_INST_0_i_1 
       (.I0(ram_reg_384_511_14_14_n_1),
        .I1(ram_reg_256_383_14_14_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_14_14_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_14_14_n_1),
        .O(\spo[14]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[14]_INST_0_i_2 
       (.I0(ram_reg_896_1023_14_14_n_1),
        .I1(ram_reg_768_895_14_14_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_14_14_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_14_14_n_1),
        .O(\spo[14]_INST_0_i_2_n_0 ));
  MUXF7 \spo[15]_INST_0 
       (.I0(\spo[15]_INST_0_i_1_n_0 ),
        .I1(\spo[15]_INST_0_i_2_n_0 ),
        .O(spo[15]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[15]_INST_0_i_1 
       (.I0(ram_reg_384_511_15_15_n_1),
        .I1(ram_reg_256_383_15_15_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_15_15_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_15_15_n_1),
        .O(\spo[15]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[15]_INST_0_i_2 
       (.I0(ram_reg_896_1023_15_15_n_1),
        .I1(ram_reg_768_895_15_15_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_15_15_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_15_15_n_1),
        .O(\spo[15]_INST_0_i_2_n_0 ));
  MUXF7 \spo[16]_INST_0 
       (.I0(\spo[16]_INST_0_i_1_n_0 ),
        .I1(\spo[16]_INST_0_i_2_n_0 ),
        .O(spo[16]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[16]_INST_0_i_1 
       (.I0(ram_reg_384_511_16_16_n_1),
        .I1(ram_reg_256_383_16_16_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_16_16_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_16_16_n_1),
        .O(\spo[16]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[16]_INST_0_i_2 
       (.I0(ram_reg_896_1023_16_16_n_1),
        .I1(ram_reg_768_895_16_16_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_16_16_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_16_16_n_1),
        .O(\spo[16]_INST_0_i_2_n_0 ));
  MUXF7 \spo[17]_INST_0 
       (.I0(\spo[17]_INST_0_i_1_n_0 ),
        .I1(\spo[17]_INST_0_i_2_n_0 ),
        .O(spo[17]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[17]_INST_0_i_1 
       (.I0(ram_reg_384_511_17_17_n_1),
        .I1(ram_reg_256_383_17_17_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_17_17_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_17_17_n_1),
        .O(\spo[17]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[17]_INST_0_i_2 
       (.I0(ram_reg_896_1023_17_17_n_1),
        .I1(ram_reg_768_895_17_17_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_17_17_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_17_17_n_1),
        .O(\spo[17]_INST_0_i_2_n_0 ));
  MUXF7 \spo[18]_INST_0 
       (.I0(\spo[18]_INST_0_i_1_n_0 ),
        .I1(\spo[18]_INST_0_i_2_n_0 ),
        .O(spo[18]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[18]_INST_0_i_1 
       (.I0(ram_reg_384_511_18_18_n_1),
        .I1(ram_reg_256_383_18_18_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_18_18_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_18_18_n_1),
        .O(\spo[18]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[18]_INST_0_i_2 
       (.I0(ram_reg_896_1023_18_18_n_1),
        .I1(ram_reg_768_895_18_18_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_18_18_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_18_18_n_1),
        .O(\spo[18]_INST_0_i_2_n_0 ));
  MUXF7 \spo[19]_INST_0 
       (.I0(\spo[19]_INST_0_i_1_n_0 ),
        .I1(\spo[19]_INST_0_i_2_n_0 ),
        .O(spo[19]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[19]_INST_0_i_1 
       (.I0(ram_reg_384_511_19_19_n_1),
        .I1(ram_reg_256_383_19_19_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_19_19_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_19_19_n_1),
        .O(\spo[19]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[19]_INST_0_i_2 
       (.I0(ram_reg_896_1023_19_19_n_1),
        .I1(ram_reg_768_895_19_19_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_19_19_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_19_19_n_1),
        .O(\spo[19]_INST_0_i_2_n_0 ));
  MUXF7 \spo[1]_INST_0 
       (.I0(\spo[1]_INST_0_i_1_n_0 ),
        .I1(\spo[1]_INST_0_i_2_n_0 ),
        .O(spo[1]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[1]_INST_0_i_1 
       (.I0(ram_reg_384_511_1_1_n_1),
        .I1(ram_reg_256_383_1_1_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_1_1_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_1_1_n_1),
        .O(\spo[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[1]_INST_0_i_2 
       (.I0(ram_reg_896_1023_1_1_n_1),
        .I1(ram_reg_768_895_1_1_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_1_1_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_1_1_n_1),
        .O(\spo[1]_INST_0_i_2_n_0 ));
  MUXF7 \spo[20]_INST_0 
       (.I0(\spo[20]_INST_0_i_1_n_0 ),
        .I1(\spo[20]_INST_0_i_2_n_0 ),
        .O(spo[20]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[20]_INST_0_i_1 
       (.I0(ram_reg_384_511_20_20_n_1),
        .I1(ram_reg_256_383_20_20_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_20_20_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_20_20_n_1),
        .O(\spo[20]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[20]_INST_0_i_2 
       (.I0(ram_reg_896_1023_20_20_n_1),
        .I1(ram_reg_768_895_20_20_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_20_20_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_20_20_n_1),
        .O(\spo[20]_INST_0_i_2_n_0 ));
  MUXF7 \spo[21]_INST_0 
       (.I0(\spo[21]_INST_0_i_1_n_0 ),
        .I1(\spo[21]_INST_0_i_2_n_0 ),
        .O(spo[21]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[21]_INST_0_i_1 
       (.I0(ram_reg_384_511_21_21_n_1),
        .I1(ram_reg_256_383_21_21_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_21_21_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_21_21_n_1),
        .O(\spo[21]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[21]_INST_0_i_2 
       (.I0(ram_reg_896_1023_21_21_n_1),
        .I1(ram_reg_768_895_21_21_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_21_21_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_21_21_n_1),
        .O(\spo[21]_INST_0_i_2_n_0 ));
  MUXF7 \spo[22]_INST_0 
       (.I0(\spo[22]_INST_0_i_1_n_0 ),
        .I1(\spo[22]_INST_0_i_2_n_0 ),
        .O(spo[22]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[22]_INST_0_i_1 
       (.I0(ram_reg_384_511_22_22_n_1),
        .I1(ram_reg_256_383_22_22_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_22_22_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_22_22_n_1),
        .O(\spo[22]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[22]_INST_0_i_2 
       (.I0(ram_reg_896_1023_22_22_n_1),
        .I1(ram_reg_768_895_22_22_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_22_22_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_22_22_n_1),
        .O(\spo[22]_INST_0_i_2_n_0 ));
  MUXF7 \spo[23]_INST_0 
       (.I0(\spo[23]_INST_0_i_1_n_0 ),
        .I1(\spo[23]_INST_0_i_2_n_0 ),
        .O(spo[23]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[23]_INST_0_i_1 
       (.I0(ram_reg_384_511_23_23_n_1),
        .I1(ram_reg_256_383_23_23_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_23_23_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_23_23_n_1),
        .O(\spo[23]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[23]_INST_0_i_2 
       (.I0(ram_reg_896_1023_23_23_n_1),
        .I1(ram_reg_768_895_23_23_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_23_23_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_23_23_n_1),
        .O(\spo[23]_INST_0_i_2_n_0 ));
  MUXF7 \spo[24]_INST_0 
       (.I0(\spo[24]_INST_0_i_1_n_0 ),
        .I1(\spo[24]_INST_0_i_2_n_0 ),
        .O(spo[24]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[24]_INST_0_i_1 
       (.I0(ram_reg_384_511_24_24_n_1),
        .I1(ram_reg_256_383_24_24_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_24_24_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_24_24_n_1),
        .O(\spo[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[24]_INST_0_i_2 
       (.I0(ram_reg_896_1023_24_24_n_1),
        .I1(ram_reg_768_895_24_24_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_24_24_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_24_24_n_1),
        .O(\spo[24]_INST_0_i_2_n_0 ));
  MUXF7 \spo[25]_INST_0 
       (.I0(\spo[25]_INST_0_i_1_n_0 ),
        .I1(\spo[25]_INST_0_i_2_n_0 ),
        .O(spo[25]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[25]_INST_0_i_1 
       (.I0(ram_reg_384_511_25_25_n_1),
        .I1(ram_reg_256_383_25_25_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_25_25_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_25_25_n_1),
        .O(\spo[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[25]_INST_0_i_2 
       (.I0(ram_reg_896_1023_25_25_n_1),
        .I1(ram_reg_768_895_25_25_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_25_25_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_25_25_n_1),
        .O(\spo[25]_INST_0_i_2_n_0 ));
  MUXF7 \spo[26]_INST_0 
       (.I0(\spo[26]_INST_0_i_1_n_0 ),
        .I1(\spo[26]_INST_0_i_2_n_0 ),
        .O(spo[26]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[26]_INST_0_i_1 
       (.I0(ram_reg_384_511_26_26_n_1),
        .I1(ram_reg_256_383_26_26_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_26_26_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_26_26_n_1),
        .O(\spo[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[26]_INST_0_i_2 
       (.I0(ram_reg_896_1023_26_26_n_1),
        .I1(ram_reg_768_895_26_26_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_26_26_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_26_26_n_1),
        .O(\spo[26]_INST_0_i_2_n_0 ));
  MUXF7 \spo[27]_INST_0 
       (.I0(\spo[27]_INST_0_i_1_n_0 ),
        .I1(\spo[27]_INST_0_i_2_n_0 ),
        .O(spo[27]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[27]_INST_0_i_1 
       (.I0(ram_reg_384_511_27_27_n_1),
        .I1(ram_reg_256_383_27_27_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_27_27_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_27_27_n_1),
        .O(\spo[27]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[27]_INST_0_i_2 
       (.I0(ram_reg_896_1023_27_27_n_1),
        .I1(ram_reg_768_895_27_27_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_27_27_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_27_27_n_1),
        .O(\spo[27]_INST_0_i_2_n_0 ));
  MUXF7 \spo[28]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(\spo[28]_INST_0_i_2_n_0 ),
        .O(spo[28]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[28]_INST_0_i_1 
       (.I0(ram_reg_384_511_28_28_n_1),
        .I1(ram_reg_256_383_28_28_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_28_28_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_28_28_n_1),
        .O(\spo[28]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[28]_INST_0_i_2 
       (.I0(ram_reg_896_1023_28_28_n_1),
        .I1(ram_reg_768_895_28_28_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_28_28_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_28_28_n_1),
        .O(\spo[28]_INST_0_i_2_n_0 ));
  MUXF7 \spo[29]_INST_0 
       (.I0(\spo[29]_INST_0_i_1_n_0 ),
        .I1(\spo[29]_INST_0_i_2_n_0 ),
        .O(spo[29]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[29]_INST_0_i_1 
       (.I0(ram_reg_384_511_29_29_n_1),
        .I1(ram_reg_256_383_29_29_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_29_29_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_29_29_n_1),
        .O(\spo[29]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[29]_INST_0_i_2 
       (.I0(ram_reg_896_1023_29_29_n_1),
        .I1(ram_reg_768_895_29_29_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_29_29_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_29_29_n_1),
        .O(\spo[29]_INST_0_i_2_n_0 ));
  MUXF7 \spo[2]_INST_0 
       (.I0(\spo[2]_INST_0_i_1_n_0 ),
        .I1(\spo[2]_INST_0_i_2_n_0 ),
        .O(spo[2]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[2]_INST_0_i_1 
       (.I0(ram_reg_384_511_2_2_n_1),
        .I1(ram_reg_256_383_2_2_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_2_2_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_2_2_n_1),
        .O(\spo[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[2]_INST_0_i_2 
       (.I0(ram_reg_896_1023_2_2_n_1),
        .I1(ram_reg_768_895_2_2_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_2_2_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_2_2_n_1),
        .O(\spo[2]_INST_0_i_2_n_0 ));
  MUXF7 \spo[30]_INST_0 
       (.I0(\spo[30]_INST_0_i_1_n_0 ),
        .I1(\spo[30]_INST_0_i_2_n_0 ),
        .O(spo[30]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[30]_INST_0_i_1 
       (.I0(ram_reg_384_511_30_30_n_1),
        .I1(ram_reg_256_383_30_30_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_30_30_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_30_30_n_1),
        .O(\spo[30]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[30]_INST_0_i_2 
       (.I0(ram_reg_896_1023_30_30_n_1),
        .I1(ram_reg_768_895_30_30_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_30_30_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_30_30_n_1),
        .O(\spo[30]_INST_0_i_2_n_0 ));
  MUXF7 \spo[31]_INST_0 
       (.I0(\spo[31]_INST_0_i_1_n_0 ),
        .I1(\spo[31]_INST_0_i_2_n_0 ),
        .O(spo[31]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[31]_INST_0_i_1 
       (.I0(ram_reg_384_511_31_31_n_1),
        .I1(ram_reg_256_383_31_31_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_31_31_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_31_31_n_1),
        .O(\spo[31]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[31]_INST_0_i_2 
       (.I0(ram_reg_896_1023_31_31_n_1),
        .I1(ram_reg_768_895_31_31_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_31_31_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_31_31_n_1),
        .O(\spo[31]_INST_0_i_2_n_0 ));
  MUXF7 \spo[3]_INST_0 
       (.I0(\spo[3]_INST_0_i_1_n_0 ),
        .I1(\spo[3]_INST_0_i_2_n_0 ),
        .O(spo[3]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[3]_INST_0_i_1 
       (.I0(ram_reg_384_511_3_3_n_1),
        .I1(ram_reg_256_383_3_3_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_3_3_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_3_3_n_1),
        .O(\spo[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[3]_INST_0_i_2 
       (.I0(ram_reg_896_1023_3_3_n_1),
        .I1(ram_reg_768_895_3_3_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_3_3_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_3_3_n_1),
        .O(\spo[3]_INST_0_i_2_n_0 ));
  MUXF7 \spo[4]_INST_0 
       (.I0(\spo[4]_INST_0_i_1_n_0 ),
        .I1(\spo[4]_INST_0_i_2_n_0 ),
        .O(spo[4]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[4]_INST_0_i_1 
       (.I0(ram_reg_384_511_4_4_n_1),
        .I1(ram_reg_256_383_4_4_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_4_4_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_4_4_n_1),
        .O(\spo[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[4]_INST_0_i_2 
       (.I0(ram_reg_896_1023_4_4_n_1),
        .I1(ram_reg_768_895_4_4_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_4_4_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_4_4_n_1),
        .O(\spo[4]_INST_0_i_2_n_0 ));
  MUXF7 \spo[5]_INST_0 
       (.I0(\spo[5]_INST_0_i_1_n_0 ),
        .I1(\spo[5]_INST_0_i_2_n_0 ),
        .O(spo[5]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[5]_INST_0_i_1 
       (.I0(ram_reg_384_511_5_5_n_1),
        .I1(ram_reg_256_383_5_5_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_5_5_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_5_5_n_1),
        .O(\spo[5]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[5]_INST_0_i_2 
       (.I0(ram_reg_896_1023_5_5_n_1),
        .I1(ram_reg_768_895_5_5_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_5_5_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_5_5_n_1),
        .O(\spo[5]_INST_0_i_2_n_0 ));
  MUXF7 \spo[6]_INST_0 
       (.I0(\spo[6]_INST_0_i_1_n_0 ),
        .I1(\spo[6]_INST_0_i_2_n_0 ),
        .O(spo[6]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[6]_INST_0_i_1 
       (.I0(ram_reg_384_511_6_6_n_1),
        .I1(ram_reg_256_383_6_6_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_6_6_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_6_6_n_1),
        .O(\spo[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[6]_INST_0_i_2 
       (.I0(ram_reg_896_1023_6_6_n_1),
        .I1(ram_reg_768_895_6_6_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_6_6_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_6_6_n_1),
        .O(\spo[6]_INST_0_i_2_n_0 ));
  MUXF7 \spo[7]_INST_0 
       (.I0(\spo[7]_INST_0_i_1_n_0 ),
        .I1(\spo[7]_INST_0_i_2_n_0 ),
        .O(spo[7]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[7]_INST_0_i_1 
       (.I0(ram_reg_384_511_7_7_n_1),
        .I1(ram_reg_256_383_7_7_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_7_7_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_7_7_n_1),
        .O(\spo[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[7]_INST_0_i_2 
       (.I0(ram_reg_896_1023_7_7_n_1),
        .I1(ram_reg_768_895_7_7_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_7_7_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_7_7_n_1),
        .O(\spo[7]_INST_0_i_2_n_0 ));
  MUXF7 \spo[8]_INST_0 
       (.I0(\spo[8]_INST_0_i_1_n_0 ),
        .I1(\spo[8]_INST_0_i_2_n_0 ),
        .O(spo[8]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[8]_INST_0_i_1 
       (.I0(ram_reg_384_511_8_8_n_1),
        .I1(ram_reg_256_383_8_8_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_8_8_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_8_8_n_1),
        .O(\spo[8]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[8]_INST_0_i_2 
       (.I0(ram_reg_896_1023_8_8_n_1),
        .I1(ram_reg_768_895_8_8_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_8_8_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_8_8_n_1),
        .O(\spo[8]_INST_0_i_2_n_0 ));
  MUXF7 \spo[9]_INST_0 
       (.I0(\spo[9]_INST_0_i_1_n_0 ),
        .I1(\spo[9]_INST_0_i_2_n_0 ),
        .O(spo[9]),
        .S(a[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[9]_INST_0_i_1 
       (.I0(ram_reg_384_511_9_9_n_1),
        .I1(ram_reg_256_383_9_9_n_1),
        .I2(a[8]),
        .I3(ram_reg_128_255_9_9_n_1),
        .I4(a[7]),
        .I5(ram_reg_0_127_9_9_n_1),
        .O(\spo[9]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[9]_INST_0_i_2 
       (.I0(ram_reg_896_1023_9_9_n_1),
        .I1(ram_reg_768_895_9_9_n_1),
        .I2(a[8]),
        .I3(ram_reg_640_767_9_9_n_1),
        .I4(a[7]),
        .I5(ram_reg_512_639_9_9_n_1),
        .O(\spo[9]_INST_0_i_2_n_0 ));
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
