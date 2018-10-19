-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
-- Date        : Fri Sep 14 12:26:21 2018
-- Host        : srusso-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx_prj/test_spiflash_programmer_multiboot/ipcore_dir_vivado/bitfile_fifo_in/bitfile_fifo_in_sim_netlist.vhdl
-- Design      : bitfile_fifo_in
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_compare is
  port (
    comp1 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gic0.gc0.count_d1_reg[8]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_compare : entity is "compare";
end bitfile_fifo_in_compare;

architecture STRUCTURE of bitfile_fifo_in_compare is
  signal \gmux.gm[3].gms.ms_n_0\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gmux.gm[3].gms.ms_n_0\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \gmux.gm[3].gms.ms_n_0\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp1,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \gic0.gc0.count_d1_reg[8]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_compare_0 is
  port (
    comp2 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gic0.gc0.count_reg[8]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_compare_0 : entity is "compare";
end bitfile_fifo_in_compare_0;

architecture STRUCTURE of bitfile_fifo_in_compare_0 is
  signal \gmux.gm[3].gms.ms_n_0\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gmux.gm[3].gms.ms_n_0\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \gmux.gm[3].gms.ms_n_0\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp2,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \gic0.gc0.count_reg[8]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_compare_1 is
  port (
    comp0 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wr_pntr_bin_reg[8]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_compare_1 : entity is "compare";
end bitfile_fifo_in_compare_1;

architecture STRUCTURE of bitfile_fifo_in_compare_1 is
  signal \gmux.gm[3].gms.ms_n_0\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gmux.gm[3].gms.ms_n_0\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \gmux.gm[3].gms.ms_n_0\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp0,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \wr_pntr_bin_reg[8]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_compare_2 is
  port (
    comp1 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gc0.count_reg[8]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_compare_2 : entity is "compare";
end bitfile_fifo_in_compare_2;

architecture STRUCTURE of bitfile_fifo_in_compare_2 is
  signal \gmux.gm[3].gms.ms_n_0\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gmux.gm[3].gms.ms_n_0\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \gmux.gm[3].gms.ms_n_0\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp1,
      CYINIT => '0',
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \gc0.count_reg[8]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_dmem is
  port (
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \gic0.gc0.count_d2_reg[7]\ : in STD_LOGIC;
    \gc0.count_d1_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \gic0.gc0.count_d2_reg[5]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gic0.gc0.count_d2_reg[8]\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_0\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_1\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_0\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_1\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_2\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_3\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_2\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_3\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_4\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_4\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_5\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_0\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_6\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_7\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_5\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_6\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_7\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_8\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_9\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_1\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_10\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_11\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_8\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_9\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_10\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_12\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_13\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_2\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_14\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_15\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_11\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_12\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_13\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_16\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_17\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_3\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_18\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_19\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_14\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_15\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_16\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_20\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_21\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_4\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_22\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_23\ : in STD_LOGIC;
    ADDRA : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gic0.gc0.count_d2_reg[8]_17\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_18\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_19\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_24\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_25\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_5\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_26\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_27\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_20\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_21\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_22\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_28\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_29\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_6\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_30\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_31\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_23\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_24\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_25\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_32\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_33\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_7\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_34\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_35\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_26\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_27\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_28\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_36\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_37\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_8\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_38\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_39\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_40\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_29\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_30\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_31\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_32\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_33\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_34\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_41\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_42\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_43\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_44\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_9\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_10\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_45\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_46\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_dmem : entity is "dmem";
end bitfile_fifo_in_dmem;

architecture STRUCTURE of bitfile_fifo_in_dmem is
  signal RAM_reg_0_63_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_128_191_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_128_191_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_128_191_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_192_255_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_192_255_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_192_255_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_256_319_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_256_319_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_256_319_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_320_383_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_320_383_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_320_383_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_384_447_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_384_447_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_384_447_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_448_511_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_448_511_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_448_511_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_30_30_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_31_31_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_9_11_n_2 : STD_LOGIC;
  signal \gpr1.dout_i[0]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[0]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[10]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[10]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[11]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[11]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[12]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[12]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[13]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[13]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[14]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[14]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[15]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[15]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[16]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[16]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[17]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[17]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[18]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[18]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[19]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[19]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[1]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[1]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[20]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[20]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[21]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[21]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[22]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[22]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[23]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[23]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[24]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[24]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[25]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[25]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[26]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[26]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[27]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[27]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[28]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[28]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[29]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[29]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[2]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[2]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[30]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[30]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[31]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[31]_i_4_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[3]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[3]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[4]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[4]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[5]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[5]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[6]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[6]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[7]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[8]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[8]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[9]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i[9]_i_3_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[17]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[18]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[21]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[22]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[25]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[26]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[29]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[30]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \gpr1.dout_i_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_128_191_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_192_255_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_256_319_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_320_383_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_384_447_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_448_511_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_30_30_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_31_31_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED : STD_LOGIC;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_128_191_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_192_255_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_256_319_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_320_383_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_384_447_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_448_511_9_11 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_12_14 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_15_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_18_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_21_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_24_26 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_27_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_9_11 : label is "";
begin
RAM_reg_0_63_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_0_63_0_2_n_0,
      DOB => RAM_reg_0_63_0_2_n_1,
      DOC => RAM_reg_0_63_0_2_n_2,
      DOD => NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]\
    );
RAM_reg_0_63_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_0_63_12_14_n_0,
      DOB => RAM_reg_0_63_12_14_n_1,
      DOC => RAM_reg_0_63_12_14_n_2,
      DOD => NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_15\
    );
RAM_reg_0_63_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_0_63_15_17_n_0,
      DOB => RAM_reg_0_63_15_17_n_1,
      DOC => RAM_reg_0_63_15_17_n_2,
      DOD => NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_19\
    );
RAM_reg_0_63_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_0_63_18_20_n_0,
      DOB => RAM_reg_0_63_18_20_n_1,
      DOC => RAM_reg_0_63_18_20_n_2,
      DOD => NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_23\
    );
RAM_reg_0_63_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_0_63_21_23_n_0,
      DOB => RAM_reg_0_63_21_23_n_1,
      DOC => RAM_reg_0_63_21_23_n_2,
      DOD => NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_27\
    );
RAM_reg_0_63_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_0_63_24_26_n_0,
      DOB => RAM_reg_0_63_24_26_n_1,
      DOC => RAM_reg_0_63_24_26_n_2,
      DOD => NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_31\
    );
RAM_reg_0_63_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_0_63_27_29_n_0,
      DOB => RAM_reg_0_63_27_29_n_1,
      DOC => RAM_reg_0_63_27_29_n_2,
      DOD => NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_35\
    );
RAM_reg_0_63_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_0_63_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_0_63_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_39\
    );
RAM_reg_0_63_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_0_63_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_0_63_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_40\
    );
RAM_reg_0_63_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_0_63_3_5_n_0,
      DOB => RAM_reg_0_63_3_5_n_1,
      DOC => RAM_reg_0_63_3_5_n_2,
      DOD => NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_3\
    );
RAM_reg_0_63_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_0_63_6_8_n_0,
      DOB => RAM_reg_0_63_6_8_n_1,
      DOC => RAM_reg_0_63_6_8_n_2,
      DOD => NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_7\
    );
RAM_reg_0_63_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_0_63_9_11_n_0,
      DOB => RAM_reg_0_63_9_11_n_1,
      DOC => RAM_reg_0_63_9_11_n_2,
      DOD => NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_11\
    );
RAM_reg_128_191_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_128_191_0_2_n_0,
      DOB => RAM_reg_128_191_0_2_n_1,
      DOC => RAM_reg_128_191_0_2_n_2,
      DOD => NLW_RAM_reg_128_191_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_0\
    );
RAM_reg_128_191_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_128_191_12_14_n_0,
      DOB => RAM_reg_128_191_12_14_n_1,
      DOC => RAM_reg_128_191_12_14_n_2,
      DOD => NLW_RAM_reg_128_191_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_12\
    );
RAM_reg_128_191_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_128_191_15_17_n_0,
      DOB => RAM_reg_128_191_15_17_n_1,
      DOC => RAM_reg_128_191_15_17_n_2,
      DOD => NLW_RAM_reg_128_191_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_15\
    );
RAM_reg_128_191_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_128_191_18_20_n_0,
      DOB => RAM_reg_128_191_18_20_n_1,
      DOC => RAM_reg_128_191_18_20_n_2,
      DOD => NLW_RAM_reg_128_191_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_18\
    );
RAM_reg_128_191_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_128_191_21_23_n_0,
      DOB => RAM_reg_128_191_21_23_n_1,
      DOC => RAM_reg_128_191_21_23_n_2,
      DOD => NLW_RAM_reg_128_191_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_21\
    );
RAM_reg_128_191_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_128_191_24_26_n_0,
      DOB => RAM_reg_128_191_24_26_n_1,
      DOC => RAM_reg_128_191_24_26_n_2,
      DOD => NLW_RAM_reg_128_191_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_24\
    );
RAM_reg_128_191_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_128_191_27_29_n_0,
      DOB => RAM_reg_128_191_27_29_n_1,
      DOC => RAM_reg_128_191_27_29_n_2,
      DOD => NLW_RAM_reg_128_191_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_27\
    );
RAM_reg_128_191_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_128_191_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_128_191_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_31\
    );
RAM_reg_128_191_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_128_191_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_128_191_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_32\
    );
RAM_reg_128_191_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_128_191_3_5_n_0,
      DOB => RAM_reg_128_191_3_5_n_1,
      DOC => RAM_reg_128_191_3_5_n_2,
      DOD => NLW_RAM_reg_128_191_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_3\
    );
RAM_reg_128_191_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_128_191_6_8_n_0,
      DOB => RAM_reg_128_191_6_8_n_1,
      DOC => RAM_reg_128_191_6_8_n_2,
      DOD => NLW_RAM_reg_128_191_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_6\
    );
RAM_reg_128_191_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_128_191_9_11_n_0,
      DOB => RAM_reg_128_191_9_11_n_1,
      DOC => RAM_reg_128_191_9_11_n_2,
      DOD => NLW_RAM_reg_128_191_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_9\
    );
RAM_reg_192_255_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_192_255_0_2_n_0,
      DOB => RAM_reg_192_255_0_2_n_1,
      DOC => RAM_reg_192_255_0_2_n_2,
      DOD => NLW_RAM_reg_192_255_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_1\
    );
RAM_reg_192_255_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_192_255_12_14_n_0,
      DOB => RAM_reg_192_255_12_14_n_1,
      DOC => RAM_reg_192_255_12_14_n_2,
      DOD => NLW_RAM_reg_192_255_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_13\
    );
RAM_reg_192_255_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_192_255_15_17_n_0,
      DOB => RAM_reg_192_255_15_17_n_1,
      DOC => RAM_reg_192_255_15_17_n_2,
      DOD => NLW_RAM_reg_192_255_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_16\
    );
RAM_reg_192_255_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_192_255_18_20_n_0,
      DOB => RAM_reg_192_255_18_20_n_1,
      DOC => RAM_reg_192_255_18_20_n_2,
      DOD => NLW_RAM_reg_192_255_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_19\
    );
RAM_reg_192_255_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_192_255_21_23_n_0,
      DOB => RAM_reg_192_255_21_23_n_1,
      DOC => RAM_reg_192_255_21_23_n_2,
      DOD => NLW_RAM_reg_192_255_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_22\
    );
RAM_reg_192_255_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_192_255_24_26_n_0,
      DOB => RAM_reg_192_255_24_26_n_1,
      DOC => RAM_reg_192_255_24_26_n_2,
      DOD => NLW_RAM_reg_192_255_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_25\
    );
RAM_reg_192_255_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_192_255_27_29_n_0,
      DOB => RAM_reg_192_255_27_29_n_1,
      DOC => RAM_reg_192_255_27_29_n_2,
      DOD => NLW_RAM_reg_192_255_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_28\
    );
RAM_reg_192_255_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_192_255_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_192_255_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_33\
    );
RAM_reg_192_255_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_192_255_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_192_255_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_34\
    );
RAM_reg_192_255_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_192_255_3_5_n_0,
      DOB => RAM_reg_192_255_3_5_n_1,
      DOC => RAM_reg_192_255_3_5_n_2,
      DOD => NLW_RAM_reg_192_255_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_4\
    );
RAM_reg_192_255_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_192_255_6_8_n_0,
      DOB => RAM_reg_192_255_6_8_n_1,
      DOC => RAM_reg_192_255_6_8_n_2,
      DOD => NLW_RAM_reg_192_255_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_7\
    );
RAM_reg_192_255_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_192_255_9_11_n_0,
      DOB => RAM_reg_192_255_9_11_n_1,
      DOC => RAM_reg_192_255_9_11_n_2,
      DOD => NLW_RAM_reg_192_255_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_10\
    );
RAM_reg_256_319_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_256_319_0_2_n_0,
      DOB => RAM_reg_256_319_0_2_n_1,
      DOC => RAM_reg_256_319_0_2_n_2,
      DOD => NLW_RAM_reg_256_319_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_0\
    );
RAM_reg_256_319_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_256_319_12_14_n_0,
      DOB => RAM_reg_256_319_12_14_n_1,
      DOC => RAM_reg_256_319_12_14_n_2,
      DOD => NLW_RAM_reg_256_319_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_16\
    );
RAM_reg_256_319_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_256_319_15_17_n_0,
      DOB => RAM_reg_256_319_15_17_n_1,
      DOC => RAM_reg_256_319_15_17_n_2,
      DOD => NLW_RAM_reg_256_319_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_20\
    );
RAM_reg_256_319_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_256_319_18_20_n_0,
      DOB => RAM_reg_256_319_18_20_n_1,
      DOC => RAM_reg_256_319_18_20_n_2,
      DOD => NLW_RAM_reg_256_319_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_24\
    );
RAM_reg_256_319_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_256_319_21_23_n_0,
      DOB => RAM_reg_256_319_21_23_n_1,
      DOC => RAM_reg_256_319_21_23_n_2,
      DOD => NLW_RAM_reg_256_319_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_28\
    );
RAM_reg_256_319_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_256_319_24_26_n_0,
      DOB => RAM_reg_256_319_24_26_n_1,
      DOC => RAM_reg_256_319_24_26_n_2,
      DOD => NLW_RAM_reg_256_319_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_32\
    );
RAM_reg_256_319_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_256_319_27_29_n_0,
      DOB => RAM_reg_256_319_27_29_n_1,
      DOC => RAM_reg_256_319_27_29_n_2,
      DOD => NLW_RAM_reg_256_319_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_36\
    );
RAM_reg_256_319_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_256_319_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_256_319_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_41\
    );
RAM_reg_256_319_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_256_319_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_256_319_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_42\
    );
RAM_reg_256_319_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_256_319_3_5_n_0,
      DOB => RAM_reg_256_319_3_5_n_1,
      DOC => RAM_reg_256_319_3_5_n_2,
      DOD => NLW_RAM_reg_256_319_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_4\
    );
RAM_reg_256_319_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_256_319_6_8_n_0,
      DOB => RAM_reg_256_319_6_8_n_1,
      DOC => RAM_reg_256_319_6_8_n_2,
      DOD => NLW_RAM_reg_256_319_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_8\
    );
RAM_reg_256_319_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_256_319_9_11_n_0,
      DOB => RAM_reg_256_319_9_11_n_1,
      DOC => RAM_reg_256_319_9_11_n_2,
      DOD => NLW_RAM_reg_256_319_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_12\
    );
RAM_reg_320_383_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_320_383_0_2_n_0,
      DOB => RAM_reg_320_383_0_2_n_1,
      DOC => RAM_reg_320_383_0_2_n_2,
      DOD => NLW_RAM_reg_320_383_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_1\
    );
RAM_reg_320_383_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_320_383_12_14_n_0,
      DOB => RAM_reg_320_383_12_14_n_1,
      DOC => RAM_reg_320_383_12_14_n_2,
      DOD => NLW_RAM_reg_320_383_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_17\
    );
RAM_reg_320_383_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_320_383_15_17_n_0,
      DOB => RAM_reg_320_383_15_17_n_1,
      DOC => RAM_reg_320_383_15_17_n_2,
      DOD => NLW_RAM_reg_320_383_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_21\
    );
RAM_reg_320_383_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_320_383_18_20_n_0,
      DOB => RAM_reg_320_383_18_20_n_1,
      DOC => RAM_reg_320_383_18_20_n_2,
      DOD => NLW_RAM_reg_320_383_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_25\
    );
RAM_reg_320_383_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_320_383_21_23_n_0,
      DOB => RAM_reg_320_383_21_23_n_1,
      DOC => RAM_reg_320_383_21_23_n_2,
      DOD => NLW_RAM_reg_320_383_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_29\
    );
RAM_reg_320_383_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_320_383_24_26_n_0,
      DOB => RAM_reg_320_383_24_26_n_1,
      DOC => RAM_reg_320_383_24_26_n_2,
      DOD => NLW_RAM_reg_320_383_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_33\
    );
RAM_reg_320_383_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_320_383_27_29_n_0,
      DOB => RAM_reg_320_383_27_29_n_1,
      DOC => RAM_reg_320_383_27_29_n_2,
      DOD => NLW_RAM_reg_320_383_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_37\
    );
RAM_reg_320_383_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_320_383_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_320_383_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_43\
    );
RAM_reg_320_383_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_320_383_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_320_383_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_44\
    );
RAM_reg_320_383_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_320_383_3_5_n_0,
      DOB => RAM_reg_320_383_3_5_n_1,
      DOC => RAM_reg_320_383_3_5_n_2,
      DOD => NLW_RAM_reg_320_383_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_5\
    );
RAM_reg_320_383_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_320_383_6_8_n_0,
      DOB => RAM_reg_320_383_6_8_n_1,
      DOC => RAM_reg_320_383_6_8_n_2,
      DOD => NLW_RAM_reg_320_383_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_9\
    );
RAM_reg_320_383_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_320_383_9_11_n_0,
      DOB => RAM_reg_320_383_9_11_n_1,
      DOC => RAM_reg_320_383_9_11_n_2,
      DOD => NLW_RAM_reg_320_383_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_13\
    );
RAM_reg_384_447_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_384_447_0_2_n_0,
      DOB => RAM_reg_384_447_0_2_n_1,
      DOC => RAM_reg_384_447_0_2_n_2,
      DOD => NLW_RAM_reg_384_447_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]\
    );
RAM_reg_384_447_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_384_447_12_14_n_0,
      DOB => RAM_reg_384_447_12_14_n_1,
      DOC => RAM_reg_384_447_12_14_n_2,
      DOD => NLW_RAM_reg_384_447_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_3\
    );
RAM_reg_384_447_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_384_447_15_17_n_0,
      DOB => RAM_reg_384_447_15_17_n_1,
      DOC => RAM_reg_384_447_15_17_n_2,
      DOD => NLW_RAM_reg_384_447_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_4\
    );
RAM_reg_384_447_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_384_447_18_20_n_0,
      DOB => RAM_reg_384_447_18_20_n_1,
      DOC => RAM_reg_384_447_18_20_n_2,
      DOD => NLW_RAM_reg_384_447_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_5\
    );
RAM_reg_384_447_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_384_447_21_23_n_0,
      DOB => RAM_reg_384_447_21_23_n_1,
      DOC => RAM_reg_384_447_21_23_n_2,
      DOD => NLW_RAM_reg_384_447_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_6\
    );
RAM_reg_384_447_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_384_447_24_26_n_0,
      DOB => RAM_reg_384_447_24_26_n_1,
      DOC => RAM_reg_384_447_24_26_n_2,
      DOD => NLW_RAM_reg_384_447_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_7\
    );
RAM_reg_384_447_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_384_447_27_29_n_0,
      DOB => RAM_reg_384_447_27_29_n_1,
      DOC => RAM_reg_384_447_27_29_n_2,
      DOD => NLW_RAM_reg_384_447_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_8\
    );
RAM_reg_384_447_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_384_447_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_384_447_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_9\
    );
RAM_reg_384_447_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_384_447_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_384_447_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_10\
    );
RAM_reg_384_447_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_384_447_3_5_n_0,
      DOB => RAM_reg_384_447_3_5_n_1,
      DOC => RAM_reg_384_447_3_5_n_2,
      DOD => NLW_RAM_reg_384_447_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_0\
    );
RAM_reg_384_447_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_384_447_6_8_n_0,
      DOB => RAM_reg_384_447_6_8_n_1,
      DOC => RAM_reg_384_447_6_8_n_2,
      DOD => NLW_RAM_reg_384_447_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_1\
    );
RAM_reg_384_447_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_384_447_9_11_n_0,
      DOB => RAM_reg_384_447_9_11_n_1,
      DOC => RAM_reg_384_447_9_11_n_2,
      DOD => NLW_RAM_reg_384_447_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[6]_2\
    );
RAM_reg_448_511_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_448_511_0_2_n_0,
      DOB => RAM_reg_448_511_0_2_n_1,
      DOC => RAM_reg_448_511_0_2_n_2,
      DOD => NLW_RAM_reg_448_511_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_2\
    );
RAM_reg_448_511_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_448_511_12_14_n_0,
      DOB => RAM_reg_448_511_12_14_n_1,
      DOC => RAM_reg_448_511_12_14_n_2,
      DOD => NLW_RAM_reg_448_511_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_18\
    );
RAM_reg_448_511_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_448_511_15_17_n_0,
      DOB => RAM_reg_448_511_15_17_n_1,
      DOC => RAM_reg_448_511_15_17_n_2,
      DOD => NLW_RAM_reg_448_511_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_22\
    );
RAM_reg_448_511_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_448_511_18_20_n_0,
      DOB => RAM_reg_448_511_18_20_n_1,
      DOC => RAM_reg_448_511_18_20_n_2,
      DOD => NLW_RAM_reg_448_511_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_26\
    );
RAM_reg_448_511_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_448_511_21_23_n_0,
      DOB => RAM_reg_448_511_21_23_n_1,
      DOC => RAM_reg_448_511_21_23_n_2,
      DOD => NLW_RAM_reg_448_511_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_30\
    );
RAM_reg_448_511_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_448_511_24_26_n_0,
      DOB => RAM_reg_448_511_24_26_n_1,
      DOC => RAM_reg_448_511_24_26_n_2,
      DOD => NLW_RAM_reg_448_511_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_34\
    );
