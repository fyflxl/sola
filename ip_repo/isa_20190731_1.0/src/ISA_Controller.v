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
	isa_status,
	isa_sd_in,
	isa_sd_out,
	isa_tri_en,
	iocs16,
	irq5
);
	
	input			clk_in_16m;		//16MÍ¬²½Ê±ÖÓÊäÈë
	input			rst_n;			//¸´Î»ĞÅºÅ
	output			oe_isa_sd1;		//74LVC4245Æ÷¼şÊ¹ÄÜ
	output			oe_isa_sd2;		//74LVC4245Æ÷¼şÊ¹ÄÜ
	output			oe_isa_sa1;		//74LVC4245Æ÷¼şÊ¹ÄÜ
	output			oe_isa_sa2;		//74LVC4245Æ÷¼şÊ¹ÄÜ
	output			oe_isa_in;		//74LVC4245Æ÷¼şÊ¹ÄÜ
	output			oe_isa_out;		//74LVC4245Æ÷¼şÊ¹ÄÜ
	output			dir_isa_sd1;	//74LVC4245·½Ïò¿ØÖÆ
	output			dir_isa_sd2;	//74LVC4245·½Ïò¿ØÖÆ
	output			dir_isa_sa1;	//74LVC4245·½Ïò¿ØÖÆ
	output			dir_isa_sa2;	//74LVC4245·½Ïò¿ØÖÆ
	output			dir_isa_in;		//74LVC4245·½Ïò¿ØÖÆ
	output			dir_isa_out;	//74LVC4245·½Ïò¿ØÖÆ
	output	[15:0]	isa_sa;			//ISAµØÖ·ĞÅºÅ
	output			isa_iow;		//ISAĞ´Èë¿ØÖÆĞÅºÅ
	output			isa_ior;		//ISA¶ÁÈ¡¿ØÖÆĞÅºÅ
	//inout	[15:0]	isa_sd;
	output			isa_rst_drv;	//ISA¸´Î»ĞÅºÅ
	output			isa_aen;		//Ô¤Áô
	input           iocs16;
	input           irq5;

	//Signal to ZYNQ
	input			master_rst_drv;		//¸´Î»
	input	[3:0]	master_isa_state;	//ISA×´Ì¬¼Ä´æÆ÷
	input	[15:0]	master_isa_sa_in;	//AXI-ISAµØÖ·¼Ä´æÆ÷
	input	[15:0]	master_isa_sd_in;	//AXI-ISAÊı¾İÊäÈë¼Ä´æÆ÷
	output	[15:0]	slave_isa_rd_data;	//ISA¶ÁÈ¡Êı¾İ¼Ä´æÆ÷(´«ÈëAXI)
	output	[15:0]	isa_status;			//ISA×´Ì¬¼Ä´æÆ÷
	
	//io_isa_sd
	input    [15:0]    isa_sd_in;
	output   [15:0]    isa_sd_out;
	output             isa_tri_en;
	
	
	assign	isa_status[3:0] = current_state;
	wire	bus_busy;
	assign	isa_status[4] = bus_busy;
	
//¸´Î»ĞÅºÅ£¬NiosÖ±???
	assign	isa_rst_drv = master_rst_drv; 

//ISA AEN,8CÒëÂëÊ¹ÓÃ
	assign	isa_aen = 1'b0;
	
//74LVC4245Ê¹ÄÜÓë·½Ïò¿Ø??
	//ISAµØÖ·Ïß£¬Æ÷¼şÊ¼ÖÕÊ¹ÄÜ£¬µØ??ÏßÖ»ÓÉFPGAÊä³öÖÁISA
	assign	oe_isa_sa1 = 1'b0;
	assign	oe_isa_sa2 = oe_isa_sa1;
	assign	dir_isa_sa1 = 1'b0;
	assign	dir_isa_sa2 = dir_isa_sa1;
	
	//ISAÊäÈëÀà£¬ĞÅºÅÓÉISAÊäÈëÖÁFPGA
	assign	oe_isa_in = 1'b0;
	assign	dir_isa_in = 1'b1;
	
	//ISAÊä³ö??
	assign	oe_isa_out = 1'b0;	
	assign	dir_isa_out = 1'b0;
	
	//ISAÊı¾İ
	assign	oe_isa_sd2 = oe_isa_sd1;
	assign	dir_isa_sd2 = dir_isa_sd1;	

