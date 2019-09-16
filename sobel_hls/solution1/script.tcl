############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project sobel_hls
set_top sobel_filter
add_files sobel_hls/sobel.h
add_files sobel_hls/sobel.cpp
add_files -tb sobel_hls/test_1080p.bmp -cflags "-Wno-unknown-pragmas"
add_files -tb sobel_hls/sobel_test.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb sobel_hls/result_1080p_golden.bmp -cflags "-Wno-unknown-pragmas"
add_files -tb sobel_hls/ap_bmp.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z010clg400-1} -tool vivado
create_clock -period 10 -name default
#source "./sobel_hls/solution1/directives.tcl"
csim_design -clean -O
csynth_design
cosim_design -O -trace_level port
export_design -flow impl -rtl verilog -format ip_catalog
