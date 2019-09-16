`timescale 1ns / 1ps

module ISA_Controller(
	clk,
	rst_n,
	isa_sa,
	isa_iow,
	isa_ior,
	isa_sd,
	iocs16,
	isa_rst_drv,
	isa_aen,
	master_rst_drv,
	master_isa_state,
	master_isa_sa_in,
	master_isa_sd_in,
	slave_isa_rd_data,
	isa_status
);
	
	input			clk;		//同步时钟输入
	input			rst_n;			//复位信号
	output	[15:0]	isa_sa;			//ISA地址信号
	output			isa_iow;		//ISA写入控制信号
	output			isa_ior;		//ISA读取控制信号
	inout	[15:0]	isa_sd;
	input           iocs16;
	output			isa_rst_drv;	//ISA复位信号
	output			isa_aen;		//预留

	//Signal to ZYNQ
	input			master_rst_drv;		//复位
	input	[3:0]	master_isa_state;	//ISA状态寄存器
	input	[15:0]	master_isa_sa_in;	//AXI-ISA地址寄存器
	input	[15:0]	master_isa_sd_in;	//AXI-ISA数据输入寄存器
	output	[15:0]	slave_isa_rd_data;	//ISA读取数据寄存器(传入AXI)
	output	[15:0]	isa_status;			//ISA状态寄存器
		
	assign	isa_status[3:0] = current_state;
	wire	bus_busy;
	assign	isa_status[4] = bus_busy;
	
	assign	isa_rst_drv = master_rst_drv; 
	assign	isa_aen = 1'b0;

	localparam IDLE 		= 4'b0000;
	localparam ISA_WRITE 	= 4'b0001;
	localparam ISA_READ 	= 4'b0010;
	
	reg	[3:0]	current_state;
	reg	[3:0]	next_state;

	always@(posedge clk or negedge rst_n) begin 
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
	assign	ISA_WRITEtoIDLE = (current_state==ISA_WRITE) && (master_isa_state==IDLE);	//读写完成后软件将状???切换回IDLE
	assign	ISA_READtoIDLE	= (current_state==ISA_READ)  && (master_isa_state==IDLE);	//读写完成后软件将状???切换回IDLE
	
	reg	[3:0]	isa_ctl_cnt;
	always@(posedge clk or negedge rst_n) begin 
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
	
	reg			dir_isa_sd1;
	reg			isa_iow;
	reg			isa_ior;
	reg	  [15:0]	isa_sa;
	reg	  [15:0]	isa_sd_out;
	reg	  [15:0]	slave_isa_rd_data;
	
	assign isa_sd = (dir_isa_sd1==0) ?  isa_sd_out : 16'bz;
	
	always@(posedge clk or negedge rst_n) begin 
		if(!rst_n) begin 
			dir_isa_sd1 <= 1'b1; 
			isa_sd_out <= 16'hffff;
			isa_iow <= 1'b1;
			isa_ior <= 1'b1; 
			isa_sa <= 16'hffff; 
			isa_wr_done <= 1'b0; 
			isa_rd_done <= 1'b0; 
			slave_isa_rd_data <= 16'h0000; end
		else if(current_state==IDLE) begin 
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
				4'd0 :  begin	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
				4'd1 :  begin	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end		
				4'd2 :  begin	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end
				4'd3 :  begin	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end
				4'd4 :  begin	dir_isa_sd1	<= 1'b0; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
				4'd5 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
				4'd6 :	begin 	isa_wr_done <= 1'b1; end
				default:begin 	isa_sd_out <= 16'hffff;
								isa_sa <= isa_sa;
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
				4'd0 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				4'd1 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end		
				4'd2 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
				4'd3 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
				4'd4 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; 
								slave_isa_rd_data <= isa_sd; 				 end	//Get Read Data
				4'd5 :  begin	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				4'd6 :	begin 	isa_rd_done <= 1'b1; end
				default:begin 	isa_sd_out <= 16'hffff;
								isa_sa <= isa_sa;
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
			dir_isa_sd1 <= 1'b1; 
			isa_sd_out <= 16'hffff;
			isa_iow <= 1'b1;
			isa_ior <= 1'b1; 
			isa_sa <= 16'hffff;
			isa_wr_done <= 1'b0; 
			isa_rd_done <= 1'b0; 
			slave_isa_rd_data <= slave_isa_rd_data; end
	end
	
endmodule
