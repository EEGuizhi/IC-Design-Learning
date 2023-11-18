`timescale 1ns/10ps

module universal_counter(data, load, incr, pause, clk, count);
    input [3:0] data;  /* set initial value of the counter */
    input load;	       /* if load = 1, count[3:0] is set to data[3:0] the positive edge of the clock */	
    input incr;        /* up counting if incr = 1, down counting if incr = 0 */
    input pause;       /* counting suspended when pause = 1 */
    input clk;

    output [3:0] count;	 /* counter output */
    reg [3:0] count = 4'b0000;  /* register type variable and set initial value */

    always @(posedge clk) begin  // Counter operates at the positiv edges of the clock
        casex ({load, pause, incr})
            4'b1xx: count <= data;  // priority of control signals: clear > pause
            4'b01x: count <= count;
            4'b001: count <= count + 4'b0001;
            4'b000: count <= count - 4'b0001;
            default: count <= data;
        endcase
    end
endmodule
