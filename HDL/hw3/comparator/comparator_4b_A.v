// 4109061012
module comparator_4b (
    input [3:0] data_a,
    input [3:0] data_b,
    output reg gt,
    output reg eq,
    output reg lt
    );

    always @(*) begin
        if (data_a > data_b) begin
            gt <= 1;
            lt <= 0;
            eq <= 0;
        end
        else if (data_a < data_b) begin
            gt <= 0;
            lt <= 1;
            eq <= 0;
        end
        else begin
            gt <= 0;
            lt <= 0;
            eq <= 1;
        end 
    end
endmodule
