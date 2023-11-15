// 4109061012
// https://stackoverflow.com/questions/10005411/assign-a-synthesizable-initial-value-to-a-reg-in-verilog
module FF1(q, din, clk, rst);
    output q;
    input din, clk, rst;

    reg q = 1'b0;  // variable type declaration plus initial value setting
    always @(negedge clk) begin
        if(rst)
            q <= 1'b0;
        else
            q <= din;
    end
endmodule
