// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Jul 29 17:21:37 2019
// Host        : BF-20160906TGWX running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_isa_0_0_stub.v
// Design      : design_1_axi_isa_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_isa,Vivado 2018.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk_16m_i, oe_isa_sd1, oe_isa_sd2, oe_isa_sa1, 
  oe_isa_sa2, oe_isa_in, oe_isa_out, dir_isa_sd1, dir_isa_sd2, dir_isa_sa1, dir_isa_sa2, 
  dir_isa_in, dir_isa_out, isa_sa, isa_iow, isa_ior, isa_sd, isa_rst_drv, isa_aen, s00_axi_aclk, 
  s00_axi_aresetn, s00_axi_awaddr, s00_axi_awprot, s00_axi_awvalid, s00_axi_awready, 
  s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, s00_axi_wready, s00_axi_bresp, 
  s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, s00_axi_arprot, s00_axi_arvalid, 
  s00_axi_arready, s00_axi_rdata, s00_axi_rresp, s00_axi_rvalid, s00_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="clk_16m_i,oe_isa_sd1,oe_isa_sd2,oe_isa_sa1,oe_isa_sa2,oe_isa_in,oe_isa_out,dir_isa_sd1,dir_isa_sd2,dir_isa_sa1,dir_isa_sa2,dir_isa_in,dir_isa_out,isa_sa[15:0],isa_iow,isa_ior,isa_sd[15:0],isa_rst_drv,isa_aen,s00_axi_aclk,s00_axi_aresetn,s00_axi_awaddr[4:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[4:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready" */;
  input clk_16m_i;
  output oe_isa_sd1;
  output oe_isa_sd2;
  output oe_isa_sa1;
  output oe_isa_sa2;
  output oe_isa_in;
  output oe_isa_out;
  output dir_isa_sd1;
  output dir_isa_sd2;
  output dir_isa_sa1;
  output dir_isa_sa2;
  output dir_isa_in;
  output dir_isa_out;
  output [15:0]isa_sa;
  output isa_iow;
  output isa_ior;
  inout [15:0]isa_sd;
  output isa_rst_drv;
  output isa_aen;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [4:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [4:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
endmodule
