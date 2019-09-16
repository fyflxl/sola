vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../led_test.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+../../../../led_test.srcs/sources_1/ip/ila_0/hdl/verilog" \
"L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../led_test.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+../../../../led_test.srcs/sources_1/ip/ila_0/hdl/verilog" \
"../../../../led_test.srcs/sources_1/ip/ila_0/sim/ila_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

