// 4109061012
module multi(
    input clk,
    input signed [15:0] in,
    output reg signed [35:0] out
    );

    reg signed [35:0] tmp [0:3];

    always @(*) begin
        tmp[0] = 2 * in + 0;
        tmp[1] = -3 * in + tmp[0];
        tmp[2] = 4 * in + tmp[1];
        tmp[3] = -5 * in + tmp[2];
        out = tmp[3];
    end

endmodule
