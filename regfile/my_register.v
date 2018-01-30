module my_register(d,clk,clr,we,out);
		input [31:0] d;
		input clk,clr,we;
		output [31:0] out;
		reg[31:0] out;
		//reg [31:0] di;
		
		genvar i;
		generate
			for(i=0;i<32;i=i+1)
				begin:loop1
					my_dffe dt(d[i],clr,clk,out[i],we);
				end
		endgenerate
		
		
endmodule