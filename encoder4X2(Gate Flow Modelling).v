module enc(I3, I2, I1, I0, O1, O0);
	input I3, I2, I1, I0;
	output O1, O0;
	or(O1,I3,I2);
	or(O0,I3,I1);
endmodule

module test;
	reg i3, i2, i1, i0;
	wire o1, o0;
	enc gnc(i3, i2, i1, i0, o1, o0);
	initial begin
		$dumpfile("encoder4X2(Gate Flow Modelling).vcd");
		$dumpvars(0,test);
		$display("I3\tI2\tI1\tI0\tO1\tO0");
		$monitor("%b\t%b\t%b\t%b\t%b\t%b",i3,i2,i1,i0,o1,o0);
		#0  i3=0;i2=0;i1=0;i0=1;
		#10 i3=0;i2=0;i1=1;i0=0;
		#10 i3=0;i2=1;i1=0;i0=0;
		#10 i3=1;i2=0;i1=0;i0=0;
		#10 
		$finish;
	end
endmodule	