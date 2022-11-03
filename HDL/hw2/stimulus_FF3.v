//4109061012
module stimulus_FF3;
    reg clk;
    reg en;
    reg d;
    wire q;

    FF3 FF3(.q(q), .din(d), .clk(clk), .en(en));  //design instantiation

    initial  //stimulus block for (c) waveforms
    clk = 1'b1;
    always #10 clk = ~clk;  //flip the clk value every 10 time units
    initial begin  //waves
        en = 1'b1;
        d = 1'b0;
        #7
        d = 1'b1;
        #18
        d = 1'b0;
        #10
        en = 1'b0;
        d = 1'b1;
        #3
        d = 1'b0;
        #7
        d = 1'b1;
        #8
        d = 1'b0;
        
        #10
        $finish;
    end
endmodule
