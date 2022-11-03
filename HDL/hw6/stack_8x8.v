module stack_8x8(clk, data_in, cmd, data_out, full, empty, error);
input clk;
input [7:0] data_in; /* input data for push operations, sampled at posedge clk */ 
input [1:0] cmd; /* 00: no operation, 01: clear, 10: push, 00: pop, sampled at the positive edges of the clock */
output [7:0] data_out; /* retrieved data for pop operations, changes at posedge clk */
output full; /* flag set when the stack is full, updated at negedge clk */
output empty; /* flag set when the stack is empty, updated at negedge clk */
output error; /* flag set when push is asserted if stack is full or when pop is asserted if stack is empty */
reg [7:0] ram [0:7]; /* 8 X 8 memory module to hold stack data, changes at posedge clk */
reg [2:0] sp; /* 3-bit wide stack pointer, updated at negative edges of the clock */
wire [7:0] dout; /* dout is always equal to RAM[sp] */
reg error;
reg empty;
reg [2:0] cmd_reg;

assign dout = ram[sp];
assign full = ((sp == 3'd0)&&(empty == 1'b0)) ? 1'b1 : 1'b0;
assign data_out = dout;

always @(posedge clk)begin
	if(cmd == 2'b01) //clear
		cmd_reg = 2'b01;
	if(cmd == 2'b10)begin //push
		cmd_reg = 2'b10;
		if(!full)
			ram[sp] <= data_in;
	end
	if(cmd == 2'b11) //pop
	    cmd_reg = 2'b11;
	if(cmd == 2'b00)
		cmd_reg = 2'b00;
end

always@(negedge clk)begin
    if(cmd_reg == 2'b01)begin //clear
		sp <= 3'd0;
		error <= 1'b0;
		empty <= 1'b1;
	end
	if(cmd_reg == 2'b10)begin //push
		empty = 1'b0;
		error = 1'b0;
        if(full)
	        error = 1'b1;
		else
			sp = (full)? 3'd7 : sp+3'd1;
	end
	if(cmd_reg == 2'b11)begin //pop
		error = 1'b0;
        if(empty)
	        error = 1'b1;
		else
			sp = (empty)? 3'd0 : sp-3'd1;

		if(sp == 3'd0)
			empty = 1'b1;
	end
end

endmodule
	