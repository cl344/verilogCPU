module my_dffe(d,aclr,clk,q,we);
		input d, aclr, clk, we;
		output q;
		reg q;
		
		
		initial
		begin 
			q = 1'b0;
		end
		
	

		always @(posedge clk or negedge aclr) begin
			if(~aclr) begin
				q <= 1'b0;
				end 
			else if(we)begin
				q <= d;
				end
		end
endmodule 