RAM_reg_448_511_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_448_511_27_29_n_0,
      DOB => RAM_reg_448_511_27_29_n_1,
      DOC => RAM_reg_448_511_27_29_n_2,
      DOD => NLW_RAM_reg_448_511_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_38\
    );
RAM_reg_448_511_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_448_511_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_448_511_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_45\
    );
RAM_reg_448_511_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_448_511_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_448_511_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_46\
    );
RAM_reg_448_511_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_448_511_3_5_n_0,
      DOB => RAM_reg_448_511_3_5_n_1,
      DOC => RAM_reg_448_511_3_5_n_2,
      DOD => NLW_RAM_reg_448_511_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_6\
    );
RAM_reg_448_511_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_448_511_6_8_n_0,
      DOB => RAM_reg_448_511_6_8_n_1,
      DOC => RAM_reg_448_511_6_8_n_2,
      DOD => NLW_RAM_reg_448_511_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_10\
    );
RAM_reg_448_511_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_448_511_9_11_n_0,
      DOB => RAM_reg_448_511_9_11_n_1,
      DOC => RAM_reg_448_511_9_11_n_2,
      DOD => NLW_RAM_reg_448_511_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[7]_14\
    );
RAM_reg_64_127_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_64_127_0_2_n_0,
      DOB => RAM_reg_64_127_0_2_n_1,
      DOC => RAM_reg_64_127_0_2_n_2,
      DOD => NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]\
    );
RAM_reg_64_127_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_64_127_12_14_n_0,
      DOB => RAM_reg_64_127_12_14_n_1,
      DOC => RAM_reg_64_127_12_14_n_2,
      DOD => NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_11\
    );
RAM_reg_64_127_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_64_127_15_17_n_0,
      DOB => RAM_reg_64_127_15_17_n_1,
      DOC => RAM_reg_64_127_15_17_n_2,
      DOD => NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_14\
    );
RAM_reg_64_127_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_64_127_18_20_n_0,
      DOB => RAM_reg_64_127_18_20_n_1,
      DOC => RAM_reg_64_127_18_20_n_2,
      DOD => NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_17\
    );
RAM_reg_64_127_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_64_127_21_23_n_0,
      DOB => RAM_reg_64_127_21_23_n_1,
      DOC => RAM_reg_64_127_21_23_n_2,
      DOD => NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_20\
    );
RAM_reg_64_127_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_64_127_24_26_n_0,
      DOB => RAM_reg_64_127_24_26_n_1,
      DOC => RAM_reg_64_127_24_26_n_2,
      DOD => NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_23\
    );
RAM_reg_64_127_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => ADDRA(5 downto 0),
      ADDRB(5 downto 0) => ADDRA(5 downto 0),
      ADDRC(5 downto 0) => ADDRA(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_64_127_27_29_n_0,
      DOB => RAM_reg_64_127_27_29_n_1,
      DOC => RAM_reg_64_127_27_29_n_2,
      DOD => NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_26\
    );
RAM_reg_64_127_30_30: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(30),
      DPO => RAM_reg_64_127_30_30_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_64_127_30_30_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_29\
    );
RAM_reg_64_127_31_31: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gic0.gc0.count_d2_reg[5]\(0),
      A1 => \gic0.gc0.count_d2_reg[5]\(1),
      A2 => \gic0.gc0.count_d2_reg[5]\(2),
      A3 => \gic0.gc0.count_d2_reg[5]\(3),
      A4 => \gic0.gc0.count_d2_reg[5]\(4),
      A5 => \gic0.gc0.count_d2_reg[5]\(5),
      D => din(31),
      DPO => RAM_reg_64_127_31_31_n_0,
      DPRA0 => ADDRA(0),
      DPRA1 => ADDRA(1),
      DPRA2 => ADDRA(2),
      DPRA3 => ADDRA(3),
      DPRA4 => ADDRA(4),
      DPRA5 => ADDRA(5),
      SPO => NLW_RAM_reg_64_127_31_31_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_30\
    );
RAM_reg_64_127_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_64_127_3_5_n_0,
      DOB => RAM_reg_64_127_3_5_n_1,
      DOC => RAM_reg_64_127_3_5_n_2,
      DOD => NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_2\
    );
RAM_reg_64_127_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_64_127_6_8_n_0,
      DOB => RAM_reg_64_127_6_8_n_1,
      DOC => RAM_reg_64_127_6_8_n_2,
      DOD => NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_5\
    );
RAM_reg_64_127_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRB(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRC(5 downto 0) => \gc0.count_d1_reg[8]\(5 downto 0),
      ADDRD(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_64_127_9_11_n_0,
      DOB => RAM_reg_64_127_9_11_n_1,
      DOC => RAM_reg_64_127_9_11_n_2,
      DOD => NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gic0.gc0.count_d2_reg[8]_8\
    );
\gpr1.dout_i[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_0_2_n_0,
      I1 => RAM_reg_128_191_0_2_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_0_2_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_0_2_n_0,
      O => \gpr1.dout_i[0]_i_2_n_0\
    );
\gpr1.dout_i[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_0_2_n_0,
      I1 => RAM_reg_384_447_0_2_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_0_2_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_0_2_n_0,
      O => \gpr1.dout_i[0]_i_3_n_0\
    );
\gpr1.dout_i[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_9_11_n_1,
      I1 => RAM_reg_128_191_9_11_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_9_11_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_9_11_n_1,
      O => \gpr1.dout_i[10]_i_2_n_0\
    );
\gpr1.dout_i[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_9_11_n_1,
      I1 => RAM_reg_384_447_9_11_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_9_11_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_9_11_n_1,
      O => \gpr1.dout_i[10]_i_3_n_0\
    );
\gpr1.dout_i[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_9_11_n_2,
      I1 => RAM_reg_128_191_9_11_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_9_11_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_9_11_n_2,
      O => \gpr1.dout_i[11]_i_2_n_0\
    );
\gpr1.dout_i[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_9_11_n_2,
      I1 => RAM_reg_384_447_9_11_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_9_11_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_9_11_n_2,
      O => \gpr1.dout_i[11]_i_3_n_0\
    );
\gpr1.dout_i[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_12_14_n_0,
      I1 => RAM_reg_128_191_12_14_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_12_14_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_12_14_n_0,
      O => \gpr1.dout_i[12]_i_2_n_0\
    );
\gpr1.dout_i[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_12_14_n_0,
      I1 => RAM_reg_384_447_12_14_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_12_14_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_12_14_n_0,
      O => \gpr1.dout_i[12]_i_3_n_0\
    );
\gpr1.dout_i[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_12_14_n_1,
      I1 => RAM_reg_128_191_12_14_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_12_14_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_12_14_n_1,
      O => \gpr1.dout_i[13]_i_2_n_0\
    );
\gpr1.dout_i[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_12_14_n_1,
      I1 => RAM_reg_384_447_12_14_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_12_14_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_12_14_n_1,
      O => \gpr1.dout_i[13]_i_3_n_0\
    );
\gpr1.dout_i[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_12_14_n_2,
      I1 => RAM_reg_128_191_12_14_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_12_14_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_12_14_n_2,
      O => \gpr1.dout_i[14]_i_2_n_0\
    );
\gpr1.dout_i[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_12_14_n_2,
      I1 => RAM_reg_384_447_12_14_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_12_14_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_12_14_n_2,
      O => \gpr1.dout_i[14]_i_3_n_0\
    );
\gpr1.dout_i[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_15_17_n_0,
      I1 => RAM_reg_128_191_15_17_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_15_17_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_15_17_n_0,
      O => \gpr1.dout_i[15]_i_2_n_0\
    );
\gpr1.dout_i[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_15_17_n_0,
      I1 => RAM_reg_384_447_15_17_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_15_17_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_15_17_n_0,
      O => \gpr1.dout_i[15]_i_3_n_0\
    );
\gpr1.dout_i[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_15_17_n_1,
      I1 => RAM_reg_128_191_15_17_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_15_17_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_15_17_n_1,
      O => \gpr1.dout_i[16]_i_2_n_0\
    );
\gpr1.dout_i[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_15_17_n_1,
      I1 => RAM_reg_384_447_15_17_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_15_17_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_15_17_n_1,
      O => \gpr1.dout_i[16]_i_3_n_0\
    );
\gpr1.dout_i[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_15_17_n_2,
      I1 => RAM_reg_128_191_15_17_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_15_17_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_15_17_n_2,
      O => \gpr1.dout_i[17]_i_2_n_0\
    );
\gpr1.dout_i[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_15_17_n_2,
      I1 => RAM_reg_384_447_15_17_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_15_17_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_15_17_n_2,
      O => \gpr1.dout_i[17]_i_3_n_0\
    );
\gpr1.dout_i[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_18_20_n_0,
      I1 => RAM_reg_128_191_18_20_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_18_20_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_18_20_n_0,
      O => \gpr1.dout_i[18]_i_2_n_0\
    );
\gpr1.dout_i[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_18_20_n_0,
      I1 => RAM_reg_384_447_18_20_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_18_20_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_18_20_n_0,
      O => \gpr1.dout_i[18]_i_3_n_0\
    );
\gpr1.dout_i[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_18_20_n_1,
      I1 => RAM_reg_128_191_18_20_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_18_20_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_18_20_n_1,
      O => \gpr1.dout_i[19]_i_2_n_0\
    );
\gpr1.dout_i[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_18_20_n_1,
      I1 => RAM_reg_384_447_18_20_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_18_20_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_18_20_n_1,
      O => \gpr1.dout_i[19]_i_3_n_0\
    );
\gpr1.dout_i[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_0_2_n_1,
      I1 => RAM_reg_128_191_0_2_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_0_2_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_0_2_n_1,
      O => \gpr1.dout_i[1]_i_2_n_0\
    );
\gpr1.dout_i[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_0_2_n_1,
      I1 => RAM_reg_384_447_0_2_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_0_2_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_0_2_n_1,
      O => \gpr1.dout_i[1]_i_3_n_0\
    );
\gpr1.dout_i[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_18_20_n_2,
      I1 => RAM_reg_128_191_18_20_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_18_20_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_18_20_n_2,
      O => \gpr1.dout_i[20]_i_2_n_0\
    );
\gpr1.dout_i[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_18_20_n_2,
      I1 => RAM_reg_384_447_18_20_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_18_20_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_18_20_n_2,
      O => \gpr1.dout_i[20]_i_3_n_0\
    );
\gpr1.dout_i[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_21_23_n_0,
      I1 => RAM_reg_128_191_21_23_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_21_23_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_21_23_n_0,
      O => \gpr1.dout_i[21]_i_2_n_0\
    );
\gpr1.dout_i[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_21_23_n_0,
      I1 => RAM_reg_384_447_21_23_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_21_23_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_21_23_n_0,
      O => \gpr1.dout_i[21]_i_3_n_0\
    );
\gpr1.dout_i[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_21_23_n_1,
      I1 => RAM_reg_128_191_21_23_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_21_23_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_21_23_n_1,
      O => \gpr1.dout_i[22]_i_2_n_0\
    );
\gpr1.dout_i[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_21_23_n_1,
      I1 => RAM_reg_384_447_21_23_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_21_23_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_21_23_n_1,
      O => \gpr1.dout_i[22]_i_3_n_0\
    );
\gpr1.dout_i[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_21_23_n_2,
      I1 => RAM_reg_128_191_21_23_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_21_23_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_21_23_n_2,
      O => \gpr1.dout_i[23]_i_2_n_0\
    );
\gpr1.dout_i[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_21_23_n_2,
      I1 => RAM_reg_384_447_21_23_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_21_23_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_21_23_n_2,
      O => \gpr1.dout_i[23]_i_3_n_0\
    );
\gpr1.dout_i[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_24_26_n_0,
      I1 => RAM_reg_128_191_24_26_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_24_26_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_24_26_n_0,
      O => \gpr1.dout_i[24]_i_2_n_0\
    );
\gpr1.dout_i[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_24_26_n_0,
      I1 => RAM_reg_384_447_24_26_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_24_26_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_24_26_n_0,
      O => \gpr1.dout_i[24]_i_3_n_0\
    );
\gpr1.dout_i[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_24_26_n_1,
      I1 => RAM_reg_128_191_24_26_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_24_26_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_24_26_n_1,
      O => \gpr1.dout_i[25]_i_2_n_0\
    );
\gpr1.dout_i[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_24_26_n_1,
      I1 => RAM_reg_384_447_24_26_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_24_26_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_24_26_n_1,
      O => \gpr1.dout_i[25]_i_3_n_0\
    );
\gpr1.dout_i[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_24_26_n_2,
      I1 => RAM_reg_128_191_24_26_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_24_26_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_24_26_n_2,
      O => \gpr1.dout_i[26]_i_2_n_0\
    );
\gpr1.dout_i[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_24_26_n_2,
      I1 => RAM_reg_384_447_24_26_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_24_26_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_24_26_n_2,
      O => \gpr1.dout_i[26]_i_3_n_0\
    );
\gpr1.dout_i[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_27_29_n_0,
      I1 => RAM_reg_128_191_27_29_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_27_29_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_27_29_n_0,
      O => \gpr1.dout_i[27]_i_2_n_0\
    );
\gpr1.dout_i[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_27_29_n_0,
      I1 => RAM_reg_384_447_27_29_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_27_29_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_27_29_n_0,
      O => \gpr1.dout_i[27]_i_3_n_0\
    );
\gpr1.dout_i[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_27_29_n_1,
      I1 => RAM_reg_128_191_27_29_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_27_29_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_27_29_n_1,
      O => \gpr1.dout_i[28]_i_2_n_0\
    );
\gpr1.dout_i[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_27_29_n_1,
      I1 => RAM_reg_384_447_27_29_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_27_29_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_27_29_n_1,
      O => \gpr1.dout_i[28]_i_3_n_0\
    );
\gpr1.dout_i[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_27_29_n_2,
      I1 => RAM_reg_128_191_27_29_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_27_29_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_27_29_n_2,
      O => \gpr1.dout_i[29]_i_2_n_0\
    );
\gpr1.dout_i[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_27_29_n_2,
      I1 => RAM_reg_384_447_27_29_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_27_29_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_27_29_n_2,
      O => \gpr1.dout_i[29]_i_3_n_0\
    );
\gpr1.dout_i[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_0_2_n_2,
      I1 => RAM_reg_128_191_0_2_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_0_2_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_0_2_n_2,
      O => \gpr1.dout_i[2]_i_2_n_0\
    );
\gpr1.dout_i[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_0_2_n_2,
      I1 => RAM_reg_384_447_0_2_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_0_2_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_0_2_n_2,
      O => \gpr1.dout_i[2]_i_3_n_0\
    );
\gpr1.dout_i[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_30_30_n_0,
      I1 => RAM_reg_128_191_30_30_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_30_30_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_30_30_n_0,
      O => \gpr1.dout_i[30]_i_2_n_0\
    );
\gpr1.dout_i[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_30_30_n_0,
      I1 => RAM_reg_384_447_30_30_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_30_30_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_30_30_n_0,
      O => \gpr1.dout_i[30]_i_3_n_0\
    );
\gpr1.dout_i[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_31_31_n_0,
      I1 => RAM_reg_128_191_31_31_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_31_31_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_31_31_n_0,
      O => \gpr1.dout_i[31]_i_3_n_0\
    );
\gpr1.dout_i[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_31_31_n_0,
      I1 => RAM_reg_384_447_31_31_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_31_31_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_31_31_n_0,
      O => \gpr1.dout_i[31]_i_4_n_0\
    );
\gpr1.dout_i[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_3_5_n_0,
      I1 => RAM_reg_128_191_3_5_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_3_5_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_3_5_n_0,
      O => \gpr1.dout_i[3]_i_2_n_0\
    );
\gpr1.dout_i[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_3_5_n_0,
      I1 => RAM_reg_384_447_3_5_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_3_5_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_3_5_n_0,
      O => \gpr1.dout_i[3]_i_3_n_0\
    );
\gpr1.dout_i[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_3_5_n_1,
      I1 => RAM_reg_128_191_3_5_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_3_5_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_3_5_n_1,
      O => \gpr1.dout_i[4]_i_2_n_0\
    );
\gpr1.dout_i[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_3_5_n_1,
      I1 => RAM_reg_384_447_3_5_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_3_5_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_3_5_n_1,
      O => \gpr1.dout_i[4]_i_3_n_0\
    );
\gpr1.dout_i[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_3_5_n_2,
      I1 => RAM_reg_128_191_3_5_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_3_5_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_3_5_n_2,
      O => \gpr1.dout_i[5]_i_2_n_0\
    );
\gpr1.dout_i[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_3_5_n_2,
      I1 => RAM_reg_384_447_3_5_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_3_5_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_3_5_n_2,
      O => \gpr1.dout_i[5]_i_3_n_0\
    );
\gpr1.dout_i[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_6_8_n_0,
      I1 => RAM_reg_128_191_6_8_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_6_8_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_6_8_n_0,
      O => \gpr1.dout_i[6]_i_2_n_0\
    );
\gpr1.dout_i[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_6_8_n_0,
      I1 => RAM_reg_384_447_6_8_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_6_8_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_6_8_n_0,
      O => \gpr1.dout_i[6]_i_3_n_0\
    );
\gpr1.dout_i[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_6_8_n_1,
      I1 => RAM_reg_128_191_6_8_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_6_8_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_6_8_n_1,
      O => \gpr1.dout_i[7]_i_2_n_0\
    );
\gpr1.dout_i[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_6_8_n_1,
      I1 => RAM_reg_384_447_6_8_n_1,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_6_8_n_1,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_6_8_n_1,
      O => \gpr1.dout_i[7]_i_3_n_0\
    );
\gpr1.dout_i[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_6_8_n_2,
      I1 => RAM_reg_128_191_6_8_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_6_8_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_6_8_n_2,
      O => \gpr1.dout_i[8]_i_2_n_0\
    );
\gpr1.dout_i[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_6_8_n_2,
      I1 => RAM_reg_384_447_6_8_n_2,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_6_8_n_2,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_6_8_n_2,
      O => \gpr1.dout_i[8]_i_3_n_0\
    );
\gpr1.dout_i[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_192_255_9_11_n_0,
      I1 => RAM_reg_128_191_9_11_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_64_127_9_11_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_0_63_9_11_n_0,
      O => \gpr1.dout_i[9]_i_2_n_0\
    );
\gpr1.dout_i[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => RAM_reg_448_511_9_11_n_0,
      I1 => RAM_reg_384_447_9_11_n_0,
      I2 => \gc0.count_d1_reg[8]\(7),
      I3 => RAM_reg_320_383_9_11_n_0,
      I4 => \gc0.count_d1_reg[8]\(6),
      I5 => RAM_reg_256_319_9_11_n_0,
      O => \gpr1.dout_i[9]_i_3_n_0\
    );
\gpr1.dout_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[0]_i_1_n_0\,
      Q => Q(0)
    );
\gpr1.dout_i_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[0]_i_2_n_0\,
      I1 => \gpr1.dout_i[0]_i_3_n_0\,
      O => \gpr1.dout_i_reg[0]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[10]_i_1_n_0\,
      Q => Q(10)
    );
\gpr1.dout_i_reg[10]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[10]_i_2_n_0\,
      I1 => \gpr1.dout_i[10]_i_3_n_0\,
      O => \gpr1.dout_i_reg[10]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[11]_i_1_n_0\,
      Q => Q(11)
    );
\gpr1.dout_i_reg[11]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[11]_i_2_n_0\,
      I1 => \gpr1.dout_i[11]_i_3_n_0\,
      O => \gpr1.dout_i_reg[11]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[12]_i_1_n_0\,
      Q => Q(12)
    );
\gpr1.dout_i_reg[12]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[12]_i_2_n_0\,
      I1 => \gpr1.dout_i[12]_i_3_n_0\,
      O => \gpr1.dout_i_reg[12]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[13]_i_1_n_0\,
      Q => Q(13)
    );
\gpr1.dout_i_reg[13]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[13]_i_2_n_0\,
      I1 => \gpr1.dout_i[13]_i_3_n_0\,
      O => \gpr1.dout_i_reg[13]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[14]_i_1_n_0\,
      Q => Q(14)
    );
\gpr1.dout_i_reg[14]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[14]_i_2_n_0\,
      I1 => \gpr1.dout_i[14]_i_3_n_0\,
      O => \gpr1.dout_i_reg[14]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[15]_i_1_n_0\,
      Q => Q(15)
    );
\gpr1.dout_i_reg[15]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[15]_i_2_n_0\,
      I1 => \gpr1.dout_i[15]_i_3_n_0\,
      O => \gpr1.dout_i_reg[15]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[16]_i_1_n_0\,
      Q => Q(16)
    );
\gpr1.dout_i_reg[16]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[16]_i_2_n_0\,
      I1 => \gpr1.dout_i[16]_i_3_n_0\,
      O => \gpr1.dout_i_reg[16]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[17]_i_1_n_0\,
      Q => Q(17)
    );
\gpr1.dout_i_reg[17]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[17]_i_2_n_0\,
      I1 => \gpr1.dout_i[17]_i_3_n_0\,
      O => \gpr1.dout_i_reg[17]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[18]_i_1_n_0\,
      Q => Q(18)
    );
\gpr1.dout_i_reg[18]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[18]_i_2_n_0\,
      I1 => \gpr1.dout_i[18]_i_3_n_0\,
      O => \gpr1.dout_i_reg[18]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[19]_i_1_n_0\,
      Q => Q(19)
    );
\gpr1.dout_i_reg[19]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[19]_i_2_n_0\,
      I1 => \gpr1.dout_i[19]_i_3_n_0\,
      O => \gpr1.dout_i_reg[19]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[1]_i_1_n_0\,
      Q => Q(1)
    );
\gpr1.dout_i_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[1]_i_2_n_0\,
      I1 => \gpr1.dout_i[1]_i_3_n_0\,
      O => \gpr1.dout_i_reg[1]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[20]_i_1_n_0\,
      Q => Q(20)
    );
\gpr1.dout_i_reg[20]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[20]_i_2_n_0\,
      I1 => \gpr1.dout_i[20]_i_3_n_0\,
      O => \gpr1.dout_i_reg[20]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[21]_i_1_n_0\,
      Q => Q(21)
    );
