// 4109061012
module universal_counter (
    input clear,
    input mode,
    input incr,
    input pause,
    input clk,
    output reg [3:0] count
    );

    always @(posedge clk) begin
        casex ({clear, pause, mode, incr})  // with priority
            4'b1xxx: count <= 0;            // clear
            4'b01xx: count <= count;        // pause
            4'b0011: count <= count + 1;    // hexadecimal counting, increase
            4'b0010: count <= count - 1;    // hexadecimal counting, decrease
            4'b0001: begin  // decimal counting, increase
                if(count >= 9)
                    count <= 0;
                else
                    count <= count + 1;
            end
            4'b0000: begin  // decimal counting, decrease
                if(count == 0)
                    count <= 9;
                else
                    count <= count - 1;
            end
            default: count <= 0;
        endcase
    end
endmodule
