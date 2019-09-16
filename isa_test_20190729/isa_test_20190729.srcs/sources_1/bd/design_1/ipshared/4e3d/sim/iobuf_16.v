`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/29 21:16:34
// Design Name: 
// Module Name: iobuf_16
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


module iobuf_16(
    io_data,
    data_in,
    data_out,
    t
);

    output   [15:0]  data_in;
    input  [15:0]  data_out;
    input           t;          //tri_en
    inout   [15:0]  io_data;


    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data0 (
        .O(data_in[0]), // Buffer output
        .IO(io_data[0]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[0]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data1 (
        .O(data_in[1]), // Buffer output
        .IO(io_data[1]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[1]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data2 (
        .O(data_in[2]), // Buffer output
        .IO(io_data[2]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[2]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data3 (
        .O(data_in[3]), // Buffer output
        .IO(io_data[3]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[3]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data4 (
        .O(data_in[4]), // Buffer output
        .IO(io_data[4]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[4]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data5 (
        .O(data_in[5]), // Buffer output
        .IO(io_data[5]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[5]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data6 (
        .O(data_in[6]), // Buffer output
        .IO(io_data[6]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[6]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data7 (
        .O(data_in[7]), // Buffer output
        .IO(io_data[7]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[7]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data8 (
        .O(data_in[8]), // Buffer output
        .IO(io_data[8]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[8]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data9 (
        .O(data_in[9]), // Buffer output
        .IO(io_data[9]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[9]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data10 (
        .O(data_in[10]), // Buffer output
        .IO(io_data[10]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[10]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data11 (
        .O(data_in[11]), // Buffer output
        .IO(io_data[11]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[11]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data12 (
        .O(data_in[12]), // Buffer output
        .IO(io_data[12]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[12]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data13 (
        .O(data_in[13]), // Buffer output
        .IO(io_data[13]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[13]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data14 (
        .O(data_in[14]), // Buffer output
        .IO(io_data[14]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[14]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

    IOBUF #(
        .DRIVE(12), // Specify the output drive strength
        .IBUF_LOW_PWR("TRUE"), // Low Power - "TRUE", High Performance = "FALSE"
        .IOSTANDARD("DEFAULT"), // Specify the I/O standard
        .SLEW("SLOW") // Specify the output slew rate
    ) 
    IOBUF_inst_data15 (
        .O(data_in[15]), // Buffer output
        .IO(io_data[15]), // Buffer inout port (connect directly to top-level port)
        .I(data_out[15]), // Buffer input
        .T(t) // 3-state enable input, high=input, low=output
    );

endmodule
