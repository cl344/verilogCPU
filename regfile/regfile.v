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
   wire [31:0] reg_v;

   my_decoder d(wirte_to,ctrl_writeReg,ctrl_writeEnable);



   //write in 

   genvar i;
   generate
      for(i = 0;i<32;i=i+1)
        begin loopo1:
          reg_v[0][i] <= 1'b0;
        end 
   endgenerate

   genvar j;
   generate 
      for(j=1;j<32;j=j+1)
        begin loopo2:

          my_register(data_writeReg,clock,ctrl_reset,write_to[j],reg_v[j]);

        end
    endgenerate

   //read out

   my_mux(data_readRegA, ctrl_readRegA, .reg_v);

   my_mux(data_readRegB, .ctrl_readRegB, .reg_v);





	
	
	
	

endmodule
