
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_sobel_filter_top/AESL_inst_sobel_filter/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set rows__cols__return_group [add_wave_group rows__cols__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/interrupt -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_BRESP -into $rows__cols__return_group -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_BREADY -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_BVALID -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_RRESP -into $rows__cols__return_group -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_RDATA -into $rows__cols__return_group -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_RREADY -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_RVALID -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_ARREADY -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_ARVALID -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_ARADDR -into $rows__cols__return_group -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_WSTRB -into $rows__cols__return_group -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_WDATA -into $rows__cols__return_group -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_WREADY -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_WVALID -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_AWREADY -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_AWVALID -into $rows__cols__return_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/s_axi_CTRL_BUS_AWADDR -into $rows__cols__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set out_pix_group [add_wave_group out_pix(axis) -into $coutputgroup]
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/out_pix_V_V_TREADY -into $out_pix_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/out_pix_V_V_TVALID -into $out_pix_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/out_pix_V_V_TDATA -into $out_pix_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set inter_pix_group [add_wave_group inter_pix(axis) -into $cinputgroup]
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/inter_pix_V_V_TREADY -into $inter_pix_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/inter_pix_V_V_TVALID -into $inter_pix_group -color #ffff00 -radix hex
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/inter_pix_V_V_TDATA -into $inter_pix_group -radix hex
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_sobel_filter_top/AESL_inst_sobel_filter/ap_clk -into $clockgroup
save_wave_config sobel_filter.wcfg
run all
quit

