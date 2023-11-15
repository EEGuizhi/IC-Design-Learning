// 4109061012
module stack_testbench();
    reg clk;
    reg [1:0] cmd;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;
    wire error;

    parameter NOP = 2'd0;
    parameter clr = 2'd1;
    parameter push = 2'd2;
    parameter pop = 2'd3;

    stack_8x8 STACK(.clk(clk), .data_in(data_in), .cmd(cmd), .data_out(data_out), .full(full), .empty(empty), .error(error));

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        cmd = clr; //clk#1
        #10
        cmd = pop; //clk#2
        #10
        cmd = pop; //clk#3
        #10
        cmd = push; //clk#4
        data_in = 8'h01;
        #10
        cmd = push; //clk#5
        data_in = 8'h02;
        #10
        cmd = NOP; //clk#6
        #10
        cmd = pop; //clk#7
        #10
        cmd = push; //clk#8
        data_in = 8'h03;
        #10
        cmd = push; //clk#9
        data_in = 8'h04;
        #10
        cmd = push; //clk#10
        data_in = 8'h05;
        #10
        cmd = push; //clk#11
        data_in = 8'h06;
        #10
        cmd = push; //clk#12
        data_in = 8'h07;
        #10
        cmd = push; //clk#13
        data_in = 8'h08;
        #10
        cmd = push; //clk#14
        data_in = 8'h09;
        #10
        cmd = push; //clk#15
        data_in = 8'h0a;
        #10
        cmd = push; //clk#16
        data_in = 8'h0b;
        #10
        cmd = push; //clk#17
        data_in = 8'h0c;
        #10
        cmd = pop; //clk#18
        #10
        cmd = pop; //clk#19
        #10
        cmd = pop; //clk#20
        #10
        cmd = NOP; //clk#21
        #10
        cmd = clr; //clk#22
        #10
        cmd = push; //clk#23
        data_in = 8'h10;
        #10
        cmd = push; //clk#24
        data_in = 8'h20;
        #10
        cmd = pop; //clk#25
        #10
        $finish;
    end

endmodule