\gpr1.dout_i_reg[21]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[21]_i_2_n_0\,
      I1 => \gpr1.dout_i[21]_i_3_n_0\,
      O => \gpr1.dout_i_reg[21]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[22]_i_1_n_0\,
      Q => Q(22)
    );
\gpr1.dout_i_reg[22]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[22]_i_2_n_0\,
      I1 => \gpr1.dout_i[22]_i_3_n_0\,
      O => \gpr1.dout_i_reg[22]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[23]_i_1_n_0\,
      Q => Q(23)
    );
\gpr1.dout_i_reg[23]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[23]_i_2_n_0\,
      I1 => \gpr1.dout_i[23]_i_3_n_0\,
      O => \gpr1.dout_i_reg[23]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[24]_i_1_n_0\,
      Q => Q(24)
    );
\gpr1.dout_i_reg[24]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[24]_i_2_n_0\,
      I1 => \gpr1.dout_i[24]_i_3_n_0\,
      O => \gpr1.dout_i_reg[24]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[25]_i_1_n_0\,
      Q => Q(25)
    );
\gpr1.dout_i_reg[25]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[25]_i_2_n_0\,
      I1 => \gpr1.dout_i[25]_i_3_n_0\,
      O => \gpr1.dout_i_reg[25]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[26]_i_1_n_0\,
      Q => Q(26)
    );
\gpr1.dout_i_reg[26]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[26]_i_2_n_0\,
      I1 => \gpr1.dout_i[26]_i_3_n_0\,
      O => \gpr1.dout_i_reg[26]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[27]_i_1_n_0\,
      Q => Q(27)
    );
\gpr1.dout_i_reg[27]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[27]_i_2_n_0\,
      I1 => \gpr1.dout_i[27]_i_3_n_0\,
      O => \gpr1.dout_i_reg[27]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[28]_i_1_n_0\,
      Q => Q(28)
    );
\gpr1.dout_i_reg[28]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[28]_i_2_n_0\,
      I1 => \gpr1.dout_i[28]_i_3_n_0\,
      O => \gpr1.dout_i_reg[28]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[29]_i_1_n_0\,
      Q => Q(29)
    );
\gpr1.dout_i_reg[29]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[29]_i_2_n_0\,
      I1 => \gpr1.dout_i[29]_i_3_n_0\,
      O => \gpr1.dout_i_reg[29]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[2]_i_1_n_0\,
      Q => Q(2)
    );
\gpr1.dout_i_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[2]_i_2_n_0\,
      I1 => \gpr1.dout_i[2]_i_3_n_0\,
      O => \gpr1.dout_i_reg[2]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[30]_i_1_n_0\,
      Q => Q(30)
    );
\gpr1.dout_i_reg[30]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[30]_i_2_n_0\,
      I1 => \gpr1.dout_i[30]_i_3_n_0\,
      O => \gpr1.dout_i_reg[30]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[31]_i_2_n_0\,
      Q => Q(31)
    );
\gpr1.dout_i_reg[31]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[31]_i_3_n_0\,
      I1 => \gpr1.dout_i[31]_i_4_n_0\,
      O => \gpr1.dout_i_reg[31]_i_2_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[3]_i_1_n_0\,
      Q => Q(3)
    );
\gpr1.dout_i_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[3]_i_2_n_0\,
      I1 => \gpr1.dout_i[3]_i_3_n_0\,
      O => \gpr1.dout_i_reg[3]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[4]_i_1_n_0\,
      Q => Q(4)
    );
\gpr1.dout_i_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[4]_i_2_n_0\,
      I1 => \gpr1.dout_i[4]_i_3_n_0\,
      O => \gpr1.dout_i_reg[4]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[5]_i_1_n_0\,
      Q => Q(5)
    );
\gpr1.dout_i_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[5]_i_2_n_0\,
      I1 => \gpr1.dout_i[5]_i_3_n_0\,
      O => \gpr1.dout_i_reg[5]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[6]_i_1_n_0\,
      Q => Q(6)
    );
\gpr1.dout_i_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[6]_i_2_n_0\,
      I1 => \gpr1.dout_i[6]_i_3_n_0\,
      O => \gpr1.dout_i_reg[6]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[7]_i_1_n_0\,
      Q => Q(7)
    );
\gpr1.dout_i_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[7]_i_2_n_0\,
      I1 => \gpr1.dout_i[7]_i_3_n_0\,
      O => \gpr1.dout_i_reg[7]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[8]_i_1_n_0\,
      Q => Q(8)
    );
\gpr1.dout_i_reg[8]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[8]_i_2_n_0\,
      I1 => \gpr1.dout_i[8]_i_3_n_0\,
      O => \gpr1.dout_i_reg[8]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
\gpr1.dout_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0),
      D => \gpr1.dout_i_reg[9]_i_1_n_0\,
      Q => Q(9)
    );
\gpr1.dout_i_reg[9]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \gpr1.dout_i[9]_i_2_n_0\,
      I1 => \gpr1.dout_i[9]_i_3_n_0\,
      O => \gpr1.dout_i_reg[9]_i_1_n_0\,
      S => \gc0.count_d1_reg[8]\(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_rd_bin_cntr is
  port (
    ram_empty_fb_i_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    v1_reg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rd_pntr_gc_reg[8]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \rd_pntr_gc_reg[5]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[4]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[3]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[2]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[1]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[0]\ : out STD_LOGIC;
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 8 downto 0 );
    ram_empty_fb_i_reg_0 : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_rd_bin_cntr : entity is "rd_bin_cntr";
end bitfile_fifo_in_rd_bin_cntr;

architecture STRUCTURE of bitfile_fifo_in_rd_bin_cntr is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \gc0.count[8]_i_2_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^rd_pntr_gc_reg[0]\ : STD_LOGIC;
  signal \^rd_pntr_gc_reg[1]\ : STD_LOGIC;
  signal \^rd_pntr_gc_reg[2]\ : STD_LOGIC;
  signal \^rd_pntr_gc_reg[3]\ : STD_LOGIC;
  signal \^rd_pntr_gc_reg[4]\ : STD_LOGIC;
  signal \^rd_pntr_gc_reg[5]\ : STD_LOGIC;
  signal \^rd_pntr_gc_reg[8]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 8 to 8 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \gc0.count[6]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gc0.count[7]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gc0.count[8]_i_2\ : label is "soft_lutpair13";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[0]\ : label is "gc0.count_d1_reg[0]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[0]_rep\ : label is "gc0.count_d1_reg[0]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[1]\ : label is "gc0.count_d1_reg[1]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[1]_rep\ : label is "gc0.count_d1_reg[1]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[2]\ : label is "gc0.count_d1_reg[2]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[2]_rep\ : label is "gc0.count_d1_reg[2]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[3]\ : label is "gc0.count_d1_reg[3]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[3]_rep\ : label is "gc0.count_d1_reg[3]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[4]\ : label is "gc0.count_d1_reg[4]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[4]_rep\ : label is "gc0.count_d1_reg[4]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[5]\ : label is "gc0.count_d1_reg[5]";
  attribute ORIG_CELL_NAME of \gc0.count_d1_reg[5]_rep\ : label is "gc0.count_d1_reg[5]";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \rd_pntr_gc_reg[0]\ <= \^rd_pntr_gc_reg[0]\;
  \rd_pntr_gc_reg[1]\ <= \^rd_pntr_gc_reg[1]\;
  \rd_pntr_gc_reg[2]\ <= \^rd_pntr_gc_reg[2]\;
  \rd_pntr_gc_reg[3]\ <= \^rd_pntr_gc_reg[3]\;
  \rd_pntr_gc_reg[4]\ <= \^rd_pntr_gc_reg[4]\;
  \rd_pntr_gc_reg[5]\ <= \^rd_pntr_gc_reg[5]\;
  \rd_pntr_gc_reg[8]\(8 downto 0) <= \^rd_pntr_gc_reg[8]\(8 downto 0);
\gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => plusOp(0)
    );
\gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => plusOp(1)
    );
\gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => plusOp(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => plusOp(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => plusOp(4)
    );
\gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^q\(4),
      O => plusOp(5)
    );
\gc0.count[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \gc0.count[8]_i_2_n_0\,
      I3 => \^q\(5),
      O => plusOp(6)
    );
\gc0.count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \gc0.count[8]_i_2_n_0\,
      I3 => \^q\(4),
      I4 => \^q\(6),
      O => plusOp(7)
    );
\gc0.count[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => rd_pntr_plus1(8),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \gc0.count[8]_i_2_n_0\,
      I4 => \^q\(5),
      I5 => \^q\(7),
      O => plusOp(8)
    );
\gc0.count[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => \gc0.count[8]_i_2_n_0\
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(0),
      Q => \^rd_pntr_gc_reg[8]\(0)
    );
\gc0.count_d1_reg[0]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(0),
      Q => \^rd_pntr_gc_reg[0]\
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(1),
      Q => \^rd_pntr_gc_reg[8]\(1)
    );
\gc0.count_d1_reg[1]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(1),
      Q => \^rd_pntr_gc_reg[1]\
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(2),
      Q => \^rd_pntr_gc_reg[8]\(2)
    );
\gc0.count_d1_reg[2]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(2),
      Q => \^rd_pntr_gc_reg[2]\
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(3),
      Q => \^rd_pntr_gc_reg[8]\(3)
    );
\gc0.count_d1_reg[3]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(3),
      Q => \^rd_pntr_gc_reg[3]\
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(4),
      Q => \^rd_pntr_gc_reg[8]\(4)
    );
\gc0.count_d1_reg[4]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(4),
      Q => \^rd_pntr_gc_reg[4]\
    );
\gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(5),
      Q => \^rd_pntr_gc_reg[8]\(5)
    );
\gc0.count_d1_reg[5]_rep\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(5),
      Q => \^rd_pntr_gc_reg[5]\
    );
\gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(6),
      Q => \^rd_pntr_gc_reg[8]\(6)
    );
\gc0.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => \^q\(7),
      Q => \^rd_pntr_gc_reg[8]\(7)
    );
\gc0.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => rd_pntr_plus1(8),
      Q => \^rd_pntr_gc_reg[8]\(8)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      D => plusOp(0),
      PRE => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      Q => \^q\(0)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(1),
      Q => \^q\(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(2),
      Q => \^q\(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(3),
      Q => \^q\(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(4),
      Q => \^q\(4)
    );
\gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(5),
      Q => \^q\(5)
    );
\gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(6),
      Q => \^q\(6)
    );
\gc0.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(7),
      Q => \^q\(7)
    );
\gc0.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => ram_empty_fb_i_reg_0,
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0),
      D => plusOp(8),
      Q => rd_pntr_plus1(8)
    );
\gmux.gm[0].gm1.m1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^rd_pntr_gc_reg[1]\,
      I1 => WR_PNTR_RD(1),
      I2 => \^rd_pntr_gc_reg[0]\,
      I3 => WR_PNTR_RD(0),
      O => v1_reg(0)
    );
\gmux.gm[1].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^rd_pntr_gc_reg[3]\,
      I1 => WR_PNTR_RD(3),
      I2 => \^rd_pntr_gc_reg[2]\,
      I3 => WR_PNTR_RD(2),
      O => v1_reg(1)
    );
\gmux.gm[2].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^rd_pntr_gc_reg[5]\,
      I1 => WR_PNTR_RD(5),
      I2 => \^rd_pntr_gc_reg[4]\,
      I3 => WR_PNTR_RD(4),
      O => v1_reg(2)
    );
\gmux.gm[3].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^rd_pntr_gc_reg[8]\(7),
      I1 => WR_PNTR_RD(7),
      I2 => \^rd_pntr_gc_reg[8]\(6),
      I3 => WR_PNTR_RD(6),
      O => v1_reg(3)
    );
\gmux.gm[4].gms.ms_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rd_pntr_plus1(8),
      I1 => WR_PNTR_RD(8),
      O => ram_empty_fb_i_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_rd_fwft is
  port (
    empty : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gc0.count_reg[8]\ : out STD_LOGIC;
    ram_empty_fb_i_reg : out STD_LOGIC;
    \goreg_dm.dout_i_reg[31]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_18_out : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    comp0 : in STD_LOGIC;
    comp1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_rd_fwft : entity is "rd_fwft";
end bitfile_fifo_in_rd_fwft;

architecture STRUCTURE of bitfile_fifo_in_rd_fwft is
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty_fwft_fb : STD_LOGIC;
  signal empty_fwft_i0 : STD_LOGIC;
  signal \gpregsm1.curr_fwft_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \gpregsm1.curr_fwft_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \gpregsm1.curr_fwft_state_reg_n_0_[1]\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of empty_fwft_fb_reg : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of empty_fwft_i_i_1 : label is "soft_lutpair10";
  attribute equivalent_register_removal of empty_fwft_i_reg : label is "no";
  attribute SOFT_HLUTNM of \gc0.count_d1[8]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \goreg_dm.dout_i[31]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \gpr1.dout_i[31]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[1]_i_1\ : label is "soft_lutpair9";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[1]\ : label is "no";
begin
empty_fwft_fb_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => Q(0),
      Q => empty_fwft_fb
    );
empty_fwft_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA22"
    )
        port map (
      I0 => empty_fwft_fb,
      I1 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I2 => rd_en,
      I3 => curr_fwft_state(0),
      O => empty_fwft_i0
    );
empty_fwft_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => Q(0),
      Q => empty
    );
\gc0.count_d1[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5515"
    )
        port map (
      I0 => p_18_out,
      I1 => curr_fwft_state(0),
      I2 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I3 => rd_en,
      O => \gc0.count_reg[8]\
    );
\goreg_dm.dout_i[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I1 => rd_en,
      I2 => curr_fwft_state(0),
      O => \goreg_dm.dout_i_reg[31]\(0)
    );
\gpr1.dout_i[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5515"
    )
        port map (
      I0 => p_18_out,
      I1 => curr_fwft_state(0),
      I2 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I3 => rd_en,
      O => E(0)
    );
\gpregsm1.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I1 => rd_en,
      I2 => curr_fwft_state(0),
      O => \gpregsm1.curr_fwft_state[0]_i_1_n_0\
    );
\gpregsm1.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I2 => rd_en,
      I3 => p_18_out,
      O => \gpregsm1.curr_fwft_state[1]_i_1_n_0\
    );
\gpregsm1.curr_fwft_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => \gpregsm1.curr_fwft_state[0]_i_1_n_0\,
      Q => curr_fwft_state(0)
    );
\gpregsm1.curr_fwft_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => Q(0),
      D => \gpregsm1.curr_fwft_state[1]_i_1_n_0\,
      Q => \gpregsm1.curr_fwft_state_reg_n_0_[1]\
    );
ram_empty_fb_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBABBBAAAAAAAA"
    )
        port map (
      I0 => comp0,
      I1 => p_18_out,
      I2 => curr_fwft_state(0),
      I3 => \gpregsm1.curr_fwft_state_reg_n_0_[1]\,
      I4 => rd_en,
      I5 => comp1,
      O => ram_empty_fb_i_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_reset_blk_ramfifo is
  port (
    s_aclk : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_reset_blk_ramfifo : entity is "reset_blk_ramfifo";
end bitfile_fifo_in_reset_blk_ramfifo;

architecture STRUCTURE of bitfile_fifo_in_reset_blk_ramfifo is
  signal inverted_reset : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_d1 : signal is "true";
  attribute msgon : string;
  attribute msgon of rst_d1 : signal is "true";
  signal rst_d2 : STD_LOGIC;
  attribute async_reg of rst_d2 : signal is "true";
  attribute msgon of rst_d2 : signal is "true";
  signal rst_d3 : STD_LOGIC;
  attribute async_reg of rst_d3 : signal is "true";
  attribute msgon of rst_d3 : signal is "true";
  signal rst_rd_reg1 : STD_LOGIC;
  attribute async_reg of rst_rd_reg1 : signal is "true";
  attribute msgon of rst_rd_reg1 : signal is "true";
  signal rst_rd_reg2 : STD_LOGIC;
  attribute async_reg of rst_rd_reg2 : signal is "true";
  attribute msgon of rst_rd_reg2 : signal is "true";
  signal rst_wr_reg1 : STD_LOGIC;
  attribute async_reg of rst_wr_reg1 : signal is "true";
  attribute msgon of rst_wr_reg1 : signal is "true";
  signal rst_wr_reg2 : STD_LOGIC;
  attribute async_reg of rst_wr_reg2 : signal is "true";
  attribute msgon of rst_wr_reg2 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "yes";
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is std.standard.true;
  attribute KEEP of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "yes";
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is std.standard.true;
  attribute KEEP of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "yes";
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\ : label is "true";
begin
\grstd1.grst_full.grst_f.rst_d1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => inverted_reset,
      Q => rst_d1
    );
\grstd1.grst_full.grst_f.rst_d2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => rst_d1,
      PRE => inverted_reset,
      Q => rst_d2
    );
\grstd1.grst_full.grst_f.rst_d3_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => rst_d2,
      PRE => inverted_reset,
      Q => rst_d3
    );
\ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_aclk,
      CE => '1',
      D => '0',
      PRE => inverted_reset,
      Q => rst_rd_reg1
    );
\ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_aclk,
      CE => '1',
      D => rst_rd_reg1,
      PRE => inverted_reset,
      Q => rst_rd_reg2
    );
\ngwrdrst.grst.g7serrst.rst_wr_reg1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_aresetn,
      O => inverted_reset
    );
\ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => inverted_reset,
      Q => rst_wr_reg1
    );
\ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_aclk,
      CE => '1',
      D => rst_wr_reg1,
      PRE => inverted_reset,
      Q => rst_wr_reg2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bitfile_fifo_in_reset_blk_ramfifo__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \gc0.count_d1_reg[0]_rep\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bitfile_fifo_in_reset_blk_ramfifo__parameterized0\ : entity is "reset_blk_ramfifo";
end \bitfile_fifo_in_reset_blk_ramfifo__parameterized0\;

architecture STRUCTURE of \bitfile_fifo_in_reset_blk_ramfifo__parameterized0\ is
  signal \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0\ : STD_LOGIC;
  signal \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1_n_0\ : STD_LOGIC;
  signal \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0\ : STD_LOGIC;
  signal \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1_n_0\ : STD_LOGIC;
  signal \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal rd_rst_asreg : STD_LOGIC;
  signal rd_rst_asreg_d2 : STD_LOGIC;
  signal rst_rd_reg1 : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_rd_reg1 : signal is "true";
  attribute msgon : string;
  attribute msgon of rst_rd_reg1 : signal is "true";
  signal rst_rd_reg2 : STD_LOGIC;
  attribute async_reg of rst_rd_reg2 : signal is "true";
  attribute msgon of rst_rd_reg2 : signal is "true";
  signal rst_wr_reg1 : STD_LOGIC;
  attribute async_reg of rst_wr_reg1 : signal is "true";
  attribute msgon of rst_wr_reg1 : signal is "true";
  signal rst_wr_reg2 : STD_LOGIC;
  attribute async_reg of rst_wr_reg2 : signal is "true";
  attribute msgon of rst_wr_reg2 : signal is "true";
  signal wr_rst_asreg : STD_LOGIC;
  signal wr_rst_asreg_d2 : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : label is "no";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\ : label is std.standard.true;
  attribute KEEP of \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\ : label is "yes";
  attribute msgon of \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\ : label is "true";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : label is "no";
begin
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => rd_rst_asreg,
      Q => \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0\,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0\,
      Q => rd_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_rst_asreg,
      I1 => \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg_n_0\,
      O => \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1_n_0\
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1_n_0\,
      PRE => rst_rd_reg2,
      Q => rd_rst_asreg
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_rst_asreg,
      I1 => rd_rst_asreg_d2,
      O => \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0\
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0\,
      Q => \gc0.count_d1_reg[0]_rep\(0)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0\,
      Q => \gc0.count_d1_reg[0]_rep\(1)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1_n_0\,
      Q => \gc0.count_d1_reg[0]_rep\(2)
    );
\ngwrdrst.grst.g7serrst.rst_rd_reg1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => rst,
      Q => rst_rd_reg1
    );
\ngwrdrst.grst.g7serrst.rst_rd_reg2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => rst_rd_reg1,
      PRE => rst,
      Q => rst_rd_reg2
    );
\ngwrdrst.grst.g7serrst.rst_wr_reg1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => rst,
      Q => rst_wr_reg1
    );
