//4109061012
module stimulus_FF2;
    reg clk;
    reg rst;
    wire q;

    FF2 FF2(.q(q), .clk(clk), .rst(rst));  //design instantiation

    initial  //stimulus block for (b) waveforms
    clk = 1'b0;
    always #10 clk = ~clk;  //flip the clk value every 10 time units
    initial begin  //waves
        rst = 1'b1;
        #15
        rst = 1'b0;
        #8
        rst = 1'b1;

        #40
        $finish;
    end
endmodule
