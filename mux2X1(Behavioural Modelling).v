module m1(IN, Select, C);
	input [1:0]IN;
	input Select;
	output C;
	reg C;
	always @(*) begin
		case(Select)
			0: C = IN[0];
			1: C = IN[1];
		endcase
	end
endmodule

module test;
	reg [1:0]in;
	reg select;
	wire c;
	m1 g1(in, select, c);
	initial begin
		$dumpfile("mux2X1(Behavioural Modelling.vcd");
		$dumpvars(0,test);
		$display("Input\tSelect\tC");
		$monitor("%b\t%b\t%b",in,select,c);
		#0  in = 2'b00; select = 0;
		#10 in = 2'b01; select = 0;
		#10 in = 2'b10; select = 0;
		#10 in = 2'b11; select = 0;
		#10 in = 2'b00; select = 1;
		#10 in = 2'b01; select = 1;
		#10 in = 2'b10; select = 1;
		#10 in = 2'b11; select = 1;
		#10
		$finish;
	end
endmodule