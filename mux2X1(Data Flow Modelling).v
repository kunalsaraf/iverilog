module m1(A, B, C, Select);
	input A, B, Select;
	output C;
	assign C = Select ? B : A;
endmodule

module test;
	reg a, b, select;
	wire c;
	m1 g1(a, b, c, select);
	initial begin
		$dumpfile("mux2X1(Data Flow Modelling).vcd");
		$dumpvars(0,test);
		$display("A\tB\tSelect\tC");
		$monitor("%b\t%b\t%b\t%b",a,b,select,c);
		#0  a=0;b=0;select=0;
		#10 a=0;b=0;select=1;
		#10 a=0;b=1;select=0;
		#10 a=0;b=1;select=1;
		#10 a=1;b=0;select=0;
		#10 a=1;b=0;select=1;
		#10 a=1;b=1;select=0;
		#10 a=1;b=1;select=1;
		#10 
		$finish;
	end
endmodule	