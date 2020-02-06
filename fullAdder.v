module fa(A,B,Cin,Cout,Sum);
	input A,B,Cin;
	output Cout,Sum;
	assign Cout = (A&B)|(Cin&(A^B));
	assign Sum = A^B^Cin;
endmodule

module test;
	reg a,b,cin;
	wire cout,sum;
	fa ga(a,b,cin,cout,sum);
	initial begin
		$dumpfile("fullAdder.vcd");
		$dumpvars(0,test);
		$display("A\tB\tCin\tCout\tSum");
		$monitor("%b\t%b\t%b\t%b\t%b",a,b,cin,cout,sum);
		#0 a=0;b=0;cin=0;
		#10 a=0;b=0;cin=1;
		#10 a=0;b=1;cin=0;
		#10 a=0;b=1;cin=1;
		#10 a=1;b=0;cin=0;
		#10 a=1;b=0;cin=1;
		#10 a=1;b=1;cin=0;
		#10 a=1;b=1;cin=1;
		#10
		$finish;
	end
endmodule