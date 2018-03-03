module decode(


clock, reset,

pc, 

nop,


opcode,

en,mwen,

lw,



//r_type, i_type, ji_type, jii_type,

rd,rs,rt,target, imm, shamt, aluop,


data_readRegA, data_readRegB,




num_a, num_b,

//out_pc, 
out_nop, out_opcode, out_rd,

out_en, out_mwen,

out_lw

);




input lw;
output out_lw; 
assign out_lw = lw;


input en,mwen;



input clock, reset;

input [11:0] pc;

input nop;



input [4:0] rd,rs,rt, imm, shamt, aluop, opcode;

input[11:0] target;

input [31:0] data_readRegA, data_readRegB;





//output[11:0] out_pc;  assign out_pc = pc;
output out_nop;  assign out_nop = nop;
output out_opcode;  assign out_opcode = opcode;



output [31:0] num_a, num_b;

output [4:0] out_rd; assign out_rd = rd;




wire [31:0]immediate;


assign immediate[31:17] = 15'b0;

assign immediate[16:0] = imm;



assign num_a= data_readRegA;

wire i_type, sw,  ai,bne, blt;
assign sw = (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[1] & opcode[0];
//assign llw = (~opcode[4]) & opcode[3] & (~opcode[2]) & (~opcode[1]) & (~opcode[0]);
assign ai = (~opcode[4]) & (~opcode[3]) & opcode[2] & (~opcode[1]) & opcode[0];
assign bne = (~opcode[4]) & (~opcode[3])& (~opcode[2])& opcode[1]  & (~opcode[0]);
assign blt = (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[1] & (~opcode[0]);

assign i_type = sw | lw | ai | bne | blt;

assign num_b= i_type? immediate : data_readRegB;


output out_en, out_mwen; 

assign out_en = en; assign out_mwen = mwen;

// immediate+ rs

// rd!=rs    and    rd<rs





endmodule
