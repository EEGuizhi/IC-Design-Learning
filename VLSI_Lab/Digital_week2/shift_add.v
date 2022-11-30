// 4109061012
module shiftReg (
    input CLK,
    input reset,
    input shift,
    input signed [7:0] Din,
    output signed [11:0] Dout
);

    reg signed [11:0] tmp [0:3];

    assign Dout = tmp[0] + tmp[1] + tmp[2] + tmp[3] + Din;

    always @(posedge CLK) begin
        if(reset) begin
            tmp[0] <= 0;
            tmp[1] <= 0;
            tmp[2] <= 0;
            tmp[3] <= 0;
        end
        else if(shift) begin
            tmp[0] <= Din;
            tmp[1] <= tmp[0];
            tmp[2] <= tmp[1];
            tmp[3] <= tmp[2];
        end
    end

endmodule
