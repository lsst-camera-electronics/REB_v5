-------------------------------------------------------------------------------
-- Title      : RCM SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : rcm_sim.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2016-01-13
-------------------------------------------------------------------------------
-- Description: This is the top level file for the SCI portion of the
--              LSST RCM. 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.LsstSciPackage.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity sciab is
   port (
     -- PGP signals
     PgpRefClk_P :  in std_logic_vector(5 downto 0);
     PgpRefClk_M :  in std_logic_vector(5 downto 0);

     PgpRxA_P  :  in std_logic_vector(11 downto 0);
     PgpRxA_M  :  in std_logic_vector(11 downto 0);
     PgpTxA_P  : out std_logic_vector(11 downto 0);
     PgpTxA_M  : out std_logic_vector(11 downto 0);

     PgpRxB_P  :  in std_logic_vector(11 downto 0);
     PgpRxB_M  :  in std_logic_vector(11 downto 0);
     PgpTxB_P  : out std_logic_vector(11 downto 0);
     PgpTxB_M  : out std_logic_vector(11 downto 0)

);
end sciab;

architecture sciab of sciab is

begin

  U_rebSim : entity work.reb_sim
    generic map (
      SCI_ID => x"5a",
      RAFT_DATA_CONVERSION => "18B_PACK"
    )
    port map (
      PgpRefClk_P => PgpRefClk_P(0),
      PgpRefClk_M => PgpRefClk_M(0),
      PgpRx_P  => PgpRxA_P(0),
      PgpRx_M  => PgpRxA_M(0),
      PgpTx_P  => PgpTxA_P(0),
      PgpTx_M  => PgpTxA_M(0)
    );
  
end sciab;

