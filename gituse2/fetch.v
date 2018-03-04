module fetch(

clock, reset,

pc, ins,

//nop,



//pc_next, nop_next



//r_type, i_type, ji_type, jii_type,

rd,rs,rt,target, immediate, shamt, aluop,



opcode, 

we, mwen,

out_pc,

lw,

bypass



);


output bypass;


input clock, reset;

input [11:0] pc;

input [31:0] ins;

//input nop;



//output pc_next;

//output nop_next;


//output r_type, i_type, ji_type, jii_type;

output [4:0] rd,rs, rt, shamt, aluop, opcode;

output [31:0] immediate;

output [11:0] target;

output we,mwen;

output [11:0] out_pc; assign out_pc = pc;




/*

/////////////////////////// TYPE //////////////////////////

*/




assign opcode = ins[31:27]; 



/*

wire r_type, i_type, ji_type, jii_type;


//00000

assign r_type =  ~(ins[31] | ins[30] | ins[29] | ins[28] | ins[27]);


//00101

assign i_type =  (~ins[31]) & (~ins[30]) & ins[29] & (~ins[28]) & ins[27];


//00010

assign ji_type = (~ins[31]) & (~ins[30]) & (~ins[29]) & ins[28] & (~ins[27]);


//00100

assign jii_type = (~ins[31]) & (~ins[30]) & ins[29] & (~ins[28]) & (~ins[27]);

*/


/*

///////////////////////// rd, rs, rt, target, imm, aluop///////////////////////

*/


//wire [4:0] rd,rs,rt,target, imm, shamt, aluop;


assign rd = ins[26:22];        //rd is the register going to write or read  --> check if write before

assign target = ins[11:0];     // rs & rt is register going to read  --> check if write befoe 

assign rs = ins[21:17];

assign rt = ins[16:12];

///assign imm = ins[16:0];

assign shamt = ins[11:7];

assign aluop = ins[6:2];







assign immediate[31:17] = ins[16] ? 15'b1: 15'b0;

assign immediate[16:0] = ins[16:0];






//////////////////////////write enables///////////////////////////
wire i_add, i_addi, i_lw, i_jalT, i_setx_T;


assign i_add = ~(opcode[4] | opcode[3] | opcode[2] | opcode[1] | opcode[0] ); //00000
assign i_addi = (~opcode[4]) & (~opcode[3]) & opcode[2] & (~opcode[1]) & opcode[0]; //00101
assign i_lw = (~opcode[4]) & opcode[3] & (~opcode[2]) & (~opcode[1]) & (~opcode[0]); //01000
assign i_jalT = (~opcode[4]) & (~opcode[3]) & (~opcode[2]) & opcode[1] & opcode[0]; //00011
assign i_setx_T = opcode[4] & (~opcode[3]) & opcode[2] & (~opcode[1]) & opcode[0]; //10101

assign we = i_add | i_addi| i_lw| i_jalT| i_setx_T;

wire i_sw;
assign i_sw = (~opcode[4]) & (~opcode[3]) & opcode[2] & opcode[1] & opcode[0];
assign mwen = i_sw;



output lw; assign lw = i_lw;
endmodule
