module fibonacci_generator(clk, reset, number);
    input clk;
    input reset; 		//active high, synchronous reset
    output [7:0] number;

    reg [7:0] reg_0;
    reg [7:0] reg_1;
    reg [8:0] sum;
    reg count;

    assign number = reg_0;

    always @(posedge clk) begin
        if(reset) begin
            reg_0 <= 8'd0;
            reg_1 <= 8'd1;
            sum <= 9'd0;
            count = 1'b0;
        end
        else begin
            sum = reg_0 + reg_1;
            reg_1 = reg_0;
            reg_0 = sum[7:0];
            if(!count) begin
                reg_1 = 8'd0;
                count = 1'b1;
            end
            if(sum > 9'd255) begin
                reg_0 <= 8'd0;
                reg_1 <= 8'd1;
                sum <= 9'd0;
                count = 1'b0;
            end
                
        end
    end
endmodule
