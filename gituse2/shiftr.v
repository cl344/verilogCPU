module shiftr(in,n,out);
input[31:0] in;
input[4:0] n;
output[31:0] out;

wire[31:0] l1;
wire[31:0] l2;
wire[31:0] l3;
wire[31:0] l4;

sr1 sss1(in,n[0],l1);
sr2 sss2(l1,n[1],l2);
sr4 sss3(l2,n[2],l3);
sr8 sss4(l3,n[3],l4);
sr16 sss5(l4,n[4],out);
endmodule
