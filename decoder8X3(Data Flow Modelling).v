module dco(I2, I1, I0, O7, O6, O5, O4, O3, O2, O1, O0);
	input I2, I1, I0;
	output O7, O6, O5, O4, O3, O2, O1, O0;
	assign O7 = I2&I1&I0;
	assign O6 = I2&I1&(~I0);
	assign O5 = I2&(~I1)&I0;
	assign O4 = I2&(~I1)&(~I0);
	assign O3 = (~I2)&I1&I0;
	assign O2 = (~I2)&I1&(~I0);
	assign O1 = (~I2)&(~I1)&I0;
	assign O0 = (~I2)&(~I1)&(~I0);
endmodule

module test;
	reg i2, i1, i0;
	wire o7, o6, o5, o4, o3, o2, o1, o0;
	dco gco(i2, i1, i0, o7, o6, o5, o4, o3, o2, o1, o0);
	initial begin
		$dumpfile("decoder8X3(Data Flow Modelling).vcd");
		$dumpvars(0,test);
		$display("I2\tI1\tI0\tO7\tO6\tO5\tO4\tO3\tO2\tO1\tO0");
		$monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t",i2,i1,i0,o7,o6,o5,o4,o3,o2,o1,o0);
		#0  i2=0;i1=0;i0=0;
		#10 i2=0;i1=0;i0=1;
		#10 i2=0;i1=1;i0=0;
		#10 i2=0;i1=1;i0=1;
		#10 i2=1;i1=0;i0=0;
		#10 i2=1;i1=0;i0=1;
		#10 i2=1;i1=1;i0=0;
		#10 i2=1;i1=1;i0=1;
		#10 
		$finish;
	end
endmodule	