`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/29 15:10:17
// Design Name: 
// Module Name: axi_isa_v1_0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_isa #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here
        input   clk_16m_i,
        output  oe_isa_sd1,
        output  oe_isa_sd2,
        output  oe_isa_sa1,
        output  oe_isa_sa2,
        output  oe_isa_in,
        output  oe_isa_out,
        output  dir_isa_sd1 ,    // output  dir_isa_sd1
        output  dir_isa_sd2 ,    // output  dir_isa_sd2
        output  dir_isa_sa1 ,    // output  dir_isa_sa1
        output  dir_isa_sa2 ,    // output  dir_isa_sa2
        output  dir_isa_in ,    // output  dir_isa_in
        output  dir_isa_out ,    // output  dir_isa_out        
        output  [15:0]  isa_sa,
        output  isa_iow,
        output  isa_ior,
        inout   [15:0]  isa_sd,
        output  isa_rst_drv,
        output  isa_aen,
//        input    [15:0]    isa_sd_in,
//        output   [15:0]    isa_sd_out,
//        output             isa_tri_en,
        
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
        wire  [31:0]    master_rst_drv_reg;
        wire  [31:0]    master_isa_state;
        wire  [31:0]    master_isa_sa_in;
        wire  [31:0]    master_isa_sd_in;
        wire   [31:0]   slave_isa_rd_data;
        wire   [31:0]   isa_status;
	axi_isa_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axi_isa_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
        .master_rst_drv(master_rst_drv_reg),
        .master_isa_state(master_isa_state),
        .master_isa_sa_in(master_isa_sa_in),
        .master_isa_sd_in(master_isa_sd_in),
        .slave_isa_rd_data(slave_isa_rd_data),
        .isa_status(isa_status)
	);

	// Add user logic here
    ISA_Controller
    ISA_Controller_inst(
        .clk_in_16m(clk_16m_i) ,    // input  clk_in_50m
        .rst_n(s00_axi_aresetn) ,                // input  rst_n
        .oe_isa_sd1(oe_isa_sd1) ,    // output  oe_isa_sd1
        .oe_isa_sd2(oe_isa_sd2) ,    // output  oe_isa_sd2
        .oe_isa_sa1(oe_isa_sa1) ,    // output  oe_isa_sa1
        .oe_isa_sa2(oe_isa_sa2) ,    // output  oe_isa_sa2
        .oe_isa_in(oe_isa_in) ,        // output  oe_isa_in
        .oe_isa_out(oe_isa_out) ,    // output  oe_isa_out
        .dir_isa_sd1(dir_isa_sd1) ,    // output  dir_isa_sd1
        .dir_isa_sd2(dir_isa_sd2) ,    // output  dir_isa_sd2
        .dir_isa_sa1(dir_isa_sa1) ,    // output  dir_isa_sa1
        .dir_isa_sa2(dir_isa_sa2) ,    // output  dir_isa_sa2
        .dir_isa_in(dir_isa_in) ,    // output  dir_isa_in
        .dir_isa_out(dir_isa_out) ,    // output  dir_isa_out
        .isa_sa(isa_sa) ,            // output [15:0] isa_sa
        .isa_iow(isa_iow) ,            // output  isa_iow
        .isa_ior(isa_ior) ,            // output  isa_ior
        .isa_sd(isa_sd) ,            // inout [15:0] isa_sd
        .isa_rst_drv(isa_rst_drv) ,    // output  isa_rst_drv
        .isa_aen(isa_aen),             // output  isa_aen
        .master_rst_drv(master_rst_drv_reg[0]),
        .master_isa_state(master_isa_state),
        .master_isa_sa_in(master_isa_sa_in),
        .master_isa_sd_in(master_isa_sd_in),
        .slave_isa_rd_data(slave_isa_rd_data),
        .isa_status(isa_status)//,
//        .isa_sd_in(isa_sd_in),
//        .isa_sd_out(isa_sd_out),
//        .isa_tri_en(isa_tri_en)
    );
	// User logic ends

	endmodule

