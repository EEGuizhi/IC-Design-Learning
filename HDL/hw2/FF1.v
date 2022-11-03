//4109061012
module FF1(q, din, clk, rst);
    output q;
    input din, clk, rst;
    reg q = 1'b0;
    always @(negedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= din;
    end
endmodule
