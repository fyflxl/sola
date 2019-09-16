`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/05 02:37:10
// Design Name: 
// Module Name: axi_isa_tb
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


module axi_isa_tb(

    );
 
 	localparam integer C_S_AXI_DATA_WIDTH	= 32;
    localparam integer C_S_AXI_ADDR_WIDTH  = 5;
    
    reg           tb_start;   
    
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
    
    reg             clk;
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
    //io_isa_sd
    reg      [15:0] isa_sd_in;
    wire     [15:0] isa_sd_out;
    wire            isa_tri_en;
    reg             iocs16;
    reg             irq5;       
        
    
    localparam P = 10;
    localparam T = P*2;
    
    initial begin
        clk = 1'b0;
    end
    always #(P*3.125) clk = ~clk; //50MHz div 16MHz = 3.125
        
    initial begin
        S_AXI_ACLK = 1'b0;
    end
    always #P S_AXI_ACLK = ~S_AXI_ACLK;
    
    initial begin
        iocs16 = 1'b1;
        irq5 = 1'b0;
        tb_start = 1'b0;
        S_AXI_ARPROT = 3'd0;//No use
        S_AXI_AWPROT = 3'd0;//No use
        S_AXI_ARESETN = 1'b0;
        #(T*4+P) S_AXI_ARESETN = 1'b1;
        tb_start = 1'b1;
    end
    
   localparam IDLE 		= 4'b0000;
   localparam ISA_WRITE    = 4'b0001;
   localparam ISA_READ     = 4'b0010;
       
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


//       #(T*10) master_isa_sa_in = 16'hEAC8;
//       master_isa_state = ISA_READ;
//       ap_start = 1'b1;
//       #T ap_start = 1'b0;              
//   end    
    
    
    initial begin
        S_AXI_AWADDR = 5'h0x00;
        S_AXI_AWVALID = 1'b0;
        S_AXI_ARADDR = 5'h0x00;
        S_AXI_ARVALID = 1'b0;
        @(posedge tb_start);
        //Test ISA_Write
        //(1)Read IDLE 0x00
         S_AXI_ARADDR = 5'h0x00;
        S_AXI_ARVALID= 1'b1;
        @(negedge S_AXI_ARREADY) begin
           S_AXI_ARADDR =  5'h0x00;
           S_AXI_ARVALID = 1'b0;             
        end                  
        //(2)write  master_isa_sd_in = 16'hABCD; 0x0C
        S_AXI_AWADDR = 5'h0x0C;
        S_AXI_AWVALID = 1'b1;
         @(negedge S_AXI_AWREADY) begin
            S_AXI_AWADDR =  5'h0x00;
            S_AXI_AWVALID = 1'b0;             
         end                
        //(3)write  master_isa_sa_in = 16'hEAC8; 0x08
        S_AXI_AWADDR = 5'h0x08;
        S_AXI_AWVALID = 1'b1;
         @(negedge S_AXI_AWREADY) begin
            S_AXI_AWADDR =  5'h0x00;
            S_AXI_AWVALID = 1'b0;             
         end          
        //(4)write  master_isa_state = ISA_WRITE; 0x04  
        S_AXI_AWADDR = 5'h0x04;
        S_AXI_AWVALID = 1'b1;
         @(negedge S_AXI_AWREADY) begin
            S_AXI_AWADDR =  5'h0x00;
            S_AXI_AWVALID = 1'b0;             
         end
         //(5)write ap_start   0x00       
        S_AXI_AWADDR = 5'h0x00;
         S_AXI_AWVALID = 1'b1;
          @(negedge S_AXI_AWREADY) begin
             S_AXI_AWADDR =  5'h0x00;
             S_AXI_AWVALID = 1'b0;             
          end 
        //(6)Read DONE = 1 0x00 1bit
           S_AXI_ARADDR = 5'h0x00;
        S_AXI_ARVALID= 1'b1;
        @(negedge S_AXI_ARREADY) begin
           S_AXI_ARADDR =  5'h0x00;
           S_AXI_ARVALID = 1'b0;             
        end            
        while(!rd_data[1]) begin
           S_AXI_ARADDR = 5'h0x00;
           S_AXI_ARVALID= 1'b1;
           @(negedge S_AXI_ARREADY) begin
              S_AXI_ARADDR =  5'h0x00;
              S_AXI_ARVALID = 1'b0;             
           end         
        end     
        
        //Test ISA_Read          
         //(1)Read IDLE 0x00
          while(!rd_data[2]) begin
             S_AXI_ARADDR = 5'h0x00;
             S_AXI_ARVALID= 1'b1;
             @(negedge S_AXI_ARREADY) begin
                S_AXI_ARADDR =  5'h0x00;
                S_AXI_ARVALID = 1'b0;             
             end              
          end                            
        //(2)write  master_isa_sa_in = 16'hEAC8; 0x08
        S_AXI_AWADDR = 5'h0x08;
        S_AXI_AWVALID = 1'b1;
         @(negedge S_AXI_AWREADY) begin
            S_AXI_AWADDR =  5'h0x00;
            S_AXI_AWVALID = 1'b0;             
         end          
        //(3)write  master_isa_state = ISA_READ; 0x04  
        S_AXI_AWADDR = 5'h0x04;
        S_AXI_AWVALID = 1'b1;
         @(negedge S_AXI_AWREADY) begin
            S_AXI_AWADDR =  5'h0x00;
            S_AXI_AWVALID = 1'b0;             
         end
         //(4)write ap_start   0x00       
        S_AXI_AWADDR = 5'h0x00;
         S_AXI_AWVALID = 1'b1;
          @(negedge S_AXI_AWREADY) begin
             S_AXI_AWADDR =  5'h0x00;
             S_AXI_AWVALID = 1'b0;             
          end
        //(5)Read DONE 0x00 1bit
            S_AXI_ARADDR = 5'h0x00;
            S_AXI_ARVALID= 1'b1;
            @(negedge S_AXI_ARREADY) begin
               S_AXI_ARADDR =  5'h0x00;
               S_AXI_ARVALID = 1'b0;   
               end         
          while(!rd_data[1]) begin
             S_AXI_ARADDR = 5'h0x00;
             S_AXI_ARVALID= 1'b1;
             @(negedge S_AXI_ARREADY) begin
                S_AXI_ARADDR =  5'h0x00;
                S_AXI_ARVALID = 1'b0;             
             end         
          end 
        //(6)Read IDLE 0x00 2bit
            S_AXI_ARADDR = 5'h0x00;
            S_AXI_ARVALID= 1'b1;
            @(negedge S_AXI_ARREADY) begin
               S_AXI_ARADDR =  5'h0x00;
               S_AXI_ARVALID = 1'b0;             
            end                 
            while(!rd_data[2]) begin
               S_AXI_ARADDR = 5'h0x00;
               S_AXI_ARVALID= 1'b1;
               @(negedge S_AXI_ARREADY) begin
                  S_AXI_ARADDR =  5'h0x00;
                  S_AXI_ARVALID = 1'b0;             
               end         
            end                               
          //(7)Read RD_DATA 0x10
          S_AXI_ARADDR = 5'h0x10;
           S_AXI_ARVALID= 1'b1;
           @(negedge S_AXI_ARREADY) begin
              S_AXI_ARADDR =  5'h0x00;
              S_AXI_ARVALID = 1'b0;             
           end           
          
         
             
//        S_AXI_AWADDR = 5'h0x04;
//        S_AXI_AWVALID = 1'b1;
//         @(negedge S_AXI_AWREADY) begin
//            S_AXI_AWADDR =  5'h0x00;
//            S_AXI_AWVALID = 1'b0;             
//         end     
//         //Test Read
//         S_AXI_ARADDR = 5'h0x04;
//         S_AXI_ARVALID= 1'b1;
//         @(negedge S_AXI_ARREADY) begin
//            S_AXI_ARADDR =  5'h0x00;
//            S_AXI_ARVALID = 1'b0;             
//         end         
    end
    
    wire [31:0] rd_data;
    assign rd_data = S_AXI_RDATA;
    
    initial begin
//        rd_data = 32'd0;
        S_AXI_BREADY = 1'b0;
        S_AXI_WDATA = 32'd0;
        S_AXI_WSTRB = 4'b0000;
        S_AXI_WVALID = 1'b0;
        S_AXI_RREADY = 1'b0;
        @(posedge tb_start);
        //Test ISA_Write
        //(1)Read IDLE 0x00
        S_AXI_RREADY = 1'b1;
        @(negedge S_AXI_RVALID) begin
//            rd_data = S_AXI_RDATA;
            S_AXI_RREADY = 1'b0;
         end
        //(2)write  master_isa_sd_in = 16'hABCD; 0x0C
        S_AXI_WDATA = 32'h0x0000ABCD;
        S_AXI_WSTRB = 4'b1111;
        S_AXI_WVALID = 1'b1;
        @(negedge S_AXI_WREADY)begin
            S_AXI_BREADY = 1'b1;
            S_AXI_WDATA = 32'h0;
            S_AXI_WSTRB = 4'b0;
            S_AXI_WVALID = 1'b0;            
        end
        @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;        
        //(3)write  master_isa_sa_in = 16'hEAC8; 0x08
         S_AXI_WDATA = 32'h0x0000EAC8;
        S_AXI_WSTRB = 4'b1111;
        S_AXI_WVALID = 1'b1;
        @(negedge S_AXI_WREADY)begin
            S_AXI_BREADY = 1'b1;
            S_AXI_WDATA = 32'h0;
            S_AXI_WSTRB = 4'b0;
            S_AXI_WVALID = 1'b0;            
        end
        @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;          
        //(4)write  master_isa_state = ISA_WRITE; 0x04             
         S_AXI_WDATA = ISA_WRITE;
       S_AXI_WSTRB = 4'b1111;
       S_AXI_WVALID = 1'b1;
       @(negedge S_AXI_WREADY)begin
           S_AXI_BREADY = 1'b1;
           S_AXI_WDATA = 32'h0;
           S_AXI_WSTRB = 4'b0;
           S_AXI_WVALID = 1'b0;            
       end
       @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0; 
         //(5)write ap_start=0x0000_0001   0x00                   
        S_AXI_WDATA = 32'h0x00000001;
         S_AXI_WSTRB = 4'b1111;
         S_AXI_WVALID = 1'b1;
         @(negedge S_AXI_WREADY)begin
             S_AXI_BREADY = 1'b1;
             S_AXI_WDATA = 32'h0;
             S_AXI_WSTRB = 4'b0;
             S_AXI_WVALID = 1'b0;            
         end
         @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;
        //(6)Read DONE = 1 0x00 1bit
            S_AXI_RREADY = 1'b1;
        @(negedge S_AXI_RVALID) begin
//                rd_data = S_AXI_RDATA;
            S_AXI_RREADY = 1'b0;
         end        
         while(!rd_data[1])
        begin
            S_AXI_RREADY = 1'b1;
            @(negedge S_AXI_RVALID) begin
//                rd_data = S_AXI_RDATA;
                S_AXI_RREADY = 1'b0;
             end
        end
                 
        //Test ISA_Read           
        //(1)Read IDLE 0x00
        while(!rd_data[2]) begin
            S_AXI_RREADY = 1'b1;
            @(negedge S_AXI_RVALID) begin
//            rd_data = S_AXI_RDATA;
                S_AXI_RREADY = 1'b0;
             end
         end               
        //(2)write  master_isa_sa_in = 16'hEAC8; 0x08
         S_AXI_WDATA = 32'h0x0000EAC8;
        S_AXI_WSTRB = 4'b1111;
        S_AXI_WVALID = 1'b1;
        @(negedge S_AXI_WREADY)begin
            S_AXI_BREADY = 1'b1;
            S_AXI_WDATA = 32'h0;
            S_AXI_WSTRB = 4'b0;
            S_AXI_WVALID = 1'b0;            
        end
        @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;          
        //(3)write  master_isa_state = ISA_READ; 0x04             
         S_AXI_WDATA = ISA_READ;
       S_AXI_WSTRB = 4'b1111;
       S_AXI_WVALID = 1'b1;
       @(negedge S_AXI_WREADY)begin
           S_AXI_BREADY = 1'b1;
           S_AXI_WDATA = 32'h0;
           S_AXI_WSTRB = 4'b0;
           S_AXI_WVALID = 1'b0;            
       end
       @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0; 
         //(4)write ap_start=0x0000_0001   0x00                   
        S_AXI_WDATA = 32'h0x00000001;
         S_AXI_WSTRB = 4'b1111;
         S_AXI_WVALID = 1'b1;
         @(negedge S_AXI_WREADY)begin
             S_AXI_BREADY = 1'b1;
             S_AXI_WDATA = 32'h0;
             S_AXI_WSTRB = 4'b0;
             S_AXI_WVALID = 1'b0;            
         end
         @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;
        //(5)Read DONE 0x00 1bit
         S_AXI_RREADY = 1'b1;
         @(negedge S_AXI_RVALID) begin
            S_AXI_RREADY = 1'b0;
         end        
         while((!rd_data[1]))
         begin
             S_AXI_RREADY = 1'b1;
             @(negedge S_AXI_RVALID) begin
//                 rd_data = S_AXI_RDATA;
                 S_AXI_RREADY = 1'b0;
              end
         end  
        //(6)Read IDLE 0x00 2bit
              S_AXI_RREADY = 1'b1;
        @(negedge S_AXI_RVALID) begin
//                 rd_data = S_AXI_RDATA;
            S_AXI_RREADY = 1'b0;
         end        
          while((!rd_data[2]))
          begin
              S_AXI_RREADY = 1'b1;
              @(negedge S_AXI_RVALID) begin
 //                 rd_data = S_AXI_RDATA;
                  S_AXI_RREADY = 1'b0;
               end
          end                                        
        //(7)Read RD_DATA 0x10
         S_AXI_RREADY = 1'b1;
         @(negedge S_AXI_RVALID) S_AXI_RREADY = 1'b0;

         
         #(T*10) $finish;
         
                        
                       
//        S_AXI_WDATA = 32'h0x9876ABCD;
//        S_AXI_WSTRB = 4'b1111;
//        S_AXI_WVALID = 1'b1;
//        @(negedge S_AXI_WREADY)begin
//            S_AXI_BREADY = 1'b1;
//            S_AXI_WDATA = 32'h0;
//            S_AXI_WSTRB = 4'b0;
//            S_AXI_WVALID = 1'b0;            
//        end
//        @(negedge S_AXI_BVALID) S_AXI_BREADY = 1'b0;
//        // Test Read
//        S_AXI_RREADY = 1'b1;
//        @(negedge S_AXI_RVALID) S_AXI_RREADY = 1'b0;
    end     
    
    
    axi_isa #(     .C_S00_AXI_DATA_WIDTH(32),
                        .C_S00_AXI_ADDR_WIDTH(5)
    )axi_isa_inst(
    .clk_16m_i(clk) ,    // input  clk_in_50m
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
    //.isa_sd(isa_sd) ,            // inout [15:0] isa_sd
    .isa_rst_drv(isa_rst_drv) ,    // output  isa_rst_drv
    .isa_aen(isa_aen),             // output  isa_aen
    .isa_sd_in(isa_sd_in),
    .isa_sd_out(isa_sd_out),
    .isa_tri_en(isa_tri_en),
    .iocs16(iocs16),
    .irq5(irq5),    
    .s00_axi_aclk(S_AXI_ACLK),
    .s00_axi_aresetn(S_AXI_ARESETN),
    .s00_axi_awaddr(S_AXI_AWADDR),
    .s00_axi_awprot(S_AXI_AWPROT),//No logic??
    .s00_axi_awvalid(S_AXI_AWVALID),
    .s00_axi_awready(S_AXI_AWREADY),
    .s00_axi_wdata(S_AXI_WDATA), 
    .s00_axi_wstrb(S_AXI_WSTRB),
    .s00_axi_wvalid(S_AXI_WVALID),
    .s00_axi_wready(S_AXI_WREADY),
    .s00_axi_bresp(S_AXI_BRESP),
    .s00_axi_bvalid(S_AXI_BVALID),
    .s00_axi_bready(S_AXI_BREADY),
    .s00_axi_araddr(S_AXI_ARADDR),
    .s00_axi_arprot(S_AXI_ARPROT),//No logic?
    .s00_axi_arvalid(S_AXI_ARVALID),
    .s00_axi_arready(S_AXI_ARREADY),
    .s00_axi_rdata(S_AXI_RDATA),
    .s00_axi_rresp(S_AXI_RRESP),
    .s00_axi_rvalid(S_AXI_RVALID),
    .s00_axi_rready(S_AXI_RREADY)   
    );
endmodule
