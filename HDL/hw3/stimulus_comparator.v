//4109061012
module stimulus_comparator;
    wire a_gt_b, a_eq_b, a_lt_b;
    reg [15:0] a, b;
    comparator_16b c_16b(.data_a(a), .data_b(b), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b));

    initial begin
        a = 16'h04F8;
        b = 16'h04F7;
        #10
        b = 16'h04FA;
        #10
        a = 16'h04FA;
        #10
        b = 16'h24FA;

        $finish;
    end
    
endmodule
