module d1(In, SelectLines, Out);
	input In;
	input [1:0]SelectLines;
	output [3:0]Out;
	assign Out[0] = (~SelectLines[0])&(~SelectLines[1])&(In);
	assign Out[1] = (SelectLines[0])&(~SelectLines[1])&(In);
	assign Out[2] = (~SelectLines[0])&(SelectLines[1])&(In);
	assign Out[3] = (SelectLines[0])&(SelectLines[1])&(In);
endmodule

module test;
	reg in;
	reg [1:0]selectlines;
	wire [3:0]out;
	d1 g1(in, selectlines, out);
	initial begin
		$dumpfile("demux1X4(Data Flow Modelling).vcd");
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