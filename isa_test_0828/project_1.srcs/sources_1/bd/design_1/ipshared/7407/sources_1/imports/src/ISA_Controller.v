`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/02 21:21:49
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
	//isa_sd,
	isa_rst_drv,
	isa_aen,
	master_rst_drv,
	master_isa_state,
	master_isa_sa_in,
	master_isa_sd_in,
	slave_isa_rd_data,
	isa_sd_in,
	isa_sd_out,
	isa_tri_en,
	iocs16,
	irq5,
	irq,
	ap_start,
	ap_idle,
	ap_done,
	ap_timeout
);
	
	input			clk_in_16m;		//16Mͬ��ʱ������
	input			rst_n;			//��λ�ź�
	output			oe_isa_sd1;		//74LVC4245����ʹ��
	output			oe_isa_sd2;		//74LVC4245����ʹ��
	output			oe_isa_sa1;		//74LVC4245����ʹ��
	output			oe_isa_sa2;		//74LVC4245����ʹ��
	output			oe_isa_in;		//74LVC4245����ʹ��
	output			oe_isa_out;		//74LVC4245����ʹ��
	output			dir_isa_sd1;	//74LVC4245�������
	output			dir_isa_sd2;	//74LVC4245�������
	output			dir_isa_sa1;	//74LVC4245�������
	output			dir_isa_sa2;	//74LVC4245�������
	output			dir_isa_in;		//74LVC4245�������
	output			dir_isa_out;	//74LVC4245�������
	output	[15:0]	isa_sa;			//ISA��ַ�ź�
	output			isa_iow;		//ISAд������ź�
	output			isa_ior;		//ISA��ȡ�����ź�
	//inout	[15:0]	isa_sd;
	output			isa_rst_drv;	//ISA��λ�ź�
	output			isa_aen;		//Ԥ��

	//Signal to ZYNQ
	input			master_rst_drv;		//��λ
	input	[3:0]	master_isa_state;	//ISA״̬�Ĵ���
	input	[15:0]	master_isa_sa_in;	//AXI-ISA��ַ�Ĵ���
	input	[15:0]	master_isa_sd_in;	//AXI-ISA��������Ĵ���
	output	[15:0]	slave_isa_rd_data;	//ISA��ȡ���ݼĴ���(����AXI)
	
	//io_isa_sd
	input    [15:0]    isa_sd_in;
	output   [15:0]    isa_sd_out;
	output             isa_tri_en;
	input              iocs16;
	input              irq5;
	output             irq;
	
	input              ap_start;
	output             ap_idle;
	output             ap_done;
	output             ap_timeout;	
	
	assign irq = irq5;
//��λ�źţ�Niosֱ???
	assign	isa_rst_drv = master_rst_drv; 

//ISA AEN,8C����ʹ��
	assign	isa_aen = 1'b0;
	
//74LVC4245ʹ���뷽���??
	//ISA��ַ�ߣ�����ʼ��ʹ�ܣ���??��ֻ��FPGA�����ISA
	assign	oe_isa_sa1 = 1'b0;
	assign	oe_isa_sa2 = oe_isa_sa1;
	assign	dir_isa_sa1 = 1'b0;
	assign	dir_isa_sa2 = dir_isa_sa1;
	
	//ISA�����࣬�ź���ISA������FPGA
	assign	oe_isa_in = 1'b0;
	assign	dir_isa_in = 1'b1;
	
	//ISA���??
	assign	oe_isa_out = 1'b0;	
	assign	dir_isa_out = 1'b0;
	
	//ISA����
	assign	oe_isa_sd2 = oe_isa_sd1;
	assign	dir_isa_sd2 = dir_isa_sd1;	

//״???��
	//����״???��
	localparam IDLE 		= 4'b0000;
	localparam ISA_WRITE 	= 4'b0001;
	localparam ISA_READ 	= 4'b0010;
	
	//FSM1-��???���???
	reg	[3:0]	current_state = IDLE;
	reg	[3:0]	next_state;

	always@(posedge clk_in_16m or negedge rst_n) begin 
		if(!rst_n) 
			current_state <= IDLE;
		else 
			current_state <= next_state;
	end

	//FSM2 ״???ת����??
	wire 	IDLEtoISA_WRITE;
	wire 	IDLEtoISA_READ;
	wire	ISA_WRITEtoIDLE;
	wire	ISA_READtoIDLE;

	always@(*) begin 
		case(current_state)
			IDLE 		: begin	if(ap_start && IDLEtoISA_WRITE) 	next_state = ISA_WRITE; 
								else if(ap_start && IDLEtoISA_READ)	next_state = ISA_READ;
								else 					next_state = current_state; end 
			ISA_WRITE	: begin if(isa_wr_done || isa_timeout) 	next_state = IDLE; 
								else 					next_state = current_state; end 
			ISA_READ	: begin if(isa_rd_done || isa_timeout)     next_state = IDLE; 
								else 					next_state = current_state; end 				
			default		: begin next_state = current_state;							end
		endcase
	end

	reg			isa_wr_done;
	reg			isa_rd_done;
	reg        isa_timeout;
	
	assign	IDLEtoISA_WRITE = (current_state==IDLE) && (master_isa_state==ISA_WRITE);
	assign	IDLEtoISA_READ  = (current_state==IDLE) && (master_isa_state==ISA_READ);
	assign	ISA_WRITEtoIDLE = (current_state==ISA_WRITE) && (master_isa_state==IDLE);	//��д��ɺ������״???�л���IDLE
	assign	ISA_READtoIDLE	= (current_state==ISA_READ)  && (master_isa_state==IDLE);	//��д��ɺ������״???�л���IDLE
	
    reg [5:0] isa_timeout_cnt;
	always@(posedge clk_in_16m or negedge rst_n) begin 
        if(!rst_n) begin
            isa_timeout_cnt <= 1'b0;
            isa_timeout <= 1'b0;
        end           
        else if((current_state == ISA_WRITE)||(current_state == ISA_READ))  begin
            isa_timeout_cnt <= isa_timeout_cnt + 1'b1;
            if(isa_timeout_cnt == 6'd63) 
                isa_timeout <= 1'b1;
            else
                isa_timeout <= 1'b0;                             
        end
        else begin
            isa_timeout_cnt <= 1'b0;
            isa_timeout <= 1'b0;
        end
    end
    
    assign ap_timeout = isa_timeout;    
	
	//FSM3
	//״???���Counter(��״̬��)
	reg	[3:0]	isa_ctl_cnt;
	always@(posedge clk_in_16m or negedge rst_n) begin 
		if(!rst_n)
			isa_ctl_cnt <= 1'b0;
		else if(current_state==IDLE)
			isa_ctl_cnt <= 1'b0;			
		else if((current_state == ISA_WRITE)||(current_state == ISA_READ))	begin
			case(isa_ctl_cnt)
			4'd0: begin if(iocs16==1'b0) 
			      isa_ctl_cnt <= 4'd1; end
			4'd1, 4'd2, 4'd3, 4'd4: begin 
			      isa_ctl_cnt <= isa_ctl_cnt + 1'b1; end
			4'd5: begin if(iocs16==1'b1) 
                        isa_ctl_cnt <= 4'd6; end			      
			default: begin isa_ctl_cnt <= isa_ctl_cnt; end
			endcase
	    end
		else 
			isa_ctl_cnt <= isa_ctl_cnt;
	end
	
	assign ap_done = isa_wr_done | isa_rd_done;
	assign ap_idle = (current_state == IDLE);
	
	reg			oe_isa_sd1;
	reg			dir_isa_sd1;
	reg			isa_iow;
	reg			isa_ior;
	reg	[15:0]	isa_sa;
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
		else if(current_state==ISA_WRITE) begin 
                case(isa_ctl_cnt)
                4'd0 :  begin    oe_isa_sd1 <= 1'b0;    dir_isa_sd1    <= 1'b0; 
                                isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
                4'd1, 4'd2, 4'd3:  
                        begin    oe_isa_sd1 <= 1'b0;    dir_isa_sd1    <= 1'b0; 
                                isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end        
                4'd4 :  begin    oe_isa_sd1 <= 1'b0;    dir_isa_sd1    <= 1'b0; 
                                isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
                4'd5 :  begin    oe_isa_sd1 <= 1'b1;    dir_isa_sd1    <= 1'b1; 
                                isa_sd_out <= master_isa_sd_in; isa_sa <= 16'hffff; isa_iow <= 1'b1; end
                4'd6 :    begin     isa_wr_done <= 1'b1; end
                default:begin     isa_sd_out <= 16'hffff;
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
		else if(current_state==ISA_READ) begin 
			case(isa_ctl_cnt)
				4'd0 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				4'd1, 4'd2, 4'd3:  
				        begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end		
				4'd4 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; 
								slave_isa_rd_data <= isa_sd_in; 				 end	//Get Read Data
				4'd5 :  begin	oe_isa_sd1 <= 1'b1;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= 16'hffff; isa_ior <= 1'b1; end
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
	    
    wire    isa_tri_en;
    assign  isa_tri_en = ~((!oe_isa_sd1) && (!dir_isa_sd1)); //high = tri/input , low = output

endmodule
