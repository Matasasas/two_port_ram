module fft_ram 				//dwuportowy, data inputy 16 bitowe, 
					//nie wiem ilubitowe sa addresy
(
	input [15:0] data_a, data_b,	//input z BFU
	input [7:0] addr_a, addr_b,	//input z AGU
	input wr_a, wr_b, clk,			
	output reg [15:0] q_a, q_b
);

	reg [15:0] ram[31:0];
	
	// Port A
	always @ (posedge clk)
	begin
		if (wr_a) 
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= ram[addr_a];
		end
	end
	
	// Port B
	always @ (posedge clk)
	begin
		if (wr_b)
		begin
			ram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else
		begin
			q_b <= ram[addr_b];
		end
	end
	
endmodule
