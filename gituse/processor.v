/**

 * READ THIS DESCRIPTION!

 *

 * The processor takes in several inputs from a skeleton file.

 *

 * Inputs

 * clock: this is the clock for your processor at 50 MHz

 * reset: we should be able to assert a reset to start your pc from 0 (sync or

 * async is fine)

 *

 * Imem: input data from imem

 * Dmem: input data from dmem

 * Regfile: input data from regfile

 *

 * Outputs

 * Imem: output control signals to interface with imem

 * Dmem: output control signals and data to interface with dmem

 * Regfile: output control signals and data to interface with regfile

 *

 * Notes

 *

 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the

 * testbench can see which controls signal you active when. Therefore, there needs to be a way to

 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton

 * file acts as a small wrapper around your processor for this purpose.

 *

 * You will need to figure out how to instantiate two memory elements, called

 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a

 * 12-bit address and allow for storing a 32-bit value at each address. Each

 * should have a single clock.

 *

 * Each memory element should have a corresponding .mif file that initializes

 * the memory element to certain value on start up. These should be named

 * imem.mif and dmem.mif respectively.

 *

 * Importantly, these .mif files should be placed at the top level, i.e. there

 * should be an imem.mif and a dmem.mif at the same level as process.v. You

 * should figure out how to point your generated imem.v and dmem.v files at

 * these MIF files.

 *

 * imem

 * Inputs:  12-bit address, 1-bit clock enable, and a clock

 * Outputs: 32-bit instruction

 *

 * dmem

 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable

 * Outputs: 32-bit data at the given address

 *

 */

module processor(

    // Control signals

    clock,                          // I: The master clock

    reset,                          // I: A reset signal


    // Imem

    address_imem,                   // O: The address of the data to get from imem

    q_imem,                         // I: The data from imem


    // Dmem

    address_dmem,                   // O: The address of the data to get or put from/to dmem

    data,                           // O: The data to write to dmem

    wren,                           // O: Write enable for dmem

    q_dmem,                         // I: The data from dmem


    // Regfile

    ctrl_writeEnable,               // O: Write enable for regfile

    ctrl_writeReg,                  // O: Register to write to in regfile

    ctrl_readRegA,                  // O: Register to read from port A of regfile

    ctrl_readRegB,                  // O: Register to read from port B of regfile

    data_writeReg,                  // O: Data to write to for regfile

    data_readRegA,                  // I: Data from port A of regfile

    data_readRegB                   // I: Data from port B of regfile

);

    // Control signals

    input clock, reset;


    // Imem

    output [11:0] address_imem;  // is default to be 0

    input [31:0] q_imem;


    // Dmem

    output [11:0] address_dmem;

    output [31:0] data;

    output wren;

    input [31:0] q_dmem;


    // Regfile

    output ctrl_writeEnable;

    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;

    output [31:0] data_writeReg;

    input [31:0] data_readRegA, data_readRegB;


    /* YOUR CODE STARTS HERE */




    //latches for FETCH

    reg [11:0] l_pc; 

    //reg [31:0] l_ins;


    wire [11:0] pc;

    assign pc = l_pc;

    assign address_imem = l_pc;


    //wire ins;


    always @ ( posedge clock) begin  // here need to find if pc to the end
    l_pc <= l_pc+1;
    end





    //lateches for F/D


    reg [4:0] ld_rd,ld_rs,ld_rt,ld_shamt, ld_aluop;
	 reg[31:0]  ld_imm;
	 reg [11:0] ld_target;
	 reg ld_we, ld_mwen;

    wire [4:0] d_rd,d_rs,d_rt, d_shamt, d_aluop;
	 wire[31:0] d_imm;
	 wire[11:0] d_target;
	 wire d_we, d_mwen;


    always @ ( posedge clock) begin


    ld_rd <= d_rd;

    ld_rs <= d_rs;

    ld_rt <= d_rt;

    ld_target <= d_target;

    ld_imm <= d_imm;

    ld_shamt <= d_shamt; 

    ld_aluop <= d_aluop;

	 ld_we <= d_we;
	 ld_mwen <= d_mwen;
    end



    //latches for D/X

