module max_detection(clk, start, din, length);
    input clk;
    input start;
    input din;
    output reg [4:0] length;

    reg prev_bit;  // previous din
    reg [5:0] count;  // length is 32 bits = 2^5

    always @(posedge clk) begin
        prev_bit <= din;
    end

    always @(posedge clk) begin
        if(start)
            count <= 0;
        else begin
            if(prev_bit != din)
                count <= count + 1;
            else
                count <= 0;
        end
    end

    always @(posedge clk) begin
        if(start)
            length <= 0;
        else begin
            if(length > count)
                length <= length;
            else
                length <= count;
        end
    end
endmodule
