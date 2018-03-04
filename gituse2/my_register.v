module my_register(d,clk,clr,we,out);
		input [31:0] d;
		input clk,clr,we;
		output [31:0] out;
		//reg [31:0] di;
		wire cl;
		
		assign cl = ~clr;
		
		genvar ii;
		generate
			for(ii=0;ii<32;ii=ii+1)
				begin:loop1
					my_dffe dt(d[ii],cl,clk,out[ii],we);
				end
		endgenerate
		
		
endmodule