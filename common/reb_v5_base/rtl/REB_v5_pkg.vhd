library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library surf;
use surf.StdRtlPkg.all;

package REB_v5_pkg is

  constant NUM_SENSORS_C : integer := 3;

  type RebVersionType is record
    schema       : std_logic_vector(31 downto 0);
    board_type   : std_logic_vector( 3 downto 0);
    vhdl_version : std_logic_vector(15 downto 0);
    reserved_1   : std_logic_vector(31 downto 0);
    reserved_2   : std_logic_vector(31 downto 0);
    reserved_3   : std_logic_vector(31 downto 0);
  end record RebVersionType;

  type RebConfigType is record
    numSequencers : integer range 1 to NUM_SENSORS_C;
    sysClkPer     : real;
    gdAddr        : std_logic_vector(3 downto 0);
    odAddr        : std_logic_vector(3 downto 0);
    rdAddr        : std_logic_vector(3 downto 0);
    gdThresh      : IntegerArray(0 to NUM_SENSORS_C-1);  -- Fixed size for simplicity
    odThresh      : IntegerArray(0 to NUM_SENSORS_C-1);
    rdThresh      : IntegerArray(0 to NUM_SENSORS_C-1);
  end record RebConfigType;

  constant REB_CONFIG_DEFAULT_C : RebConfigType := (
    numSequencers => 1,
    sysClkPer     => 10.0E-9, -- 100MHz=10ns, 156.25=6.4ns
    gdAddr        => x"0",
    odAddr        => x"1",
    rdAddr        => x"4",
    gdThresh      => (1138, 1138, 1138),
    odThresh      => (2275, 2275, 2275),
    rdThresh      => (1632, 1632, 1632)
    --         Sensor(   0,    1,    2)
  );

end package REB_v5_pkg;
