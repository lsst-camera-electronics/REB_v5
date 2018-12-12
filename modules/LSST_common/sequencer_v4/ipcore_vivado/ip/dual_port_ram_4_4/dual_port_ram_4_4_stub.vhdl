-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Thu Jan 28 15:57:16 2016
-- Host        : lsst-daq01 running 64-bit Red Hat Enterprise Linux Server release 6.7 (Santiago)
-- Command     : write_vhdl -force -mode synth_stub
--               /u1/srusso/Xilinx_prj/LSST_prj/DREB_prj/REB_v3_vivado_15_2/REB_v3_vivado_15_2/REB_v3_vivado_15_2.srcs/sources_1/ip/dual_port_ram_4_4/dual_port_ram_4_4_stub.vhdl
-- Design      : dual_port_ram_4_4
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tffg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dual_port_ram_4_4 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end dual_port_ram_4_4;

architecture stub of dual_port_ram_4_4 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[3:0],d[3:0],dpra[3:0],clk,we,spo[3:0],dpo[3:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0,Vivado 2015.2";
begin
end;
