-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Tue Nov  3 18:09:35 2015
-- Host        : lpnws5166 running 64-bit Scientific Linux release 6.7 (Carbon)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/srusso/Xilinx_prj/LSST_prj/DREB_prj/REB_v3_vivado_15_2/REB_v3_vivado_15_2/REB_v3_vivado_15_2.srcs/sources_1/ip/seq_param_fifo_v3/seq_param_fifo_v3_stub.vhdl
-- Design      : seq_param_fifo_v3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tffg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seq_param_fifo_v3 is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end seq_param_fifo_v3;

architecture stub of seq_param_fifo_v3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[31:0],wr_en,rd_en,dout[31:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v12_0,Vivado 2015.2";
begin
end;
