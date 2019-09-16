`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/07 13:37:18
// Design Name: 
// Module Name: dualram_wrapper
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


module dualram_wrapper(clka,
                       ena,
                       wea,
                       addra,
                       dina,
                       douta,
                       clkb,
                       enb,
                       web,
                       addrb,
                       dinb,
                       doutb
    );
    
input  wire          clka;
input  wire          ena;
input  wire [ 0 : 0] wea;
input  wire [ 8 : 0] addra;
input  wire [15 : 0] dina;
output wire [15 : 0] douta;
input  wire          clkb;
input  wire          enb;
input  wire [ 0 : 0] web;
input  wire [ 8 : 0] addrb;
input  wire [15 : 0] dinb;
output wire [15 : 0] doutb;   
    
//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    blk_mem_gen_0 blk_mem_gen_0_inst (
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
    // INST_TAG_END ------ End INSTANTIATION Template ---------    
    
endmodule
