`timescale 1ns/10ps

module pipeline (clk, op1, op2, out);
    input clk;
    input [7:0] op1, op2;
    output [15:0] out;

    wire [15:0] out;    /* DO NOT change it to reg type */
    reg [7:0] Reg_A = 0;  /* set initial value of all registers to 0 */
    reg [7:0] Reg_B = 0;
    reg [7:0] Reg_C = 0;
    reg [15:0] Reg_D = 0;

    /* all registers are positive edge triggered */
    assign out = Reg_D;
    always @(posedge clk) begin
        Reg_A <= op1;
        Reg_B <= op2;
        Reg_C <= Reg_A + Reg_D[7:0];
        Reg_D = (Reg_C >> 1) * Reg_B;
    end
endmodule
