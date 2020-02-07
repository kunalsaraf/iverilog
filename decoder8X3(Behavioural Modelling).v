module dco(IN, OUT);
	input [2:0]IN;
	output [7:0]OUT;
	reg [7:0]OUT;
	always @(*) begin
		case(IN)
			3'b000: OUT = 8'b00000001;
			3'b001: OUT = 8'b00000010;
			3'b010: OUT = 8'b00000100;
			3'b011: OUT = 8'b00001000;
			3'b100: OUT = 8'b00010000;
			3'b101: OUT = 8'b00100000;
			3'b110: OUT = 8'b01000000;
			3'b111: OUT = 8'b10000000;
		endcase
	end
endmodule

module test;
	reg [2:0]in;
	wire [7:0]out;
	dco gco(in, out);
	initial begin
		$dumpfile("decoder8X3(Behavioural Modelling).vcd");
		$dumpvars(0,test);
		$display("Input\tOutput");
		$monitor("%b\t%b",in,out);
		#0  in = 3'b000;
		#10 in = 3'b001;
		#10 in = 3'b010;
		#10 in = 3'b011;
		#10 in = 3'b100;
		#10 in = 3'b101;
		#10 in = 3'b110;
		#10 in = 3'b111;
		#10
		$finish;
	end
endmodule