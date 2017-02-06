// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Fri Nov  6 14:59:48 2015
// Host        : lpnws5166 running 64-bit Scientific Linux release 6.7 (Carbon)
// Command     : write_verilog -force -mode synth_stub
//               /home/srusso/Xilinx_prj/LSST_prj/DREB_prj/REB_v3_vivado_15_2/src/ipcore_dir/dcm_user_clk/dcm_user_clk_stub.v
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
