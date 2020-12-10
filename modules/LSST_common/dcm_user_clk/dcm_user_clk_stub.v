// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Thu Dec 10 18:23:52 2020
// Host        : lpnws4225 running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/srusso/Xilinx_prj/build/REB_v5_top/REB_v5_top_project.srcs/sources_1/ip/dcm_user_clk/dcm_user_clk_stub.v
// Design      : dcm_user_clk
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tffg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dcm_user_clk(CLK_IN1, CLK_OUT1, CLK_OUT2, LOCKED)
/* synthesis syn_black_box black_box_pad_pin="CLK_IN1,CLK_OUT1,CLK_OUT2,LOCKED" */;
  input CLK_IN1;
  output CLK_OUT1;
  output CLK_OUT2;
  output LOCKED;
endmodule
