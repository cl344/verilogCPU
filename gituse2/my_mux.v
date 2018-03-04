module my_mux(outf, s, in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31);


input [4:0] s;
input [31:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31;
output [31:0] outf;

wire [31:0] out;
wire [31:0] choose;
wire [31:0] tmpout[31:0];

my_decoder md(choose,s,1'b1);


assign outf = choose[0 ] ? in0 : 32'bz;
assign outf = choose[1 ] ? in1 : 32'bz;
assign outf = choose[2 ] ? in2 : 32'bz;
assign outf = choose[3 ] ? in3 : 32'bz;
assign outf = choose[4 ] ? in4 : 32'bz;
assign outf = choose[5 ] ? in5 : 32'bz;
assign outf = choose[6 ] ? in6 : 32'bz;
assign outf = choose[7 ] ? in7 : 32'bz;
assign outf = choose[8 ] ? in8 : 32'bz;
assign outf = choose[9 ] ? in9 : 32'bz;
assign outf = choose[10] ? in10: 32'bz;
assign outf = choose[11] ? in11: 32'bz;
assign outf = choose[12] ? in12: 32'bz;
assign outf = choose[13] ? in13: 32'bz;
assign outf = choose[14] ? in14: 32'bz;
assign outf = choose[15] ? in15: 32'bz;
assign outf = choose[16] ? in16: 32'bz;
assign outf = choose[17] ? in17: 32'bz;
assign outf = choose[18] ? in18: 32'bz;
assign outf = choose[19] ? in19: 32'bz;
assign outf = choose[20] ? in20: 32'bz;
assign outf = choose[21] ? in21: 32'bz;
assign outf = choose[22] ? in22: 32'bz;
assign outf = choose[23] ? in23: 32'bz;
assign outf = choose[24] ? in24: 32'bz;
assign outf = choose[25] ? in25: 32'bz;
assign outf = choose[26] ? in26: 32'bz;
assign outf = choose[27] ? in27: 32'bz;
assign outf = choose[28] ? in28: 32'bz;
assign outf = choose[29] ? in29: 32'bz;
assign outf = choose[30] ? in30: 32'bz;
assign outf = choose[31] ? in31: 32'bz;

endmodule
