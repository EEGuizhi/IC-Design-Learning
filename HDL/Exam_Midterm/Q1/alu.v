`timescale 1ns/10ps

module alu(a, b, cmd, y, z, c);
input [7:0] a, b;     	/* input operands */
input [1:0] cmd;   	/* ALU command */

output [7:0] y;		/* ALU output */
output c;		/* carry out */
output z;		/* zero flag */

wire [1:0] cmd;
reg [7:0] y;
reg carry;

always @(*) begin
    case (cmd) 
        2'b00: {carry, y} = a + b;
        2'b01: {carry, y} = {1'b0, a - b};
        2'b10: {carry, y} = {1'b0, a | b};
        2'b11: {carry, y} = {1'b0, a & b};
        default: {carry, y} = 9'd0;
    endcase
end

assign c = carry;
assign z = (y == 0) ? 1'b1 : 1'b0;

endmodule
