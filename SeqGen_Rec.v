//测试模块
module SeqGen_Rec(
	clk,
	rst,
	Q,
	led_6bit,
	detected
);
	input clk,rst;
	output Q;
	output detected;
	wire Q;
	wire detected;
	output [5:0] led_6bit;
	wire [5:0] led_6bit;
	SeqGen sg(
		.Q(Q),
		.rst(rst),
		.sysclk(clk),
		.led_6bit(led_6bit)
	);
	SeqRec sr(
		.data_in(Q),
		.sysclk(clk),
		.rst(rst),
		.detected(detected)
	);

endmodule