//×´???»ú
	//¶¨Òå×´???Ãû
	localparam IDLE 		= 4'b0000;
	localparam ISA_WRITE 	= 4'b0001;
	localparam ISA_READ 	= 4'b0010;
	
	//FSM1-ÏÖ???Óë´Î???
	reg	[3:0]	current_state;
	reg	[3:0]	next_state;

	always@(posedge clk_in_16m or negedge rst_n) begin 
		if(!rst_n) 
			current_state <= IDLE;
		else 
			current_state <= next_state;
	end

	//FSM2 ×´???×ªÒÆÌõ??
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
	assign	ISA_WRITEtoIDLE = (current_state==ISA_WRITE) && (master_isa_state==IDLE);	//¶ÁĞ´Íê³ÉºóÈí¼ş½«×´???ÇĞ»»»ØIDLE
	assign	ISA_READtoIDLE	= (current_state==ISA_READ)  && (master_isa_state==IDLE);	//¶ÁĞ´Íê³ÉºóÈí¼ş½«×´???ÇĞ»»»ØIDLE
	
	parameter nothing   = 4'b0000;
	parameter dataready = 4'b0001;
	parameter readready = 4'b0010;
	parameter readout   = 4'b0011;
	parameter dataout   = 4'b0100;
	parameter waitend   = 4'b0101;
	parameter down      = 4'b0110;
	
	//FSM
	//×´???Êä³öCounter(×Ó×´Ì¬»ú)
	reg	[3:0]	isa_ctl_cnt;
	always@(posedge clk_in_16m or negedge rst_n) begin
	  if(!iocs16)
	  begin 
		if(!rst_n)
			isa_ctl_cnt <= 1'b0;
		else if(current_state==IDLE)
			isa_ctl_cnt <= isa_ctl_cnt;			
		else if(isa_wr_done|isa_rd_done)	
			isa_ctl_cnt <= isa_ctl_cnt;
		else if(isa_ctl_cnt>4'd6)
			isa_ctl_cnt <= isa_ctl_cnt;
		else if(((current_state == ISA_WRITE) || (current_state == ISA_READ))  &&  (!(isa_wr_done|isa_rd_done)))
			isa_ctl_cnt <= isa_ctl_cnt + 1'b1;
		else 
			isa_ctl_cnt <= isa_ctl_cnt;
	  end
	  else
	  isa_ctl_cnt <= 1'b0;
	end
	  
	assign	bus_busy = ((current_state == ISA_WRITE) || (current_state == ISA_READ))  &&  (isa_ctl_cnt<6);
	
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
				nothing :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				dataready :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end		
				readready :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
				readout :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
				dataout  :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; 
								slave_isa_rd_data <= isa_sd_in; 				 end	//Get Read Data
				waitend :  begin	oe_isa_sd1 <= 1'b1;	dir_isa_sd1	<= 1'b1; 
								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
				down :	begin 	isa_rd_done <= 1'b1; isa_sa <= 16'hffff;end
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


//module ISA_Controller(
//	clk_in_16m,
//	rst_n,
//	oe_isa_sd1,
//	oe_isa_sd2,
//	oe_isa_sa1,
//	oe_isa_sa2,
//	oe_isa_in,
//	oe_isa_out,
//	dir_isa_sd1,
//	dir_isa_sd2,
//	dir_isa_sa1,
//	dir_isa_sa2,
//	dir_isa_in,
//	dir_isa_out,
//	isa_sa,
//	isa_iow,
//	isa_ior,
//	//isa_sd,
//	isa_rst_drv,
//	isa_aen,
//	master_rst_drv,
//	master_isa_state,
//	master_isa_sa_in,
//	master_isa_sd_in,
//	slave_isa_rd_data,
//	isa_status,
//	isa_sd_in,
//	isa_sd_out,
//	isa_tri_en,
//	iocs16,
//	irq5
//);
	
//	input			clk_in_16m;		//16MåŒæ­¥æ—¶é’Ÿè¾“å…¥
//	input			rst_n;			//å¤ä½ä¿¡å·
//	output			oe_isa_sd1;		//74LVC4245å™¨ä»¶ä½¿èƒ½
//	output			oe_isa_sd2;		//74LVC4245å™¨ä»¶ä½¿èƒ½
//	output			oe_isa_sa1;		//74LVC4245å™¨ä»¶ä½¿èƒ½
//	output			oe_isa_sa2;		//74LVC4245å™¨ä»¶ä½¿èƒ½
//	output			oe_isa_in;		//74LVC4245å™¨ä»¶ä½¿èƒ½
//	output			oe_isa_out;		//74LVC4245å™¨ä»¶ä½¿èƒ½
//	output			dir_isa_sd1;	//74LVC4245æ–¹å‘æ§åˆ¶
//	output			dir_isa_sd2;	//74LVC4245æ–¹å‘æ§åˆ¶
//	output			dir_isa_sa1;	//74LVC4245æ–¹å‘æ§åˆ¶
//	output			dir_isa_sa2;	//74LVC4245æ–¹å‘æ§åˆ¶
//	output			dir_isa_in;		//74LVC4245æ–¹å‘æ§åˆ¶
//	output			dir_isa_out;	//74LVC4245æ–¹å‘æ§åˆ¶
//	output	[15:0]	isa_sa;			//ISAåœ°å€ä¿¡å·
//	output			isa_iow;		//ISAå†™å…¥æ§åˆ¶ä¿¡å·
//	output			isa_ior;		//ISAè¯»å–æ§åˆ¶ä¿¡å·
//	//inout	[15:0]	isa_sd;
//	output			isa_rst_drv;	//ISAå¤ä½ä¿¡å·
//	output			isa_aen;		//é¢„ç•™

//	//Signal to ZYNQ
//	input			master_rst_drv;		//å¤ä½
//	input	[3:0]	master_isa_state;	//ISAçŠ¶æ?å¯„å­˜å™¨
//	input	[15:0]	master_isa_sa_in;	//AXI-ISAåœ°å€å¯„å­˜å™?
//	input	[15:0]	master_isa_sd_in;	//AXI-ISAæ•°æ®è¾“å…¥å¯„å­˜å™?
//	output	[15:0]	slave_isa_rd_data;	//ISAè¯»å–æ•°æ®å¯„å­˜å™?(ä¼ å…¥AXI)
//	output	[15:0]	isa_status;			//ISAçŠ¶æ?å¯„å­˜å™¨
	
//	//io_isa_sd
//	input    [15:0]    isa_sd_in;
//	output   [15:0]    isa_sd_out;
//	output             isa_tri_en;
	
//	input iocs16;
//    input irq5;
	
	
//	assign	isa_status[3:0] = current_state;
//	wire	bus_busy;
//	assign	isa_status[4] = bus_busy;
	
////å¤ä½ä¿¡å·ï¼ŒNiosç›´ï¿½??
//	assign	isa_rst_drv = master_rst_drv; 

////ISA AEN,8Cè¯‘ç ä½¿ç”¨
//	assign	isa_aen = 1'b0;
	
////74LVC4245ä½¿èƒ½ä¸æ–¹å‘æ§ï¿??
//	//ISAåœ°å€çº¿ï¼Œå™¨ä»¶å§‹ç»ˆä½¿èƒ½ï¼Œåœ°ï¿??çº¿åªç”±FPGAè¾“å‡ºè‡³ISA
//	assign	oe_isa_sa1 = 1'b0;
//	assign	oe_isa_sa2 = oe_isa_sa1;
//	assign	dir_isa_sa1 = 1'b0;
//	assign	dir_isa_sa2 = dir_isa_sa1;
	
//	//ISAè¾“å…¥ç±»ï¼Œä¿¡å·ç”±ISAè¾“å…¥è‡³FPGA
//	assign	oe_isa_in = 1'b0;
//	assign	dir_isa_in = 1'b1;
	
//	//ISAè¾“å‡ºï¿??
//	assign	oe_isa_out = 1'b0;	
//	assign	dir_isa_out = 1'b0;
	
//	//ISAæ•°æ®
//	assign	oe_isa_sd2 = oe_isa_sd1;
//	assign	dir_isa_sd2 = dir_isa_sd1;	

////çŠ¶ï¿½?ï¿½æœº
//	//å®šä¹‰çŠ¶ï¿½?ï¿½å
//	localparam IDLE 		= 4'b0000;
//	localparam ISA_WRITE 	= 4'b0001;
//	localparam ISA_READ 	= 4'b0010;
	
//	//FSM1-ç°ï¿½?ï¿½ä¸æ¬¡ï¿½??
//	reg	[3:0]	current_state;
//	reg	[3:0]	next_state;

//	always@(posedge clk_in_16m or negedge rst_n) begin 
//		if(!rst_n) 
//			current_state <= IDLE;
//		else 
//			current_state <= next_state;
//	end

//	//FSM2 çŠ¶ï¿½?ï¿½è½¬ç§»æ¡ï¿??
//	wire 	IDLEtoISA_WRITE;
//	wire 	IDLEtoISA_READ;
//	wire	ISA_WRITEtoIDLE;
//	wire	ISA_READtoIDLE;

//	always@(*) begin 
//		case(current_state)
//			IDLE 		: begin	if(IDLEtoISA_WRITE) 	next_state = ISA_WRITE; 
//								else if(IDLEtoISA_READ)	next_state = ISA_READ;
//								else 					next_state = current_state; end 
//			ISA_WRITE	: begin if(ISA_WRITEtoIDLE) 	next_state = IDLE; 
//								else 					next_state = current_state; end 
//			ISA_READ	: begin if(ISA_READtoIDLE) 		next_state = IDLE; 
//								else 					next_state = current_state; end 				
//			default		: begin next_state = current_state;							end
//		endcase
//	end

//	reg			isa_wr_done;
//	reg			isa_rd_done;
	
//	assign	IDLEtoISA_WRITE = (current_state==IDLE) && (master_isa_state==ISA_WRITE);
//	assign	IDLEtoISA_READ  = (current_state==IDLE) && (master_isa_state==ISA_READ);
//	assign	ISA_WRITEtoIDLE = (current_state==ISA_WRITE) && (master_isa_state==IDLE);	//è¯»å†™å®Œæˆåè½¯ä»¶å°†çŠ¶ï¿½?ï¿½åˆ‡æ¢å›IDLE
//	assign	ISA_READtoIDLE	= (current_state==ISA_READ)  && (master_isa_state==IDLE);	//è¯»å†™å®Œæˆåè½¯ä»¶å°†çŠ¶ï¿½?ï¿½åˆ‡æ¢å›IDLE
	
//	//FSM3
//	//çŠ¶ï¿½?ï¿½è¾“å‡ºCounter(å­çŠ¶æ€æœº)
//	reg	[3:0]	isa_ctl_cnt;
//	always@(posedge clk_in_16m or negedge rst_n) begin 
//		if(!rst_n)
//			isa_ctl_cnt <= 1'b0;
//		else if(current_state==IDLE)
//			isa_ctl_cnt <= 1'b0;			
//		else if(isa_wr_done|isa_rd_done)	
//			isa_ctl_cnt <= isa_ctl_cnt;
//		else if(isa_ctl_cnt>4'd6)
//			isa_ctl_cnt <= isa_ctl_cnt;
//		else if(((current_state == ISA_WRITE) || (current_state == ISA_READ))  &&  (!(isa_wr_done|isa_rd_done)))
//			isa_ctl_cnt <= isa_ctl_cnt + 1'b1;
//		else 
//			isa_ctl_cnt <= isa_ctl_cnt;
//	end
	  
//	assign	bus_busy = ((current_state == ISA_WRITE) || (current_state == ISA_READ))  &&  (isa_ctl_cnt<6);
	
//	reg			oe_isa_sd1;
//	reg			dir_isa_sd1;
//	reg			isa_iow;
//	reg			isa_ior;
//	reg	[15:0]	isa_sa;
//	reg	[15:0]	isa_sd_out;	
//	reg	[15:0]	slave_isa_rd_data;
//	always@(posedge clk_in_16m or negedge rst_n) begin 
//		if(!rst_n) begin 
//			oe_isa_sd1 <= 1'b1;
//			dir_isa_sd1 <= 1'b1; 
//			isa_sd_out <= 16'hffff;
//			isa_iow <= 1'b1;
//			isa_ior <= 1'b1; 
//			isa_sa <= 16'hffff; 
//			isa_wr_done <= 1'b0; 
//			isa_rd_done <= 1'b0; 
//			slave_isa_rd_data <= 16'h0000; end
//		else if(current_state==IDLE) begin 
//			oe_isa_sd1 <= 1'b1;
//			dir_isa_sd1 <= 1'b1; 
//			isa_sd_out <= 16'hffff;
//			isa_iow <= 1'b1;
//			isa_ior <= 1'b1; 
//			isa_sa <= 16'hffff;
//			isa_wr_done <= 1'b0; 
//			isa_rd_done <= 1'b0; 
//			slave_isa_rd_data <= slave_isa_rd_data; end	
//		else if(current_state==ISA_WRITE) begin 
//			case(isa_ctl_cnt)
//				4'd0 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
//								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
//				4'd1 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
//								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end		
//				4'd2 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
//								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end
//				4'd3 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
//								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b0; end
//				4'd4 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b0; 
//								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
//				4'd5 :  begin	oe_isa_sd1 <= 1'b1;	dir_isa_sd1	<= 1'b1; 
//								isa_sd_out <= master_isa_sd_in; isa_sa <= master_isa_sa_in; isa_iow <= 1'b1; end
//				4'd6 :	begin 	isa_wr_done <= 1'b1; end
//				default:begin 	isa_sd_out <= 16'hffff;
//								isa_sa <= isa_sa;
//								oe_isa_sd1 <= 1'b1;
//								dir_isa_sd1 <= 1'b1; 
//								isa_iow <= 1'b1;
//								isa_ior <= 1'b1;
//								isa_wr_done <= 1'b0;  
//								isa_rd_done <= 1'b0;
//								slave_isa_rd_data <= slave_isa_rd_data; 	
//								end
//			endcase
//			end
//		else if(current_state==ISA_READ) begin 
//			case(isa_ctl_cnt)
//				4'd0 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
//								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
//				4'd1 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
//								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end		
//				4'd2 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
//								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
//				4'd3 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
//								isa_sa <= master_isa_sa_in; isa_ior <= 1'b0; end
//				4'd4 :  begin	oe_isa_sd1 <= 1'b0;	dir_isa_sd1	<= 1'b1; 
//								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; 
//								slave_isa_rd_data <= isa_sd_in; 				 end	//Get Read Data
//				4'd5 :  begin	oe_isa_sd1 <= 1'b1;	dir_isa_sd1	<= 1'b1; 
//								isa_sa <= master_isa_sa_in; isa_ior <= 1'b1; end
//				4'd6 :	begin 	isa_rd_done <= 1'b1; end
//				default:begin 	isa_sd_out <= 16'hffff;
//								isa_sa <= isa_sa;
//								oe_isa_sd1 <= 1'b1;
//								dir_isa_sd1 <= 1'b1; 
//								isa_iow <= 1'b1;
//								isa_ior <= 1'b1;
//								isa_wr_done <= 1'b0; 
//								isa_rd_done <= 1'b0; 
//								slave_isa_rd_data <= slave_isa_rd_data;
//								end	
//			endcase
//			end
//		else begin 
//			oe_isa_sd1 <= 1'b1;
//			dir_isa_sd1 <= 1'b1; 
//			isa_sd_out <= 16'hffff;
//			isa_iow <= 1'b1;
//			isa_ior <= 1'b1; 
//			isa_sa <= 16'hffff;
//			isa_wr_done <= 1'b0; 
//			isa_rd_done <= 1'b0; 
//			slave_isa_rd_data <= slave_isa_rd_data; end
//	end
	
//	//assign	isa_sd = ((!oe_isa_sd1) && (!dir_isa_sd1)) ? isa_sd_out:16'hzzzz;
//	//io_buf_16
//	//io_buf_16_inst(
//    //	.io_data(isa_sd),
//    //	.data_in(isa_sd_in),
//    //	.data_out(isa_sd_out),
//    //	.t(!((!oe_isa_sd1) && (!dir_isa_sd1)))
//	//);
    
//    wire    isa_tri_en;
//    assign  isa_tri_en = ~((!oe_isa_sd1) && (!dir_isa_sd1)); //high = tri/input , low = output

//endmodule

