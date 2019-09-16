`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/28 20:05:32
// Design Name: 
// Module Name: cross_clock_domain_resetn
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


module cross_clock_domain_resetn(
    input clk_axi,
    input clk_isa,
    input rstn,
    input ap_rst,
    output isa_rst_n
    );
    
    reg D0,D1,D2;
    
    reg [4:0] cnt;
    reg state;
    localparam IDLE    = 1'b0;
    localparam RST     = 1'b1;
    
    always@(posedge clk_axi or negedge rstn) begin
        if(!rstn) begin
            state <= RST;
            cnt <= 0;
        end
        else if(ap_rst) begin
            state <= RST;
            cnt <= 0;            
        end 
        else if(state == RST) begin
            cnt <= cnt + 1'b1;
            if(cnt == 5'd8)
               state <= IDLE;      
        end 
        else begin
            cnt <= 0;
            state <= IDLE;
        end
    end
    
    always@(posedge clk_axi) begin
        if(state == IDLE)
            D0 <= 1'b1;
        else
            D0 <= 1'b0;
    end
    
    always@(posedge clk_isa) begin
        D1 <= D0;
        D2 <= D1; 
    end 
    
    assign isa_rst_n = D2;
  
endmodule
