module my_mux(out, s, in);

	input re;
	input [4:0] s;
	input [31:0] in [31:0];
	output [31:0] out;

	wire [31:0] choose;
	wire [31:0] tmpout[31:0];

	my_decoder(.out(choose),.in(s),.en(1'b1));

	genvar k,j;
	generate
		for( k=0;k<32;k=k+1)
			begin: loop1

			for(j=0;j<32;j=j+1)
				begin: loop2

					and(tmpout[k][j],in[k][j],choose[k]);

			    end


			end 
	endgenerate

	genvar i;
	generate
		for(i=0;i<32;i=1+i)
			begin: loop3

				or(out[i],  tmpout[0][i],tmpout[1][i],tmpout[2][i],tmpout[3][i],tmpout[4][i],tmpout[5][i],tmpout[6][i],tmpout[7][i],tmpout[8][i],tmpout[9][i],tmpout[10][i],tmpout[11][i],tmpout[12][i],tmpout[13][i],tmpout[14][i],tmpout[15][i],tmpout[16][i],tmpout[17][i],tmpout[18][i],tmpout[19][i],tmpout[20][i],tmpout[21][i],tmpout[23][i],tmpout[24][i],tmpout[25][i],tmpout[26][i],tmpout[27][i],tmpout[28][i],tmpout[29][i],tmpout[30][i],tmpout[31][i],);

			end
	endgenerate
	
endmodule








