#!/bin/bash

file_name="$1"

if [ $# = 0 ]
then 
echo ""
echo "please specify the memory file name"
echo "example" 
echo "./et_prog_flash.sh /REB_v5/reb_v5_daq_v1/reb_v5_2/REB_v5_top_30325002.mcs"
echo ""
else
	if [ -z ${file_name} ]
	then
	    echo "please set the file to program"
	else
	    echo "writing flash"
	    vivado -mode batch -source ./flash_load.tcl -tclargs $file_name
	fi
fi
#exit