\ngwrdrst.grst.g7serrst.rst_wr_reg2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rst_wr_reg1,
      PRE => rst,
      Q => rst_wr_reg2
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => wr_rst_asreg,
      Q => \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0\,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0\,
      Q => wr_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => wr_rst_asreg,
      I1 => \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg_n_0\,
      O => \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1_n_0\
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1_n_0\,
      PRE => rst_wr_reg2,
      Q => wr_rst_asreg
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => wr_rst_asreg,
      I1 => wr_rst_asreg_d2,
      O => \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0\
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0\,
      Q => Q(0)
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1_n_0\,
      Q => Q(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_synchronizer_ff is
  port (
    D : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_synchronizer_ff : entity is "synchronizer_ff";
end bitfile_fifo_in_synchronizer_ff;

architecture STRUCTURE of bitfile_fifo_in_synchronizer_ff is
  signal Q_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute async_reg : string;
  attribute async_reg of Q_reg : signal is "true";
  attribute msgon : string;
  attribute msgon of Q_reg : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \Q_reg_reg[0]\ : label is "yes";
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[1]\ : label is "yes";
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[2]\ : label is "yes";
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[3]\ : label is "yes";
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[4]\ : label is "yes";
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[5]\ : label is "yes";
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[6]\ : label is "yes";
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[7]\ : label is "yes";
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[8]\ : label is "yes";
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
  D(8 downto 0) <= Q_reg(8 downto 0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(0),
      Q => Q_reg(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(1),
      Q => Q_reg(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(2),
      Q => Q_reg(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(3),
      Q => Q_reg(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(4),
      Q => Q_reg(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(5),
      Q => Q_reg(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(6),
      Q => Q_reg(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(7),
      Q => Q_reg(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(8),
      Q => Q_reg(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_synchronizer_ff_3 is
  port (
    D : out STD_LOGIC_VECTOR ( 8 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 8 downto 0 );
    wr_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_synchronizer_ff_3 : entity is "synchronizer_ff";
end bitfile_fifo_in_synchronizer_ff_3;

architecture STRUCTURE of bitfile_fifo_in_synchronizer_ff_3 is
  signal Q_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute async_reg : string;
  attribute async_reg of Q_reg : signal is "true";
  attribute msgon : string;
  attribute msgon of Q_reg : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \Q_reg_reg[0]\ : label is "yes";
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[1]\ : label is "yes";
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[2]\ : label is "yes";
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[3]\ : label is "yes";
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[4]\ : label is "yes";
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[5]\ : label is "yes";
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[6]\ : label is "yes";
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[7]\ : label is "yes";
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[8]\ : label is "yes";
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
  D(8 downto 0) <= Q_reg(8 downto 0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(0),
      Q => Q_reg(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(1),
      Q => Q_reg(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(2),
      Q => Q_reg(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(3),
      Q => Q_reg(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(4),
      Q => Q_reg(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(5),
      Q => Q_reg(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(6),
      Q => Q_reg(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(7),
      Q => Q_reg(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => Q(8),
      Q => Q_reg(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_synchronizer_ff_4 is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_pntr_bin_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_synchronizer_ff_4 : entity is "synchronizer_ff";
end bitfile_fifo_in_synchronizer_ff_4;

architecture STRUCTURE of bitfile_fifo_in_synchronizer_ff_4 is
  signal Q_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute async_reg : string;
  attribute async_reg of Q_reg : signal is "true";
  attribute msgon : string;
  attribute msgon of Q_reg : signal is "true";
  signal \wr_pntr_bin[2]_i_2_n_0\ : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \Q_reg_reg[0]\ : label is "yes";
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[1]\ : label is "yes";
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[2]\ : label is "yes";
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[3]\ : label is "yes";
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[4]\ : label is "yes";
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[5]\ : label is "yes";
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[6]\ : label is "yes";
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[7]\ : label is "yes";
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[8]\ : label is "yes";
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
  \out\(0) <= Q_reg(8);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(0),
      Q => Q_reg(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(1),
      Q => Q_reg(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(2),
      Q => Q_reg(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(3),
      Q => Q_reg(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(4),
      Q => Q_reg(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(5),
      Q => Q_reg(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(6),
      Q => Q_reg(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(7),
      Q => Q_reg(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => D(8),
      Q => Q_reg(8)
    );
\wr_pntr_bin[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => Q_reg(1),
      I1 => Q_reg(0),
      I2 => \wr_pntr_bin[2]_i_2_n_0\,
      I3 => Q_reg(3),
      I4 => Q_reg(2),
      I5 => Q_reg(8),
      O => \wr_pntr_bin_reg[7]\(0)
    );
\wr_pntr_bin[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \wr_pntr_bin[2]_i_2_n_0\,
      I1 => Q_reg(3),
      I2 => Q_reg(2),
      I3 => Q_reg(8),
      I4 => Q_reg(1),
      O => \wr_pntr_bin_reg[7]\(1)
    );
\wr_pntr_bin[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q_reg(8),
      I1 => Q_reg(2),
      I2 => Q_reg(3),
      I3 => \wr_pntr_bin[2]_i_2_n_0\,
      O => \wr_pntr_bin_reg[7]\(2)
    );
\wr_pntr_bin[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q_reg(7),
      I1 => Q_reg(6),
      I2 => Q_reg(5),
      I3 => Q_reg(4),
      O => \wr_pntr_bin[2]_i_2_n_0\
    );
\wr_pntr_bin[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => Q_reg(5),
      I1 => Q_reg(3),
      I2 => Q_reg(4),
      I3 => Q_reg(8),
      I4 => Q_reg(6),
      I5 => Q_reg(7),
      O => \wr_pntr_bin_reg[7]\(3)
    );
\wr_pntr_bin[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => Q_reg(6),
      I1 => Q_reg(4),
      I2 => Q_reg(5),
      I3 => Q_reg(8),
      I4 => Q_reg(7),
      O => \wr_pntr_bin_reg[7]\(4)
    );
\wr_pntr_bin[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q_reg(6),
      I1 => Q_reg(5),
      I2 => Q_reg(8),
      I3 => Q_reg(7),
      O => \wr_pntr_bin_reg[7]\(5)
    );
\wr_pntr_bin[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => Q_reg(7),
      I1 => Q_reg(6),
      I2 => Q_reg(8),
      O => \wr_pntr_bin_reg[7]\(6)
    );
\wr_pntr_bin[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q_reg(7),
      I1 => Q_reg(8),
      O => \wr_pntr_bin_reg[7]\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_synchronizer_ff_5 is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \rd_pntr_bin_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    wr_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_synchronizer_ff_5 : entity is "synchronizer_ff";
end bitfile_fifo_in_synchronizer_ff_5;

architecture STRUCTURE of bitfile_fifo_in_synchronizer_ff_5 is
  signal Q_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute async_reg : string;
  attribute async_reg of Q_reg : signal is "true";
  attribute msgon : string;
  attribute msgon of Q_reg : signal is "true";
  signal \rd_pntr_bin[2]_i_2_n_0\ : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \Q_reg_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \Q_reg_reg[0]\ : label is "yes";
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[1]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[1]\ : label is "yes";
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[2]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[2]\ : label is "yes";
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[3]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[3]\ : label is "yes";
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[4]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[4]\ : label is "yes";
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[5]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[5]\ : label is "yes";
  attribute msgon of \Q_reg_reg[5]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[6]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[6]\ : label is "yes";
  attribute msgon of \Q_reg_reg[6]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[7]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[7]\ : label is "yes";
  attribute msgon of \Q_reg_reg[7]\ : label is "true";
  attribute ASYNC_REG_boolean of \Q_reg_reg[8]\ : label is std.standard.true;
  attribute KEEP of \Q_reg_reg[8]\ : label is "yes";
  attribute msgon of \Q_reg_reg[8]\ : label is "true";
begin
  \out\(0) <= Q_reg(8);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(0),
      Q => Q_reg(0)
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(1),
      Q => Q_reg(1)
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(2),
      Q => Q_reg(2)
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(3),
      Q => Q_reg(3)
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(4),
      Q => Q_reg(4)
    );
\Q_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(5),
      Q => Q_reg(5)
    );
\Q_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(6),
      Q => Q_reg(6)
    );
\Q_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(7),
      Q => Q_reg(7)
    );
\Q_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => D(8),
      Q => Q_reg(8)
    );
\rd_pntr_bin[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => Q_reg(1),
      I1 => Q_reg(0),
      I2 => \rd_pntr_bin[2]_i_2_n_0\,
      I3 => Q_reg(3),
      I4 => Q_reg(2),
      I5 => Q_reg(8),
      O => \rd_pntr_bin_reg[7]\(0)
    );
\rd_pntr_bin[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \rd_pntr_bin[2]_i_2_n_0\,
      I1 => Q_reg(3),
      I2 => Q_reg(2),
      I3 => Q_reg(8),
      I4 => Q_reg(1),
      O => \rd_pntr_bin_reg[7]\(1)
    );
\rd_pntr_bin[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q_reg(8),
      I1 => Q_reg(2),
      I2 => Q_reg(3),
      I3 => \rd_pntr_bin[2]_i_2_n_0\,
      O => \rd_pntr_bin_reg[7]\(2)
    );
\rd_pntr_bin[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q_reg(7),
      I1 => Q_reg(6),
      I2 => Q_reg(5),
      I3 => Q_reg(4),
      O => \rd_pntr_bin[2]_i_2_n_0\
    );
\rd_pntr_bin[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => Q_reg(5),
      I1 => Q_reg(3),
      I2 => Q_reg(4),
      I3 => Q_reg(8),
      I4 => Q_reg(6),
      I5 => Q_reg(7),
      O => \rd_pntr_bin_reg[7]\(3)
    );
\rd_pntr_bin[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => Q_reg(6),
      I1 => Q_reg(4),
      I2 => Q_reg(5),
      I3 => Q_reg(8),
      I4 => Q_reg(7),
      O => \rd_pntr_bin_reg[7]\(4)
    );
\rd_pntr_bin[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => Q_reg(6),
      I1 => Q_reg(5),
      I2 => Q_reg(8),
      I3 => Q_reg(7),
      O => \rd_pntr_bin_reg[7]\(5)
    );
\rd_pntr_bin[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => Q_reg(7),
      I1 => Q_reg(6),
      I2 => Q_reg(8),
      O => \rd_pntr_bin_reg[7]\(6)
    );
\rd_pntr_bin[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q_reg(7),
      I1 => Q_reg(8),
      O => \rd_pntr_bin_reg[7]\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_wr_bin_cntr is
  port (
    ram_full_i_reg : out STD_LOGIC;
    ram_full_i_reg_0 : out STD_LOGIC;
    ram_full_i_reg_1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \gpr1.dout_i_reg[31]\ : out STD_LOGIC;
    \wr_pntr_gc_reg[8]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \gpr1.dout_i_reg[30]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_6\ : out STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    comp1 : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    p_0_out : in STD_LOGIC;
    comp2 : in STD_LOGIC;
    RD_PNTR_WR : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_wr_bin_cntr : entity is "wr_bin_cntr";
end bitfile_fifo_in_wr_bin_cntr;

architecture STRUCTURE of bitfile_fifo_in_wr_bin_cntr is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \gic0.gc0.count[8]_i_2_n_0\ : STD_LOGIC;
  signal \^gic0.gc0.count_d2_reg[7]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_8_out : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^wr_pntr_gc_reg[8]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 8 to 8 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gic0.gc0.count[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gic0.gc0.count[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gic0.gc0.count[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gic0.gc0.count[6]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gic0.gc0.count[7]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gic0.gc0.count[8]_i_2\ : label is "soft_lutpair16";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \gic0.gc0.count_d2_reg[7]_0\(7 downto 0) <= \^gic0.gc0.count_d2_reg[7]_0\(7 downto 0);
  \wr_pntr_gc_reg[8]\(8 downto 0) <= \^wr_pntr_gc_reg[8]\(8 downto 0);
RAM_reg_0_63_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[0]_2\
    );
RAM_reg_0_63_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[12]_2\
    );
RAM_reg_0_63_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[15]_2\
    );
RAM_reg_0_63_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[18]_2\
    );
RAM_reg_0_63_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[21]_2\
    );
RAM_reg_0_63_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[24]_2\
    );
RAM_reg_0_63_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[27]_2\
    );
RAM_reg_0_63_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[30]_2\
    );
RAM_reg_0_63_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[31]_2\
    );
RAM_reg_0_63_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[3]_2\
    );
RAM_reg_0_63_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[6]_2\
    );
RAM_reg_0_63_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => \^wr_pntr_gc_reg[8]\(8),
      I3 => wr_en,
      I4 => p_0_out,
      O => \gpr1.dout_i_reg[9]_2\
    );
RAM_reg_128_191_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_128_191_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[12]_0\
    );
RAM_reg_128_191_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[15]_0\
    );
RAM_reg_128_191_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[18]_0\
    );
RAM_reg_128_191_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[21]_0\
    );
RAM_reg_128_191_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[24]_0\
    );
RAM_reg_128_191_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[27]_0\
    );
RAM_reg_128_191_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[30]_0\
    );
RAM_reg_128_191_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[31]_0\
    );
RAM_reg_128_191_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[3]_0\
    );
RAM_reg_128_191_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[6]_0\
    );
RAM_reg_128_191_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(6),
      I4 => \^wr_pntr_gc_reg[8]\(7),
      O => \gpr1.dout_i_reg[9]_0\
    );
RAM_reg_192_255_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[0]\
    );
RAM_reg_192_255_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[12]\
    );
RAM_reg_192_255_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[15]\
    );
RAM_reg_192_255_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[18]\
    );
RAM_reg_192_255_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[21]\
    );
RAM_reg_192_255_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[24]\
    );
RAM_reg_192_255_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[27]\
    );
RAM_reg_192_255_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[30]\
    );
RAM_reg_192_255_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[31]\
    );
RAM_reg_192_255_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[3]\
    );
RAM_reg_192_255_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[6]\
    );
RAM_reg_192_255_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[9]\
    );
RAM_reg_256_319_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[0]_3\
    );
RAM_reg_256_319_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[12]_3\
    );
RAM_reg_256_319_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[15]_3\
    );
RAM_reg_256_319_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[18]_3\
    );
RAM_reg_256_319_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[21]_3\
    );
RAM_reg_256_319_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[24]_3\
    );
RAM_reg_256_319_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[27]_3\
    );
RAM_reg_256_319_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[30]_3\
    );
RAM_reg_256_319_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[31]_3\
    );
RAM_reg_256_319_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[3]_3\
    );
RAM_reg_256_319_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[6]_3\
    );
RAM_reg_256_319_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[9]_3\
    );
RAM_reg_320_383_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[0]_4\
    );
RAM_reg_320_383_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[12]_4\
    );
RAM_reg_320_383_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[15]_4\
    );
RAM_reg_320_383_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[18]_4\
    );
RAM_reg_320_383_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[21]_4\
    );
RAM_reg_320_383_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[24]_4\
    );
RAM_reg_320_383_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[27]_4\
    );
RAM_reg_320_383_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[30]_4\
    );
RAM_reg_320_383_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[31]_4\
    );
RAM_reg_320_383_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[3]_4\
    );
RAM_reg_320_383_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[6]_4\
    );
RAM_reg_320_383_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[9]_4\
    );
RAM_reg_384_447_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[0]_5\
    );
RAM_reg_384_447_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[12]_5\
    );
RAM_reg_384_447_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[15]_5\
    );
RAM_reg_384_447_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[18]_5\
    );
RAM_reg_384_447_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[21]_5\
    );
RAM_reg_384_447_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[24]_5\
    );
RAM_reg_384_447_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[27]_5\
    );
RAM_reg_384_447_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[30]_5\
    );
RAM_reg_384_447_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[31]_5\
    );
RAM_reg_384_447_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[3]_5\
    );
RAM_reg_384_447_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[6]_5\
    );
RAM_reg_384_447_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(6),
      I1 => \^wr_pntr_gc_reg[8]\(7),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[9]_5\
    );
RAM_reg_448_511_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[0]_6\
    );
RAM_reg_448_511_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[12]_6\
    );
RAM_reg_448_511_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[15]_6\
    );
RAM_reg_448_511_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[18]_6\
    );
RAM_reg_448_511_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[21]_6\
    );
RAM_reg_448_511_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[24]_6\
    );
RAM_reg_448_511_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[27]_6\
    );
RAM_reg_448_511_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[30]_6\
    );
RAM_reg_448_511_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[31]_6\
    );
RAM_reg_448_511_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[3]_6\
    );
RAM_reg_448_511_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[6]_6\
    );
RAM_reg_448_511_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(7),
      I1 => \^wr_pntr_gc_reg[8]\(6),
      I2 => wr_en,
      I3 => p_0_out,
      I4 => \^wr_pntr_gc_reg[8]\(8),
      O => \gpr1.dout_i_reg[9]_6\
    );
RAM_reg_64_127_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[0]_1\
    );
RAM_reg_64_127_12_14_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[12]_1\
    );
RAM_reg_64_127_15_17_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[15]_1\
    );
RAM_reg_64_127_18_20_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[18]_1\
    );
RAM_reg_64_127_21_23_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[21]_1\
    );
RAM_reg_64_127_24_26_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[24]_1\
    );
RAM_reg_64_127_27_29_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[27]_1\
    );
RAM_reg_64_127_30_30_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[30]_1\
    );
RAM_reg_64_127_31_31_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[31]_1\
    );
RAM_reg_64_127_3_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[3]_1\
    );
RAM_reg_64_127_6_8_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[6]_1\
    );
RAM_reg_64_127_9_11_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \^wr_pntr_gc_reg[8]\(8),
      I1 => wr_en,
      I2 => p_0_out,
      I3 => \^wr_pntr_gc_reg[8]\(7),
      I4 => \^wr_pntr_gc_reg[8]\(6),
      O => \gpr1.dout_i_reg[9]_1\
    );
\gic0.gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \plusOp__0\(0)
    );
\gic0.gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \plusOp__0\(1)
    );
\gic0.gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => \plusOp__0\(2)
    );
\gic0.gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \plusOp__0\(3)
    );
\gic0.gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => \plusOp__0\(4)
    );
\gic0.gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^q\(4),
      O => \plusOp__0\(5)
    );
\gic0.gc0.count[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \gic0.gc0.count[8]_i_2_n_0\,
      I3 => \^q\(5),
      O => \plusOp__0\(6)
    );
\gic0.gc0.count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \gic0.gc0.count[8]_i_2_n_0\,
      I3 => \^q\(4),
      I4 => \^q\(6),
      O => \plusOp__0\(7)
    );
\gic0.gc0.count[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_pntr_plus2(8),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \gic0.gc0.count[8]_i_2_n_0\,
      I4 => \^q\(5),
      I5 => \^q\(7),
      O => \plusOp__0\(8)
    );
\gic0.gc0.count[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => \gic0.gc0.count[8]_i_2_n_0\
    );
\gic0.gc0.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \^q\(0),
      PRE => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(0)
    );
\gic0.gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(1),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(1)
    );
\gic0.gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(2),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(2)
    );
\gic0.gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(3),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(3)
    );
\gic0.gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(4),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(4)
    );
\gic0.gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(5),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(5)
    );
\gic0.gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(6),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(6)
    );
\gic0.gc0.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^q\(7),
      Q => \^gic0.gc0.count_d2_reg[7]_0\(7)
    );
\gic0.gc0.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => wr_pntr_plus2(8),
      Q => p_8_out(8)
    );
\gic0.gc0.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(0),
      Q => \^wr_pntr_gc_reg[8]\(0)
    );
\gic0.gc0.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(1),
      Q => \^wr_pntr_gc_reg[8]\(1)
    );
\gic0.gc0.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(2),
      Q => \^wr_pntr_gc_reg[8]\(2)
    );
\gic0.gc0.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(3),
      Q => \^wr_pntr_gc_reg[8]\(3)
    );
\gic0.gc0.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(4),
      Q => \^wr_pntr_gc_reg[8]\(4)
    );
\gic0.gc0.count_d2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(5),
      Q => \^wr_pntr_gc_reg[8]\(5)
    );
\gic0.gc0.count_d2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(6),
      Q => \^wr_pntr_gc_reg[8]\(6)
    );
\gic0.gc0.count_d2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \^gic0.gc0.count_d2_reg[7]_0\(7),
      Q => \^wr_pntr_gc_reg[8]\(7)
    );
\gic0.gc0.count_d2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => p_8_out(8),
      Q => \^wr_pntr_gc_reg[8]\(8)
    );
\gic0.gc0.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(0),
      Q => \^q\(0)
    );
\gic0.gc0.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \plusOp__0\(1),
      PRE => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      Q => \^q\(1)
    );
\gic0.gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(2),
      Q => \^q\(2)
    );
\gic0.gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(3),
      Q => \^q\(3)
    );
\gic0.gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(4),
      Q => \^q\(4)
    );
\gic0.gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(5),
      Q => \^q\(5)
    );
\gic0.gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(6),
      Q => \^q\(6)
    );
\gic0.gc0.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(7),
      Q => \^q\(7)
    );
\gic0.gc0.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0),
      D => \plusOp__0\(8),
      Q => wr_pntr_plus2(8)
    );
\gmux.gm[4].gms.ms_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_8_out(8),
      I1 => RD_PNTR_WR(0),
      O => ram_full_i_reg_0
    );
\gmux.gm[4].gms.ms_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_pntr_plus2(8),
      I1 => RD_PNTR_WR(0),
      O => ram_full_i_reg_1
    );
