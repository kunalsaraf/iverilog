module fs(A, B, Bin, Diff, Bout);
	input A,B,Bin;
	output Diff, Bout;
	assign Diff = A^B^Bin;
	assign Bout = (~A&Bin) | (~A&B) | (B&Bin);
endmodule

module test;
	reg a,b,bin;
	wire diff,bout;
	fs gs(a,b,bin,diff,bout);
	initial begin
		$dumpfile("fullSubtractor.vcd");
		$dumpvars(0,test);
		$display("A\tB\tBin\tDiff\tBout");
		$monitor("%b\t%b\t%b\t%b\t%b",a,b,bin,diff,bout);
		#00 a=0;b=0;bin=0;
		#10 a=0;b=0;bin=1;
		#10 a=0;b=1;bin=0;
		#10 a=0;b=1;bin=1;
		#10 a=1;b=0;bin=0;
		#10 a=1;b=0;bin=1;
		#10 a=1;b=1;bin=0;
		#10 a=1;b=1;bin=1;
		#10
		$finish;
	end
endmodule