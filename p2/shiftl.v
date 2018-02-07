module shiftl(in,n,out);
input[31:0] in;
input[4:0] n;
output[31:0] out;

wire[31:0] l1;
wire[31:0] l2;
wire[31:0] l3;
wire[31:0] l4;

sl1 ss1(in,n[0],l1);
sl2 ss2(l1,n[1],l2);
sl4 ss3(l2,n[2],l3);
sl8 ss4(l3,n[3],l4);
sl16 ss5(l4,n[4],out);
endmodule