//
//    reg[31:0] l_num_a, l_num_b;
//
//    wire [31:0] num_a, num_b;
//
//    
//
//    always @ ( posedge clock) begin
//
//    l_num_a <= num_a; 
//
//    l_num_b <= num_b;
//
//    end


    reg [4:0] lx_rd,lx_rs,lx_rt, lx_shamt, lx_aluop;
	 reg[31:0]  lx_imm;
	 reg lx_we, lx_mwen;

    wire [4:0] x_rd,x_rs,x_rt,x_shamt, x_aluop;
	 wire[31:0] x_imm;
	 wire x_we, x_mwen;
	 


    always @ ( posedge clock) begin


    lx_rd <= x_rd;

    lx_rs <= x_rs;

    lx_rt <= x_rt;

    //lx_target <= x_target;

    lx_imm <= x_imm;

    lx_shamt <= x_shamt; 

    lx_aluop <= x_aluop;
	 
	 lx_we <= x_we;
	 lx_mwen <= x_mwen;


    end




    //latches for X/M

    

    reg [31:0] l_result;
	 reg lm_we, lm_mwen;

    wire [31:0] result;
	 wire m_we, m_mwen;


    always @ ( posedge clock) begin

    l_result <= result;

    end


    reg [4:0] lm_rd;
	 //reg[31:0] lm_imm;

    wire [4:0] m_rd;
	 //wire[31:0]  m_imm;


    always @ ( posedge clock) begin


    lm_rd <= m_rd;
	 
	 lm_we <=m_we;
	 
	 lm_mwen <= m_mwen;

    //lm_rs <= m_rs;

    //lm_rt <= m_rt;

    //lm_target <= m_target;

    //lm_imm <= m_imm;

   // lm_shamt <= m_shamt; 

    //lm_aluop <= m_aluop;


    end



    //latches for M/W


    reg[31:0] l_value;
	 reg lw_we;

    wire[31:0] value;
	 wire w_we;


    always @ ( posedge clock) begin

    l_value <= value;

    end



    reg [4:0] lw_rd;

    wire [4:0] w_rd;

    always @ ( posedge clock) begin


    lw_rd <= w_rd;
	 lw_we <= w_we;

    end



    ///////////////////////////// Latches are defined above /////////////////



    reg lnop_f, lnop_fd, lnop_dx, lnop_xm, lnop_mw;
    wire nop_f, nop_fd, nop_dx, nop_xm, nop_mw;
	 
	 always @ ( posedge clock) begin
	 lnop_f <= nop_f;
	 lnop_fd <= nop_fd; 
	 lnop_dx <= nop_dx; 
	 lnop_xm <= nop_xm;
	 lnop_mw <= nop_mw;
	 
	 end
	 
	 
	 
	 reg pc_fd, pc_dx, pc_xm, pc_mw;
	 
	 
	 always @ ( posedge clock) begin
	 pc_fd<= pc;
	 pc_dx <= pc_fd;
	 pc_xm <= pc_dx;
	 pc_mw <= pc_xm;
	 
	 end
	 
//	 
//	 reg[4:0] ld_rd,lx_rd,lm_rd,lw_rd;
//	 wire[4:0] d_rd, x_rd, m_rd, w_rd;
//	 always @ ( posedge clock) begin
//	 ld_rd <= d_rd;
//	 lx_rd <= x_rd;
//	 lm_rd <= m_rd;
//	 lw_rd <= w_rd;
//	 end
//	 


    

	 
	 reg ld_lw, lx_lw, lm_lw;//lw_lw;
	 wire d_lw, x_lw, m_lw;// w-lw;
	 always @ ( posedge clock) begin
	 ld_lw <= d_lw;
	 lx_lw <= x_lw;
	 lm_lw <= m_lw;
	 //lw_lw; <= w_lw;
	 
	 end
	 



    fetch my_fetch(clock, reset,

    l_pc, q_imem,

    nop_f,

    d_rd,d_rs,d_rt,d_target, d_imm, d_shamt, d_aluop,

    opcode,
	 d_we, d_mwen,
	 pc,
	 d_lw
	 );
	 
	 
	 
	 reg [31:0] lnum_a,lnum_b;
	 wire [31:0] num_a,num_b;
	 
	 always @ ( posedge clock) begin
	 lnum_a <= num_a;
	 lnum_b <= num_b;
	 end
	 
	 
	 reg[11:0] lout_pc;
	 reg[4:0] lout_opcode;
	 wire[11:0] out_pc;
	 wire[4:0] out_opcode;
	 
	 always @ ( posedge clock) begin
	 lout_pc <= out_pc;
	 lout_opcode <= out_opcode;
	 end
	 
	 
	 
	 
	 decode my_decode(
	 clock, reset,pc_fd, lnop_fd, opcode,
	 ld_we, ld_mwen,
	 ld_lw,
	 ld_rd,ld_rs,ld_rt,ld_target, ld_imm, ld_shamt, ld_aluop,

    data_readRegA, data_readRegB,

    num_a, num_b,
    nop_dx, out_opcode,
	 x_rd,
	 x_we, x_mwen,
	 x_lw
	 );
	 
	 
//	 reg  [31:0] l_result;
//	 wire result;
//	 
//	 always @ ( posedge clock) begin
//	 l_result <= result;
//	 end
	  
	 execution my_execution(
	 clock, reset, pc_dx, lnop_dx, lout_opcode,
	 lx_we, lx_mwen,
    lx_rd, lx_aluop,
    lnum_a,lnum_b,
	 result,
	 nop_xm,
	 m_rd,
	 m_we, m_mwen,
	 lx_lw, m_lw);
	 
	 
	 
//	 reg[31:0] l_value;
//	 wire [31:0] value;
//	 
//	 always @ ( posedge clock) begin
//	 l_value <= value;
//	 end
	 
	 
	 
	 mem my_mem(
	 clock, reset,
    lnop_xm,
    q_dmem,
    l_result,   //for lw & sw cal_result is N+rs
    lm_rd,
    lm_we,lm_mwen,
    address_dmem,
    //data,
    wren,
	 nop_mw,
	 w_rd,
	 w_we,
	 value,
	 lm_lw
	 );
	 
	 
	 
	 
	 write my_write(
	 clock, reset,
    lnop_mw,
    l_value,
    lw_rd,//rs,rt,target, imm, shamt, aluop,
    lw_we,


    ctrl_writeReg,

    data_writeReg,

    ctrl_writeEnable
    );
	 
	 

endmodule
