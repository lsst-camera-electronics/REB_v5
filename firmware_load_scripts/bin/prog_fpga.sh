#!/bin/bash


operation_type="$1"
file_name="$2"

if [ $# = 0 ]
then 
echo ""
echo "please set operation type and file"
echo "example" 
echo "./prog_fpga.sh fpga REB_v4_top_102c4005.bit"
echo "or"
echo "./prog_fpga.sh flash /REB_v4/reb_v4_daq_v1/reb_v4_5/REB_v4_top_102c4005.mcs"
echo ""
else
    if [ "$operation_type" == "fpga" ]
    then 
	if [ -z ${file_name} ]
	then
	    echo "please set the file to program"
	else
	    echo "writing FPGA"
#	    cd vivado
	    source /afs/slac.stanford.edu/g/reseng/xilinx/vivado_2015.3/Vivado/2015.3/settings64.sh
	    vivado -mode batch -source ../fpga_load.tcl -tclargs $file_name
	fi
    elif [ "$operation_type" == "flash" ] 
    then
	if [ -z ${file_name} ]
	then
	    echo "please set the file to program"
	else
	    echo "writing flash"
#	    cd vivado
	    source /afs/slac.stanford.edu/g/reseng/xilinx/vivado_2015.3/Vivado/2015.3/settings64.sh
	    vivado -mode batch -source ../flash_load.tcl -tclargs $file_name
	fi
    else 
	echo "Unrecognized option it can be either memory or fpga"
    fi
fi
#cd ..
#exit
