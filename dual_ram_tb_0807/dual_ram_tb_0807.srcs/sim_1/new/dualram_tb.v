`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/07 13:42:50
// Design Name: 
// Module Name: dualram_tb
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


///////////////////////TEST_2 Dual_ram write and read(single port Write, single port Read) 20190808 START
//module dualram_tb(

//    );
    
//    localparam Pa = 10;//hafl period 10ns;
//    localparam Ta = Pa*2;//one clock period 20ns;
//    localparam Pb = Pa*3.125;//hafl period 10ns;
//    localparam Tb = Pb*2;//one clock period 20ns;    
    
//    reg           clka;
//    reg           ena;
//    reg           wea;
//    reg  [ 8 : 0] addra;
//    reg  [15 : 0] dina;
//    wire [15 : 0] douta;
//    reg           clkb;
//    reg           enb;
//    reg  [ 0 : 0] web;
//    reg  [ 8 : 0] addrb;
//    reg  [15 : 0] dinb;
//    wire [15 : 0] doutb;
    
    
//    initial begin
//        clka = 1'b0;
//    end
//    always #Pa clka = ~clka;    
    
//    initial begin
//        clkb = 1'b0;
//    end
//    always #Pb clkb = ~clkb;       

    
//    reg tb_start;
    
//    initial begin//initial
//        tb_start = 1'b0;//For tb_start signal
//        ena = 1'b0;
//        wea = 1'b0;
//        addra =  9'd0;
//        dina  = 16'd0;
//        enb = 1'b0;
//        web = 1'b0;
//        addrb =  9'd0;
//        dinb  = 16'd0;
//        #(Ta*10) wea = 1'b1;        
//                 tb_start = 1'b1;
//                 ena = 1'b1;       
//        #(Ta*512) wea = 1'b0;
//                  ena = 1'b0;
//                  enb = 1'b1;
////        $display("Begin Read From Port B");                  
//        #(Tb*513) $finish;
//    end
    
//    always@(posedge clkb) begin
//        if(!tb_start) begin
//            addrb <= 9'd0;
// //           dinb  <= 16'd10;
//        end
//        else if(enb) begin
//            addrb <= addrb +  9'd1;
// //           dinb  <= dinb  + 16'd1;
//        end
//    end    
    
//    always@(posedge clka) begin
//        if(!tb_start) begin
//            addra <= 9'd0;
//            dina  <= 16'd10;
//        end
//        else if(ena) begin
//            addra <= addra +  9'd1;
//            dina  <= dina  + 16'd1;
//        end
//    end
    
//    dualram_wrapper dualram_wrapper_inst (
//      .clka(clka),    // input wire clka
//      .ena(ena),      // input wire ena
//      .wea(wea),      // input wire [0 : 0] wea
//      .addra(addra),  // input wire [8 : 0] addra
//      .dina(dina),    // input wire [15 : 0] dina
//      .douta(douta),  // output wire [15 : 0] douta
//      .clkb(clkb),    // input wire clkb
//      .enb(enb),      // input wire enb
//      .web(web),      // input wire [0 : 0] web
//      .addrb(addrb),  // input wire [8 : 0] addrb
//      .dinb(dinb),    // input wire [15 : 0] dinb
//      .doutb(doutb)  // output wire [15 : 0] doutb
//    );     
    
//endmodule
///////////////////////TEST_2 Dual_ram write and read(single port Write, single port Read) 20190808 END

/////////////////////TEST_1 Dual_ram write and read(single port) 20190807 START
module dualram_tb(

    );
    
    localparam P = 10;//hafl period 10ns;
    localparam T = P*2;//one clock period 20ns;
    
    reg           clka;
    reg           ena;
    reg           wea;
    reg  [ 8 : 0] addra;
    reg  [15 : 0] dina;
    wire [15 : 0] douta;
    wire          clkb;//For other reg clk 
    reg           enb;
    reg  [ 0 : 0] web;
    reg  [ 8 : 0] addrb;
    reg  [15 : 0] dinb;
    wire [15 : 0] doutb;
    
    
    initial begin
        clka = 1'b0;
    end
    always #P clka = ~clka;    
    assign clkb = clka;
    
    reg tb_start;
    
    initial begin//initial
        tb_start = 1'b0;//For tb_start signal
        ena = 1'b0;
        wea = 1'b0;
        addra =  9'd0;
        dina  = 16'd0;
        enb = 1'b0;
        web = 1'b0;
        addrb =  9'd0;
        dinb  = 16'd0;
        #(T*10) wea = 1'b1;        
        tb_start = 1'b1;
        ena = 1'b1;       
        #(T*512) wea = 1'b0;
        #(T*513) $finish;
    end
    
    always@(posedge clka) begin
        if(!tb_start) begin
            addra <= 9'd0;
            dina  <= 16'd10;
        end
        else begin
            addra <= addra +  9'd1;
            dina  <= dina  + 16'd1;
        end
    end
    
    dualram_wrapper dualram_wrapper_inst (
      .clka(clka),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [8 : 0] addra
      .dina(dina),    // input wire [15 : 0] dina
      .douta(douta),  // output wire [15 : 0] douta
      .clkb(clkb),    // input wire clkb
      .enb(enb),      // input wire enb
      .web(web),      // input wire [0 : 0] web
      .addrb(addrb),  // input wire [8 : 0] addrb
      .dinb(dinb),    // input wire [15 : 0] dinb
      .doutb(doutb)  // output wire [15 : 0] doutb
    );     
    
endmodule
/////////////////////TEST_1 Dual_ram write and read(single port) 20190807 END