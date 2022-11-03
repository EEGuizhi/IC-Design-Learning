//4109061012
module universal_counter (clear, mode, incr, pause, clk, count);
    input clear; /* if clear = 1, count[3:0] is reset at the positive edge of the clock*/
    input mode; /* hexadecimal counting if mode = 1, decimal counting if otherwise */
    input incr; /* up counting if incr = 1, down counting if incr = 0 */
    input pause; /* counting suspended when pause = 1 */
    input clk;
    output [3:0] count; /* counter output */
    reg [3:0] count; /* register type variable */

    always @(posedge clk) begin
        casex ({clear, pause, mode, incr})
            4'b1xxx: count = 4'b0000;  //priority of control signals: clear > pause
            4'b01xx: count = count;
            4'b0011: count = count + 4'b0001;
            4'b0010: count = count - 4'b0001;
            4'b0001: begin                  //10進位時 9往上數 = 0
                if(count >= 4'b1001)
                    count = 4'b0000;
                else
                    count = count + 4'b0001;
            end
            4'b0000: begin                  //10進位時 0往下數 = 9
                if(count == 4'b0000)
                    count = 4'b1001;
                else
                    count = count - 4'b0001;
            end
            default: $display("Unspecified control signals");
        endcase
    end
endmodule
