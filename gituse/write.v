module write(

clock, reset,

//pc, 

nop,

value,

//opcode,


//num_reg is rd   


rd,//rs,rt,target, imm, shamt, aluop,

we,


ctrl_writeReg,

data_writeReg,

ctrl_writeEnable

);



input clock, reset;

//input [11:0] pc;

input nop;

input we;



//input r_type, i_type, ji_type, jii_type;

input [4:0] rd;//,rs,rt,target, imm, shamt, aluop, opcode;


input[31:0] value;





output[31:0] data_writeReg;

output ctrl_writeEnable;

output[4:0] ctrl_writeReg;




// 00000 alu_opration

// 00101 addi

// 01000 sw


//wire alu_opration,addi,sw;
//
//assign alu_opration = ~(opcode[4] | opcode[3] | opcode[2] | opcode[1] | opcode[0]);
//
//assign addi = (~opcode[4]) & (~opcode[3]) & opcode[2] & (~opcode[1]) & opcode[0];
//
//assign sw = (~opcode[4]) & opcode[3] & (~opcode[2]) & (~opcode[1]) & (~opcode[0]);


assign ctrl_writeEnable = we;//alu_opration | addi | sw;

assign data_writeReg = value;

assign ctrl_writeReg = rd;




endmodule
