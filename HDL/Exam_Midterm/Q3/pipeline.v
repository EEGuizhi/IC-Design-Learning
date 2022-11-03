`timescale 1ns/10ps

module pipeline (clk, op1, op2, out);
    input clk;
    input [7:0] op1, op2;
    output [15:0] out;

    wire [15:0] out;    /* DO NOT change it to reg type */
    reg [7:0] ra = 8'b00000000;  /* set initial value of all registers to 0 */
    reg [7:0] rb = 8'b00000000;
    reg [7:0] rc = 8'b00000000;
    reg [15:0] rd = 16'h0000;

    /* all registers are positive edge triggered */
    always @(posedge clk) begin
        ra = op1;
        rb = op2;

        rc = ra + rd[7:0];
        rc = rc >> 1;
        rd = rc * rb;
    end
    assign out = rd;

endmodule
