// 4109061012
module FF3(q, din, clk, en);
    output q;
    input din, clk, en;
    reg q = 1'b0;  // variable type declaration plus initial value setting
    always @(negedge clk) begin
        if(en)
            q <= din;
        else
            q <= q;
    end
endmodule
