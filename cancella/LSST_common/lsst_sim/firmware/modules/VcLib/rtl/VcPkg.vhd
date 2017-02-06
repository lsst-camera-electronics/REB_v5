library ieee;
use ieee.std_logic_1164.all;

use work.StdRtlPkg.all;

package VcPkg is
   --assume max. 4 lanes per VC source
   constant MAX_VC_COUNT_C : integer := 4;

   ------------------------------------------------------------------------
   -- TxVcIn Types/Constants                             
   ------------------------------------------------------------------------
   type VcTxInType is record
      valid        : sl;                                   -- User frame data is valid
      sof          : sl;                                   -- User frame data start of frame
      eof          : sl;                                   -- User frame data end of frame
      eofe         : sl;                                   -- User frame data error
      data         : slv16Array(0 to (MAX_VC_COUNT_C-1));  -- User frame data (up to 4 lanes)
      locBuffAFull : sl;                                   -- Local buffer almost full
      locBuffFull  : sl;                                   -- Local buffer full
   end record;
   type VcTxInArray is array (natural range <>) of VcTxInType;
   type VcTxInVectorArray is array (integer range<>, integer range<>)of VcTxInType;
   constant VC_TX_IN_INIT_C : VcTxInType := (
      '0',
      '0',
      '0',
      '0',
      (others => (others => '0')),
      '0',
      '0');   

   ------------------------------------------------------------------------
   -- VcTxQuadIn Types/Constants                             
   ------------------------------------------------------------------------
   type VcTxQuadInType is array (0 to 3) of VcTxInType;  -- 4 Virtual Channel inputs
   type VcTxQuadInArray is array (natural range <>) of VcTxQuadInType;
   type VcTxQuadInVectorArray is array (integer range<>, integer range<>)of VcTxQuadInType;
   constant VC_TX_QUAD_IN_INIT_C : VcTxQuadInType := (
      (others => VC_TX_IN_INIT_C)); 

   ------------------------------------------------------------------------
   -- VcTxOut Types/Constants                             
   ------------------------------------------------------------------------
   type VcTxOutType is record
      ready : sl;                       -- PGP is ready
   end record;
   type VcTxOutArray is array (natural range <>) of VcTxOutType;
   type VcTxOutVectorArray is array (integer range<>, integer range<>)of VcTxOutType;
   constant VC_TX_OUT_INIT_C : VcTxOutType := (
      (others => '0'));                 --frameTxReady   

   ------------------------------------------------------------------------
   -- VcTxQuadOut Types/Constants                             
   ------------------------------------------------------------------------
   type VcTxQuadOutType is array (0 to 3) of VcTxOutType;  -- 4 Virtual Channel inputs
   type VcTxQuadOutArray is array (natural range <>) of VcTxQuadOutType;
   type VcTxQuadOutVectorArray is array (integer range<>, integer range<>)of VcTxQuadOutType;
   constant VC_TX_QUAD_OUT_INIT_C : VcTxQuadOutType := (
      (others => VC_TX_OUT_INIT_C));

   ------------------------------------------------------------------------
   -- VcRxCommonOut Types/Constants                             
   ------------------------------------------------------------------------
   type VcRxCommonOutType is record
      sof  : sl;                                   -- PGP frame data start of frame
      eof  : sl;                                   -- PGP frame data end of frame
      eofe : sl;                                   -- PGP frame data error
      data : slv16Array(0 to (MAX_VC_COUNT_C-1));  -- PGP frame data
   end record;
   type VcRxCommonOutArray is array (natural range <>) of VcRxCommonOutType;
   type VcRxCommonOutVectorArray is array (integer range<>, integer range<>)of VcRxCommonOutType;
   constant VC_RX_COMMON_OUT_INIT_C : VcRxCommonOutType := (
      '0',
      '0',
      '0',
      (others => (others => '0')));    

   ------------------------------------------------------------------------
   -- VcRxOut Types/Constants                             
   ------------------------------------------------------------------------
   type VcRxOutType is record
      valid        : sl;                -- PGP frame data is valid
      remBuffAFull : sl;                -- Remote buffer almost full
      remBuffFull  : sl;                -- Remote buffer full
   end record;
   type VcRxOutArray is array (natural range <>) of VcRxOutType;
   type VcRxOutVectorArray is array (integer range<>, integer range<>)of VcRxOutType;
   constant VC_RX_OUT_INIT_C : VcRxOutType := (
      '0',
      '0',
      '0');       

   ------------------------------------------------------------------------
   -- VcRxQuadOut Types/Constants                             
   ------------------------------------------------------------------------
   type VcRxQuadOutType is array (0 to 3) of VcRxOutType;  -- 4 Rx Virtual Channel outputs
   type VcRxQuadOutArray is array (natural range <>) of VcRxQuadOutType;
   type VcRxQuadOutVectorArray is array (integer range<>, integer range<>)of VcRxQuadOutType;
   constant VC_RX_QUAD_OUT_INIT_C : VcRxQuadOutType := (
      (others => VC_RX_OUT_INIT_C));  

   ------------------------------------------------------------------------
   -- VcCmdSlaveOut Types/Constants                             
   ------------------------------------------------------------------------
   type VcCmdSlaveOutType is record
      valid  : sl;                      -- Command Opcode is valid (formerly cmdEn)
      opCode : slv(7 downto 0);         -- Command OpCode
      ctxOut : slv(23 downto 0);        -- Command Context
   end record;
   type VcCmdSlaveOutArray is array (natural range <>) of VcCmdSlaveOutType;
   type VcCmdSlaveOutVectorArray is array (integer range<>, integer range<>)of VcCmdSlaveOutType;
   constant VC_CMD_SLAVE_OUT_INIT_C : VcCmdSlaveOutType := (
      '0',
      (others => '0'),
      (others => '0'));            

   ------------------------------------------------------------------------
   -- Slave Register Types/Constants                       
   ------------------------------------------------------------------------
   type VcRegSlaveInType is record
      ack    : sl;                      -- Register Access Acknowledge
      fail   : sl;                      -- Register Access Fail
      rdData : slv(31 downto 0);        -- Register Data In (Read Data)
   end record;
   type VcRegSlaveInArray is array (natural range <>) of VcRegSlaveInType;
   type VcRegSlaveInVectorArray is array (integer range<>, integer range<>)of VcRegSlaveInType;
   constant VC_REG_SLAVE_IN_INIT_C : VcRegSlaveInType := (
      '0',
      '0',
      (others => '0'));               

   type VcRegSlaveOutType is record
      inp    : sl;                      -- Register Access In Progress Flag
      req    : sl;                      -- Register Access Request  
      op     : sl;                      -- Register OpCode, 0=Read, 1=Write
      addr   : slv(23 downto 0);        -- Register Address
      wrData : slv(31 downto 0);        -- Register Data Out (Write Data)
   end record;
   type VcRegSlaveOutArray is array (natural range <>) of VcRegSlaveOutType;
   type VcRegSlaveOutVectorArray is array (integer range<>, integer range<>)of VcRegSlaveOutType;
   constant VC_REG_SLAVE_OUT_INIT_C : VcRegSlaveOutType := (
      '0',
      '0',
      '0',
      (others => '0'),
      (others => '0'));

   constant VC_REG_SLAVE_WR_OP_C : sl := '1';
   constant VC_REG_SLAVE_RD_OP_C : sl := '0';
   ------------------------------------------------------------------------
   -- Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuffInType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(127 downto 0);
   end record;
   type VcUsBuffInArray is array (natural range <>) of VcUsBuffInType;
   type VcUsBuffInVectorArray is array (integer range<>, integer range<>)of VcUsBuffInType;
   constant VC_US_BUFF_IN_INIT_C : VcUsBuffInType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuffOutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuffOutArray is array (natural range <>) of VcUsBuffOutType;
   type VcUsBuffOutVectorArray is array (integer range<>, integer range<>)of VcUsBuffOutType;
   constant VC_US_BUFF_OUT_INIT_C : VcUsBuffOutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuffInType is record
      ready : sl;
   end record;
   type VcDsBuffInArray is array (natural range <>) of VcDsBuffInType;
   type VcDsBuffInVectorArray is array (integer range<>, integer range<>)of VcDsBuffInType;
   constant VC_DS_BUFF_IN_INIT_C : VcDsBuffInType := (
      (others => '0'));   

   type VcDsBuffOutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(127 downto 0);
   end record;
   type VcDsBuffOutArray is array (natural range <>) of VcDsBuffOutType;
   type VcDsBuffOutVectorArray is array (integer range<>, integer range<>)of VcDsBuffOutType;
   constant VC_DS_BUFF_OUT_INIT_C : VcDsBuffOutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0'));


   -------------------------------------------------------------------------------------------------
   -- Depricated types for old style Us and Ds Buffers.
   -------------------------------------------------------------------------------------------------
   ------------------------------------------------------------------------
   -- 16-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff16InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(15 downto 0);
   end record;
   type VcUsBuff16InArray is array (natural range <>) of VcUsBuff16InType;
   type VcUsBuff16InVectorArray is array (integer range<>, integer range<>)of VcUsBuff16InType;
   constant VC_US_BUFF16_IN_INIT_C : VcUsBuff16InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff16OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff16OutArray is array (natural range <>) of VcUsBuff16OutType;
   type VcUsBuff16OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff16OutType;
   constant VC_US_BUFF16_OUT_INIT_C : VcUsBuff16OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 16-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff16InType is record
      ready : sl;
   end record;
   type VcDsBuff16InArray is array (natural range <>) of VcDsBuff16InType;
   type VcDsBuff16InVectorArray is array (integer range<>, integer range<>)of VcDsBuff16InType;
   constant VC_DS_BUFF16_IN_INIT_C : VcDsBuff16InType := (
      (others => '0'));   

   type VcDsBuff16OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(15 downto 0);
   end record;
   type VcDsBuff16OutArray is array (natural range <>) of VcDsBuff16OutType;
   type VcDsBuff16OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff16OutType;
   constant VC_DS_BUFF16_OUT_INIT_C : VcDsBuff16OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   ------------------------------------------------------------------------
   -- 32-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff32InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(31 downto 0);
   end record;
   type VcUsBuff32InArray is array (natural range <>) of VcUsBuff32InType;
   type VcUsBuff32InVectorArray is array (integer range<>, integer range<>)of VcUsBuff32InType;
   constant VC_US_BUFF32_IN_INIT_C : VcUsBuff32InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff32OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff32OutArray is array (natural range <>) of VcUsBuff32OutType;
   type VcUsBuff32OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff32OutType;
   constant VC_US_BUFF32_OUT_INIT_C : VcUsBuff32OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 32-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff32InType is record
      ready : sl;
   end record;
   type VcDsBuff32InArray is array (natural range <>) of VcDsBuff32InType;
   type VcDsBuff32InVectorArray is array (integer range<>, integer range<>)of VcDsBuff32InType;
   constant VC_DS_BUFF32_IN_INIT_C : VcDsBuff32InType := (
      (others => '0'));   

   type VcDsBuff32OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(31 downto 0);
   end record;
   type VcDsBuff32OutArray is array (natural range <>) of VcDsBuff32OutType;
   type VcDsBuff32OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff32OutType;
   constant VC_DS_BUFF32_OUT_INIT_C : VcDsBuff32OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0'));  

   ------------------------------------------------------------------------
   -- 48-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff48InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(47 downto 0);
   end record;
   type VcUsBuff48InArray is array (natural range <>) of VcUsBuff48InType;
   type VcUsBuff48InVectorArray is array (integer range<>, integer range<>)of VcUsBuff48InType;
   constant VC_US_BUFF48_IN_INIT_C : VcUsBuff48InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff48OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff48OutArray is array (natural range <>) of VcUsBuff48OutType;
   type VcUsBuff48OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff48OutType;
   constant VC_US_BUFF48_OUT_INIT_C : VcUsBuff48OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 48-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff48InType is record
      ready : sl;
   end record;
   type VcDsBuff48InArray is array (natural range <>) of VcDsBuff48InType;
   type VcDsBuff48InVectorArray is array (integer range<>, integer range<>)of VcDsBuff48InType;
   constant VC_DS_BUFF48_IN_INIT_C : VcDsBuff48InType := (
      (others => '0'));   

   type VcDsBuff48OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(47 downto 0);
   end record;
   type VcDsBuff48OutArray is array (natural range <>) of VcDsBuff48OutType;
   type VcDsBuff48OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff48OutType;
   constant VC_DS_BUFF48_OUT_INIT_C : VcDsBuff48OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0'));        

   ------------------------------------------------------------------------
   -- 64-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff64InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(63 downto 0);
   end record;
   type VcUsBuff64InArray is array (natural range <>) of VcUsBuff64InType;
   type VcUsBuff64InVectorArray is array (integer range<>, integer range<>)of VcUsBuff64InType;
   constant VC_US_BUFF64_IN_INIT_C : VcUsBuff64InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff64OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff64OutArray is array (natural range <>) of VcUsBuff64OutType;
   type VcUsBuff64OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff64OutType;
   constant VC_US_BUFF64_OUT_INIT_C : VcUsBuff64OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 64-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff64InType is record
      ready : sl;
   end record;
   type VcDsBuff64InArray is array (natural range <>) of VcDsBuff64InType;
   type VcDsBuff64InVectorArray is array (integer range<>, integer range<>)of VcDsBuff64InType;
   constant VC_DS_BUFF64_IN_INIT_C : VcDsBuff64InType := (
      (others => '0'));   

   type VcDsBuff64OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(63 downto 0);
   end record;
   type VcDsBuff64OutArray is array (natural range <>) of VcDsBuff64OutType;
   type VcDsBuff64OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff64OutType;
   constant VC_DS_BUFF64_OUT_INIT_C : VcDsBuff64OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   ------------------------------------------------------------------------
   -- 80-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff80InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(79 downto 0);
   end record;
   type VcUsBuff80InArray is array (natural range <>) of VcUsBuff80InType;
   type VcUsBuff80InVectorArray is array (integer range<>, integer range<>)of VcUsBuff80InType;
   constant VC_US_BUFF80_IN_INIT_C : VcUsBuff80InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff80OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff80OutArray is array (natural range <>) of VcUsBuff80OutType;
   type VcUsBuff80OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff80OutType;
   constant VC_US_BUFF80_OUT_INIT_C : VcUsBuff80OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 80-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff80InType is record
      ready : sl;
   end record;
   type VcDsBuff80InArray is array (natural range <>) of VcDsBuff80InType;
   type VcDsBuff80InVectorArray is array (integer range<>, integer range<>)of VcDsBuff80InType;
   constant VC_DS_BUFF80_IN_INIT_C : VcDsBuff80InType := (
      (others => '0'));   

   type VcDsBuff80OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(79 downto 0);
   end record;
   type VcDsBuff80OutArray is array (natural range <>) of VcDsBuff80OutType;
   type VcDsBuff80OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff80OutType;
   constant VC_DS_BUFF80_OUT_INIT_C : VcDsBuff80OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0'));

   ------------------------------------------------------------------------
   -- 96-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff96InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(95 downto 0);
   end record;
   type VcUsBuff96InArray is array (natural range <>) of VcUsBuff96InType;
   type VcUsBuff96InVectorArray is array (integer range<>, integer range<>)of VcUsBuff96InType;
   constant VC_US_BUFF96_IN_INIT_C : VcUsBuff96InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff96OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff96OutArray is array (natural range <>) of VcUsBuff96OutType;
   type VcUsBuff96OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff96OutType;
   constant VC_US_BUFF96_OUT_INIT_C : VcUsBuff96OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 96-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff96InType is record
      ready : sl;
   end record;
   type VcDsBuff96InArray is array (natural range <>) of VcDsBuff96InType;
   type VcDsBuff96InVectorArray is array (integer range<>, integer range<>)of VcDsBuff96InType;
   constant VC_DS_BUFF96_IN_INIT_C : VcDsBuff96InType := (
      (others => '0'));   

   type VcDsBuff96OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(95 downto 0);
   end record;
   type VcDsBuff96OutArray is array (natural range <>) of VcDsBuff96OutType;
   type VcDsBuff96OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff96OutType;
   constant VC_DS_BUFF96_OUT_INIT_C : VcDsBuff96OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   ------------------------------------------------------------------------
   -- 128-bit Up Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcUsBuff128InType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(127 downto 0);
   end record;
   type VcUsBuff128InArray is array (natural range <>) of VcUsBuff128InType;
   type VcUsBuff128InVectorArray is array (integer range<>, integer range<>)of VcUsBuff128InType;
   constant VC_US_BUFF128_IN_INIT_C : VcUsBuff128InType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcUsBuff128OutType is record
      full       : sl;
      almostFull : sl;
   end record;
   type VcUsBuff128OutArray is array (natural range <>) of VcUsBuff128OutType;
   type VcUsBuff128OutVectorArray is array (integer range<>, integer range<>)of VcUsBuff128OutType;
   constant VC_US_BUFF128_OUT_INIT_C : VcUsBuff128OutType := (
      '0',
      '0');            

   ------------------------------------------------------------------------
   -- 128-bit Down Stream Buffer Types/Constants                            
   ------------------------------------------------------------------------
   type VcDsBuff128InType is record
      ready : sl;
   end record;
   type VcDsBuff128InArray is array (natural range <>) of VcDsBuff128InType;
   type VcDsBuff128InVectorArray is array (integer range<>, integer range<>)of VcDsBuff128InType;
   constant VC_DS_BUFF128_IN_INIT_C : VcDsBuff128InType := (
      (others => '0'));   

   type VcDsBuff128OutType is record
      valid : sl;
      sof   : sl;
      eof   : sl;
      eofe  : sl;
      data  : slv(127 downto 0);
   end record;
   type VcDsBuff128OutArray is array (natural range <>) of VcDsBuff128OutType;
   type VcDsBuff128OutVectorArray is array (integer range<>, integer range<>)of VcDsBuff128OutType;
   constant VC_DS_BUFF128_OUT_INIT_C : VcDsBuff128OutType := (
      '0',
      '0',
      '0',
      '0',
      (others => '0'));       
 

   ------------------------------------------------------------------------
   -- 64-bit Generic Streaming Data Interface Types/Constants                            
   ------------------------------------------------------------------------
   type VcStreamDataType is record
      valid : sl;              -- Data Valid (use on FIFO's wrEn)
      vc    : slv(3 downto 0); -- VC channel pointer (Optional: depending on interface)
      sof   : sl;              -- Start of Frame Flag
      eof   : sl;              -- end of Frame Flag
      eofe  : sl;              -- end of Frame with error(s) Flag
      data  : slv(63 downto 0);-- streaming data
   end record;
   type VcStreamDataArray is array (natural range <>) of VcStreamDataType;
   type VcStreamDataVectorArray is array (integer range<>, integer range<>)of VcStreamDataType;
   constant VC_STREAM_DATA_INIT_C : VcStreamDataType := (
      '0',
      (others => '0'),
      '0',
      '0',
      '0',
      (others => '0')); 

   type VcStreamCtrlType is record
      full       : sl;-- FIFO's full flag
      almostFull : sl;-- FIFO's almostFull (or FIFO's progFull for back pressure applications)
      ready      : sl;-- Not used in FIFO interface applications (Optional: depending on interface)
   end record;
   type VcStreamCtrlArray is array (natural range <>) of VcStreamCtrlType;
   type VcStreamCtrlVectorArray is array (integer range<>, integer range<>)of VcStreamCtrlType;
   constant VC_STREAM_CTRL_INIT_C : VcStreamCtrlType := (
      '1',
      '1',
      '1');            
      
   --------------
   -- Functions
   --------------

   -- Header Encode/Decode Functions
   function encodeVcHdr (sof : sl; eof : sl; eofe : sl) return slv;
   function decodeVcHdr (vec : slv(1 downto 0)) return slv;

   -- 16-bit Up Stream Buffer Functions    
   function toSlv (vec           : VcUsBuff16InType) return slv;
   function toVcUsBuff16In (vec  : slv((1*18) downto 0)) return VcUsBuff16InType;
   function toVcUsBuff16In (vec  : VcDsBuff16OutType) return VcUsBuff16InType;
   function toVcUsBuff16Out (vec : VcDsBuff16InType) return VcUsBuff16OutType;

   -- 16-bit Down Stream Buffer Functions    
   function toSlv (vec           : VcDsBuff16OutType) return slv;
   function toVcDsBuff16Out (vec : slv((1*18) downto 0)) return VcDsBuff16OutType;
   function toVcDsBuff16Out (vec : VcUsBuff16InType) return VcDsBuff16OutType;
   function toVcDsBuff16In (vec  : VcUsBuff16OutType) return VcDsBuff16InType;

   -- 32-bit Up Stream Buffer Functions    
   function toSlv (vec           : VcUsBuff32InType) return slv;
   function toVcUsBuff32In (vec  : slv((2*18) downto 0)) return VcUsBuff32InType;
   function toVcUsBuff32In (vec  : VcDsBuff32OutType) return VcUsBuff32InType;
   function toVcUsBuff32Out (vec : VcDsBuff32InType) return VcUsBuff32OutType;

   -- 32-bit Down Stream Buffer Functions       
   function toSlv (vec           : VcDsBuff32OutType) return slv;
   function toVcDsBuff32Out (vec : slv((2*18) downto 0)) return VcDsBuff32OutType;
   function toVcDsBuff32Out (vec : VcUsBuff32InType) return VcDsBuff32OutType;
   function toVcDsBuff32In (vec  : VcUsBuff32OutType) return VcDsBuff32InType;

   -- 48-bit Up Stream Buffer Functions       
   function toSlv (vec           : VcUsBuff48InType) return slv;
   function toVcUsBuff48In (vec  : slv((3*18) downto 0)) return VcUsBuff48InType;
   function toVcUsBuff48In (vec  : VcDsBuff48OutType) return VcUsBuff48InType;
   function toVcUsBuff48Out (vec : VcDsBuff48InType) return VcUsBuff48OutType;

   -- 48-bit Down Stream Buffer Functions       
   function toSlv (vec           : VcDsBuff48OutType) return slv;
   function toVcDsBuff48Out (vec : slv((3*18) downto 0)) return VcDsBuff48OutType;
   function toVcDsBuff48Out (vec : VcUsBuff48InType) return VcDsBuff48OutType;
   function toVcDsBuff48In (vec  : VcUsBuff48OutType) return VcDsBuff48InType;

   -- 64-bit Up Stream Buffer Functions    
   function toSlv (vec           : VcUsBuff64InType) return slv;
   function toVcUsBuff64In (vec  : slv((4*18) downto 0)) return VcUsBuff64InType;
   function toVcUsBuff64In (vec  : VcDsBuff64OutType) return VcUsBuff64InType;
   function toVcUsBuff64Out (vec : VcDsBuff64InType) return VcUsBuff64OutType;

   -- 64-bit Down Stream Buffer Functions       
   function toSlv (vec           : VcDsBuff64OutType) return slv;
   function toVcDsBuff64Out (vec : slv((4*18) downto 0)) return VcDsBuff64OutType;
   function toVcDsBuff64Out (vec : VcUsBuff64InType) return VcDsBuff64OutType;
   function toVcDsBuff64In (vec  : VcUsBuff64OutType) return VcDsBuff64InType;

   -- 80-bit Up Stream Buffer Functions    
   function toSlv (vec           : VcUsBuff80InType) return slv;
   function toVcUsBuff80In (vec  : slv((5*18) downto 0)) return VcUsBuff80InType;
   function toVcUsBuff80In (vec  : VcDsBuff80OutType) return VcUsBuff80InType;
   function toVcUsBuff80Out (vec : VcDsBuff80InType) return VcUsBuff80OutType;

   -- 80-bit Down Stream Buffer Functions       
   function toSlv (vec           : VcDsBuff80OutType) return slv;
   function toVcDsBuff80Out (vec : slv((5*18) downto 0)) return VcDsBuff80OutType;
   function toVcDsBuff80Out (vec : VcUsBuff80InType) return VcDsBuff80OutType;
   function toVcDsBuff80In (vec  : VcUsBuff80OutType) return VcDsBuff80InType;

   -- 96-bit Up Stream Buffer Functions    
   function toSlv (vec           : VcUsBuff96InType) return slv;
   function toVcUsBuff96In (vec  : slv((6*18) downto 0)) return VcUsBuff96InType;
   function toVcUsBuff96In (vec  : VcDsBuff96OutType) return VcUsBuff96InType;
   function toVcUsBuff96Out (vec : VcDsBuff96InType) return VcUsBuff96OutType;

   -- 96-bit Down Stream Buffer Functions       
   function toSlv (vec           : VcDsBuff96OutType) return slv;
   function toVcDsBuff96Out (vec : slv((6*18) downto 0)) return VcDsBuff96OutType;
   function toVcDsBuff96Out (vec : VcUsBuff96InType) return VcDsBuff96OutType;
   function toVcDsBuff96In (vec  : VcUsBuff96OutType) return VcDsBuff96InType;

   -- 128-bit Up Stream Buffer Functions    
   function toSlv (vec            : VcUsBuff128InType) return slv;
   function toVcUsBuff128In (vec  : slv((8*18) downto 0)) return VcUsBuff128InType;
   function toVcUsBuff128In (vec  : VcDsBuff128OutType) return VcUsBuff128InType;
   function toVcUsBuff128Out (vec : VcDsBuff128InType) return VcUsBuff128OutType;

   -- 128-bit Down Stream Buffer Functions       
   function toSlv (vec            : VcDsBuff128OutType) return slv;
   function toVcDsBuff128Out (vec : slv((8*18) downto 0)) return VcDsBuff128OutType;
   function toVcDsBuff128Out (vec : VcUsBuff128InType) return VcDsBuff128OutType;
   function toVcDsBuff128In (vec  : VcUsBuff128OutType) return VcDsBuff128InType;
   
