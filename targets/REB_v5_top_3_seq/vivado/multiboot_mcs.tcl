source -quiet $::env(RUCKUS_DIR)/vivado/env_var.tcl

set topModule [file rootname [file tail [glob -dir ${IMPL_DIR} *.bit]]]

set inputFile     "$::env(IMPL_DIR)/${topModule}.mcs"
set outputFile    "$::env(IMPL_DIR)/${topModule}_multiboot.mcs"
set imagesFile    "$::env(IMAGES_DIR)/$::env(IMAGENAME)_multiboot.mcs"

#open a file to readn and write
set infile [open $inputFile r+]

#read the file infile
set filedata [read $infile]

set add_scan_result 0
set reboot_scan_result 0
#substitute 3002000100000000 3002000100008000 if is included between aa995566 and 30026001
if {[regexp -nocase {(aa995566.+?3002000100000000.+?30026001)} $filedata]} {
    regsub 3002000100000000 $filedata 3002000100008000 filedata_mod
    set add_scan_result 1
    puts "cmd and address on the same line"


} elseif {[regexp -nocase {(aa995566.+?30020001............00000000.+?30026001)} $filedata]} {
    regexp -nocase -indices {30020001............00000000} $filedata index
    regsub -start [expr [lindex $index 1] - 7] 00000000 $filedata 00008000 filedata_mod
    set add_scan_result 1
    puts "cmd and address on two lines"
}

# substitute the reboot comand
if {[regexp -nocase {(30020001.+?3000800100000000.+?30026001)} $filedata]} {
    regsub 3000800100000000 $filedata_mod 300080010000000F filedata_mod
    set reboot_scan_result 1
    puts "cmd and address on the same line"


} elseif {[regexp -nocase {(30020001.+?30008001............00000000.+?30026001)} $filedata]} {
    regexp -nocase -indices {30008001............00000000} $filedata index
    regsub -start [expr [lindex $index 1] - 7] 00000000 $filedata_mod 0000000F filedata_mod
    set reboot_scan_result 1
    puts "cmd and address on two lines"
}


if {($add_scan_result == 1&& $reboot_scan_result == 1)} {
    set outfile [open $outputFile w]
    puts $outfile  "$filedata_mod"
    close $outfile
    puts "multiboot jump inserted"
} else {
    puts "multiboot jump already present"
}

close $infile

# Copy the image from build tree to source tree
if { $::env(GEN_MULTIBOOT_IMAGE) != 0 } {
  exec cp -f ${outputFile} ${imagesFile}
  puts "PROM file copied to ${imagesFile}"
}

# Check if gzip-ing the image files
if { $::env(GEN_MULTIBOOT_IMAGE_GZIP) != 0 } {
  # Create a compressed version of the image file
  exec gzip -c -f -9 ${outputFile} > ${imagesFile}.gz
  puts "PROM file copied to ${imagesFile}.gz"
}


#exec gzip -c -f -9 ${outputFile} > ${imagesFile}.gz
#puts "PROM file copied to ${imagesFile}.gz"