ram_full_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => comp1,
      I1 => wr_en,
      I2 => p_0_out,
      I3 => comp2,
      O => ram_full_i_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_clk_x_pntrs is
  port (
    ram_empty_fb_i_reg : out STD_LOGIC;
    WR_PNTR_RD : out STD_LOGIC_VECTOR ( 8 downto 0 );
    v1_reg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RD_PNTR_WR : out STD_LOGIC_VECTOR ( 0 to 0 );
    v1_reg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gc0.count_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \gic0.gc0.count_d1_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \gic0.gc0.count_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \gic0.gc0.count_d2_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \gc0.count_d1_reg[0]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[1]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[2]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[3]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[4]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[5]_rep\ : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_clk_x_pntrs : entity is "clk_x_pntrs";
end bitfile_fifo_in_clk_x_pntrs;

architecture STRUCTURE of bitfile_fifo_in_clk_x_pntrs is
  signal \^wr_pntr_rd\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \gsync_stage[2].wr_stg_inst_n_1\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_2\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_3\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_4\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_5\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_6\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_7\ : STD_LOGIC;
  signal \gsync_stage[2].wr_stg_inst_n_8\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in7_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_out_0 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal p_1_out : STD_LOGIC_VECTOR ( 8 to 8 );
  signal p_2_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_3_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal rd_pntr_gc : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \rd_pntr_gc[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[5]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[6]_i_1_n_0\ : STD_LOGIC;
  signal \rd_pntr_gc[7]_i_1_n_0\ : STD_LOGIC;
  signal wr_pntr_gc : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_pntr_gc[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rd_pntr_gc[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rd_pntr_gc[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_pntr_gc[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_pntr_gc[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rd_pntr_gc[5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rd_pntr_gc[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_pntr_gc[7]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \wr_pntr_gc[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_pntr_gc[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_pntr_gc[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_pntr_gc[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_pntr_gc[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wr_pntr_gc[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wr_pntr_gc[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \wr_pntr_gc[7]_i_1\ : label is "soft_lutpair3";
begin
  WR_PNTR_RD(8 downto 0) <= \^wr_pntr_rd\(8 downto 0);
\gmux.gm[0].gm1.m1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^wr_pntr_rd\(1),
      I1 => \gc0.count_reg[7]\(1),
      I2 => \^wr_pntr_rd\(0),
      I3 => \gc0.count_reg[7]\(0),
      O => v1_reg(0)
    );
\gmux.gm[0].gm1.m1_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(1),
      I1 => \gic0.gc0.count_d1_reg[7]\(1),
      I2 => p_0_out(0),
      I3 => \gic0.gc0.count_d1_reg[7]\(0),
      O => v1_reg_0(0)
    );
\gmux.gm[0].gm1.m1_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(1),
      I1 => \gic0.gc0.count_reg[7]\(1),
      I2 => p_0_out(0),
      I3 => \gic0.gc0.count_reg[7]\(0),
      O => v1_reg_1(0)
    );
\gmux.gm[1].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^wr_pntr_rd\(3),
      I1 => \gc0.count_reg[7]\(3),
      I2 => \^wr_pntr_rd\(2),
      I3 => \gc0.count_reg[7]\(2),
      O => v1_reg(1)
    );
\gmux.gm[1].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(3),
      I1 => \gic0.gc0.count_d1_reg[7]\(3),
      I2 => p_0_out(2),
      I3 => \gic0.gc0.count_d1_reg[7]\(2),
      O => v1_reg_0(1)
    );
\gmux.gm[1].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(3),
      I1 => \gic0.gc0.count_reg[7]\(3),
      I2 => p_0_out(2),
      I3 => \gic0.gc0.count_reg[7]\(2),
      O => v1_reg_1(1)
    );
\gmux.gm[2].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^wr_pntr_rd\(5),
      I1 => \gc0.count_reg[7]\(5),
      I2 => \^wr_pntr_rd\(4),
      I3 => \gc0.count_reg[7]\(4),
      O => v1_reg(2)
    );
\gmux.gm[2].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(5),
      I1 => \gic0.gc0.count_d1_reg[7]\(5),
      I2 => p_0_out(4),
      I3 => \gic0.gc0.count_d1_reg[7]\(4),
      O => v1_reg_0(2)
    );
\gmux.gm[2].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(5),
      I1 => \gic0.gc0.count_reg[7]\(5),
      I2 => p_0_out(4),
      I3 => \gic0.gc0.count_reg[7]\(4),
      O => v1_reg_1(2)
    );
\gmux.gm[3].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^wr_pntr_rd\(7),
      I1 => \gc0.count_reg[7]\(7),
      I2 => \^wr_pntr_rd\(6),
      I3 => \gc0.count_reg[7]\(6),
      O => v1_reg(3)
    );
\gmux.gm[3].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(7),
      I1 => \gic0.gc0.count_d1_reg[7]\(7),
      I2 => p_0_out(6),
      I3 => \gic0.gc0.count_d1_reg[7]\(6),
      O => v1_reg_0(3)
    );
\gmux.gm[3].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_0_out(7),
      I1 => \gic0.gc0.count_reg[7]\(7),
      I2 => p_0_out(6),
      I3 => \gic0.gc0.count_reg[7]\(6),
      O => v1_reg_1(3)
    );
\gmux.gm[4].gms.ms_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^wr_pntr_rd\(8),
      I1 => Q(2),
      O => ram_empty_fb_i_reg
    );
\gsync_stage[1].rd_stg_inst\: entity work.bitfile_fifo_in_synchronizer_ff
     port map (
      D(8 downto 0) => p_3_out(8 downto 0),
      Q(8 downto 0) => wr_pntr_gc(8 downto 0),
      \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0) => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      rd_clk => rd_clk
    );
\gsync_stage[1].wr_stg_inst\: entity work.bitfile_fifo_in_synchronizer_ff_3
     port map (
      D(8 downto 0) => p_2_out(8 downto 0),
      Q(8 downto 0) => rd_pntr_gc(8 downto 0),
      \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0) => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      wr_clk => wr_clk
    );
\gsync_stage[2].rd_stg_inst\: entity work.bitfile_fifo_in_synchronizer_ff_4
     port map (
      D(8 downto 0) => p_3_out(8 downto 0),
      \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0) => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      \out\(0) => p_1_out(8),
      rd_clk => rd_clk,
      \wr_pntr_bin_reg[7]\(7 downto 0) => p_0_in(7 downto 0)
    );
\gsync_stage[2].wr_stg_inst\: entity work.bitfile_fifo_in_synchronizer_ff_5
     port map (
      D(8 downto 0) => p_2_out(8 downto 0),
      \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0) => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      \out\(0) => p_0_out_0(8),
      \rd_pntr_bin_reg[7]\(7) => \gsync_stage[2].wr_stg_inst_n_1\,
      \rd_pntr_bin_reg[7]\(6) => \gsync_stage[2].wr_stg_inst_n_2\,
      \rd_pntr_bin_reg[7]\(5) => \gsync_stage[2].wr_stg_inst_n_3\,
      \rd_pntr_bin_reg[7]\(4) => \gsync_stage[2].wr_stg_inst_n_4\,
      \rd_pntr_bin_reg[7]\(3) => \gsync_stage[2].wr_stg_inst_n_5\,
      \rd_pntr_bin_reg[7]\(2) => \gsync_stage[2].wr_stg_inst_n_6\,
      \rd_pntr_bin_reg[7]\(1) => \gsync_stage[2].wr_stg_inst_n_7\,
      \rd_pntr_bin_reg[7]\(0) => \gsync_stage[2].wr_stg_inst_n_8\,
      wr_clk => wr_clk
    );
\rd_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_8\,
      Q => p_0_out(0)
    );
\rd_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_7\,
      Q => p_0_out(1)
    );
\rd_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_6\,
      Q => p_0_out(2)
    );
\rd_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_5\,
      Q => p_0_out(3)
    );
\rd_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_4\,
      Q => p_0_out(4)
    );
\rd_pntr_bin_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_3\,
      Q => p_0_out(5)
    );
\rd_pntr_bin_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_2\,
      Q => p_0_out(6)
    );
\rd_pntr_bin_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gsync_stage[2].wr_stg_inst_n_1\,
      Q => p_0_out(7)
    );
\rd_pntr_bin_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_out_0(8),
      Q => RD_PNTR_WR(0)
    );
\rd_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gc0.count_d1_reg[0]_rep\,
      I1 => \gc0.count_d1_reg[1]_rep\,
      O => \rd_pntr_gc[0]_i_1_n_0\
    );
\rd_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gc0.count_d1_reg[1]_rep\,
      I1 => \gc0.count_d1_reg[2]_rep\,
      O => \rd_pntr_gc[1]_i_1_n_0\
    );
\rd_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gc0.count_d1_reg[2]_rep\,
      I1 => \gc0.count_d1_reg[3]_rep\,
      O => \rd_pntr_gc[2]_i_1_n_0\
    );
\rd_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gc0.count_d1_reg[3]_rep\,
      I1 => \gc0.count_d1_reg[4]_rep\,
      O => \rd_pntr_gc[3]_i_1_n_0\
    );
\rd_pntr_gc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gc0.count_d1_reg[4]_rep\,
      I1 => \gc0.count_d1_reg[5]_rep\,
      O => \rd_pntr_gc[4]_i_1_n_0\
    );
\rd_pntr_gc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gc0.count_d1_reg[5]_rep\,
      I1 => Q(0),
      O => \rd_pntr_gc[5]_i_1_n_0\
    );
\rd_pntr_gc[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      O => \rd_pntr_gc[6]_i_1_n_0\
    );
\rd_pntr_gc[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      O => \rd_pntr_gc[7]_i_1_n_0\
    );
\rd_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[0]_i_1_n_0\,
      Q => rd_pntr_gc(0)
    );
\rd_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[1]_i_1_n_0\,
      Q => rd_pntr_gc(1)
    );
\rd_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[2]_i_1_n_0\,
      Q => rd_pntr_gc(2)
    );
\rd_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[3]_i_1_n_0\,
      Q => rd_pntr_gc(3)
    );
\rd_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[4]_i_1_n_0\,
      Q => rd_pntr_gc(4)
    );
\rd_pntr_gc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[5]_i_1_n_0\,
      Q => rd_pntr_gc(5)
    );
\rd_pntr_gc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[6]_i_1_n_0\,
      Q => rd_pntr_gc(6)
    );
\rd_pntr_gc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => \rd_pntr_gc[7]_i_1_n_0\,
      Q => rd_pntr_gc(7)
    );
\rd_pntr_gc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => Q(2),
      Q => rd_pntr_gc(8)
    );
\wr_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(0),
      Q => \^wr_pntr_rd\(0)
    );
\wr_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(1),
      Q => \^wr_pntr_rd\(1)
    );
\wr_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(2),
      Q => \^wr_pntr_rd\(2)
    );
\wr_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(3),
      Q => \^wr_pntr_rd\(3)
    );
\wr_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(4),
      Q => \^wr_pntr_rd\(4)
    );
\wr_pntr_bin_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(5),
      Q => \^wr_pntr_rd\(5)
    );
\wr_pntr_bin_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(6),
      Q => \^wr_pntr_rd\(6)
    );
\wr_pntr_bin_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_0_in(7),
      Q => \^wr_pntr_rd\(7)
    );
\wr_pntr_bin_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0),
      D => p_1_out(8),
      Q => \^wr_pntr_rd\(8)
    );
\wr_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(0),
      I1 => \gic0.gc0.count_d2_reg[8]\(1),
      O => p_0_in7_out(0)
    );
\wr_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(1),
      I1 => \gic0.gc0.count_d2_reg[8]\(2),
      O => p_0_in7_out(1)
    );
\wr_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(2),
      I1 => \gic0.gc0.count_d2_reg[8]\(3),
      O => p_0_in7_out(2)
    );
\wr_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(3),
      I1 => \gic0.gc0.count_d2_reg[8]\(4),
      O => p_0_in7_out(3)
    );
\wr_pntr_gc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(4),
      I1 => \gic0.gc0.count_d2_reg[8]\(5),
      O => p_0_in7_out(4)
    );
\wr_pntr_gc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(5),
      I1 => \gic0.gc0.count_d2_reg[8]\(6),
      O => p_0_in7_out(5)
    );
\wr_pntr_gc[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(6),
      I1 => \gic0.gc0.count_d2_reg[8]\(7),
      O => p_0_in7_out(6)
    );
\wr_pntr_gc[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \gic0.gc0.count_d2_reg[8]\(7),
      I1 => \gic0.gc0.count_d2_reg[8]\(8),
      O => p_0_in7_out(7)
    );
\wr_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(0),
      Q => wr_pntr_gc(0)
    );
\wr_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(1),
      Q => wr_pntr_gc(1)
    );
\wr_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(2),
      Q => wr_pntr_gc(2)
    );
\wr_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(3),
      Q => wr_pntr_gc(3)
    );
\wr_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(4),
      Q => wr_pntr_gc(4)
    );
\wr_pntr_gc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(5),
      Q => wr_pntr_gc(5)
    );
\wr_pntr_gc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(6),
      Q => wr_pntr_gc(6)
    );
\wr_pntr_gc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => p_0_in7_out(7),
      Q => wr_pntr_gc(7)
    );
\wr_pntr_gc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0),
      D => \gic0.gc0.count_d2_reg[8]\(8),
      Q => wr_pntr_gc(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_memory is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \gic0.gc0.count_d2_reg[7]\ : in STD_LOGIC;
    \gc0.count_d1_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \gic0.gc0.count_d2_reg[5]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gic0.gc0.count_d2_reg[8]\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_0\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_1\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_0\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_1\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_2\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_3\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_2\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_3\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_4\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_4\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_5\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_0\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_6\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_7\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_5\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_6\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_7\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_8\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_9\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_1\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_10\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_11\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_8\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_9\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_10\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_12\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_13\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_2\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_14\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_15\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_11\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_12\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_13\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_16\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_17\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_3\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_18\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_19\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_14\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_15\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_16\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_20\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_21\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_4\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_22\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_23\ : in STD_LOGIC;
    \gc0.count_d1_reg[5]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[4]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[3]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[2]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[1]_rep\ : in STD_LOGIC;
    \gc0.count_d1_reg[0]_rep\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_17\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_18\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_19\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_24\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_25\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_5\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_26\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_27\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_20\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_21\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_22\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_28\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_29\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_6\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_30\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_31\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_23\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_24\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_25\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_32\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_33\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_7\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_34\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_35\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_26\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_27\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_28\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_36\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_37\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_8\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_38\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_39\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_40\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_29\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_30\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_31\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_32\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_33\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[8]_34\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_41\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_42\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_43\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_44\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_9\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]_10\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_45\ : in STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]_46\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gpregsm1.curr_fwft_state_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_memory : entity is "memory";
end bitfile_fifo_in_memory;

architecture STRUCTURE of bitfile_fifo_in_memory is
  signal dout_i : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
\gdm.dm\: entity work.bitfile_fifo_in_dmem
     port map (
      ADDRA(5) => \gc0.count_d1_reg[5]_rep\,
      ADDRA(4) => \gc0.count_d1_reg[4]_rep\,
      ADDRA(3) => \gc0.count_d1_reg[3]_rep\,
      ADDRA(2) => \gc0.count_d1_reg[2]_rep\,
      ADDRA(1) => \gc0.count_d1_reg[1]_rep\,
      ADDRA(0) => \gc0.count_d1_reg[0]_rep\,
      E(0) => E(0),
      Q(31 downto 0) => dout_i(31 downto 0),
      din(31 downto 0) => din(31 downto 0),
      \gc0.count_d1_reg[8]\(8 downto 0) => \gc0.count_d1_reg[8]\(8 downto 0),
      \gic0.gc0.count_d2_reg[5]\(5 downto 0) => \gic0.gc0.count_d2_reg[5]\(5 downto 0),
      \gic0.gc0.count_d2_reg[6]\ => \gic0.gc0.count_d2_reg[6]\,
      \gic0.gc0.count_d2_reg[6]_0\ => \gic0.gc0.count_d2_reg[6]_0\,
      \gic0.gc0.count_d2_reg[6]_1\ => \gic0.gc0.count_d2_reg[6]_1\,
      \gic0.gc0.count_d2_reg[6]_10\ => \gic0.gc0.count_d2_reg[6]_10\,
      \gic0.gc0.count_d2_reg[6]_2\ => \gic0.gc0.count_d2_reg[6]_2\,
      \gic0.gc0.count_d2_reg[6]_3\ => \gic0.gc0.count_d2_reg[6]_3\,
      \gic0.gc0.count_d2_reg[6]_4\ => \gic0.gc0.count_d2_reg[6]_4\,
      \gic0.gc0.count_d2_reg[6]_5\ => \gic0.gc0.count_d2_reg[6]_5\,
      \gic0.gc0.count_d2_reg[6]_6\ => \gic0.gc0.count_d2_reg[6]_6\,
      \gic0.gc0.count_d2_reg[6]_7\ => \gic0.gc0.count_d2_reg[6]_7\,
      \gic0.gc0.count_d2_reg[6]_8\ => \gic0.gc0.count_d2_reg[6]_8\,
      \gic0.gc0.count_d2_reg[6]_9\ => \gic0.gc0.count_d2_reg[6]_9\,
      \gic0.gc0.count_d2_reg[7]\ => \gic0.gc0.count_d2_reg[7]\,
      \gic0.gc0.count_d2_reg[7]_0\ => \gic0.gc0.count_d2_reg[7]_0\,
      \gic0.gc0.count_d2_reg[7]_1\ => \gic0.gc0.count_d2_reg[7]_1\,
      \gic0.gc0.count_d2_reg[7]_10\ => \gic0.gc0.count_d2_reg[7]_10\,
      \gic0.gc0.count_d2_reg[7]_11\ => \gic0.gc0.count_d2_reg[7]_11\,
      \gic0.gc0.count_d2_reg[7]_12\ => \gic0.gc0.count_d2_reg[7]_12\,
      \gic0.gc0.count_d2_reg[7]_13\ => \gic0.gc0.count_d2_reg[7]_13\,
      \gic0.gc0.count_d2_reg[7]_14\ => \gic0.gc0.count_d2_reg[7]_14\,
      \gic0.gc0.count_d2_reg[7]_15\ => \gic0.gc0.count_d2_reg[7]_15\,
      \gic0.gc0.count_d2_reg[7]_16\ => \gic0.gc0.count_d2_reg[7]_16\,
      \gic0.gc0.count_d2_reg[7]_17\ => \gic0.gc0.count_d2_reg[7]_17\,
      \gic0.gc0.count_d2_reg[7]_18\ => \gic0.gc0.count_d2_reg[7]_18\,
      \gic0.gc0.count_d2_reg[7]_19\ => \gic0.gc0.count_d2_reg[7]_19\,
      \gic0.gc0.count_d2_reg[7]_2\ => \gic0.gc0.count_d2_reg[7]_2\,
      \gic0.gc0.count_d2_reg[7]_20\ => \gic0.gc0.count_d2_reg[7]_20\,
      \gic0.gc0.count_d2_reg[7]_21\ => \gic0.gc0.count_d2_reg[7]_21\,
      \gic0.gc0.count_d2_reg[7]_22\ => \gic0.gc0.count_d2_reg[7]_22\,
      \gic0.gc0.count_d2_reg[7]_23\ => \gic0.gc0.count_d2_reg[7]_23\,
      \gic0.gc0.count_d2_reg[7]_24\ => \gic0.gc0.count_d2_reg[7]_24\,
      \gic0.gc0.count_d2_reg[7]_25\ => \gic0.gc0.count_d2_reg[7]_25\,
      \gic0.gc0.count_d2_reg[7]_26\ => \gic0.gc0.count_d2_reg[7]_26\,
      \gic0.gc0.count_d2_reg[7]_27\ => \gic0.gc0.count_d2_reg[7]_27\,
      \gic0.gc0.count_d2_reg[7]_28\ => \gic0.gc0.count_d2_reg[7]_28\,
      \gic0.gc0.count_d2_reg[7]_29\ => \gic0.gc0.count_d2_reg[7]_29\,
      \gic0.gc0.count_d2_reg[7]_3\ => \gic0.gc0.count_d2_reg[7]_3\,
      \gic0.gc0.count_d2_reg[7]_30\ => \gic0.gc0.count_d2_reg[7]_30\,
      \gic0.gc0.count_d2_reg[7]_31\ => \gic0.gc0.count_d2_reg[7]_31\,
      \gic0.gc0.count_d2_reg[7]_32\ => \gic0.gc0.count_d2_reg[7]_32\,
      \gic0.gc0.count_d2_reg[7]_33\ => \gic0.gc0.count_d2_reg[7]_33\,
      \gic0.gc0.count_d2_reg[7]_34\ => \gic0.gc0.count_d2_reg[7]_34\,
      \gic0.gc0.count_d2_reg[7]_35\ => \gic0.gc0.count_d2_reg[7]_35\,
      \gic0.gc0.count_d2_reg[7]_36\ => \gic0.gc0.count_d2_reg[7]_36\,
      \gic0.gc0.count_d2_reg[7]_37\ => \gic0.gc0.count_d2_reg[7]_37\,
      \gic0.gc0.count_d2_reg[7]_38\ => \gic0.gc0.count_d2_reg[7]_38\,
      \gic0.gc0.count_d2_reg[7]_39\ => \gic0.gc0.count_d2_reg[7]_39\,
      \gic0.gc0.count_d2_reg[7]_4\ => \gic0.gc0.count_d2_reg[7]_4\,
      \gic0.gc0.count_d2_reg[7]_40\ => \gic0.gc0.count_d2_reg[7]_40\,
      \gic0.gc0.count_d2_reg[7]_41\ => \gic0.gc0.count_d2_reg[7]_41\,
      \gic0.gc0.count_d2_reg[7]_42\ => \gic0.gc0.count_d2_reg[7]_42\,
      \gic0.gc0.count_d2_reg[7]_43\ => \gic0.gc0.count_d2_reg[7]_43\,
      \gic0.gc0.count_d2_reg[7]_44\ => \gic0.gc0.count_d2_reg[7]_44\,
      \gic0.gc0.count_d2_reg[7]_45\ => \gic0.gc0.count_d2_reg[7]_45\,
      \gic0.gc0.count_d2_reg[7]_46\ => \gic0.gc0.count_d2_reg[7]_46\,
      \gic0.gc0.count_d2_reg[7]_5\ => \gic0.gc0.count_d2_reg[7]_5\,
      \gic0.gc0.count_d2_reg[7]_6\ => \gic0.gc0.count_d2_reg[7]_6\,
      \gic0.gc0.count_d2_reg[7]_7\ => \gic0.gc0.count_d2_reg[7]_7\,
      \gic0.gc0.count_d2_reg[7]_8\ => \gic0.gc0.count_d2_reg[7]_8\,
      \gic0.gc0.count_d2_reg[7]_9\ => \gic0.gc0.count_d2_reg[7]_9\,
      \gic0.gc0.count_d2_reg[8]\ => \gic0.gc0.count_d2_reg[8]\,
      \gic0.gc0.count_d2_reg[8]_0\ => \gic0.gc0.count_d2_reg[8]_0\,
      \gic0.gc0.count_d2_reg[8]_1\ => \gic0.gc0.count_d2_reg[8]_1\,
      \gic0.gc0.count_d2_reg[8]_10\ => \gic0.gc0.count_d2_reg[8]_10\,
      \gic0.gc0.count_d2_reg[8]_11\ => \gic0.gc0.count_d2_reg[8]_11\,
      \gic0.gc0.count_d2_reg[8]_12\ => \gic0.gc0.count_d2_reg[8]_12\,
      \gic0.gc0.count_d2_reg[8]_13\ => \gic0.gc0.count_d2_reg[8]_13\,
      \gic0.gc0.count_d2_reg[8]_14\ => \gic0.gc0.count_d2_reg[8]_14\,
      \gic0.gc0.count_d2_reg[8]_15\ => \gic0.gc0.count_d2_reg[8]_15\,
      \gic0.gc0.count_d2_reg[8]_16\ => \gic0.gc0.count_d2_reg[8]_16\,
      \gic0.gc0.count_d2_reg[8]_17\ => \gic0.gc0.count_d2_reg[8]_17\,
      \gic0.gc0.count_d2_reg[8]_18\ => \gic0.gc0.count_d2_reg[8]_18\,
      \gic0.gc0.count_d2_reg[8]_19\ => \gic0.gc0.count_d2_reg[8]_19\,
      \gic0.gc0.count_d2_reg[8]_2\ => \gic0.gc0.count_d2_reg[8]_2\,
      \gic0.gc0.count_d2_reg[8]_20\ => \gic0.gc0.count_d2_reg[8]_20\,
      \gic0.gc0.count_d2_reg[8]_21\ => \gic0.gc0.count_d2_reg[8]_21\,
      \gic0.gc0.count_d2_reg[8]_22\ => \gic0.gc0.count_d2_reg[8]_22\,
      \gic0.gc0.count_d2_reg[8]_23\ => \gic0.gc0.count_d2_reg[8]_23\,
      \gic0.gc0.count_d2_reg[8]_24\ => \gic0.gc0.count_d2_reg[8]_24\,
      \gic0.gc0.count_d2_reg[8]_25\ => \gic0.gc0.count_d2_reg[8]_25\,
      \gic0.gc0.count_d2_reg[8]_26\ => \gic0.gc0.count_d2_reg[8]_26\,
      \gic0.gc0.count_d2_reg[8]_27\ => \gic0.gc0.count_d2_reg[8]_27\,
      \gic0.gc0.count_d2_reg[8]_28\ => \gic0.gc0.count_d2_reg[8]_28\,
      \gic0.gc0.count_d2_reg[8]_29\ => \gic0.gc0.count_d2_reg[8]_29\,
      \gic0.gc0.count_d2_reg[8]_3\ => \gic0.gc0.count_d2_reg[8]_3\,
      \gic0.gc0.count_d2_reg[8]_30\ => \gic0.gc0.count_d2_reg[8]_30\,
      \gic0.gc0.count_d2_reg[8]_31\ => \gic0.gc0.count_d2_reg[8]_31\,
      \gic0.gc0.count_d2_reg[8]_32\ => \gic0.gc0.count_d2_reg[8]_32\,
      \gic0.gc0.count_d2_reg[8]_33\ => \gic0.gc0.count_d2_reg[8]_33\,
      \gic0.gc0.count_d2_reg[8]_34\ => \gic0.gc0.count_d2_reg[8]_34\,
      \gic0.gc0.count_d2_reg[8]_4\ => \gic0.gc0.count_d2_reg[8]_4\,
      \gic0.gc0.count_d2_reg[8]_5\ => \gic0.gc0.count_d2_reg[8]_5\,
      \gic0.gc0.count_d2_reg[8]_6\ => \gic0.gc0.count_d2_reg[8]_6\,
      \gic0.gc0.count_d2_reg[8]_7\ => \gic0.gc0.count_d2_reg[8]_7\,
      \gic0.gc0.count_d2_reg[8]_8\ => \gic0.gc0.count_d2_reg[8]_8\,
      \gic0.gc0.count_d2_reg[8]_9\ => \gic0.gc0.count_d2_reg[8]_9\,
      \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\(0) => Q(0),
      rd_clk => rd_clk,
      wr_clk => wr_clk
    );
