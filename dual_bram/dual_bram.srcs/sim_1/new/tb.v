`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/24 20:20:41
// Design Name: 
// Module Name: tb
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


module tb(
    );
    
    localparam Period       = (20/2);//50MHz
    localparam IDLE 		= 4'b0000;
    localparam ISA_WRITE    = 4'b0001;
    localparam ISA_READ     = 4'b0010;
    
	reg    clk;
    reg    rst_n;
    wire    [15:0]  isa_sa;
    wire            isa_iow;
    wire            isa_ior;
    
    reg             isa_sd_dir;
    reg    [15:0]   isa_sd_in;
    wire   [15:0]   isa_sd_out;
    wire   [15:0]   isa_sd;
    
    assign isa_sd_out = (isa_sd_dir==0) ? isa_sd:16'bz;
    assign isa_sd = (isa_sd_dir==1) ? isa_sd_in:16'bz;
    
    
    wire            isa_rst_drv;    //
    wire            isa_aen;        //
    reg            iocs16;

    //Signal to NiosII
    reg            master_rst_drv;        //
    reg    [3:0]    master_isa_state;
    reg    [15:0]    master_isa_sa_in;
    reg    [15:0]    master_isa_sd_in;
    wire    [15:0]    slave_isa_rd_data;
    wire    [15:0]    isa_status;
  
    
    initial begin
        clk <= 1'b0;
        rst_n <= 1'b0;
        master_rst_drv <= 1'b0;
        master_isa_state <= IDLE;
        isa_sd_in <= 16'h1234;
        
        #(Period*2*6) clk <= 1'b1;
        master_rst_drv <= 1'b1;
        master_isa_state <= ISA_WRITE;
        master_isa_sa_in <= 16'h1357;
        master_isa_sd_in <= 16'h9876;
        
    end
    
    always #Period clk = ~clk;
    
ISA_Controller U0(
        .clk(clk),
        .rst_n(rst_n),
        .isa_sa(isa_sa),
        .isa_iow(isa_iow),
        .isa_ior(isa_ior),
        .isa_sd(isa_sd),
        .iocs16(iocs16),
        .isa_rst_drv(isa_rst_drv),
        .isa_aen(isa_aen),
        .master_rst_drv(master_rst_drv),
        .master_isa_state(master_isa_state),
        .master_isa_sa_in(master_isa_sa_in),
        .master_isa_sd_in(master_isa_sd_in),
        .slave_isa_rd_data(slave_isa_rd_data),
        .isa_status(isa_status)
    );
    
    
endmodule
