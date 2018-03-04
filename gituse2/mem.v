module mem(


//read or write from dmem


clock, reset,

//pc, 

nop,


mem_content,

//opcode,


cal_result,   //for lw & sw cal_result is N+rs


rd,

we, wren,



address_dmem,

//data,

out_wren,

out_nop,
out_rd,
out_we,

value,

lw


);


output [31:0] value;

input lw;

input clock, reset;

//input [11:0] pc;

input nop;



input [4:0] rd;


input[31:0] cal_result, mem_content;
input we, wren;





output [11:0] address_dmem;

//output [31:0] data;

output out_wren;

output out_nop;  assign out_nop = nop;

output out_rd; assign out_rd = rd;

output out_we; assign out_we = we;





assign address_dmem = cal_result[11:0];


// sw 00111(we) &  lw 01000


//assign wren = (opcode == 5'b00111)? 1'b1: 1'b0;

assign out_wren = wren & (~nop);


//assign data = mem_content;








//change input before about lw
//if lw? 
assign value = lw? mem_content: cal_result;



endmodule


