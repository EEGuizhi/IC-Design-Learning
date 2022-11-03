`timescale 1ns/10ps

module stimulus_counter;
reg [3:0] data;
reg clock;
reg load, incr, pause;

wire [3:0] counter;

universal_counter unit1(data, load, incr, pause, clock, counter);

initial
clock = 1'b0;

always #5 clock = ~clock;    /* Clock period is 10 time units*/

initial begin
    data  = 4'b1100;
    load  = 1'b0;
	incr  = 1'b1;
	pause = 1'b0;
#50	load  = 1'b1; 
#10	load  = 1'b0;
#50 incr  = 1'b0;
#30 pause = 1'b1;
#20 load  = 1'b1;
    data  = 4'b0111;
#10 pause = 1'b0;
    load  = 1'b0;
#30

$finish;
end
endmodule
