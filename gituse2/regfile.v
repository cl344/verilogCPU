module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */

   wire [31:0] write_to;
   wire [31:0] reg_v0,reg_v1,reg_v2,reg_v3,reg_v4,reg_v5,reg_v6,reg_v7,reg_v8,reg_v9, 
               reg_v10,reg_v11,reg_v12,reg_v13,reg_v14,reg_v15,reg_v16,reg_v17,reg_v18,reg_v19,
               reg_v20,reg_v21,reg_v22,reg_v23,reg_v24,reg_v25,reg_v26,reg_v27,reg_v28,reg_v29,
               reg_v30, reg_v31;

   my_decoder d(write_to,ctrl_writeReg,ctrl_writeEnable);



   //write in 

   assign reg_v0 = 32'b0;

my_register r1(data_writeReg,clock,ctrl_reset,write_to [1 ],reg_v1);
my_register r2(data_writeReg,clock,ctrl_reset,write_to [2 ],reg_v2);
my_register r3(data_writeReg,clock,ctrl_reset,write_to [3 ],reg_v3);
my_register r4(data_writeReg,clock,ctrl_reset,write_to [4 ],reg_v4);
my_register r5(data_writeReg,clock,ctrl_reset,write_to [5 ],reg_v5);
my_register r6(data_writeReg,clock,ctrl_reset,write_to [6 ],reg_v6);
my_register r7(data_writeReg,clock,ctrl_reset,write_to [7 ],reg_v7);
my_register r8(data_writeReg,clock,ctrl_reset,write_to [8 ],reg_v8);
my_register r9(data_writeReg,clock,ctrl_reset,write_to [9 ],reg_v9);
my_register r10(data_writeReg,clock,ctrl_reset,write_to[10],reg_v10);
my_register r11(data_writeReg,clock,ctrl_reset,write_to[11],reg_v11);
my_register r12(data_writeReg,clock,ctrl_reset,write_to[12],reg_v12);
my_register r13(data_writeReg,clock,ctrl_reset,write_to[13],reg_v13);
my_register r14(data_writeReg,clock,ctrl_reset,write_to[14],reg_v14);
my_register r15(data_writeReg,clock,ctrl_reset,write_to[15],reg_v15);
my_register r16(data_writeReg,clock,ctrl_reset,write_to[16],reg_v16);
my_register r17(data_writeReg,clock,ctrl_reset,write_to[17],reg_v17);
my_register r18(data_writeReg,clock,ctrl_reset,write_to[18],reg_v18);
my_register r19(data_writeReg,clock,ctrl_reset,write_to[19],reg_v19);
my_register r20(data_writeReg,clock,ctrl_reset,write_to[20],reg_v20);
my_register r21(data_writeReg,clock,ctrl_reset,write_to[21],reg_v21);
my_register r22(data_writeReg,clock,ctrl_reset,write_to[22],reg_v22);
my_register r23(data_writeReg,clock,ctrl_reset,write_to[23],reg_v23);
my_register r24(data_writeReg,clock,ctrl_reset,write_to[24],reg_v24);
my_register r25(data_writeReg,clock,ctrl_reset,write_to[25],reg_v25);
my_register r26(data_writeReg,clock,ctrl_reset,write_to[26],reg_v26);
my_register r27(data_writeReg,clock,ctrl_reset,write_to[27],reg_v27);
my_register r28(data_writeReg,clock,ctrl_reset,write_to[28],reg_v28);
my_register r29(data_writeReg,clock,ctrl_reset,write_to[29],reg_v29);
my_register r30(data_writeReg,clock,ctrl_reset,write_to[30],reg_v30);
my_register r31(data_writeReg,clock,ctrl_reset,write_to[31],reg_v31); 


   //read out

   my_mux m1(data_readRegA, ctrl_readRegA, reg_v0,reg_v1,reg_v2,reg_v3,reg_v4,reg_v5,reg_v6,reg_v7,reg_v8,reg_v9, 
               reg_v10,reg_v11,reg_v12,reg_v13,reg_v14,reg_v15,reg_v16,reg_v17,reg_v18,reg_v19,
               reg_v20,reg_v21,reg_v22,reg_v23,reg_v24,reg_v25,reg_v26,reg_v27,reg_v28,reg_v29,
               reg_v30, reg_v31);

   my_mux m2(data_readRegB, ctrl_readRegB, reg_v0,reg_v1,reg_v2,reg_v3,reg_v4,reg_v5,reg_v6,reg_v7,reg_v8,reg_v9, 
               reg_v10,reg_v11,reg_v12,reg_v13,reg_v14,reg_v15,reg_v16,reg_v17,reg_v18,reg_v19,
               reg_v20,reg_v21,reg_v22,reg_v23,reg_v24,reg_v25,reg_v26,reg_v27,reg_v28,reg_v29,
               reg_v30, reg_v31);






endmodule