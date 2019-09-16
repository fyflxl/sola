//外域上升沿->下降沿使能模块
module Edge2EN #( parameter SYNC_STG = 1 )(
    input wire clk, in,
    output logic rising, falling, out
);

    logic [SYNC_STG:0] dly;
    always_ff@(posedge clk) begin  
        dly <= { dly[ SYNC_STG - 1 : 0] , in}; end

    assign rising = (SYNC_STG? dly[SYNC_STG-:2] : {dly,in} ) == 2'b01;      
    assign falling = (SYNC_STG? dly[SYNC_STG-:2] : {dly,in} ) == 2'b10;
    assign out = dly[SYNC_STG];

endmodule
