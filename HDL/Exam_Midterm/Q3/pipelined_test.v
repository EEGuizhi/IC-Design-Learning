`timescale 1ns/10ps

module pipelined_test;
reg [7:0] data1, data2;
reg clock;

wire [15:0] data_out;

pipeline tb1(clock, data1, data2, data_out);

initial
clock = 1'b0;

always #5 clock = ~clock;	/* Clock period is 10 time units*/

initial begin
    data1 = 8'h42; 
    data2 = 8'h21;
#10 data2 = 8'h42; 
#10 data1 = 8'hA0;
    data2 = 8'h0A;
#30

$finish;
end
endmodule
