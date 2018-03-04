module adder(in1,in2,s0,cout0,s1,cout1);
input in1,in2;
output s0,cout0,s1,cout1;

//if cin is 0
and a1(cout0,in1,in2);
xor x1(s0,in1,in2);

//if cin is 1
or o1(cout1,in1,in2);
xnor xn1(s1,in1,in2);

endmodule