\goreg_dm.dout_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(0),
      Q => dout(0)
    );
\goreg_dm.dout_i_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(10),
      Q => dout(10)
    );
\goreg_dm.dout_i_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(11),
      Q => dout(11)
    );
\goreg_dm.dout_i_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(12),
      Q => dout(12)
    );
\goreg_dm.dout_i_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(13),
      Q => dout(13)
    );
\goreg_dm.dout_i_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(14),
      Q => dout(14)
    );
\goreg_dm.dout_i_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(15),
      Q => dout(15)
    );
\goreg_dm.dout_i_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(16),
      Q => dout(16)
    );
\goreg_dm.dout_i_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(17),
      Q => dout(17)
    );
\goreg_dm.dout_i_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(18),
      Q => dout(18)
    );
\goreg_dm.dout_i_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(19),
      Q => dout(19)
    );
\goreg_dm.dout_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(1),
      Q => dout(1)
    );
\goreg_dm.dout_i_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(20),
      Q => dout(20)
    );
\goreg_dm.dout_i_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(21),
      Q => dout(21)
    );
\goreg_dm.dout_i_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(22),
      Q => dout(22)
    );
\goreg_dm.dout_i_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(23),
      Q => dout(23)
    );
\goreg_dm.dout_i_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(24),
      Q => dout(24)
    );
\goreg_dm.dout_i_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(25),
      Q => dout(25)
    );
\goreg_dm.dout_i_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(26),
      Q => dout(26)
    );
\goreg_dm.dout_i_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(27),
      Q => dout(27)
    );
\goreg_dm.dout_i_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(28),
      Q => dout(28)
    );
\goreg_dm.dout_i_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(29),
      Q => dout(29)
    );
\goreg_dm.dout_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(2),
      Q => dout(2)
    );
\goreg_dm.dout_i_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(30),
      Q => dout(30)
    );
\goreg_dm.dout_i_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(31),
      Q => dout(31)
    );
\goreg_dm.dout_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(3),
      Q => dout(3)
    );
\goreg_dm.dout_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(4),
      Q => dout(4)
    );
\goreg_dm.dout_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(5),
      Q => dout(5)
    );
\goreg_dm.dout_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(6),
      Q => dout(6)
    );
\goreg_dm.dout_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(7),
      Q => dout(7)
    );
\goreg_dm.dout_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(8),
      Q => dout(8)
    );
