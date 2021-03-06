module alu(data_operandA, data_operandB, ctrl_ALUopcode,
ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

input [31:0] data_operandA, data_operandB;
input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

output [31:0] data_result;
output isNotEqual, isLessThan, overflow;

wire lt1;
wire lt2;

wire [31:0] my_add;
wire [31:0] my_shiftl;
wire [31:0] my_shiftr;
wire [31:0] my_and;
wire [31:0] my_or;

//wire [31:0] t_add;
//wire [31:0] t_shiftl;
//wire [31:0] t_shiftr;
//wire [31:0] t_and;
//wire [31:0] t_or;

wire is_add;
wire is_shiftl;
wire is_shiftr;
wire is_and;
wire is_or;

wire no0,no1,no2;
not n0(no0,ctrl_ALUopcode[0]);
not n1(no1,ctrl_ALUopcode[1]);
not n2(no2,ctrl_ALUopcode[2]);



nor na0(is_add,ctrl_ALUopcode[2],ctrl_ALUopcode[1]);
and a0(is_and,no2,ctrl_ALUopcode[1],no0);
and a1(is_or,no2,ctrl_ALUopcode[1],ctrl_ALUopcode[0]);
and a2(is_shiftl,ctrl_ALUopcode[2],no1,no0);
and a3(is_shiftr,ctrl_ALUopcode[2],no1,ctrl_ALUopcode[0]);


sadder ad(ctrl_ALUopcode[0],data_operandA,data_operandB,my_add,overflow);
shiftl sl(data_operandA,ctrl_shiftamt,my_shiftl);
shiftr sr(data_operandA,ctrl_shiftamt,my_shiftr);
andop ao(data_operandA,data_operandB,my_and);
orop oo(data_operandA,data_operandB,my_or);

//equal and less 
or o1(isNotEqual,my_add[0],my_add[1],my_add[2],my_add[3],my_add[4],my_add[5],my_add[6],my_add[7],my_add[8],my_add[9],my_add[10],my_add[11],my_add[12],my_add[13],my_add[14],my_add[15],my_add[16],my_add[17],my_add[18],my_add[19],my_add[20],my_add[21],my_add[22],my_add[23],my_add[24],my_add[25],my_add[26],my_add[27],my_add[28],my_add[29],my_add[30],my_add[31]);

//nand na1(isLessThan,my_add[31],overflow);

//and md1(lt1, my_add[31], ~overflow);
//and md2(lt2,overflow,data_operandA[31]);
//and mor (isLessThan,lt1,lt2);

xor xlala(isLessThan,my_add[31],overflow);
 


//make result

assign data_result = is_add? my_add:32'bz;
assign data_result = is_shiftl? my_shiftl:32'bz;
assign data_result = is_shiftr? my_shiftr:32'bz;
assign data_result = is_and? my_and:32'bz;
assign data_result = is_or? my_or:32'bz;

//assign data_result = my_shiftl;




//generate
//genvar k;
//for(k=0;k<32;k=k+1) begin: loop3
//
//and an1(t_add[k],my_add[k],is_and);
//and an2(t_shiftl[k],my_shiftl[k],is_shiftl);
//and an3(t_shiftr[k],my_shiftr[k],is_shiftr);
//and an4(t_and[k],my_and[k],is_and);
//and an5(t_or[k],my_or[k],is_or);
//
//end
//endgenerate
//
//generate
//
//genvar c;
//for(c=0;c<32;c=c+1) begin:loop4
//
//or orr(data_result[c],t_add[c],t_shiftl[c],t_shiftr[c],t_and[c],t_or[c]);
//
//end
//endgenerate


endmodule