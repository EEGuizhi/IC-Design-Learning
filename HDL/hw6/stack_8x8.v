// 4109061012
module stack_8x8(
	input clk,
	input [7:0] data_in,  // input data for push operations, sampled at posedge clk
	input [1:0] cmd,  // 00: no operation, 01: clear, 10: push, 11: pop, sampled at the posedge clk
	output reg [7:0] data_out,  // retrieved data for pop operations, changes at posedge clk
	output reg full,  // flag set when the stack is full, updated at negedge clk
	output reg empty,  // flag set when the stack is empty, updated at negedge clk
	output reg error  // flag set when push is asserted if stack is full or when pop is asserted if stack is empty
	);

	parameter SIZE = 8;
	parameter IDLE = 0;
	parameter CLEAR = 1;
	parameter PUSH = 2;
	parameter POP = 3;

	wire [7:0] dout;  // dout is always equal to RAM[sp]
	reg [7:0] ram [0:7]; // 8 X 8 memory module to hold stack data, changes at posedge clk
	reg [2:0] sp;  // 3-bit wide stack pointer, updated at negative edges of the clock
	reg [1:0] cmd_reg;

	assign dout = ram[sp];

	always @(posedge clk) begin
		data_out <= dout;
	end

	always @(posedge clk) begin
		if(cmd == PUSH && full == 0)
			ram[sp] <= data_in;
		else
			ram[sp] <= ram[sp];
	end

	// delay "cmd" half cycle
	always @(posedge clk) begin
		cmd_reg <= cmd;
	end

	// "full" control
	always @(negedge clk) begin
		if(cmd_reg == CLEAR) begin
			full <= 0;
		end
		else begin
			if(sp == SIZE-1 && cmd_reg == PUSH)
				full <= 1;
			else if(full == 1 && cmd_reg == POP)
				full <= 0;
			else
				full <= full;
		end
	end

	// "empty" control
	always @(negedge clk) begin
		if(cmd_reg == CLEAR) begin
			empty <= 1;
		end
		else begin
			if(empty == 1 && cmd_reg == PUSH)
				empty <= 0;
			else if(sp == 1 && cmd_reg == POP)
				empty <= 1;
			else
				empty <= empty;
		end
	end

	// "error" control
	always @(negedge clk) begin
		if(cmd_reg == CLEAR) begin
			error <= 0;
		end
		else begin
			if(empty == 1 && cmd_reg == POP)
				error <= 1;
			else if(full == 1 && cmd_reg == PUSH)
				error <= 1;
			else
				error <= 0;
		end
	end

	// stack pointer control
	always @(negedge clk) begin
		case (cmd_reg)
			IDLE: sp <= sp;
			CLEAR: sp <= 0;
			PUSH: begin
				if(full)
					sp <= sp;
				else
					sp <= sp + 1;
			end
			POP: begin
				if(empty)
					sp <= sp;
				else
					sp <= sp - 1;
			end
			default: sp <= 0;
		endcase
	end
endmodule
