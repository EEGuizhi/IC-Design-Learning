// 4109061012
module stimulus_FF1;
    reg clk;
    reg rst;
    reg d;
    wire q;

    FF1 FF1(.q(q), .din(d), .clk(clk), .rst(rst));  //design instantiation

    initial  //stimulus block for (a) waveforms
    clk = 1'b1;
    always #10 clk = ~clk;  //flip the clk value every 10 time units
    initial begin  //waves
        rst = 1'b0;
        d = 1'b0;
        #7
        d = 1'b1;
        #15
        rst = 1'b1;
        #3
        d = 1'b0;
        #10
        d = 1'b1;
        #3
        d = 1'b0;
        #1
        rst = 1'b0;
        #6
        d = 1'b1;
        #8
        d = 1'b0;
        
        #10
        $finish;
    end
endmodule
