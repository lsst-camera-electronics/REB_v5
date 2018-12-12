-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Thu Jan 28 15:57:16 2016
-- Host        : lsst-daq01 running 64-bit Red Hat Enterprise Linux Server release 6.7 (Santiago)
-- Command     : write_vhdl -force -mode funcsim
--               /u1/srusso/Xilinx_prj/LSST_prj/DREB_prj/REB_v3_vivado_15_2/REB_v3_vivado_15_2/REB_v3_vivado_15_2.srcs/sources_1/ip/dual_port_ram_4_4/dual_port_ram_4_4_funcsim.vhdl
-- Design      : dual_port_ram_4_4
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tffg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dual_port_ram_4_4_dpram is
  port (
    dpo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    we : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dual_port_ram_4_4_dpram : entity is "dpram";
end dual_port_ram_4_4_dpram;

architecture STRUCTURE of dual_port_ram_4_4_dpram is
  signal \^dpo\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal qdpo_int : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qdpo_int : signal is "true";
  signal qspo_int : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP of qspo_int : signal is "true";
  signal \^spo\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute KEEP : string;
  attribute KEEP of \qdpo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qdpo_int_reg[0]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[1]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[2]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[3]\ : label is "no";
  attribute KEEP of \qspo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[0]\ : label is "no";
  attribute KEEP of \qspo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[1]\ : label is "no";
  attribute KEEP of \qspo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[2]\ : label is "no";
  attribute KEEP of \qspo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[3]\ : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of ram_reg_0_15_0_0 : label is "RAM16X1D";
  attribute XILINX_LEGACY_PRIM of ram_reg_0_15_1_1 : label is "RAM16X1D";
  attribute XILINX_LEGACY_PRIM of ram_reg_0_15_2_2 : label is "RAM16X1D";
  attribute XILINX_LEGACY_PRIM of ram_reg_0_15_3_3 : label is "RAM16X1D";
begin
  dpo(3 downto 0) <= \^dpo\(3 downto 0);
  spo(3 downto 0) <= \^spo\(3 downto 0);
\qdpo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(0),
      Q => qdpo_int(0),
      R => '0'
    );
\qdpo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(1),
      Q => qdpo_int(1),
      R => '0'
    );
\qdpo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(2),
      Q => qdpo_int(2),
      R => '0'
    );
\qdpo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(3),
      Q => qdpo_int(3),
      R => '0'
    );
\qspo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(0),
      Q => qspo_int(0),
      R => '0'
    );
\qspo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(1),
      Q => qspo_int(1),
      R => '0'
    );
\qspo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(2),
      Q => qspo_int(2),
      R => '0'
    );
\qspo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(3),
      Q => qspo_int(3),
      R => '0'
    );
ram_reg_0_15_0_0: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => '0',
      D => d(0),
      DPO => \^dpo\(0),
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => '0',
      SPO => \^spo\(0),
      WCLK => clk,
      WE => we
    );
ram_reg_0_15_1_1: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => '0',
      D => d(1),
      DPO => \^dpo\(1),
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => '0',
      SPO => \^spo\(1),
      WCLK => clk,
      WE => we
    );
ram_reg_0_15_2_2: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => '0',
      D => d(2),
      DPO => \^dpo\(2),
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => '0',
      SPO => \^spo\(2),
      WCLK => clk,
      WE => we
    );
