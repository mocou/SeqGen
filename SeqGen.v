module SeqGen(Q, rst, sysclk,led_6bit);
	input rst;
	wire rst;
	input sysclk;
	output Q;
	reg Q;
	wire clk_r ;
	//实例化分频模块
	DivFreq div_freq ( 
	.clk (sysclk) ,
	.clk_out  (clk_r));
	//四位计数变量
	reg [3:0] cnt;
	output [5:0] led_6bit;
	reg [5:0] led_6bit;
	parameter strSq=16'b0111010011011010;
	reg [15:0] regSq;
//	always @(posedge clk_r or negedge rst)
//		begin
//			if(!rst)
//				cnt<=4'b0000;
//			else
//				cnt<=cnt+1;
//			end	
	always @(posedge clk_r or negedge rst)
		if(!rst)
			regSq<=strSq;
		else
			begin
				Q<=regSq[15];
				regSq<=regSq<<1;
				regSq[0]<=Q;
				led_6bit<=led_6bit<<1;
				led_6bit[0]<=Q;
			end
			
//			case(cnt)
//				0:begin Q<=0;led_6bit<=000000; end
//				1:begin Q<=1;led_6bit<=000001; end
//				2:begin Q<=1;led_6bit<=000011; end
//				3:begin Q<=1;led_6bit<=000111; end
//				4:begin Q<=0;led_6bit<=001110;end
//				5:begin Q<=1;led_6bit<=011101;end
//				6:begin Q<=0;led_6bit<=111010;end
//				7:begin Q<=0;led_6bit<=110100; end
//				8:begin Q<=1;led_6bit<=101001; end
//				9:begin Q<=1;led_6bit<=010011;end
//			  10:begin Q<=0;led_6bit<=100110;end
//			  11:begin Q<=1;led_6bit<=001101;end
//			  12:begin Q<=1;led_6bit<=011011;end
//			  13:begin Q<=0;led_6bit<=110110;end
//			  14:begin Q<=1;led_6bit<=101101;end
//			  15:begin Q<=0;led_6bit<=011010;end
//				//default:begin Q<=0;led_6bit<=000000; end
//			endcase
		

endmodule