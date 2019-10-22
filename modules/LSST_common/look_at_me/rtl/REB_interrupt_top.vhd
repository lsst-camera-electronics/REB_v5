----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:40 04/24/2017 
-- Design Name: 
-- Module Name:    REB_interrupt_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

use ieee.std_logic_misc.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity REB_interrupt_top is
  generic (
    interrupt_bus_width : integer := 32);
  port (
    clk               : in  std_logic;
    reset             : in  std_logic;
    edge_en           : in  std_logic_vector(interrupt_bus_width-1 downto 0);  -- select which edge to pass 1 for rising 0 for falling
    interrupt_bus_in  : in  std_logic_vector(interrupt_bus_width-1 downto 0);
    mask_bus_in_en    : in  std_logic;
    mask_bus_in       : in  std_logic_vector(interrupt_bus_width-1 downto 0);
    mask_bus_out      : out std_logic_vector(interrupt_bus_width-1 downto 0);
    interrupt_en_out  : out std_logic;
    interrupt_bus_out : out std_logic_vector(interrupt_bus_width-1 downto 0)
    );  

end REB_interrupt_top;

architecture Behavioral of REB_interrupt_top is

  component generic_reg_ce_init
    generic (width : integer := 15);
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      ce       : in  std_logic;         -- clock enable
      init     : in  std_logic;  -- signal to reset the reg (active high)
      data_in  : in  std_logic_vector(width downto 0);   -- data in
      data_out : out std_logic_vector(width downto 0));  -- data out
  end component;

   component generic_reg_ce_init_1
    generic (width : integer := 15);
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      ce       : in  std_logic;         -- clock enable
      init     : in  std_logic;  -- signal to reset the reg (active high)
      data_in  : in  std_logic_vector(width downto 0);   -- data in
      data_out : out std_logic_vector(width downto 0));  -- data out
  end component;

  signal mask_bus_int         : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal edge_in_bus          : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal posedge_out_bus      : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal negedge_out_bus      : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal edge_out_bus         : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal interrupt_en_out_int : std_logic;

  signal interrupt_bus_in_masked : std_logic_vector(interrupt_bus_width-1 downto 0);

begin

  mask_in_reg : generic_reg_ce_init_1
    generic map (width => interrupt_bus_width-1)
    port map (
      reset    => reset,
      clk      => clk,
      ce       => mask_bus_in_en,
      init     => '0',  -- signal to reset the reg (active high)
      data_in  => mask_bus_in,
      data_out => mask_bus_int);        

  mask_bus_out <= mask_bus_int;

-- masking inputs
  interrupt_bus_in_masked <= interrupt_bus_in and not mask_bus_int;

-- Positive and negative edge detector enabled with edge_en
  edge_detector_generate :
  for i in 0 to interrupt_bus_width-1 generate
    edge_detect_ff : FD port map (D => interrupt_bus_in(i), C => clk, Q => edge_in_bus(i));
    posedge_out_bus(i) <= interrupt_bus_in_masked(i) and (not edge_in_bus(i)) and edge_en(i);
    negedge_out_bus(i) <= not(interrupt_bus_in_masked(i)) and edge_in_bus(i) and not edge_en(i);
    edge_out_bus(i)    <= posedge_out_bus(i) or negedge_out_bus(i);
  end generate;

-- or bit by bit VHDL-2008
--interrupt_en_out <= interrupt_en_out or edge_out_bus(i);

-- this works also with older VHDL but needs use ieee.std_logic_misc.all;
-- OR of all the pos edge and neg edge signals to for the iterrupt enable
  interrupt_en_out_int <= (or_reduce(edge_out_bus));

-- delay to allign the itterput enable with the interrupt out bus
  interrupt_en_ff : FD port map (D => interrupt_en_out_int, C => clk, Q => interrupt_en_out);



  iterrupt_out_reg : generic_reg_ce_init
    generic map (width => interrupt_bus_width-1)
    port map (
      reset    => reset,
      clk      => clk,
      ce       => '1',
      init     => '0',  -- signal to reset the reg (active high)
      data_in  => edge_out_bus,
      data_out => interrupt_bus_out);        

end Behavioral;

