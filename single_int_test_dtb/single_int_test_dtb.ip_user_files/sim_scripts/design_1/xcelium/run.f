-makelib xcelium_lib/xilinx_vip -sv \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  "L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "L:/Xilinx_201802/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../single_int_test_dtb.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../single_int_test_dtb.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/axi_protocol_checker_v2_0_3 -sv \
  "../../../../single_int_test_dtb.srcs/sources_1/bd/design_1/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_3 -sv \
  "../../../../single_int_test_dtb.srcs/sources_1/bd/design_1/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_5 -sv \
  "../../../../single_int_test_dtb.srcs/sources_1/bd/design_1/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
  "../../../bd/design_1/sim/design_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

