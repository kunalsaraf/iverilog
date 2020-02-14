module d1(In, SelectLines, Out);
	input In;
	input [1:0]SelectLines;
	output [3:0]Out;
	reg [3:0]Out;
	always @(*) begin
		case(SelectLines)
			2'b00: 
			begin
				Out[0] = In;
				Out[1] = 0;
				Out[2] = 0;
				Out[3] = 0;	
			end
			2'b01:  
			begin
				Out[1] = In;
				Out[0] = 0;
				Out[2] = 0;
				Out[3] = 0;	
			end	
			2'b10:  
			begin
				Out[2] = In;
				Out[1] = 0;
				Out[0] = 0;
				Out[3] = 0;	
			end	
			2'b11:  
			begin
				Out[3] = In;
				Out[1] = 0;
				Out[2] = 0;
				Out[0] = 0;	
			end	
		endcase
	end
endmodule

module test;
	reg in;
	reg [1:0]selectlines;
	wire [3:0]out;
	d1 g1(in, selectlines, out);
	initial begin
		$dumpfile("demux1X4(Behavioural Modelling).vcd");
		$dumpvars(0,test);
		$display("In\tSelect\tOut");
		$monitor("%b\t%b\t%b",in,selectlines,out);
		#0  in=0;selectlines=2'b00;
		#10 in=0;selectlines=2'b01;
		#10 in=0;selectlines=2'b10;
		#10 in=0;selectlines=2'b11;
		#10 in=1;selectlines=2'b00;
		#10 in=1;selectlines=2'b01;
		#10 in=1;selectlines=2'b10;
		#10 in=1;selectlines=2'b11;
		#10 
		$finish;
	end
endmodule	