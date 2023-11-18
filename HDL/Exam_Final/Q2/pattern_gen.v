module pattern_gen(Q, clk, enable);
    input  clk;
    input  enable;  /* enable signal for pattern generation */
    output reg [2:0] Q;  /* 3-bit wide patterns repeat every 4 clock cycles */

    reg [1:0] count;
    reg [2:0] next_Q;

    // counter
    always @(posedge clk) begin
        if(enable)
            count <= count + 1;
        else
            count <= 0;
    end

    // pattern Q (FSM)
    always @(posedge clk) begin
        if(enable)
            Q <= next_Q;
        else
            Q <= 0;
    end

    always @(*) begin
        if(count == 0) begin
            next_Q = 3'b001;
        end
        else if(count == 1) begin
            next_Q = 3'b011;
        end
        else if(count == 2) begin
            next_Q = 3'b100;
        end
        else begin
            next_Q = 3'b010;
        end
    end
endmodule
