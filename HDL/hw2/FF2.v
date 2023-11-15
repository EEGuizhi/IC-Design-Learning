// 4109061012
module FF2(q, clk, rst);
    output q;
    input clk, rst;
    reg q = 1'b0;  // variable type declaration plus initial value setting
    always @(negedge rst or posedge clk) begin
        if(!rst)
            q <= 1'b0;
        else
            q <= ~q; 
    end
endmodule