ram_reg_0_15_3_3: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => '0',
      D => d(3),
      DPO => \^dpo\(3),
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => '0',
      SPO => \^spo\(3),
      WCLK => clk,
      WE => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dual_port_ram_4_4_dist_mem_gen_v8_0_synth is
  port (
    dpo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    we : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dual_port_ram_4_4_dist_mem_gen_v8_0_synth : entity is "dist_mem_gen_v8_0_synth";
end dual_port_ram_4_4_dist_mem_gen_v8_0_synth;

architecture STRUCTURE of dual_port_ram_4_4_dist_mem_gen_v8_0_synth is
begin
\gen_dp_ram.dpram_inst\: entity work.dual_port_ram_4_4_dpram
     port map (
      a(3 downto 0) => a(3 downto 0),
      clk => clk,
      d(3 downto 0) => d(3 downto 0),
      dpo(3 downto 0) => dpo(3 downto 0),
      dpra(3 downto 0) => dpra(3 downto 0),
      spo(3 downto 0) => spo(3 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dual_port_ram_4_4_dist_mem_gen_v8_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 4;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 16;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is "kintex7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 2;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is 4;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dual_port_ram_4_4_dist_mem_gen_v8_0 : entity is "dist_mem_gen_v8_0";
end dual_port_ram_4_4_dist_mem_gen_v8_0;

architecture STRUCTURE of dual_port_ram_4_4_dist_mem_gen_v8_0 is
  signal \<const0>\ : STD_LOGIC;
begin
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.dual_port_ram_4_4_dist_mem_gen_v8_0_synth
     port map (
      a(3 downto 0) => a(3 downto 0),
      clk => clk,
      d(3 downto 0) => d(3 downto 0),
      dpo(3 downto 0) => dpo(3 downto 0),
      dpra(3 downto 0) => dpra(3 downto 0),
      spo(3 downto 0) => spo(3 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dual_port_ram_4_4 is
  port (
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    d : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dual_port_ram_4_4 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dual_port_ram_4_4 : entity is "dual_port_ram_4_4,dist_mem_gen_v8_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of dual_port_ram_4_4 : entity is "dual_port_ram_4_4,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=8,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_FAMILY=kintex7,C_ADDR_WIDTH=4,C_DEFAULT_DATA=0,C_DEPTH=16,C_HAS_CLK=1,C_HAS_D=1,C_HAS_DPO=1,C_HAS_DPRA=1,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=1,C_MEM_INIT_FILE=no_coe_file_loaded,C_ELABORATION_DIR=./,C_MEM_TYPE=2,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=0,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=4,C_PARSER_TYPE=1}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of dual_port_ram_4_4 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of dual_port_ram_4_4 : entity is "dist_mem_gen_v8_0,Vivado 2015.2";
end dual_port_ram_4_4;

architecture STRUCTURE of dual_port_ram_4_4 is
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "kintex7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 2;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 4;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 16;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_dpo : integer;
  attribute c_has_dpo of U0 : label is 1;
  attribute c_has_dpra : integer;
  attribute c_has_dpra of U0 : label is 1;
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qdpo : integer;
  attribute c_has_qdpo of U0 : label is 0;
  attribute c_has_qdpo_ce : integer;
  attribute c_has_qdpo_ce of U0 : label is 0;
  attribute c_has_qdpo_clk : integer;
  attribute c_has_qdpo_clk of U0 : label is 0;
  attribute c_has_qdpo_rst : integer;
  attribute c_has_qdpo_rst of U0 : label is 0;
  attribute c_has_qdpo_srst : integer;
  attribute c_has_qdpo_srst of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qce_joined : integer;
  attribute c_qce_joined of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_reg_dpra_input : integer;
  attribute c_reg_dpra_input of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 4;
begin
U0: entity work.dual_port_ram_4_4_dist_mem_gen_v8_0
     port map (
      a(3 downto 0) => a(3 downto 0),
      clk => clk,
      d(3 downto 0) => d(3 downto 0),
      dpo(3 downto 0) => dpo(3 downto 0),
      dpra(3 downto 0) => dpra(3 downto 0),
      i_ce => '1',
      qdpo(3 downto 0) => NLW_U0_qdpo_UNCONNECTED(3 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(3 downto 0) => NLW_U0_qspo_UNCONNECTED(3 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(3 downto 0) => spo(3 downto 0),
      we => we
    );
end STRUCTURE;
