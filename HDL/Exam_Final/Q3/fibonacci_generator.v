module fibonacci_generator(clk, reset, number);
    input clk;
    input reset;  // active high, synchronous reset
    output reg [7:0] number;  // same as Reg0

    reg [7:0] prev_num;  // same as Reg1
    reg [8:0] sum;  // 255 = 2^8 - 1, when "sum[8] == 1": sum exceed 255 and restart

    always @(posedge clk) begin
        if(reset || sum[8] == 1)
            prev_num <= 1;
        else
            prev_num <= number;
    end

    always @(posedge clk) begin
        if(reset || sum[8] == 1)
            number <= 0;
        else
            number <= sum[7:0];
    end

    always @(*) begin
        sum = prev_num + number;
    end
endmodule
