module hs(A, B, Diff, Borrow);
input A,B;
output Diff, Borrow;
assign Diff = A^B;
assign Borrow = (~A)&B;
endmodule

module test;
reg a,b;
wire diff, borrow;
hs gs(a,b,diff,borrow);
initial begin
$dumpfile("halfSubtractor.vcd");
$dumpvars(0,test);
$display("A\tB\tDiff\tBorrow");
$monitor("%b\t%b\t%b\t%b",a,b,diff,borrow);
#0 a=0;b=0;
#10 a=0;b=1;
#10 a=1;b=0;
#10 a=1;b=1;
#10
$finish;
end
endmodule