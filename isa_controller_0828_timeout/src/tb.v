`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/02 21:26:28
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
    reg             clk;
    reg             rst_n;            //复位信号
    wire            oe_isa_sd1;        //74LVC4245器件使能
    wire            oe_isa_sd2;        //74LVC4245器件使能
    wire            oe_isa_sa1;        //74LVC4245器件使能
    wire            oe_isa_sa2;        //74LVC4245器件使能
    wire            oe_isa_in;        //74LVC4245器件使能
    wire            oe_isa_out;        //74LVC4245器件使能
    wire            dir_isa_sd1;    //74LVC4245方向控制
    wire            dir_isa_sd2;    //74LVC4245方向控制
    wire            dir_isa_sa1;    //74LVC4245方向控制
    wire            dir_isa_sa2;    //74LVC4245方向控制
    wire            dir_isa_in;        //74LVC4245方向控制
    wire            dir_isa_out;    //74LVC4245方向控制
    wire     [15:0] isa_sa;            //ISA地址信号
    wire            isa_iow;        //ISA写入控制信号
    wire            isa_ior;        //ISA读取控制信号
    //inout    [15:0]    isa_sd;
    wire            isa_rst_drv;    //ISA复位信号
    wire            isa_aen;        //预留
    //Signal to ZYNQ
    reg             master_rst_drv;        //复位
    reg       [3:0] master_isa_state;    //ISA状态寄存器
    reg      [15:0] master_isa_sa_in;    //AXI-ISA地址寄存器
    reg      [15:0] master_isa_sd_in;    //AXI-ISA数据输入寄存器
    wire     [15:0] slave_isa_rd_data;    //ISA读取数据寄存器(传入AXI)
    //io_isa_sd
    reg      [15:0] isa_sd_in;
    wire     [15:0] isa_sd_out;
    wire            isa_tri_en;
    reg             iocs16;
    reg             irq5;    
	reg             ap_start;
    wire            ap_done;
    wire            ap_idle;        
    
 
 	localparam IDLE 		= 4'b0000;
    localparam ISA_WRITE    = 4'b0001;
    localparam ISA_READ     = 4'b0010;
    
    localparam P = 10;
    localparam T = P*2;//Period = 10*2 ns    
       
    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        master_rst_drv = 1'b0;
        master_isa_sa_in = 16'hFFFF;
        master_isa_state = IDLE;
        master_isa_sd_in = 16'hFFFF;
        iocs16 = 1'b1;
        irq5 = 1'b0;
        ap_start = 1'b0;
        #P rst_n = 1'b1;
    end
    always #P clk = ~clk;
    
    wire isa_select = (isa_sa == 16'hEAC8);
//iocs16
    always@(*) begin
        if(isa_select)
            @(posedge clk) iocs16 = 1'b0;
        else
            @(posedge clk) iocs16 = 1'b1;
    end

    reg [15:0] ISA_MEM;
    always@(*) begin
        if(isa_select&&(isa_iow == 1'b0))
            ISA_MEM = isa_sd_out;
        else if(isa_select&&(isa_ior == 1'b0))
            isa_sd_in = ISA_MEM;
    end

//Write and Read    
    initial begin
        #(T*10) master_isa_sd_in = 16'hABCD;
        master_isa_sa_in = 16'hEAC8;
        master_isa_state = ISA_WRITE;
        ap_start = 1'b1;
        #T ap_start = 1'b0;
        #(T*10) master_isa_sa_in = 16'hEAC8;
        master_isa_state = ISA_READ;
        ap_start = 1'b1;
        #T ap_start = 1'b0;              
    end
    
    ISA_Controller U0(
        .clk_in_16m(clk),
        .rst_n(rst_n),
        .oe_isa_sd1(oe_isa_sd1),//OE_SD_N
        .oe_isa_sd2(oe_isa_sd2),
        .oe_isa_sa1(oe_isa_sa1),
        .oe_isa_sa2(oe_isa_sa2),
        .oe_isa_in(oe_isa_in),
        .oe_isa_out(oe_isa_out),
        .dir_isa_sd1(dir_isa_sd1),//DIR_SD 
        .dir_isa_sd2(dir_isa_sd2),
        .dir_isa_sa1(dir_isa_sa1),
        .dir_isa_sa2(dir_isa_sa2),
        .dir_isa_in(dir_isa_in),
        .dir_isa_out(dir_isa_out),
        .isa_sa(isa_sa),//SA
        .isa_iow(isa_iow),//IOW
        .isa_ior(isa_ior),//IOR
        //isa_sd,
        .isa_rst_drv(isa_rst_drv),
        .isa_aen(isa_aen),
        .master_rst_drv(master_rst_drv),
        .master_isa_state(master_isa_state),//Input_state: IDLE, READ,and WRITE
        .master_isa_sa_in(master_isa_sa_in),//Input SA 
        .master_isa_sd_in(master_isa_sd_in),//Input SD
        .slave_isa_rd_data(slave_isa_rd_data),//READ SD
        .isa_sd_in(isa_sd_in),
        .isa_sd_out(isa_sd_out),
        .isa_tri_en(isa_tri_en),
        .iocs16(iocs16),
        .irq5(irq5),
        .ap_start(ap_start),
        .ap_idle(ap_idle),
        .ap_done(ap_done)
    );    
    
     
    
endmodule
