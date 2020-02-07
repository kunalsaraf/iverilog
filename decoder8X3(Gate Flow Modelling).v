module dco(I2, I1, I0, O7, O6, O5, O4, O3, O2, O1, O0);
	input I2, I1, I0;
	inout T7, T6, T5, T4, T3, T2, T1, T0;
	output O7, O6, O5, O4, O3, O2, O1, O0;
	and(T7,I1,I0);
	and(O7,T7,I2);
	and(T6,I1,~I0);
	and(O6,T6,I2);
	and(T5,~I1,I0);
	and(O5,T5,I2);
	and(T4,~I1,~I0);
	and(O4,T4,I2);
	and(T3,I1,I0);
	and(O3,T3,~I2);
	and(T2,I1,~I0);
	and(O2,T2,~I2);
	and(T1,~I1,I0);
	and(O1,T1,~I2);
	and(T0,~I1,~I0);
	and(O0,T0,~I2);
endmodule

module test;
	reg i2, i1, i0;
	wire o7, o6, o5, o4, o3, o2, o1, o0;
	dco gco(i2, i1, i0, o7, o6, o5, o4, o3, o2, o1, o0);
	initial begin
		$dumpfile("decoder8X3(Gate Flow Modelling).vcd");
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