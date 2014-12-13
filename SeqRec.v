module SeqRec(
	data_in,
	sysclk,
	rst,
	detected
);
	input data_in,sysclk,rst;
	output detected;
	reg detected;
	reg [5:0] state;
	parameter s0=0,
				 s1=1,
				 s2=2,
				 s3=3,
				 s4=4,
				 s5=5;
	wire clk_r ;
	//实例化分频模块
	DivFreq div_freq ( 
	.clk (sysclk) ,
	.clk_out  (clk_r));
	
	always @(posedge clk_r or negedge rst)
		begin
			if(!rst)
				state<=s0;
			else
				case(state)
					s0:if(data_in==1)
							state<=s1;
						else
							state<=s0;
					s1:if(data_in==1)
							state<=s2;
						else
							state<=s0;
					s2:if(data_in==0)
							state<=s3;
						else
							state<=s2;
					s3:if(data_in==1)
							state<=s4;
						else
							state<=s0;
					s4:if(data_in==1)
							state<=s5;
						else
							state<=s0;
					s5:if(data_in==1)
							state<=s2;
						else
							state<=s0;
					default:state<=s0;
				endcase
		end
		
	always @(state)
		begin
			case(state)
				s0:detected=0;
				s1:detected=0;
				s2:detected=0;
				s3:detected=0;
				s4:detected=0;
				s5:detected=1;
				default:detected=0;
			endcase
		end

endmodule