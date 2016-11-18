-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Fri Nov  6 14:59:48 2015
-- Host        : lpnws5166 running 64-bit Scientific Linux release 6.7 (Carbon)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/srusso/Xilinx_prj/LSST_prj/DREB_prj/REB_v3_vivado_15_2/src/ipcore_dir/dcm_user_clk/dcm_user_clk_stub.vhdl
-- Design      : dcm_user_clk
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tffg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dcm_user_clk is
  Port ( 
    CLK_IN1 : in STD_LOGIC;
    CLK_OUT1 : out STD_LOGIC;
    CLK_OUT2 : out STD_LOGIC;
    LOCKED : out STD_LOGIC
  );

end dcm_user_clk;

architecture stub of dcm_user_clk is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_IN1,CLK_OUT1,CLK_OUT2,LOCKED";
begin
end;
