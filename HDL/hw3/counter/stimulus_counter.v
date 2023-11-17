// 4109061012
module stimulus_counter;
    reg clear;
    reg mode;
    reg incr;
    reg pause;
    reg clk;
    wire [3:0] count;
    universal_counter ctr(.clear(clear), .mode(mode), .incr(incr), .pause(pause), .clk(clk), .count(count));
    
    always #5 clk = ~clk;
    initial begin
        clk = 1'b0;
        {clear, pause, mode, incr} = 4'b1001;  //initial value
        #10 //clk#1
        {clear, pause, mode, incr} = 4'b0001;
        #60 //clk#2-7
        {clear, pause, mode, incr} = 4'b0101;
        #10 //clk#8
        {clear, pause, mode, incr} = 4'b0100;
        #20 //clk#9-10
        {clear, pause, mode, incr} = 4'b0000;
        #60 //clk#11-16
        {clear, pause, mode, incr} = 4'b1000;
        #10 //clk#17
        {clear, pause, mode, incr} = 4'b0011;
        #60 //clk#18-23
        {clear, pause, mode, incr} = 4'b0010;
        #20 //clk#24-25
        {clear, pause, mode, incr} = 4'b0011;
        #140//clk#26-39
        {clear, pause, mode, incr} = 4'b0111; 
        #10 //clk#40    
        $finish;
    end
endmodule