end VcPkg;

package body VcPkg is

   ------------------------------------------------------------------------
   -- VC Header Encode/Decode Functions                         
   ------------------------------------------------------------------------
   function encodeVcHdr (sof : sl; eof : sl; eofe : sl) return slv is
      variable retVar : slv(1 downto 0);
   begin
      -- Encode the header so that it packed into a 18-bit wide FIFO
      if sof = '1' then
         retVar := "01";
      elsif eofe = '1' then
         retVar := "11";
      elsif eof = '1' then
         retVar := "10";
      else
         retVar := "00";
      end if;
      return retVar;
   end function;

   function decodeVcHdr (vec : slv(1 downto 0)) return slv is
      variable retVar : slv(2 downto 0);
   begin
      -- Decode the header so that it packed into a 18-bit wide FIFO
      if vec = "01" then                -- sof
         retVar := "100";
      elsif vec = "11" then             -- eofe
         retVar := "011";
      elsif vec = "10" then             -- eof
         retVar := "010";
      else                              -- no headers
         retVar := "000";
      end if;
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 16-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff16InType) return slv is
      variable retVar : slv((1*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(1*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (1-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff16In (vec : slv((1*18) downto 0)) return VcUsBuff16InType is
      variable retVar : VcUsBuff16InType;
      variable i      : integer;
   begin
      retVar.valid := vec(1*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (1-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff16In (vec : VcDsBuff16OutType) return VcUsBuff16InType is
      variable retVar : VcUsBuff16InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff16Out (vec : VcDsBuff16InType) return VcUsBuff16OutType is
      variable retVar : VcUsBuff16OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 16-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff16OutType) return slv is
      variable retVar : slv((1*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(1*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (1-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff16Out (vec : slv((1*18) downto 0)) return VcDsBuff16OutType is
      variable retVar : VcDsBuff16OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(1*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (1-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff16Out (vec : VcUsBuff16InType) return VcDsBuff16OutType is
      variable retVar : VcDsBuff16OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff16In (vec : VcUsBuff16OutType) return VcDsBuff16InType is
      variable retVar : VcDsBuff16InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 32-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff32InType) return slv is
      variable retVar : slv((2*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(2*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (2-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff32In (vec : slv((2*18) downto 0)) return VcUsBuff32InType is
      variable retVar : VcUsBuff32InType;
      variable i      : integer;
   begin
      retVar.valid := vec(2*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (2-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff32In (vec : VcDsBuff32OutType) return VcUsBuff32InType is
      variable retVar : VcUsBuff32InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff32Out (vec : VcDsBuff32InType) return VcUsBuff32OutType is
      variable retVar : VcUsBuff32OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 32-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff32OutType) return slv is
      variable retVar : slv((2*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(2*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (2-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff32Out (vec : slv((2*18) downto 0)) return VcDsBuff32OutType is
      variable retVar : VcDsBuff32OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(2*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (2-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff32Out (vec : VcUsBuff32InType) return VcDsBuff32OutType is
      variable retVar : VcDsBuff32OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff32In (vec : VcUsBuff32OutType) return VcDsBuff32InType is
      variable retVar : VcDsBuff32InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 48-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff48InType) return slv is
      variable retVar : slv((3*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(3*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (3-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff48In (vec : slv((3*18) downto 0)) return VcUsBuff48InType is
      variable retVar : VcUsBuff48InType;
      variable i      : integer;
   begin
      retVar.valid := vec(3*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (3-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff48In (vec : VcDsBuff48OutType) return VcUsBuff48InType is
      variable retVar : VcUsBuff48InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff48Out (vec : VcDsBuff48InType) return VcUsBuff48OutType is
      variable retVar : VcUsBuff48OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 48-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff48OutType) return slv is
      variable retVar : slv((3*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(3*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (3-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff48Out (vec : slv((3*18) downto 0)) return VcDsBuff48OutType is
      variable retVar : VcDsBuff48OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(3*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (3-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff48Out (vec : VcUsBuff48InType) return VcDsBuff48OutType is
      variable retVar : VcDsBuff48OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff48In (vec : VcUsBuff48OutType) return VcDsBuff48InType is
      variable retVar : VcDsBuff48InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 64-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff64InType) return slv is
      variable retVar : slv((4*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(4*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (4-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff64In (vec : slv((4*18) downto 0)) return VcUsBuff64InType is
      variable retVar : VcUsBuff64InType;
      variable i      : integer;
   begin
      retVar.valid := vec(4*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (4-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff64In (vec : VcDsBuff64OutType) return VcUsBuff64InType is
      variable retVar : VcUsBuff64InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff64Out (vec : VcDsBuff64InType) return VcUsBuff64OutType is
      variable retVar : VcUsBuff64OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 64-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff64OutType) return slv is
      variable retVar : slv((4*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(4*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (4-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff64Out (vec : slv((4*18) downto 0)) return VcDsBuff64OutType is
      variable retVar : VcDsBuff64OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(4*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (4-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff64Out (vec : VcUsBuff64InType) return VcDsBuff64OutType is
      variable retVar : VcDsBuff64OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff64In (vec : VcUsBuff64OutType) return VcDsBuff64InType is
      variable retVar : VcDsBuff64InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 80-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff80InType) return slv is
      variable retVar : slv((5*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(5*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (5-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff80In (vec : slv((5*18) downto 0)) return VcUsBuff80InType is
      variable retVar : VcUsBuff80InType;
      variable i      : integer;
   begin
      retVar.valid := vec(5*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (5-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff80In (vec : VcDsBuff80OutType) return VcUsBuff80InType is
      variable retVar : VcUsBuff80InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff80Out (vec : VcDsBuff80InType) return VcUsBuff80OutType is
      variable retVar : VcUsBuff80OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 80-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff80OutType) return slv is
      variable retVar : slv((5*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(5*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (5-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff80Out (vec : slv((5*18) downto 0)) return VcDsBuff80OutType is
      variable retVar : VcDsBuff80OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(5*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (5-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff80Out (vec : VcUsBuff80InType) return VcDsBuff80OutType is
      variable retVar : VcDsBuff80OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff80In (vec : VcUsBuff80OutType) return VcDsBuff80InType is
      variable retVar : VcDsBuff80InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 96-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff96InType) return slv is
      variable retVar : slv((6*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(6*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (6-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff96In (vec : slv((6*18) downto 0)) return VcUsBuff96InType is
      variable retVar : VcUsBuff96InType;
      variable i      : integer;
   begin
      retVar.valid := vec(6*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (6-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff96In (vec : VcDsBuff96OutType) return VcUsBuff96InType is
      variable retVar : VcUsBuff96InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff96Out (vec : VcDsBuff96InType) return VcUsBuff96OutType is
      variable retVar : VcUsBuff96OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 96-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff96OutType) return slv is
      variable retVar : slv((6*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(6*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (6-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff96Out (vec : slv((6*18) downto 0)) return VcDsBuff96OutType is
      variable retVar : VcDsBuff96OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(6*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (6-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff96Out (vec : VcUsBuff96InType) return VcDsBuff96OutType is
      variable retVar : VcDsBuff96OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff96In (vec : VcUsBuff96OutType) return VcDsBuff96InType is
      variable retVar : VcDsBuff96InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 128-bit Up Stream Buffer Functions                          
   ------------------------------------------------------------------------
   function toSlv (vec : VcUsBuff128InType) return slv is
      variable retVar : slv((8*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(8*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (8-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff128In (vec : slv((8*18) downto 0)) return VcUsBuff128InType is
      variable retVar : VcUsBuff128InType;
      variable i      : integer;
   begin
      retVar.valid := vec(8*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (8-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcUsBuff128In (vec : VcDsBuff128OutType) return VcUsBuff128InType is
      variable retVar : VcUsBuff128InType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcUsBuff128Out (vec : VcDsBuff128InType) return VcUsBuff128OutType is
      variable retVar : VcUsBuff128OutType;
   begin
      retVar.full       := not(vec.ready);
      retVar.almostFull := not(vec.ready);
      return retVar;
   end function;

   ------------------------------------------------------------------------
   -- 128-bit Down Stream Buffer Functions                          
   ------------------------------------------------------------------------   
   function toSlv (vec : VcDsBuff128OutType) return slv is
      variable retVar : slv((8*18) downto 0) := (others => '0');
      variable i      : integer;
   begin
      retVar(8*18)         := vec.valid;
      retVar(17 downto 16) := encodeVcHdr(vec.sof, vec.eof, vec.eofe);
      for i in 0 to (8-1) loop
         retVar(i*18+15 downto i*18) := vec.data(i*16+15 downto i*16);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff128Out (vec : slv((8*18) downto 0)) return VcDsBuff128OutType is
      variable retVar : VcDsBuff128OutType;
      variable i      : integer;
   begin
      retVar.valid := vec(8*18);
      retVar.sof   := decodeVcHdr(vec(17 downto 16))(2);
      retVar.eof   := decodeVcHdr(vec(17 downto 16))(1);
      retVar.eofe  := decodeVcHdr(vec(17 downto 16))(0);
      for i in 0 to (8-1) loop
         retVar.data(i*16+15 downto i*16) := vec(i*18+15 downto i*18);
      end loop;
      return retVar;
   end function;

   function toVcDsBuff128Out (vec : VcUsBuff128InType) return VcDsBuff128OutType is
      variable retVar : VcDsBuff128OutType;
   begin
      retVar.valid := vec.valid;
      retVar.sof   := vec.sof;
      retVar.eof   := vec.eof;
      retVar.eofe  := vec.eofe;
      retVar.data  := vec.data;
      return retVar;
   end function;

   function toVcDsBuff128In (vec : VcUsBuff128OutType) return VcDsBuff128InType is
      variable retVar : VcDsBuff128InType;
   begin
      retVar.ready := not(vec.full) and not(vec.almostFull);
      return retVar;
   end function;  
   
end package body VcPkg;
