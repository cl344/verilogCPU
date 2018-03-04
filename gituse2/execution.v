module execution(

clock, reset,

pc, 

nop,

last_result,



opcode,

we, mwen,

rd, aluop, shamt,


num_a, num_b,



result,

out_nop,

out_rd,

out_we, out_mwen,

lw, out_lw


);



input lw;
output out_lw; assign out_lw = lw;


input we, mwen;
output out_we, out_mwen; assign out_we = we; assign  out_mwen = mwen;

input clock, reset;

input [11:0] pc;

input nop;



input [4:0] rd, aluop, opcode, shamt;



input[31:0] num_a, num_b;




output [31:0] result;

output[11:0] out_nop; assign out_nop = nop;

output [4:0] out_rd; assign out_rd = rd;


// initiate an alu to calculate


wire isNotEqual, isLessThan, overflow;



alu my_alu(num_a, num_b, aluop,
shamt, result, isNotEqual, isLessThan, overflow);





endmodule