\goreg_dm.dout_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gpregsm1.curr_fwft_state_reg[1]\(0),
      CLR => Q(0),
      D => dout_i(9),
      Q => dout(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_rd_status_flags_as is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_18_out : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wr_pntr_bin_reg[8]\ : in STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gc0.count_reg[8]\ : in STD_LOGIC;
    ram_empty_fb_i_reg_0 : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_rd_status_flags_as : entity is "rd_status_flags_as";
end bitfile_fifo_in_rd_status_flags_as;

architecture STRUCTURE of bitfile_fifo_in_rd_status_flags_as is
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
begin
c0: entity work.bitfile_fifo_in_compare_1
     port map (
      comp0 => comp0,
      v1_reg_0(3 downto 0) => v1_reg_0(3 downto 0),
      \wr_pntr_bin_reg[8]\ => \wr_pntr_bin_reg[8]\
    );
c1: entity work.bitfile_fifo_in_compare_2
     port map (
      comp1 => comp1,
      \gc0.count_reg[8]\ => \gc0.count_reg[8]\,
      v1_reg(3 downto 0) => v1_reg(3 downto 0)
    );
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => ram_empty_fb_i_reg_0,
      PRE => Q(0),
      Q => p_18_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_wr_status_flags_as is
  port (
    comp1 : out STD_LOGIC;
    comp2 : out STD_LOGIC;
    full : out STD_LOGIC;
    p_0_out : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gic0.gc0.count_d1_reg[8]\ : in STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gic0.gc0.count_reg[8]\ : in STD_LOGIC;
    ram_full_fb_i_reg_0 : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_wr_status_flags_as : entity is "wr_status_flags_as";
end bitfile_fifo_in_wr_status_flags_as;

architecture STRUCTURE of bitfile_fifo_in_wr_status_flags_as is
  signal \^p_0_out\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
begin
  p_0_out <= \^p_0_out\;
c1: entity work.bitfile_fifo_in_compare
     port map (
      comp1 => comp1,
      \gic0.gc0.count_d1_reg[8]\ => \gic0.gc0.count_d1_reg[8]\,
      v1_reg(3 downto 0) => v1_reg(3 downto 0)
    );
c2: entity work.bitfile_fifo_in_compare_0
     port map (
      comp2 => comp2,
      \gic0.gc0.count_reg[8]\ => \gic0.gc0.count_reg[8]\,
      v1_reg_0(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gic0.gc0.count_d1[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => wr_en,
      I1 => \^p_0_out\,
      O => E(0)
    );
ram_full_fb_i_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => Q(0),
      D => ram_full_fb_i_reg_0,
      Q => \^p_0_out\
    );
ram_full_i_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => Q(0),
      D => ram_full_fb_i_reg_0,
      Q => full
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_rd_logic is
  port (
    empty : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gc0.count_d1_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \rd_pntr_gc_reg[8]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \rd_pntr_gc_reg[5]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[4]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[3]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[2]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[1]\ : out STD_LOGIC;
    \rd_pntr_gc_reg[0]\ : out STD_LOGIC;
    \goreg_dm.dout_i_reg[31]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \wr_pntr_bin_reg[8]\ : in STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_en : in STD_LOGIC;
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_rd_logic : entity is "rd_logic";
end bitfile_fifo_in_rd_logic;

architecture STRUCTURE of bitfile_fifo_in_rd_logic is
  signal \c0/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal comp0 : STD_LOGIC;
  signal comp1 : STD_LOGIC;
  signal \gr1.rfwft_n_2\ : STD_LOGIC;
  signal \gr1.rfwft_n_3\ : STD_LOGIC;
  signal p_18_out : STD_LOGIC;
  signal rpntr_n_0 : STD_LOGIC;
begin
\gr1.rfwft\: entity work.bitfile_fifo_in_rd_fwft
     port map (
      E(0) => E(0),
      Q(0) => Q(0),
      comp0 => comp0,
      comp1 => comp1,
      empty => empty,
      \gc0.count_reg[8]\ => \gr1.rfwft_n_2\,
      \goreg_dm.dout_i_reg[31]\(0) => \goreg_dm.dout_i_reg[31]\(0),
      p_18_out => p_18_out,
      ram_empty_fb_i_reg => \gr1.rfwft_n_3\,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
\gras.rsts\: entity work.bitfile_fifo_in_rd_status_flags_as
     port map (
      Q(0) => Q(0),
      comp0 => comp0,
      comp1 => comp1,
      \gc0.count_reg[8]\ => rpntr_n_0,
      p_18_out => p_18_out,
      ram_empty_fb_i_reg_0 => \gr1.rfwft_n_3\,
      rd_clk => rd_clk,
      v1_reg(3 downto 0) => v1_reg(3 downto 0),
      v1_reg_0(3 downto 0) => \c0/v1_reg\(3 downto 0),
      \wr_pntr_bin_reg[8]\ => \wr_pntr_bin_reg[8]\
    );
rpntr: entity work.bitfile_fifo_in_rd_bin_cntr
     port map (
      Q(7 downto 0) => \gc0.count_d1_reg[7]\(7 downto 0),
      WR_PNTR_RD(8 downto 0) => WR_PNTR_RD(8 downto 0),
      \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\(0) => Q(0),
      ram_empty_fb_i_reg => rpntr_n_0,
      ram_empty_fb_i_reg_0 => \gr1.rfwft_n_2\,
      rd_clk => rd_clk,
      \rd_pntr_gc_reg[0]\ => \rd_pntr_gc_reg[0]\,
      \rd_pntr_gc_reg[1]\ => \rd_pntr_gc_reg[1]\,
      \rd_pntr_gc_reg[2]\ => \rd_pntr_gc_reg[2]\,
      \rd_pntr_gc_reg[3]\ => \rd_pntr_gc_reg[3]\,
      \rd_pntr_gc_reg[4]\ => \rd_pntr_gc_reg[4]\,
      \rd_pntr_gc_reg[5]\ => \rd_pntr_gc_reg[5]\,
      \rd_pntr_gc_reg[8]\(8 downto 0) => \rd_pntr_gc_reg[8]\(8 downto 0),
      v1_reg(3 downto 0) => \c0/v1_reg\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_wr_logic is
  port (
    full : out STD_LOGIC;
    \gic0.gc0.count_d2_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \gic0.gc0.count_d1_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \gpr1.dout_i_reg[31]\ : out STD_LOGIC;
    \wr_pntr_gc_reg[8]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \gpr1.dout_i_reg[30]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_0\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_1\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_2\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_3\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_4\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_5\ : out STD_LOGIC;
    \gpr1.dout_i_reg[31]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[30]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[27]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[24]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[21]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[18]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[15]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[12]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[9]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[6]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[3]_6\ : out STD_LOGIC;
    \gpr1.dout_i_reg[0]_6\ : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wr_en : in STD_LOGIC;
    RD_PNTR_WR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_wr_logic : entity is "wr_logic";
end bitfile_fifo_in_wr_logic;

architecture STRUCTURE of bitfile_fifo_in_wr_logic is
  signal comp1 : STD_LOGIC;
  signal comp2 : STD_LOGIC;
  signal p_0_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal wpntr_n_0 : STD_LOGIC;
  signal wpntr_n_1 : STD_LOGIC;
  signal wpntr_n_2 : STD_LOGIC;
begin
\gwas.wsts\: entity work.bitfile_fifo_in_wr_status_flags_as
     port map (
      E(0) => p_3_out,
      Q(0) => Q(0),
      comp1 => comp1,
      comp2 => comp2,
      full => full,
      \gic0.gc0.count_d1_reg[8]\ => wpntr_n_1,
      \gic0.gc0.count_reg[8]\ => wpntr_n_2,
      p_0_out => p_0_out,
      ram_full_fb_i_reg_0 => wpntr_n_0,
      v1_reg(3 downto 0) => v1_reg(3 downto 0),
      v1_reg_0(3 downto 0) => v1_reg_0(3 downto 0),
      wr_clk => wr_clk,
      wr_en => wr_en
    );
wpntr: entity work.bitfile_fifo_in_wr_bin_cntr
     port map (
      E(0) => p_3_out,
      Q(7 downto 0) => \gic0.gc0.count_d1_reg[7]\(7 downto 0),
      RD_PNTR_WR(0) => RD_PNTR_WR(0),
      comp1 => comp1,
      comp2 => comp2,
      \gic0.gc0.count_d2_reg[7]_0\(7 downto 0) => \gic0.gc0.count_d2_reg[7]\(7 downto 0),
      \gpr1.dout_i_reg[0]\ => \gpr1.dout_i_reg[0]\,
      \gpr1.dout_i_reg[0]_0\ => \gpr1.dout_i_reg[0]_0\,
      \gpr1.dout_i_reg[0]_1\ => \gpr1.dout_i_reg[0]_1\,
      \gpr1.dout_i_reg[0]_2\ => \gpr1.dout_i_reg[0]_2\,
      \gpr1.dout_i_reg[0]_3\ => \gpr1.dout_i_reg[0]_3\,
      \gpr1.dout_i_reg[0]_4\ => \gpr1.dout_i_reg[0]_4\,
      \gpr1.dout_i_reg[0]_5\ => \gpr1.dout_i_reg[0]_5\,
      \gpr1.dout_i_reg[0]_6\ => \gpr1.dout_i_reg[0]_6\,
      \gpr1.dout_i_reg[12]\ => \gpr1.dout_i_reg[12]\,
      \gpr1.dout_i_reg[12]_0\ => \gpr1.dout_i_reg[12]_0\,
      \gpr1.dout_i_reg[12]_1\ => \gpr1.dout_i_reg[12]_1\,
      \gpr1.dout_i_reg[12]_2\ => \gpr1.dout_i_reg[12]_2\,
      \gpr1.dout_i_reg[12]_3\ => \gpr1.dout_i_reg[12]_3\,
      \gpr1.dout_i_reg[12]_4\ => \gpr1.dout_i_reg[12]_4\,
      \gpr1.dout_i_reg[12]_5\ => \gpr1.dout_i_reg[12]_5\,
      \gpr1.dout_i_reg[12]_6\ => \gpr1.dout_i_reg[12]_6\,
      \gpr1.dout_i_reg[15]\ => \gpr1.dout_i_reg[15]\,
      \gpr1.dout_i_reg[15]_0\ => \gpr1.dout_i_reg[15]_0\,
      \gpr1.dout_i_reg[15]_1\ => \gpr1.dout_i_reg[15]_1\,
      \gpr1.dout_i_reg[15]_2\ => \gpr1.dout_i_reg[15]_2\,
      \gpr1.dout_i_reg[15]_3\ => \gpr1.dout_i_reg[15]_3\,
      \gpr1.dout_i_reg[15]_4\ => \gpr1.dout_i_reg[15]_4\,
      \gpr1.dout_i_reg[15]_5\ => \gpr1.dout_i_reg[15]_5\,
      \gpr1.dout_i_reg[15]_6\ => \gpr1.dout_i_reg[15]_6\,
      \gpr1.dout_i_reg[18]\ => \gpr1.dout_i_reg[18]\,
      \gpr1.dout_i_reg[18]_0\ => \gpr1.dout_i_reg[18]_0\,
      \gpr1.dout_i_reg[18]_1\ => \gpr1.dout_i_reg[18]_1\,
      \gpr1.dout_i_reg[18]_2\ => \gpr1.dout_i_reg[18]_2\,
      \gpr1.dout_i_reg[18]_3\ => \gpr1.dout_i_reg[18]_3\,
      \gpr1.dout_i_reg[18]_4\ => \gpr1.dout_i_reg[18]_4\,
      \gpr1.dout_i_reg[18]_5\ => \gpr1.dout_i_reg[18]_5\,
      \gpr1.dout_i_reg[18]_6\ => \gpr1.dout_i_reg[18]_6\,
      \gpr1.dout_i_reg[21]\ => \gpr1.dout_i_reg[21]\,
      \gpr1.dout_i_reg[21]_0\ => \gpr1.dout_i_reg[21]_0\,
      \gpr1.dout_i_reg[21]_1\ => \gpr1.dout_i_reg[21]_1\,
      \gpr1.dout_i_reg[21]_2\ => \gpr1.dout_i_reg[21]_2\,
      \gpr1.dout_i_reg[21]_3\ => \gpr1.dout_i_reg[21]_3\,
      \gpr1.dout_i_reg[21]_4\ => \gpr1.dout_i_reg[21]_4\,
      \gpr1.dout_i_reg[21]_5\ => \gpr1.dout_i_reg[21]_5\,
      \gpr1.dout_i_reg[21]_6\ => \gpr1.dout_i_reg[21]_6\,
      \gpr1.dout_i_reg[24]\ => \gpr1.dout_i_reg[24]\,
      \gpr1.dout_i_reg[24]_0\ => \gpr1.dout_i_reg[24]_0\,
      \gpr1.dout_i_reg[24]_1\ => \gpr1.dout_i_reg[24]_1\,
      \gpr1.dout_i_reg[24]_2\ => \gpr1.dout_i_reg[24]_2\,
      \gpr1.dout_i_reg[24]_3\ => \gpr1.dout_i_reg[24]_3\,
      \gpr1.dout_i_reg[24]_4\ => \gpr1.dout_i_reg[24]_4\,
      \gpr1.dout_i_reg[24]_5\ => \gpr1.dout_i_reg[24]_5\,
      \gpr1.dout_i_reg[24]_6\ => \gpr1.dout_i_reg[24]_6\,
      \gpr1.dout_i_reg[27]\ => \gpr1.dout_i_reg[27]\,
      \gpr1.dout_i_reg[27]_0\ => \gpr1.dout_i_reg[27]_0\,
      \gpr1.dout_i_reg[27]_1\ => \gpr1.dout_i_reg[27]_1\,
      \gpr1.dout_i_reg[27]_2\ => \gpr1.dout_i_reg[27]_2\,
      \gpr1.dout_i_reg[27]_3\ => \gpr1.dout_i_reg[27]_3\,
      \gpr1.dout_i_reg[27]_4\ => \gpr1.dout_i_reg[27]_4\,
      \gpr1.dout_i_reg[27]_5\ => \gpr1.dout_i_reg[27]_5\,
      \gpr1.dout_i_reg[27]_6\ => \gpr1.dout_i_reg[27]_6\,
      \gpr1.dout_i_reg[30]\ => \gpr1.dout_i_reg[30]\,
      \gpr1.dout_i_reg[30]_0\ => \gpr1.dout_i_reg[30]_0\,
      \gpr1.dout_i_reg[30]_1\ => \gpr1.dout_i_reg[30]_1\,
      \gpr1.dout_i_reg[30]_2\ => \gpr1.dout_i_reg[30]_2\,
      \gpr1.dout_i_reg[30]_3\ => \gpr1.dout_i_reg[30]_3\,
      \gpr1.dout_i_reg[30]_4\ => \gpr1.dout_i_reg[30]_4\,
      \gpr1.dout_i_reg[30]_5\ => \gpr1.dout_i_reg[30]_5\,
      \gpr1.dout_i_reg[30]_6\ => \gpr1.dout_i_reg[30]_6\,
      \gpr1.dout_i_reg[31]\ => \gpr1.dout_i_reg[31]\,
      \gpr1.dout_i_reg[31]_0\ => \gpr1.dout_i_reg[31]_0\,
      \gpr1.dout_i_reg[31]_1\ => \gpr1.dout_i_reg[31]_1\,
      \gpr1.dout_i_reg[31]_2\ => \gpr1.dout_i_reg[31]_2\,
      \gpr1.dout_i_reg[31]_3\ => \gpr1.dout_i_reg[31]_3\,
      \gpr1.dout_i_reg[31]_4\ => \gpr1.dout_i_reg[31]_4\,
      \gpr1.dout_i_reg[31]_5\ => \gpr1.dout_i_reg[31]_5\,
      \gpr1.dout_i_reg[31]_6\ => \gpr1.dout_i_reg[31]_6\,
      \gpr1.dout_i_reg[3]\ => \gpr1.dout_i_reg[3]\,
      \gpr1.dout_i_reg[3]_0\ => \gpr1.dout_i_reg[3]_0\,
      \gpr1.dout_i_reg[3]_1\ => \gpr1.dout_i_reg[3]_1\,
      \gpr1.dout_i_reg[3]_2\ => \gpr1.dout_i_reg[3]_2\,
      \gpr1.dout_i_reg[3]_3\ => \gpr1.dout_i_reg[3]_3\,
      \gpr1.dout_i_reg[3]_4\ => \gpr1.dout_i_reg[3]_4\,
      \gpr1.dout_i_reg[3]_5\ => \gpr1.dout_i_reg[3]_5\,
      \gpr1.dout_i_reg[3]_6\ => \gpr1.dout_i_reg[3]_6\,
      \gpr1.dout_i_reg[6]\ => \gpr1.dout_i_reg[6]\,
      \gpr1.dout_i_reg[6]_0\ => \gpr1.dout_i_reg[6]_0\,
      \gpr1.dout_i_reg[6]_1\ => \gpr1.dout_i_reg[6]_1\,
      \gpr1.dout_i_reg[6]_2\ => \gpr1.dout_i_reg[6]_2\,
      \gpr1.dout_i_reg[6]_3\ => \gpr1.dout_i_reg[6]_3\,
      \gpr1.dout_i_reg[6]_4\ => \gpr1.dout_i_reg[6]_4\,
      \gpr1.dout_i_reg[6]_5\ => \gpr1.dout_i_reg[6]_5\,
      \gpr1.dout_i_reg[6]_6\ => \gpr1.dout_i_reg[6]_6\,
      \gpr1.dout_i_reg[9]\ => \gpr1.dout_i_reg[9]\,
      \gpr1.dout_i_reg[9]_0\ => \gpr1.dout_i_reg[9]_0\,
      \gpr1.dout_i_reg[9]_1\ => \gpr1.dout_i_reg[9]_1\,
      \gpr1.dout_i_reg[9]_2\ => \gpr1.dout_i_reg[9]_2\,
      \gpr1.dout_i_reg[9]_3\ => \gpr1.dout_i_reg[9]_3\,
      \gpr1.dout_i_reg[9]_4\ => \gpr1.dout_i_reg[9]_4\,
      \gpr1.dout_i_reg[9]_5\ => \gpr1.dout_i_reg[9]_5\,
      \gpr1.dout_i_reg[9]_6\ => \gpr1.dout_i_reg[9]_6\,
      \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\(0) => Q(1),
      p_0_out => p_0_out,
      ram_full_i_reg => wpntr_n_0,
      ram_full_i_reg_0 => wpntr_n_1,
      ram_full_i_reg_1 => wpntr_n_2,
      wr_clk => wr_clk,
      wr_en => wr_en,
      \wr_pntr_gc_reg[8]\(8 downto 0) => \wr_pntr_gc_reg[8]\(8 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_fifo_generator_ramfifo is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_fifo_generator_ramfifo : entity is "fifo_generator_ramfifo";
end bitfile_fifo_in_fifo_generator_ramfifo;

architecture STRUCTURE of bitfile_fifo_in_fifo_generator_ramfifo is
  signal RD_RST : STD_LOGIC;
  signal \^rst\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_0\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_1\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_19\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_20\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_21\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_22\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_23\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.rd_n_24\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_100\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_101\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_102\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_103\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_104\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_105\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_106\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_107\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_108\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_109\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_110\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_111\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_112\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_113\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_114\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_115\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_116\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_117\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_118\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_119\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_120\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_121\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_17\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_27\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_28\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_29\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_30\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_31\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_32\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_33\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_34\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_35\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_36\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_37\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_38\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_39\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_40\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_41\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_42\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_43\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_44\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_45\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_46\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_47\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_48\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_49\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_50\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_51\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_52\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_53\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_54\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_55\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_56\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_57\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_58\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_59\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_60\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_61\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_62\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_63\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_64\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_65\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_66\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_67\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_68\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_69\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_70\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_71\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_72\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_73\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_74\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_75\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_76\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_77\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_78\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_79\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_80\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_81\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_82\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_83\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_84\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_85\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_86\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_87\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_88\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_89\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_90\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_91\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_92\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_93\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_94\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_95\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_96\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_97\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_98\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_99\ : STD_LOGIC;
  signal \gras.rsts/c1/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \gwas.wsts/c1/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \gwas.wsts/c2/v1_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 8 to 8 );
  signal p_15_out : STD_LOGIC;
  signal p_1_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_20_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_8_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rd_rst_i : STD_LOGIC_VECTOR ( 1 to 1 );
  signal rst_full_ff_i : STD_LOGIC;
  signal rstblk_n_4 : STD_LOGIC;
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
\gntv_or_sync_fifo.gcx.clkx\: entity work.bitfile_fifo_in_clk_x_pntrs
     port map (
      Q(2 downto 0) => p_20_out(8 downto 6),
      RD_PNTR_WR(0) => p_0_out(8),
      WR_PNTR_RD(8 downto 0) => p_1_out(8 downto 0),
      \gc0.count_d1_reg[0]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_24\,
      \gc0.count_d1_reg[1]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_23\,
      \gc0.count_d1_reg[2]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_22\,
      \gc0.count_d1_reg[3]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_21\,
      \gc0.count_d1_reg[4]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_20\,
      \gc0.count_d1_reg[5]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_19\,
      \gc0.count_reg[7]\(7 downto 0) => rd_pntr_plus1(7 downto 0),
      \gic0.gc0.count_d1_reg[7]\(7 downto 0) => p_8_out(7 downto 0),
      \gic0.gc0.count_d2_reg[8]\(8 downto 0) => p_9_out(8 downto 0),
      \gic0.gc0.count_reg[7]\(7 downto 0) => wr_pntr_plus2(7 downto 0),
      \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\(0) => rd_rst_i(1),
      \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\(0) => rst_full_ff_i,
      ram_empty_fb_i_reg => \gntv_or_sync_fifo.gcx.clkx_n_0\,
      rd_clk => rd_clk,
      v1_reg(3 downto 0) => \gras.rsts/c1/v1_reg\(3 downto 0),
      v1_reg_0(3 downto 0) => \gwas.wsts/c1/v1_reg\(3 downto 0),
      v1_reg_1(3 downto 0) => \gwas.wsts/c2/v1_reg\(3 downto 0),
      wr_clk => wr_clk
    );
\gntv_or_sync_fifo.gl0.rd\: entity work.bitfile_fifo_in_rd_logic
     port map (
      E(0) => \gntv_or_sync_fifo.gl0.rd_n_1\,
      Q(0) => RD_RST,
      WR_PNTR_RD(8 downto 0) => p_1_out(8 downto 0),
      empty => empty,
      \gc0.count_d1_reg[7]\(7 downto 0) => rd_pntr_plus1(7 downto 0),
      \goreg_dm.dout_i_reg[31]\(0) => p_15_out,
      rd_clk => rd_clk,
      rd_en => rd_en,
      \rd_pntr_gc_reg[0]\ => \gntv_or_sync_fifo.gl0.rd_n_24\,
      \rd_pntr_gc_reg[1]\ => \gntv_or_sync_fifo.gl0.rd_n_23\,
      \rd_pntr_gc_reg[2]\ => \gntv_or_sync_fifo.gl0.rd_n_22\,
      \rd_pntr_gc_reg[3]\ => \gntv_or_sync_fifo.gl0.rd_n_21\,
      \rd_pntr_gc_reg[4]\ => \gntv_or_sync_fifo.gl0.rd_n_20\,
      \rd_pntr_gc_reg[5]\ => \gntv_or_sync_fifo.gl0.rd_n_19\,
      \rd_pntr_gc_reg[8]\(8 downto 0) => p_20_out(8 downto 0),
      v1_reg(3 downto 0) => \gras.rsts/c1/v1_reg\(3 downto 0),
      \wr_pntr_bin_reg[8]\ => \gntv_or_sync_fifo.gcx.clkx_n_0\
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.bitfile_fifo_in_wr_logic
     port map (
      Q(1) => \^rst\,
      Q(0) => rst_full_ff_i,
      RD_PNTR_WR(0) => p_0_out(8),
      full => full,
      \gic0.gc0.count_d1_reg[7]\(7 downto 0) => wr_pntr_plus2(7 downto 0),
      \gic0.gc0.count_d2_reg[7]\(7 downto 0) => p_8_out(7 downto 0),
      \gpr1.dout_i_reg[0]\ => \gntv_or_sync_fifo.gl0.wr_n_70\,
      \gpr1.dout_i_reg[0]_0\ => \gntv_or_sync_fifo.gl0.wr_n_71\,
      \gpr1.dout_i_reg[0]_1\ => \gntv_or_sync_fifo.gl0.wr_n_72\,
      \gpr1.dout_i_reg[0]_2\ => \gntv_or_sync_fifo.gl0.wr_n_73\,
      \gpr1.dout_i_reg[0]_3\ => \gntv_or_sync_fifo.gl0.wr_n_85\,
      \gpr1.dout_i_reg[0]_4\ => \gntv_or_sync_fifo.gl0.wr_n_97\,
      \gpr1.dout_i_reg[0]_5\ => \gntv_or_sync_fifo.gl0.wr_n_109\,
      \gpr1.dout_i_reg[0]_6\ => \gntv_or_sync_fifo.gl0.wr_n_121\,
      \gpr1.dout_i_reg[12]\ => \gntv_or_sync_fifo.gl0.wr_n_54\,
      \gpr1.dout_i_reg[12]_0\ => \gntv_or_sync_fifo.gl0.wr_n_55\,
      \gpr1.dout_i_reg[12]_1\ => \gntv_or_sync_fifo.gl0.wr_n_56\,
      \gpr1.dout_i_reg[12]_2\ => \gntv_or_sync_fifo.gl0.wr_n_57\,
      \gpr1.dout_i_reg[12]_3\ => \gntv_or_sync_fifo.gl0.wr_n_81\,
      \gpr1.dout_i_reg[12]_4\ => \gntv_or_sync_fifo.gl0.wr_n_93\,
      \gpr1.dout_i_reg[12]_5\ => \gntv_or_sync_fifo.gl0.wr_n_105\,
      \gpr1.dout_i_reg[12]_6\ => \gntv_or_sync_fifo.gl0.wr_n_117\,
      \gpr1.dout_i_reg[15]\ => \gntv_or_sync_fifo.gl0.wr_n_50\,
      \gpr1.dout_i_reg[15]_0\ => \gntv_or_sync_fifo.gl0.wr_n_51\,
      \gpr1.dout_i_reg[15]_1\ => \gntv_or_sync_fifo.gl0.wr_n_52\,
      \gpr1.dout_i_reg[15]_2\ => \gntv_or_sync_fifo.gl0.wr_n_53\,
      \gpr1.dout_i_reg[15]_3\ => \gntv_or_sync_fifo.gl0.wr_n_80\,
      \gpr1.dout_i_reg[15]_4\ => \gntv_or_sync_fifo.gl0.wr_n_92\,
      \gpr1.dout_i_reg[15]_5\ => \gntv_or_sync_fifo.gl0.wr_n_104\,
      \gpr1.dout_i_reg[15]_6\ => \gntv_or_sync_fifo.gl0.wr_n_116\,
      \gpr1.dout_i_reg[18]\ => \gntv_or_sync_fifo.gl0.wr_n_46\,
      \gpr1.dout_i_reg[18]_0\ => \gntv_or_sync_fifo.gl0.wr_n_47\,
      \gpr1.dout_i_reg[18]_1\ => \gntv_or_sync_fifo.gl0.wr_n_48\,
      \gpr1.dout_i_reg[18]_2\ => \gntv_or_sync_fifo.gl0.wr_n_49\,
      \gpr1.dout_i_reg[18]_3\ => \gntv_or_sync_fifo.gl0.wr_n_79\,
      \gpr1.dout_i_reg[18]_4\ => \gntv_or_sync_fifo.gl0.wr_n_91\,
      \gpr1.dout_i_reg[18]_5\ => \gntv_or_sync_fifo.gl0.wr_n_103\,
      \gpr1.dout_i_reg[18]_6\ => \gntv_or_sync_fifo.gl0.wr_n_115\,
      \gpr1.dout_i_reg[21]\ => \gntv_or_sync_fifo.gl0.wr_n_42\,
      \gpr1.dout_i_reg[21]_0\ => \gntv_or_sync_fifo.gl0.wr_n_43\,
      \gpr1.dout_i_reg[21]_1\ => \gntv_or_sync_fifo.gl0.wr_n_44\,
      \gpr1.dout_i_reg[21]_2\ => \gntv_or_sync_fifo.gl0.wr_n_45\,
      \gpr1.dout_i_reg[21]_3\ => \gntv_or_sync_fifo.gl0.wr_n_78\,
      \gpr1.dout_i_reg[21]_4\ => \gntv_or_sync_fifo.gl0.wr_n_90\,
      \gpr1.dout_i_reg[21]_5\ => \gntv_or_sync_fifo.gl0.wr_n_102\,
      \gpr1.dout_i_reg[21]_6\ => \gntv_or_sync_fifo.gl0.wr_n_114\,
      \gpr1.dout_i_reg[24]\ => \gntv_or_sync_fifo.gl0.wr_n_38\,
      \gpr1.dout_i_reg[24]_0\ => \gntv_or_sync_fifo.gl0.wr_n_39\,
      \gpr1.dout_i_reg[24]_1\ => \gntv_or_sync_fifo.gl0.wr_n_40\,
      \gpr1.dout_i_reg[24]_2\ => \gntv_or_sync_fifo.gl0.wr_n_41\,
      \gpr1.dout_i_reg[24]_3\ => \gntv_or_sync_fifo.gl0.wr_n_77\,
      \gpr1.dout_i_reg[24]_4\ => \gntv_or_sync_fifo.gl0.wr_n_89\,
      \gpr1.dout_i_reg[24]_5\ => \gntv_or_sync_fifo.gl0.wr_n_101\,
      \gpr1.dout_i_reg[24]_6\ => \gntv_or_sync_fifo.gl0.wr_n_113\,
      \gpr1.dout_i_reg[27]\ => \gntv_or_sync_fifo.gl0.wr_n_34\,
      \gpr1.dout_i_reg[27]_0\ => \gntv_or_sync_fifo.gl0.wr_n_35\,
      \gpr1.dout_i_reg[27]_1\ => \gntv_or_sync_fifo.gl0.wr_n_36\,
      \gpr1.dout_i_reg[27]_2\ => \gntv_or_sync_fifo.gl0.wr_n_37\,
      \gpr1.dout_i_reg[27]_3\ => \gntv_or_sync_fifo.gl0.wr_n_76\,
      \gpr1.dout_i_reg[27]_4\ => \gntv_or_sync_fifo.gl0.wr_n_88\,
      \gpr1.dout_i_reg[27]_5\ => \gntv_or_sync_fifo.gl0.wr_n_100\,
      \gpr1.dout_i_reg[27]_6\ => \gntv_or_sync_fifo.gl0.wr_n_112\,
      \gpr1.dout_i_reg[30]\ => \gntv_or_sync_fifo.gl0.wr_n_27\,
      \gpr1.dout_i_reg[30]_0\ => \gntv_or_sync_fifo.gl0.wr_n_29\,
      \gpr1.dout_i_reg[30]_1\ => \gntv_or_sync_fifo.gl0.wr_n_31\,
      \gpr1.dout_i_reg[30]_2\ => \gntv_or_sync_fifo.gl0.wr_n_33\,
      \gpr1.dout_i_reg[30]_3\ => \gntv_or_sync_fifo.gl0.wr_n_75\,
      \gpr1.dout_i_reg[30]_4\ => \gntv_or_sync_fifo.gl0.wr_n_87\,
      \gpr1.dout_i_reg[30]_5\ => \gntv_or_sync_fifo.gl0.wr_n_99\,
      \gpr1.dout_i_reg[30]_6\ => \gntv_or_sync_fifo.gl0.wr_n_111\,
      \gpr1.dout_i_reg[31]\ => \gntv_or_sync_fifo.gl0.wr_n_17\,
      \gpr1.dout_i_reg[31]_0\ => \gntv_or_sync_fifo.gl0.wr_n_28\,
      \gpr1.dout_i_reg[31]_1\ => \gntv_or_sync_fifo.gl0.wr_n_30\,
      \gpr1.dout_i_reg[31]_2\ => \gntv_or_sync_fifo.gl0.wr_n_32\,
      \gpr1.dout_i_reg[31]_3\ => \gntv_or_sync_fifo.gl0.wr_n_74\,
      \gpr1.dout_i_reg[31]_4\ => \gntv_or_sync_fifo.gl0.wr_n_86\,
      \gpr1.dout_i_reg[31]_5\ => \gntv_or_sync_fifo.gl0.wr_n_98\,
      \gpr1.dout_i_reg[31]_6\ => \gntv_or_sync_fifo.gl0.wr_n_110\,
      \gpr1.dout_i_reg[3]\ => \gntv_or_sync_fifo.gl0.wr_n_66\,
      \gpr1.dout_i_reg[3]_0\ => \gntv_or_sync_fifo.gl0.wr_n_67\,
      \gpr1.dout_i_reg[3]_1\ => \gntv_or_sync_fifo.gl0.wr_n_68\,
      \gpr1.dout_i_reg[3]_2\ => \gntv_or_sync_fifo.gl0.wr_n_69\,
      \gpr1.dout_i_reg[3]_3\ => \gntv_or_sync_fifo.gl0.wr_n_84\,
      \gpr1.dout_i_reg[3]_4\ => \gntv_or_sync_fifo.gl0.wr_n_96\,
      \gpr1.dout_i_reg[3]_5\ => \gntv_or_sync_fifo.gl0.wr_n_108\,
      \gpr1.dout_i_reg[3]_6\ => \gntv_or_sync_fifo.gl0.wr_n_120\,
      \gpr1.dout_i_reg[6]\ => \gntv_or_sync_fifo.gl0.wr_n_62\,
      \gpr1.dout_i_reg[6]_0\ => \gntv_or_sync_fifo.gl0.wr_n_63\,
      \gpr1.dout_i_reg[6]_1\ => \gntv_or_sync_fifo.gl0.wr_n_64\,
      \gpr1.dout_i_reg[6]_2\ => \gntv_or_sync_fifo.gl0.wr_n_65\,
      \gpr1.dout_i_reg[6]_3\ => \gntv_or_sync_fifo.gl0.wr_n_83\,
      \gpr1.dout_i_reg[6]_4\ => \gntv_or_sync_fifo.gl0.wr_n_95\,
      \gpr1.dout_i_reg[6]_5\ => \gntv_or_sync_fifo.gl0.wr_n_107\,
      \gpr1.dout_i_reg[6]_6\ => \gntv_or_sync_fifo.gl0.wr_n_119\,
      \gpr1.dout_i_reg[9]\ => \gntv_or_sync_fifo.gl0.wr_n_58\,
      \gpr1.dout_i_reg[9]_0\ => \gntv_or_sync_fifo.gl0.wr_n_59\,
      \gpr1.dout_i_reg[9]_1\ => \gntv_or_sync_fifo.gl0.wr_n_60\,
      \gpr1.dout_i_reg[9]_2\ => \gntv_or_sync_fifo.gl0.wr_n_61\,
      \gpr1.dout_i_reg[9]_3\ => \gntv_or_sync_fifo.gl0.wr_n_82\,
      \gpr1.dout_i_reg[9]_4\ => \gntv_or_sync_fifo.gl0.wr_n_94\,
      \gpr1.dout_i_reg[9]_5\ => \gntv_or_sync_fifo.gl0.wr_n_106\,
      \gpr1.dout_i_reg[9]_6\ => \gntv_or_sync_fifo.gl0.wr_n_118\,
      v1_reg(3 downto 0) => \gwas.wsts/c1/v1_reg\(3 downto 0),
      v1_reg_0(3 downto 0) => \gwas.wsts/c2/v1_reg\(3 downto 0),
      wr_clk => wr_clk,
      wr_en => wr_en,
      \wr_pntr_gc_reg[8]\(8 downto 0) => p_9_out(8 downto 0)
    );
\gntv_or_sync_fifo.mem\: entity work.bitfile_fifo_in_memory
     port map (
      E(0) => \gntv_or_sync_fifo.gl0.rd_n_1\,
      Q(0) => rstblk_n_4,
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      \gc0.count_d1_reg[0]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_24\,
      \gc0.count_d1_reg[1]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_23\,
      \gc0.count_d1_reg[2]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_22\,
      \gc0.count_d1_reg[3]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_21\,
      \gc0.count_d1_reg[4]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_20\,
      \gc0.count_d1_reg[5]_rep\ => \gntv_or_sync_fifo.gl0.rd_n_19\,
      \gc0.count_d1_reg[8]\(8 downto 0) => p_20_out(8 downto 0),
      \gic0.gc0.count_d2_reg[5]\(5 downto 0) => p_9_out(5 downto 0),
      \gic0.gc0.count_d2_reg[6]\ => \gntv_or_sync_fifo.gl0.wr_n_109\,
      \gic0.gc0.count_d2_reg[6]_0\ => \gntv_or_sync_fifo.gl0.wr_n_108\,
      \gic0.gc0.count_d2_reg[6]_1\ => \gntv_or_sync_fifo.gl0.wr_n_107\,
      \gic0.gc0.count_d2_reg[6]_10\ => \gntv_or_sync_fifo.gl0.wr_n_98\,
      \gic0.gc0.count_d2_reg[6]_2\ => \gntv_or_sync_fifo.gl0.wr_n_106\,
      \gic0.gc0.count_d2_reg[6]_3\ => \gntv_or_sync_fifo.gl0.wr_n_105\,
      \gic0.gc0.count_d2_reg[6]_4\ => \gntv_or_sync_fifo.gl0.wr_n_104\,
      \gic0.gc0.count_d2_reg[6]_5\ => \gntv_or_sync_fifo.gl0.wr_n_103\,
      \gic0.gc0.count_d2_reg[6]_6\ => \gntv_or_sync_fifo.gl0.wr_n_102\,
      \gic0.gc0.count_d2_reg[6]_7\ => \gntv_or_sync_fifo.gl0.wr_n_101\,
      \gic0.gc0.count_d2_reg[6]_8\ => \gntv_or_sync_fifo.gl0.wr_n_100\,
      \gic0.gc0.count_d2_reg[6]_9\ => \gntv_or_sync_fifo.gl0.wr_n_99\,
      \gic0.gc0.count_d2_reg[7]\ => \gntv_or_sync_fifo.gl0.wr_n_73\,
      \gic0.gc0.count_d2_reg[7]_0\ => \gntv_or_sync_fifo.gl0.wr_n_85\,
      \gic0.gc0.count_d2_reg[7]_1\ => \gntv_or_sync_fifo.gl0.wr_n_97\,
      \gic0.gc0.count_d2_reg[7]_10\ => \gntv_or_sync_fifo.gl0.wr_n_119\,
      \gic0.gc0.count_d2_reg[7]_11\ => \gntv_or_sync_fifo.gl0.wr_n_61\,
      \gic0.gc0.count_d2_reg[7]_12\ => \gntv_or_sync_fifo.gl0.wr_n_82\,
      \gic0.gc0.count_d2_reg[7]_13\ => \gntv_or_sync_fifo.gl0.wr_n_94\,
      \gic0.gc0.count_d2_reg[7]_14\ => \gntv_or_sync_fifo.gl0.wr_n_118\,
      \gic0.gc0.count_d2_reg[7]_15\ => \gntv_or_sync_fifo.gl0.wr_n_57\,
      \gic0.gc0.count_d2_reg[7]_16\ => \gntv_or_sync_fifo.gl0.wr_n_81\,
      \gic0.gc0.count_d2_reg[7]_17\ => \gntv_or_sync_fifo.gl0.wr_n_93\,
      \gic0.gc0.count_d2_reg[7]_18\ => \gntv_or_sync_fifo.gl0.wr_n_117\,
      \gic0.gc0.count_d2_reg[7]_19\ => \gntv_or_sync_fifo.gl0.wr_n_53\,
      \gic0.gc0.count_d2_reg[7]_2\ => \gntv_or_sync_fifo.gl0.wr_n_121\,
      \gic0.gc0.count_d2_reg[7]_20\ => \gntv_or_sync_fifo.gl0.wr_n_80\,
      \gic0.gc0.count_d2_reg[7]_21\ => \gntv_or_sync_fifo.gl0.wr_n_92\,
      \gic0.gc0.count_d2_reg[7]_22\ => \gntv_or_sync_fifo.gl0.wr_n_116\,
      \gic0.gc0.count_d2_reg[7]_23\ => \gntv_or_sync_fifo.gl0.wr_n_49\,
      \gic0.gc0.count_d2_reg[7]_24\ => \gntv_or_sync_fifo.gl0.wr_n_79\,
      \gic0.gc0.count_d2_reg[7]_25\ => \gntv_or_sync_fifo.gl0.wr_n_91\,
      \gic0.gc0.count_d2_reg[7]_26\ => \gntv_or_sync_fifo.gl0.wr_n_115\,
      \gic0.gc0.count_d2_reg[7]_27\ => \gntv_or_sync_fifo.gl0.wr_n_45\,
      \gic0.gc0.count_d2_reg[7]_28\ => \gntv_or_sync_fifo.gl0.wr_n_78\,
      \gic0.gc0.count_d2_reg[7]_29\ => \gntv_or_sync_fifo.gl0.wr_n_90\,
      \gic0.gc0.count_d2_reg[7]_3\ => \gntv_or_sync_fifo.gl0.wr_n_69\,
      \gic0.gc0.count_d2_reg[7]_30\ => \gntv_or_sync_fifo.gl0.wr_n_114\,
      \gic0.gc0.count_d2_reg[7]_31\ => \gntv_or_sync_fifo.gl0.wr_n_41\,
      \gic0.gc0.count_d2_reg[7]_32\ => \gntv_or_sync_fifo.gl0.wr_n_77\,
      \gic0.gc0.count_d2_reg[7]_33\ => \gntv_or_sync_fifo.gl0.wr_n_89\,
      \gic0.gc0.count_d2_reg[7]_34\ => \gntv_or_sync_fifo.gl0.wr_n_113\,
      \gic0.gc0.count_d2_reg[7]_35\ => \gntv_or_sync_fifo.gl0.wr_n_37\,
      \gic0.gc0.count_d2_reg[7]_36\ => \gntv_or_sync_fifo.gl0.wr_n_76\,
      \gic0.gc0.count_d2_reg[7]_37\ => \gntv_or_sync_fifo.gl0.wr_n_88\,
      \gic0.gc0.count_d2_reg[7]_38\ => \gntv_or_sync_fifo.gl0.wr_n_112\,
      \gic0.gc0.count_d2_reg[7]_39\ => \gntv_or_sync_fifo.gl0.wr_n_33\,
      \gic0.gc0.count_d2_reg[7]_4\ => \gntv_or_sync_fifo.gl0.wr_n_84\,
      \gic0.gc0.count_d2_reg[7]_40\ => \gntv_or_sync_fifo.gl0.wr_n_32\,
      \gic0.gc0.count_d2_reg[7]_41\ => \gntv_or_sync_fifo.gl0.wr_n_75\,
      \gic0.gc0.count_d2_reg[7]_42\ => \gntv_or_sync_fifo.gl0.wr_n_74\,
      \gic0.gc0.count_d2_reg[7]_43\ => \gntv_or_sync_fifo.gl0.wr_n_87\,
      \gic0.gc0.count_d2_reg[7]_44\ => \gntv_or_sync_fifo.gl0.wr_n_86\,
      \gic0.gc0.count_d2_reg[7]_45\ => \gntv_or_sync_fifo.gl0.wr_n_111\,
      \gic0.gc0.count_d2_reg[7]_46\ => \gntv_or_sync_fifo.gl0.wr_n_110\,
      \gic0.gc0.count_d2_reg[7]_5\ => \gntv_or_sync_fifo.gl0.wr_n_96\,
      \gic0.gc0.count_d2_reg[7]_6\ => \gntv_or_sync_fifo.gl0.wr_n_120\,
      \gic0.gc0.count_d2_reg[7]_7\ => \gntv_or_sync_fifo.gl0.wr_n_65\,
      \gic0.gc0.count_d2_reg[7]_8\ => \gntv_or_sync_fifo.gl0.wr_n_83\,
      \gic0.gc0.count_d2_reg[7]_9\ => \gntv_or_sync_fifo.gl0.wr_n_95\,
      \gic0.gc0.count_d2_reg[8]\ => \gntv_or_sync_fifo.gl0.wr_n_72\,
      \gic0.gc0.count_d2_reg[8]_0\ => \gntv_or_sync_fifo.gl0.wr_n_71\,
      \gic0.gc0.count_d2_reg[8]_1\ => \gntv_or_sync_fifo.gl0.wr_n_70\,
      \gic0.gc0.count_d2_reg[8]_10\ => \gntv_or_sync_fifo.gl0.wr_n_58\,
      \gic0.gc0.count_d2_reg[8]_11\ => \gntv_or_sync_fifo.gl0.wr_n_56\,
      \gic0.gc0.count_d2_reg[8]_12\ => \gntv_or_sync_fifo.gl0.wr_n_55\,
      \gic0.gc0.count_d2_reg[8]_13\ => \gntv_or_sync_fifo.gl0.wr_n_54\,
      \gic0.gc0.count_d2_reg[8]_14\ => \gntv_or_sync_fifo.gl0.wr_n_52\,
      \gic0.gc0.count_d2_reg[8]_15\ => \gntv_or_sync_fifo.gl0.wr_n_51\,
      \gic0.gc0.count_d2_reg[8]_16\ => \gntv_or_sync_fifo.gl0.wr_n_50\,
      \gic0.gc0.count_d2_reg[8]_17\ => \gntv_or_sync_fifo.gl0.wr_n_48\,
      \gic0.gc0.count_d2_reg[8]_18\ => \gntv_or_sync_fifo.gl0.wr_n_47\,
      \gic0.gc0.count_d2_reg[8]_19\ => \gntv_or_sync_fifo.gl0.wr_n_46\,
      \gic0.gc0.count_d2_reg[8]_2\ => \gntv_or_sync_fifo.gl0.wr_n_68\,
      \gic0.gc0.count_d2_reg[8]_20\ => \gntv_or_sync_fifo.gl0.wr_n_44\,
      \gic0.gc0.count_d2_reg[8]_21\ => \gntv_or_sync_fifo.gl0.wr_n_43\,
      \gic0.gc0.count_d2_reg[8]_22\ => \gntv_or_sync_fifo.gl0.wr_n_42\,
      \gic0.gc0.count_d2_reg[8]_23\ => \gntv_or_sync_fifo.gl0.wr_n_40\,
      \gic0.gc0.count_d2_reg[8]_24\ => \gntv_or_sync_fifo.gl0.wr_n_39\,
      \gic0.gc0.count_d2_reg[8]_25\ => \gntv_or_sync_fifo.gl0.wr_n_38\,
      \gic0.gc0.count_d2_reg[8]_26\ => \gntv_or_sync_fifo.gl0.wr_n_36\,
      \gic0.gc0.count_d2_reg[8]_27\ => \gntv_or_sync_fifo.gl0.wr_n_35\,
      \gic0.gc0.count_d2_reg[8]_28\ => \gntv_or_sync_fifo.gl0.wr_n_34\,
      \gic0.gc0.count_d2_reg[8]_29\ => \gntv_or_sync_fifo.gl0.wr_n_31\,
      \gic0.gc0.count_d2_reg[8]_3\ => \gntv_or_sync_fifo.gl0.wr_n_67\,
      \gic0.gc0.count_d2_reg[8]_30\ => \gntv_or_sync_fifo.gl0.wr_n_30\,
      \gic0.gc0.count_d2_reg[8]_31\ => \gntv_or_sync_fifo.gl0.wr_n_29\,
      \gic0.gc0.count_d2_reg[8]_32\ => \gntv_or_sync_fifo.gl0.wr_n_28\,
      \gic0.gc0.count_d2_reg[8]_33\ => \gntv_or_sync_fifo.gl0.wr_n_27\,
      \gic0.gc0.count_d2_reg[8]_34\ => \gntv_or_sync_fifo.gl0.wr_n_17\,
      \gic0.gc0.count_d2_reg[8]_4\ => \gntv_or_sync_fifo.gl0.wr_n_66\,
      \gic0.gc0.count_d2_reg[8]_5\ => \gntv_or_sync_fifo.gl0.wr_n_64\,
      \gic0.gc0.count_d2_reg[8]_6\ => \gntv_or_sync_fifo.gl0.wr_n_63\,
      \gic0.gc0.count_d2_reg[8]_7\ => \gntv_or_sync_fifo.gl0.wr_n_62\,
      \gic0.gc0.count_d2_reg[8]_8\ => \gntv_or_sync_fifo.gl0.wr_n_60\,
      \gic0.gc0.count_d2_reg[8]_9\ => \gntv_or_sync_fifo.gl0.wr_n_59\,
      \gpregsm1.curr_fwft_state_reg[1]\(0) => p_15_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk
    );
rstblk: entity work.\bitfile_fifo_in_reset_blk_ramfifo__parameterized0\
     port map (
      Q(1) => \^rst\,
      Q(0) => rst_full_ff_i,
      \gc0.count_d1_reg[0]_rep\(2) => RD_RST,
      \gc0.count_d1_reg[0]_rep\(1) => rd_rst_i(1),
      \gc0.count_d1_reg[0]_rep\(0) => rstblk_n_4,
      rd_clk => rd_clk,
      rst => rst,
      wr_clk => wr_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_fifo_generator_top is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_fifo_generator_top : entity is "fifo_generator_top";
end bitfile_fifo_in_fifo_generator_top;

architecture STRUCTURE of bitfile_fifo_in_fifo_generator_top is
begin
\grf.rf\: entity work.bitfile_fifo_in_fifo_generator_ramfifo
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_fifo_generator_v13_0_0_synth is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_en : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_fifo_generator_v13_0_0_synth : entity is "fifo_generator_v13_0_0_synth";
end bitfile_fifo_in_fifo_generator_v13_0_0_synth;

architecture STRUCTURE of bitfile_fifo_in_fifo_generator_v13_0_0_synth is
begin
\gconvfifo.rf\: entity work.bitfile_fifo_in_fifo_generator_top
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
\reset_gen_ic.rstblk_cc\: entity work.bitfile_fifo_in_reset_blk_ramfifo
     port map (
      m_aclk => m_aclk,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in_fifo_generator_v13_0_0 is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 32;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 32;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "kintex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 9;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 512;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 9;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bitfile_fifo_in_fifo_generator_v13_0_0 : entity is "fifo_generator_v13_0_0";
end bitfile_fifo_in_fifo_generator_v13_0_0;

architecture STRUCTURE of bitfile_fifo_in_fifo_generator_v13_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const1>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.bitfile_fifo_in_fifo_generator_v13_0_0_synth
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      m_aclk => m_aclk,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bitfile_fifo_in is
  port (
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bitfile_fifo_in : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bitfile_fifo_in : entity is "bitfile_fifo_in,fifo_generator_v13_0_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of bitfile_fifo_in : entity is "bitfile_fifo_in,fifo_generator_v13_0_0,{x_ipProduct=Vivado 2015.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=fifo_generator,x_ipVersion=13.0,x_ipCoreRevision=0,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_COMMON_CLOCK=0,C_COUNT_TYPE=0,C_DATA_COUNT_WIDTH=9,C_DEFAULT_VALUE=BlankString,C_DIN_WIDTH=32,C_DOUT_RST_VAL=0,C_DOUT_WIDTH=32,C_ENABLE_RLOCS=0,C_FAMILY=kintex7,C_FULL_FLAGS_RST_VAL=0,C_HAS_ALMOST_EMPTY=0,C_HAS_ALMOST_FULL=0,C_HAS_BACKUP=0,C_HAS_DATA_COUNT=0,C_HAS_INT_CLK=0,C_HAS_MEMINIT_FILE=0,C_HAS_OVERFLOW=0,C_HAS_RD_DATA_COUNT=0,C_HAS_RD_RST=0,C_HAS_RST=1,C_HAS_SRST=0,C_HAS_UNDERFLOW=0,C_HAS_VALID=0,C_HAS_WR_ACK=0,C_HAS_WR_DATA_COUNT=0,C_HAS_WR_RST=0,C_IMPLEMENTATION_TYPE=2,C_INIT_WR_PNTR_VAL=0,C_MEMORY_TYPE=2,C_MIF_FILE_NAME=BlankString,C_OPTIMIZATION_MODE=0,C_OVERFLOW_LOW=0,C_PRELOAD_LATENCY=0,C_PRELOAD_REGS=1,C_PRIM_FIFO_TYPE=512x36,C_PROG_EMPTY_THRESH_ASSERT_VAL=4,C_PROG_EMPTY_THRESH_NEGATE_VAL=5,C_PROG_EMPTY_TYPE=0,C_PROG_FULL_THRESH_ASSERT_VAL=511,C_PROG_FULL_THRESH_NEGATE_VAL=510,C_PROG_FULL_TYPE=0,C_RD_DATA_COUNT_WIDTH=9,C_RD_DEPTH=512,C_RD_FREQ=1,C_RD_PNTR_WIDTH=9,C_UNDERFLOW_LOW=0,C_USE_DOUT_RST=1,C_USE_ECC=0,C_USE_EMBEDDED_REG=0,C_USE_PIPELINE_REG=0,C_POWER_SAVING_MODE=0,C_USE_FIFO16_FLAGS=0,C_USE_FWFT_DATA_COUNT=0,C_VALID_LOW=0,C_WR_ACK_LOW=0,C_WR_DATA_COUNT_WIDTH=9,C_WR_DEPTH=512,C_WR_FREQ=1,C_WR_PNTR_WIDTH=9,C_WR_RESPONSE_LATENCY=1,C_MSGON_VAL=1,C_ENABLE_RST_SYNC=1,C_EN_SAFETY_CKT=0,C_ERROR_INJECTION_TYPE=0,C_SYNCHRONIZER_STAGE=2,C_INTERFACE_TYPE=0,C_AXI_TYPE=1,C_HAS_AXI_WR_CHANNEL=1,C_HAS_AXI_RD_CHANNEL=1,C_HAS_SLAVE_CE=0,C_HAS_MASTER_CE=0,C_ADD_NGC_CONSTRAINT=0,C_USE_COMMON_OVERFLOW=0,C_USE_COMMON_UNDERFLOW=0,C_USE_DEFAULT_SETTINGS=0,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=64,C_AXI_LEN_WIDTH=8,C_AXI_LOCK_WIDTH=1,C_HAS_AXI_ID=0,C_HAS_AXI_AWUSER=0,C_HAS_AXI_WUSER=0,C_HAS_AXI_BUSER=0,C_HAS_AXI_ARUSER=0,C_HAS_AXI_RUSER=0,C_AXI_ARUSER_WIDTH=1,C_AXI_AWUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_HAS_AXIS_TDATA=1,C_HAS_AXIS_TID=0,C_HAS_AXIS_TDEST=0,C_HAS_AXIS_TUSER=1,C_HAS_AXIS_TREADY=1,C_HAS_AXIS_TLAST=0,C_HAS_AXIS_TSTRB=0,C_HAS_AXIS_TKEEP=0,C_AXIS_TDATA_WIDTH=8,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_AXIS_TUSER_WIDTH=4,C_AXIS_TSTRB_WIDTH=1,C_AXIS_TKEEP_WIDTH=1,C_WACH_TYPE=0,C_WDCH_TYPE=0,C_WRCH_TYPE=0,C_RACH_TYPE=0,C_RDCH_TYPE=0,C_AXIS_TYPE=0,C_IMPLEMENTATION_TYPE_WACH=1,C_IMPLEMENTATION_TYPE_WDCH=1,C_IMPLEMENTATION_TYPE_WRCH=1,C_IMPLEMENTATION_TYPE_RACH=1,C_IMPLEMENTATION_TYPE_RDCH=1,C_IMPLEMENTATION_TYPE_AXIS=1,C_APPLICATION_TYPE_WACH=0,C_APPLICATION_TYPE_WDCH=0,C_APPLICATION_TYPE_WRCH=0,C_APPLICATION_TYPE_RACH=0,C_APPLICATION_TYPE_RDCH=0,C_APPLICATION_TYPE_AXIS=0,C_PRIM_FIFO_TYPE_WACH=512x36,C_PRIM_FIFO_TYPE_WDCH=1kx36,C_PRIM_FIFO_TYPE_WRCH=512x36,C_PRIM_FIFO_TYPE_RACH=512x36,C_PRIM_FIFO_TYPE_RDCH=1kx36,C_PRIM_FIFO_TYPE_AXIS=1kx18,C_USE_ECC_WACH=0,C_USE_ECC_WDCH=0,C_USE_ECC_WRCH=0,C_USE_ECC_RACH=0,C_USE_ECC_RDCH=0,C_USE_ECC_AXIS=0,C_ERROR_INJECTION_TYPE_WACH=0,C_ERROR_INJECTION_TYPE_WDCH=0,C_ERROR_INJECTION_TYPE_WRCH=0,C_ERROR_INJECTION_TYPE_RACH=0,C_ERROR_INJECTION_TYPE_RDCH=0,C_ERROR_INJECTION_TYPE_AXIS=0,C_DIN_WIDTH_WACH=32,C_DIN_WIDTH_WDCH=64,C_DIN_WIDTH_WRCH=2,C_DIN_WIDTH_RACH=32,C_DIN_WIDTH_RDCH=64,C_DIN_WIDTH_AXIS=1,C_WR_DEPTH_WACH=16,C_WR_DEPTH_WDCH=1024,C_WR_DEPTH_WRCH=16,C_WR_DEPTH_RACH=16,C_WR_DEPTH_RDCH=1024,C_WR_DEPTH_AXIS=1024,C_WR_PNTR_WIDTH_WACH=4,C_WR_PNTR_WIDTH_WDCH=10,C_WR_PNTR_WIDTH_WRCH=4,C_WR_PNTR_WIDTH_RACH=4,C_WR_PNTR_WIDTH_RDCH=10,C_WR_PNTR_WIDTH_AXIS=10,C_HAS_DATA_COUNTS_WACH=0,C_HAS_DATA_COUNTS_WDCH=0,C_HAS_DATA_COUNTS_WRCH=0,C_HAS_DATA_COUNTS_RACH=0,C_HAS_DATA_COUNTS_RDCH=0,C_HAS_DATA_COUNTS_AXIS=0,C_HAS_PROG_FLAGS_WACH=0,C_HAS_PROG_FLAGS_WDCH=0,C_HAS_PROG_FLAGS_WRCH=0,C_HAS_PROG_FLAGS_RACH=0,C_HAS_PROG_FLAGS_RDCH=0,C_HAS_PROG_FLAGS_AXIS=0,C_PROG_FULL_TYPE_WACH=0,C_PROG_FULL_TYPE_WDCH=0,C_PROG_FULL_TYPE_WRCH=0,C_PROG_FULL_TYPE_RACH=0,C_PROG_FULL_TYPE_RDCH=0,C_PROG_FULL_TYPE_AXIS=0,C_PROG_FULL_THRESH_ASSERT_VAL_WACH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WRCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_RACH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_RDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_AXIS=1023,C_PROG_EMPTY_TYPE_WACH=0,C_PROG_EMPTY_TYPE_WDCH=0,C_PROG_EMPTY_TYPE_WRCH=0,C_PROG_EMPTY_TYPE_RACH=0,C_PROG_EMPTY_TYPE_RDCH=0,C_PROG_EMPTY_TYPE_AXIS=0,C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS=1022,C_REG_SLICE_MODE_WACH=0,C_REG_SLICE_MODE_WDCH=0,C_REG_SLICE_MODE_WRCH=0,C_REG_SLICE_MODE_RACH=0,C_REG_SLICE_MODE_RDCH=0,C_REG_SLICE_MODE_AXIS=0}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of bitfile_fifo_in : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of bitfile_fifo_in : entity is "fifo_generator_v13_0_0,Vivado 2015.3";
end bitfile_fifo_in;

architecture STRUCTURE of bitfile_fifo_in is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 32;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 32;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "kintex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 9;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 512;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 9;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
  attribute x_interface_info : string;
  attribute x_interface_info of U0 : label is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA";
begin
U0: entity work.bitfile_fifo_in_fifo_generator_v13_0_0
     port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_U0_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(8 downto 0) => NLW_U0_data_count_UNCONNECTED(8 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_U0_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_U0_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_U0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_U0_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_U0_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_U0_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_U0_overflow_UNCONNECTED,
      prog_empty => NLW_U0_prog_empty_UNCONNECTED,
      prog_empty_thresh(8 downto 0) => B"000000000",
      prog_empty_thresh_assert(8 downto 0) => B"000000000",
      prog_empty_thresh_negate(8 downto 0) => B"000000000",
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(8 downto 0) => B"000000000",
      prog_full_thresh_assert(8 downto 0) => B"000000000",
      prog_full_thresh_negate(8 downto 0) => B"000000000",
      rd_clk => rd_clk,
      rd_data_count(8 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(8 downto 0),
      rd_en => rd_en,
      rd_rst => '0',
      rd_rst_busy => NLW_U0_rd_rst_busy_UNCONNECTED,
      rst => rst,
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => B"00000000",
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_U0_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => NLW_U0_valid_UNCONNECTED,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(8 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(8 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => NLW_U0_wr_rst_busy_UNCONNECTED
    );
end STRUCTURE;
