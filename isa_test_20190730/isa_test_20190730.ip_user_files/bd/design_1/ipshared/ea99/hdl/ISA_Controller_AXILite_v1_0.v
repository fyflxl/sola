
`timescale 1 ns / 1 ps

	module ISA_Controller_AXILite_v1_0 #
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
	    input	wire		  clk_in_16m,		//16M同步时钟输入
        output wire           oe_isa_sd1,        //74LVC4245器件使能
        output  wire          oe_isa_sd2,        //74LVC4245器件使能
        output    wire        oe_isa_sa1,        //74LVC4245器件使能
        output   wire         oe_isa_sa2,        //74LVC4245器件使能
        output   wire         oe_isa_in,        //74LVC4245器件使能
        output   wire         oe_isa_out,        //74LVC4245器件使能
        output    wire        dir_isa_sd1,    //74LVC4245方向控制
        output    wire        dir_isa_sd2,    //74LVC4245方向控制
        output     wire       dir_isa_sa1,    //74LVC4245方向控制
        output     wire       dir_isa_sa2,    //74LVC4245方向控制
        output     wire       dir_isa_in,        //74LVC4245方向控制
        output      wire      dir_isa_out,    //74LVC4245方向控制
        output   wire [15:0]    isa_sa,            //ISA地址信号
        output   wire         isa_iow,        //ISA写入控制信号
        output    wire        isa_ior,        //ISA读取控制信号
        //inout    [15:0]    isa_sd;
        output     wire       isa_rst_drv,    //ISA复位信号
        output     wire       isa_aen,        //预留
        
        //io_isa_sd
        input   wire [15:0]    isa_sd_in,
        output  wire [15:0]    isa_sd_out,
        output   wire          isa_tri_en,
        input     wire         iocs16,
        input      wire        irq5,
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
	
    wire  [31:0]    master_rst_drv_reg;
    wire  [31:0]    master_isa_state;
    wire  [31:0]    master_isa_sa_in;
    wire  [31:0]    master_isa_sd_in;
    wire   [31:0]   slave_isa_rd_data;
    wire   [31:0]   isa_status;	
	
// Instantiation of Axi Bus Interface S00_AXI
	ISA_Controller_AXILite_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) ISA_Controller_AXILite_v1_0_S00_AXI_inst (
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
ISA_Controller ISA_Controller_inst(
        .clk_in_16m(clk_in_16m),
        .rst_n(s00_axi_aresetn),
        .oe_isa_sd1(oe_isa_sd1),
        .oe_isa_sd2(oe_isa_sd2),
        .oe_isa_sa1(oe_isa_sa1),
        .oe_isa_sa2(oe_isa_sa2),
        .oe_isa_in(oe_isa_in),
        .oe_isa_out(oe_isa_out),
        .dir_isa_sd1(dir_isa_sd1),
        .dir_isa_sd2(dir_isa_sd2),
        .dir_isa_sa1(dir_isa_sa1),
        .dir_isa_sa2(dir_isa_sa2),
        .dir_isa_in(dir_isa_in),
        .dir_isa_out(dir_isa_out),
        .isa_sa(isa_sa),
        .isa_iow(isa_iow),
        .isa_ior(isa_ior),
        //isa_sd,
        .isa_rst_drv(isa_rst_drv),
        .isa_aen(isa_aen),
        .master_rst_drv(master_rst_drv_reg[0]),
        .master_isa_state(master_isa_state),
        .master_isa_sa_in(master_isa_sa_in),
        .master_isa_sd_in(master_isa_sd_in),
        .slave_isa_rd_data(slave_isa_rd_data),
        .isa_status(isa_status),
        .isa_sd_in(isa_sd_in),
        .isa_sd_out(isa_sd_out),
        .isa_tri_en(isa_tri_en),
        .iocs16(iocs16),
        .irq5(irq5)
    );
	// User logic ends

	endmodule
