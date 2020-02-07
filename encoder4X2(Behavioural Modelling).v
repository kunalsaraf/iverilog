module enc(IN, OUT);
	input [3:0]IN;
	output [1:0]OUT;
	reg [1:0]OUT;
	always @(*) begin
		case(IN)
			4'b0001: OUT = 2'b00;
			4'b0010: OUT = 2'b01;
			4'b0100: OUT = 2'b10;
			4'b1000: OUT = 2'b11;
		endcase
	end
endmodule

module test;
	reg [3:0]in;
	wire [1:0]out;
	enc gnc(in, out);
	initial begin
		$dumpfile("encoder4X2(Behavioural Modelling).vcd");
		$dumpvars(0,test);
		$display("I3\tI2\tI1\tI0\tO1\tO0");
		$monitor("%b\t%b\t%b\t%b\t%b\t%b",in[3],in[2],in[1],in[0],out[1],out[0]);
		#0  in = 4'b0000;
		#10 in = 4'b0001;
		#10 in = 4'b0010;
		#10 in = 4'b0100;
		#10 in = 4'b1000;
		#10
		$finish;
	end
endmodule