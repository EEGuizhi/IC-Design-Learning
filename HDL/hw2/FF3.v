//4109061012
module FF3(q, din, clk, en);
    output q;
    input din, clk, en;
    reg q = 1'b0;
    always @(negedge clk) begin
        if (en)
            q <= din;
    end
endmodule
