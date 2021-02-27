############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project DetectCorner
set_top detectCorner
add_files source/detectCorner.cpp -cflags "-I /home/guohui/NFS-Folder/FPGA/Vitis_Libraries/vision/L1/include -std=c++0x"
add_files -tb source/test.cpp -cflags "-I../../../../../../usr/local/include -std=c++0x"
open_solution "solution1" -flow_target vivado
set_part {xczu5ev-sfvc784-1-i}
create_clock -period 10 -name default
#source "./DetectCorner/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
