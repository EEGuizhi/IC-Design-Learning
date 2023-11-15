// 4109061012
module debounce_testbench();
    reg clk, sig_in;
    wire sig_out;

    debouncing_circuit DB(.clk(clk), .in(sig_in), .out(sig_out));

    initial begin
        clk = 1'b0;
        sig_in = 1'b0;
    end
    always #5 clk = ~clk;   
    initial begin
        #8 //t=8
        sig_in = 1'b1;
        #3 //t=11
        sig_in = 1'b0;
        #3 //t=14
        sig_in = 1'b1;
        #3 //t=17
        sig_in = 1'b0;
        #4 //t=21
        sig_in = 1'b1;
        #3 //t=24
        sig_in = 1'b0;
        #3 //t=27
        sig_in = 1'b1;
        #46 //t=73
        sig_in = 1'b0;
        #3 //t=76
        sig_in = 1'b1;
        #3 //t=79
        sig_in = 1'b0;
        #4 //t=83
        sig_in = 1'b1;
        #3 //t=86
        sig_in = 1'b0;
        #2 //t=88
        sig_in = 1'b1;
        #3 //t=91
        sig_in = 1'b0;
        #50
        $finish;
    end
endmodule
