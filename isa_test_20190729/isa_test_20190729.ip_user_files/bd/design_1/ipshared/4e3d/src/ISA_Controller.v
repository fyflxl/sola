`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/29 15:11:33
// Design Name: 
// Module Name: ISA_Controller
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


module ISA_Controller(
	clk_in_16m,
	rst_n,
	oe_isa_sd1,
	oe_isa_sd2,
	oe_isa_sa1,
	oe_isa_sa2,
	oe_isa_in,
	oe_isa_out,
	dir_isa_sd1,
	dir_isa_sd2,
	dir_isa_sa1,
	dir_isa_sa2,
	dir_isa_in,
	dir_isa_out,
	isa_sa,
	isa_iow,
	isa_ior,
	isa_sd,
	isa_rst_drv,
	isa_aen,
	master_rst_drv,
	master_isa_state,
	master_isa_sa_in,
	master_isa_sd_in,
	slave_isa_rd_data,
	isa_status,
	iocs16,
    sbhe,
    irq5
//	isa_sd_in,
//	isa_sd_out,
//	isa_tri_en
);
	
	input			clk_in_16m;
	input			rst_n;
	output			oe_isa_sd1;
	output			oe_isa_sd2;		//
	output			oe_isa_sa1;		//
	output			oe_isa_sa2;		//
	output			oe_isa_in;		//
	output			oe_isa_out;		//
	output			dir_isa_sd1;
	output			dir_isa_sd2;	//
	output			dir_isa_sa1;	//
	output			dir_isa_sa2;	//
	output			dir_isa_in;		//
	output			dir_isa_out;	//
	output	[15:0]	isa_sa;
	output			isa_iow;
	output			isa_ior;
	inout	[15:0]	isa_sd;
	output			isa_rst_drv;	//
	output			isa_aen;		//

	//Signal to NiosII
	input			master_rst_drv;		//
	input	[3:0]	master_isa_state;
	input	[15:0]	master_isa_sa_in;
	input	[15:0]	master_isa_sd_in;
	output	[15:0]	slave_isa_rd_data;
	output	[15:0]	isa_status;
	
    input   iocs16;
    input   sbhe;
    input   irq5;	
	
	
	assign	isa_status[3:0] = current_state;
	wire	bus_busy;
	assign	isa_status[4] = bus_busy;
	
	assign	isa_rst_drv = master_rst_drv; //????
	assign	isa_aen = 1'b1;//???
	
	assign	oe_isa_sa1 = 1'b0;
    assign  oe_isa_sa2 = 1'b0;
	assign	oe_isa_in = 1'b0;
	assign	oe_isa_out = 1'b0;	
	
	assign	dir_isa_in = 1'b1;
	assign	dir_isa_out = 1'b0;
	assign	dir_isa_sa1 = 1'b0;
    assign  dir_isa_sa2 = 1'b0;	
	
	assign	oe_isa_sd2 = oe_isa_sd1;
	assign	dir_isa_sd2 = dir_isa_sd1;	

	localparam IDLE 		= 4'b0000;
	localparam ISA_WRITE 	= 4'b0001;
	localparam ISA_READ 	= 4'b0010;
	
	reg	[3:0]	current_state;
	reg	[3:0]	next_state;

	always@(posedge clk_in_16m or negedge rst_n) begin 
		if(!rst_n) 
			current_state <= IDLE;
		else 
			current_state <= next_state;
	end

	wire 	IDLEtoISA_WRITE;
	wire 	IDLEtoISA_READ;
	wire	ISA_WRITEtoIDLE;
	wire	ISA_READtoIDLE;

	always@(*) begin 
		case(current_state)
			IDLE 		: begin	if(IDLEtoISA_WRITE) 	next_state = ISA_WRITE; 
								else if(IDLEtoISA_READ)	next_state = ISA_READ;
								else 					next_state = current_state; end 
			ISA_WRITE	: begin if(ISA_WRITEtoIDLE) 	next_state = IDLE; 
								else 					next_state = current_state; end 
			ISA_READ	: begin if(ISA_READtoIDLE) 		next_state = IDLE; 
								else 					next_state = current_state; end 				
			default		: begin next_state = current_state;							end
		endcase
	end

	reg			isa_wr_done;
	reg			isa_rd_done;
	
	assign	IDLEtoISA_WRITE = (current_state==IDLE) && (master_isa_state==ISA_WRITE);
	assign	IDLEtoISA_READ  = (current_state==IDLE) && (master_isa_state==ISA_READ);
	assign	ISA_WRITEtoIDLE = (current_state==ISA_WRITE) && (master_isa_state==IDLE);	//读写完成后软件将状�?�切换回IDLE
	assign	ISA_READtoIDLE	= (current_state==ISA_READ)  && (master_isa_state==IDLE);	//读写完成后软件将状�?�切换回IDLE
	
	reg	[3:0]	isa_ctl_cnt;
	always@(posedge clk_in_16m or negedge rst_n) begin 
		if(!rst_n)
			isa_ctl_cnt <= 1'b0;
		else if(current_state==IDLE)
			isa_ctl_cnt <= 1'b0;			
		else if(isa_wr_done|isa_rd_done)	
			isa_ctl_cnt <= isa_ctl_cnt;
		else if(isa_ctl_cnt>4'd6)
			isa_ctl_cnt <= isa_ctl_cnt;
		else if(((current_state == ISA_WRITE) || (current_state == ISA_READ))  &&  (!(isa_wr_done|isa_rd_done)))
			isa_ctl_cnt <= isa_ctl_cnt + 1'b1;
		else 
			isa_ctl_cnt <= isa_ctl_cnt;
	end
	    
	assign	bus_busy = ((current_state == ISA_WRITE) || (current_state == ISA_READ))  &&  (isa_ctl_cnt<6);
	
	reg			oe_isa_sd1;
	reg			dir_isa_sd1;
	reg			isa_iow;
	reg			isa_ior;
	reg	[15:0]	isa_sa;
	wire [15:0] isa_sd_in;
	reg	[15:0]	isa_sd_out;	
	reg	[15:0]	slave_isa_rd_data;
	
	always@(posedge clk_in_16m or negedge rst_n) begin 
		if(!rst_n) begin 
			oe_isa_sd1 <= 1'b1;
			dir_isa_sd1 <= 1'b1; 
			isa_sd_out <= 16'hffff;
			isa_iow <= 1'b1;
			isa_ior <= 1'b1; 
			isa_sa <= 16'hffff; 
			isa_wr_done <= 1'b0; 
			isa_rd_done <= 1'b0; 
			slave_isa_rd_data <= 16'h0000; end
		else if(current_state==IDLE) begin 
			oe_isa_sd1 <= 1'b1;
			dir_isa_sd1 <= 1'b1; 
			isa_sd_out <= 16'hffff;
			isa_iow <= 1'b1;
			isa_ior <= 1'b1; 
			isa_sa <= 16'hffff;
			isa_wr_done <= 1'b0; 
			isa_rd_done <= 1'b0; 
			slave_isa_rd_data <= slave_isa_rd_data; end	
		else if(current_state==ISA_WRITE) begin 
			case(isa_ctl_cnt)
				4'd0 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
				4'd1 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end		
				4'd2 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end
				4'd3 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end
				4'd4 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
				4'd5 :  begin	oe_isa_sd1 <= 1'b1;	dir_isa_sd1	<= 1'b1; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
				4'd6 :	begin 	isa_wr_done <= 1'b1; end
				default:begin 	isa_sd_out <= 16'hffff;
								isa_sa <= 16'hffff;
								oe_isa_sd1 <= 1'b1;
								dir_isa_sd1 <= 1'b1; 
								isa_iow <= 1'b1;
								isa_ior <= 1'b1;
								isa_wr_done <= 1'b0;  
								isa_rd_done <= 1'b0;
								slave_isa_rd_data <= slave_isa_rd_data; 	
								end
			endcase
			end
		else if(current_state==ISA_READ) begin 
			case(isa_ctl_cnt)
				4'd0 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				4'd1 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end		
				4'd2 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
				4'd3 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
				4'd4 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1;
								slave_isa_rd_data <= isa_sd_in; 
//								isa_sd_in <= isa_sd; 				 
								end	//Get Read Data
				4'd5 :  begin	oe_isa_sd1 <= 1'b1;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				4'd6 :	begin 	isa_rd_done <= 1'b1; end
				default:begin 	isa_sd_out <= 16'hffff;
								isa_sa <= isa_sa;
								oe_isa_sd1 <= 1'b1;
								dir_isa_sd1 <= 1'b1; 
								isa_iow <= 1'b1;
								isa_ior <= 1'b1;
								isa_wr_done <= 1'b0; 
								isa_rd_done <= 1'b0; 
								slave_isa_rd_data <= slave_isa_rd_data;
								end	
			endcase
			end
		else begin 
			oe_isa_sd1 <= 1'b1;
			dir_isa_sd1 <= 1'b1; 
			isa_sd_out <= 16'hffff;
			isa_iow <= 1'b1;
			isa_ior <= 1'b1; 
			isa_sa <= 16'hffff;
			isa_wr_done <= 1'b0; 
			isa_rd_done <= 1'b0; 
			slave_isa_rd_data <= slave_isa_rd_data; end
	end
   
	iobuf_16
	io_buf_16_inst(
    	.io_data(isa_sd),
    	.data_in(isa_sd_in),
    	.data_out(isa_sd_out),
    	.t(dir_isa_sd1)
	);
   

endmodule


