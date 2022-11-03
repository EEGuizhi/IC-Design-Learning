//4109061012
module comparator_4b (data_a, data_b, gt, eq, lt);
    input [3:0] data_a, data_b;
    output gt, eq, lt;
    reg gt, eq, lt;
    reg gt_d, eq_d, lt_d;

    always @(*) begin  //delays
        gt = #3 gt_d;
        lt = #1 lt_d;
        eq = #1 eq_d;
    end

    always @(*) begin
        if (data_a < data_b) begin  //data_a 小於 data_b
            gt_d = 1'b0;
            lt_d = 1'b1;
            eq_d = 1'b0; 
        end
        else if (data_a == data_b) begin  //data_a 等於 data_b
            gt_d = 1'b0;
            lt_d = 1'b0;
            eq_d = 1'b1;
        end
        else begin            //data_a 大於 data_b
            gt_d = 1'b1;
            lt_d = 1'b0;
            eq_d = 1'b0;
        end
    end

endmodule
