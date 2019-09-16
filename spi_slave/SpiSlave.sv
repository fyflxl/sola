module SpiSlave #(
    parameter CPHA = 0                  				//SPI通信参数CPHA为0, (0:ss_n有效时数据出现, 1:ss_n有效后第一个跳沿数据出现。
)(
    input 	wire 			clk_i, rst_n,           	//时钟与复位，复位为高电平有效的同步复位
    input 	wire 			sclk0, mosi, ss_n,       	//spi协议输入信号
    output 	logic 			miso, miso_tri,        		//spi协议输出信号、spi协议miso顶层方向控制信号
    output 	logic 			read,                  		//读入数据，待发送到MISO的数据应在read的下一个时钟周期出现在输出寄存器上
    input 	wire 	[31:0] 	tx_data,           			//待发送到miso的数据
    output 	logic 			valid,                 		//从mosi接收到的数据有效，每次数据更新仅有效一次
    output 	logic 	[31:0] 	rx_data,         			//从mosi接受到的数据，再valid有效时同步更新
    output 	logic 			busy                   		//指示接收状态, ss_n为低期间busy为高
);

//Sync
    logic ss_n_reg; 
	always_ff@(posedge clk_i or negedge rst_n) begin 
		if(!rst_n)
			ss_n_reg <= 1'b1;
		else 
			ss_n_reg <= ss_n;   //同步处理
	end

/*    
	logic mosi_reg; 
	always_ff@(posedge clk_i or negedge rst_n) begin  
		if(!rst_n)
			mosi_reg <= 1'b0;   
		else 
			mosi_reg <= mosi;   //同步处理
	end
*/
	
//ss_n & sclk rising & falling
    logic sclk_r, sclk_f, ss_n_rising, ss_n_falling;
    wire sclk_rising = sclk_r & ~ss_n_reg;                      //对sclk0边沿进行有效判定，然后作为有效边沿信号
    wire sclk_falling = sclk_f & ~ss_n_reg;                     //对sclk0边沿进行有效判定，然后作为有效边沿信号
	Edge2EN #(1)
        ssnEdgeDet(clk_i, ss_n, ss_n_rising, ss_n_falling,),      //产生ss_n信号的上升沿脉冲与下降沿脉冲，
        sclkEdgeDet(clk_i, sclk0, sclk_r, sclk_f,);               //产生sclk0的上升沿脉冲与下降沿脉冲
    
//bit_cnt
    logic [11:0] bit_cnt;
    wire bit_cnt_en = ~ss_n_reg & ((CPHA==0) ? sclk_rising:sclk_falling);   //CPHA=0, 在ss_n为低、sclk_rising信号有效时，计数器使能信号置位
    Counter #(4096) 
        bitCnt(clk_i, ~rst_n|ss_n_falling, bit_cnt_en, bit_cnt,);   //计数器，最大计数为4096(大于通信周期)，ss_n下降沿时清零

//busy driven, ss_n下降沿置位busy， ss_n上升沿取消busy
    always_ff@(posedge clk_i or negedge rst_n) begin 
        if(!rst_n) 
			busy <= 1'b0;
        else if(ss_n_falling) 
			busy <= 1'b1;
        else if(ss_n_rising) 
			busy <= 1'b0;
    end

//tx_data & miso
    assign  read = (CPHA==0) ? ss_n_falling | (sclk_falling && bit_cnt[4:0]==5'd0) : sclk_rising && bit_cnt[4:0]==5'd0;
    
    logic read_dly;
    always_ff@(posedge clk_i or negedge rst_n) begin 
		if(!rst_n)
			read_dly <= 1'b0;
		else 
			read_dly <= read;
	end
    
    wire out_shift = (CPHA==0) ? sclk_falling:sclk_rising;    //下降沿时讲数据送出，主机会在上升沿时将数据取走。          
    
    logic [31:0] miso_shift_reg;
    always_ff@(posedge clk_i or negedge rst_n) begin 
        if(!rst_n) 
			miso_shift_reg <= 32'h0;
        else if(read_dly) 
			miso_shift_reg <= tx_data;                	//准备好第一个数据
        else if(out_shift & ~read) 
			miso_shift_reg <= miso_shift_reg>>1; 		//逐个发送数据
		else 
			miso_shift_reg <= miso_shift_reg;
    end

    assign miso = miso_shift_reg[0];    //逐个发送数据
    assign miso_tri = ss_n_reg;         //当ss_n为低时(同步后), 使能miso数据线(低电平有效)， 1=z

//mosi & rx_data
    wire in_shift  = (CPHA==0) ? sclk_rising : sclk_falling; //CPHA为0时，串行时钟线的上升沿移位数据。
	wire out_valid = (CPHA==0) ? sclk_rising && bit_cnt[4:0] == 5'd31 : sclk_falling && bit_cnt[4:0] == 5'd31;

    always_ff@(posedge clk_i or negedge rst_n) begin  
        if(!rst_n) 		
			valid <= 1'b0;
		else 
			valid <= out_valid; 
	end		
	
	logic [31:0] mosi_shift_reg;
    always_ff@(posedge clk_i or negedge rst_n) begin  
        if(!rst_n) 
			mosi_shift_reg <= 32'h0;
        else if(in_shift) 
			mosi_shift_reg <= {mosi, mosi_shift_reg[31:1]};    //将数据逐个读入
		else 
			mosi_shift_reg <= mosi_shift_reg;
    end

    always_ff@(posedge clk_i or negedge rst_n) begin  
        if(!rst_n)
            rx_data <= 32'h0;
        else if(out_valid)              //保存最后一个数据
            rx_data <= {mosi, mosi_shift_reg[31:1]};
		else 
			rx_data <= rx_data;
    end

endmodule