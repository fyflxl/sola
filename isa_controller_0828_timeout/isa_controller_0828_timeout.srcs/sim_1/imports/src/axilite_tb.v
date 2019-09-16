`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/04 15:44:53
// Design Name: 
// Module Name: axilite_tb
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


module axilite_tb(

    );
    
	localparam integer C_S_AXI_DATA_WIDTH	= 32;
    localparam integer C_S_AXI_ADDR_WIDTH  = 5;
    
    reg           tb_start;   
    
    wire          master_rst_drv;
    wire  [31:0]  master_isa_state;
    wire  [31:0]  master_isa_sa_in;
    wire  [31:0]  master_isa_sd_in;
    reg   [31:0]  slave_isa_rd_data;
    reg   [31:0]  isa_status;
    wire          ap_start;
    reg           ap_idle;
    reg           ap_done;
    reg           S_AXI_ACLK;
    reg           S_AXI_ARESETN;
    reg [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR;
    reg   [2 : 0] S_AXI_AWPROT;
    reg           S_AXI_AWVALID;
    wire          S_AXI_AWREADY;
    reg [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA; 
    reg [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB;
    reg           S_AXI_WVALID;
    wire          S_AXI_WREADY;
    wire  [1 : 0] S_AXI_BRESP;
    wire          S_AXI_BVALID;
    reg           S_AXI_BREADY;
    reg [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR;
    reg   [2 : 0] S_AXI_ARPROT;
    reg           S_AXI_ARVALID;
    wire          S_AXI_ARREADY;
    wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA;
    wire  [1 : 0] S_AXI_RRESP;
    wire          S_AXI_RVALID;
    reg           S_AXI_RREADY;    
    
    localparam P = 10;
    localparam T = P*2;
    
    initial begin
        S_AXI_ACLK = 1'b0;
    end
    always #P S_AXI_ACLK = ~S_AXI_ACLK;
    
    initial begin
        tb_start = 1'b0;
        slave_isa_rd_data = 32'hFFFFFFFF;
        isa_status   = 32'd0;//just set to zero
        S_AXI_ARPROT = 3'd0;//No use
        S_AXI_AWPROT = 3'd0;//No use
        S_AXI_ARESETN = 1'b0;
        #(T*4+P) S_AXI_ARESETN = 1'b1;
        tb_start = 1'b1;
    end
    
    initial begin
        S_AXI_AWADDR = 5'h0x00;
        S_AXI_AWVALID = 1'b0;
        S_AXI_ARADDR = 5'h0x00;
        S_AXI_ARVALID = 1'b0;
        @(posedge tb_start);
        //Test Write
        S_AXI_AWADDR = 5'h0x04;
        S_AXI_AWVALID = 1'b1;
         @(negedge S_AXI_AWREADY) begin
            S_AXI_AWADDR =  5'h0x00;
            S_AXI_AWVALID = 1'b0;             
         end
         //Test Read
         S_AXI_ARADDR = 5'h0x04;
         S_AXI_ARVALID= 1'b1;
         @(negedge S_AXI_ARREADY) begin
            S_AXI_ARADDR =  5'h0x00;
            S_AXI_ARVALID = 1'b0;             
         end         
    end
    
    initial begin
        S_AXI_BREADY = 1'b0;
        S_AXI_WDATA = 32'd0;
        S_AXI_WSTRB = 4'b0000;
        S_AXI_WVALID = 1'b0;
        S_AXI_RREADY = 1'b0;
        @(posedge tb_start);
        //Test Write
        S_AXI_WDATA = 32'h0x9876ABCD;
        S_AXI_WSTRB = 4'b1111;
        S_AXI_WVALID = 1'b1;
        @(negedge S_AXI_WREADY)begin
            S_AXI_BREADY = 1'b1;
            S_AXI_WDATA = 32'h0;
            S_AXI_WSTRB = 4'b0;
            S_AXI_WVALID = 1'b0;            
        end
        @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;
        // Test Read
        S_AXI_RREADY = 1'b1;
        @(negedge S_AXI_RVALID) S_AXI_RREADY = 1'b0;
    end    
    
    
	axi_isa_S00_AXI # ( 
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(5)
    ) axi_isa_S00_AXI_inst (
        .master_rst_drv(master_rst_drv),
        .master_isa_state(master_isa_state),
        .master_isa_sa_in(master_isa_sa_in),
        .master_isa_sd_in(master_isa_sd_in),
        .slave_isa_rd_data(),
        .isa_status(isa_status),
        .ap_start(ap_start),
        .ap_idle(),
        .ap_done(),
        .S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_AWADDR(S_AXI_AWADDR),
        .S_AXI_AWPROT(S_AXI_AWPROT),//No logic??
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WDATA(S_AXI_WDATA), 
        .S_AXI_WSTRB(S_AXI_WSTRB),
        .S_AXI_WVALID(S_AXI_WVALID),
        .S_AXI_WREADY(S_AXI_WREADY),
        .S_AXI_BRESP(S_AXI_BRESP),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_ARADDR(S_AXI_ARADDR),
        .S_AXI_ARPROT(S_AXI_ARPROT),//No logic?
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RRESP(S_AXI_RRESP),
        .S_AXI_RVALID(S_AXI_RVALID),
        .S_AXI_RREADY(S_AXI_RREADY)
    );    
    
endmodule
