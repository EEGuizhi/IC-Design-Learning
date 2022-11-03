module pattern_gen(Q, clk, enable);
    input  clk;
    input  enable;  /* enable signal for pattern generation */
    output [2:0] Q;
    
    reg [2:0] Q;  /* 3-bit wide patterns repeat every 4 clock cycles */
    reg [1:0] count;

    always @(posedge clk) begin
        if(enable) begin
            if(count == 2'd0) begin
                Q = 3'b001;
                count = count + 2'd1;
            end
            else if(count == 2'd1) begin
                Q = 3'b011;
                count = count + 2'd1;
            end
            else if(count == 2'd2) begin
                Q = 3'b100;
                count = count + 2'd1;
            end
            else if(count == 2'd3) begin
                Q = 3'b010;
                count = 2'd0;
            end
        end
        else begin
            count = 2'd0;
            Q = 3'b000;
        end
    end
    
endmodule
