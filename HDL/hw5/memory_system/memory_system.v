// 4109061012
module ram4096X16(
	inout [15:0] data,
	input [11:0] addr,
	input clk,
	input rw
	);

	reg [7:0] ram_1 [0:1023];
	reg [7:0] ram_2 [0:1023];
	reg [7:0] ram_3 [0:1023];
	reg [7:0] ram_4 [0:1023];
	reg [7:0] ram_5 [0:1023];
	reg [7:0] ram_6 [0:1023];
	reg [7:0] ram_7 [0:1023];
	reg [7:0] ram_8 [0:1023];

	wire [15:0] dout;
	integer i;

	assign data = (!rw) ? dout : 'bz;
	assign dout = addr[11] ? (
			addr[10] ?
			{ram_8[addr[9:0]], ram_7[addr[9:0]]} :
			{ram_6[addr[9:0]], ram_5[addr[9:0]]}
		) :	(
			addr[10] ?
			{ram_4[addr[9:0]], ram_3[addr[9:0]]} :
			{ram_2[addr[9:0]], ram_1[addr[9:0]]}
		);

	always@(posedge clk) begin
		if(addr[11:10] == 2'b00) begin  // ram2, ram1
			if(rw) begin  
				ram_1[addr[9:0]] <= data[7:0];
				ram_2[addr[9:0]] <= data[15:8];
			end
			else begin
				for(i=0; i<1024; i=i+1) begin
					ram_1[i] <= ram_1[i];
					ram_2[i] <= ram_2[i];
				end
			end
		end 
		else if(addr[11:10] == 2'b01) begin  // ram4, ram3
			if(rw) begin    
				ram_3[addr[9:0]] <= data[7:0];
				ram_4[addr[9:0]] <= data[15:8];
			end
			else begin
				for(i=0; i<1024; i=i+1) begin
					ram_3[i] <= ram_3[i];
					ram_4[i] <= ram_4[i];
				end
			end
		end 
		else if(addr[11:10] == 2'b10) begin  // ram6, ram5
			if(rw) begin    
				ram_5[addr[9:0]] <= data[7:0];
				ram_6[addr[9:0]] <= data[15:8];
			end
			else begin
				for(i=0; i<1024; i=i+1) begin
					ram_5[i] <= ram_5[i];
					ram_6[i] <= ram_6[i];
				end
			end
		end
		else if(addr[11:10] == 2'b11) begin  // ram8, ram7
			if(rw) begin    
				ram_7[addr[9:0]] <= data[7:0];
				ram_8[addr[9:0]] <= data[15:8];
			end
			else begin
				for(i=0; i<1024; i=i+1) begin
					ram_7[i] <= ram_7[i];
					ram_8[i] <= ram_8[i];
				end
			end
		end
	end
endmodule
