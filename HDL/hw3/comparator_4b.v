//4109061012
module comparator_4b (data_a, data_b, gt, eq, lt);
    input [3:0] data_a, data_b;
    output gt, eq, lt;
    reg gt, eq, lt;

    always @(*) begin
        if (data_a > data_b) begin
            gt <= #3 1'b1;
            lt <= #4 1'b0;
            eq <= #5 1'b0;
        end
        else if (data_a < data_b) begin
            gt <= #3 1'b0;
            lt <= #4 1'b1;
            eq <= #5 1'b0;
        end
        else if (data_a == data_b) begin
            gt <= #3 1'b0;
            lt <= #4 1'b0;
            eq <= #5 1'b1;
        end 
    end
endmodule
