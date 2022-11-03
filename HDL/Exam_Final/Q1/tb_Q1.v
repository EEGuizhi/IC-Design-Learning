`timescale 1ns / 1ps
`define     CYCLE   10
module tb_Q1;

reg     clk , rw , cs;
reg     [10:0]      addr;
wire    [7 :0]      data;

reg     [7:0]       din;

assign      data = (rw)? 8'hzz:din;

always #(`CYCLE/2) clk = ~clk;

ram2048x8   u1(
 .clk(clk),
 .addr(addr),
 .data(data),
 .rw(rw),
 .cs(cs)
 );
reg     error_flag = 0;
initial begin
    clk = 0; cs = 1; rw = 0;
    #30
    cs = 0;
    rw=0;
    addr=11'b00_0_0000_0000;
    din =8'b1111_1111;
    #10
    addr=11'b01_1_0000_0000;
    din =8'b1111_1111;
    #10
    rw=1;
    addr=11'b01_1_0000_0000;
    
    #10
    rw=0;
    addr=11'b10_0_0000_0000;
    din =8'b1111_1111;
    #10
    addr=11'b11_1_0000_0000;
    din =8'b1111_1111;
    #10
    addr=11'b11_0_0000_0000;
    din =8'b1111_1111;
    #10
    cs=1;
    addr=11'b00_0_0000_0000;
    din =8'b0000_0000;
    #10
    cs=0;
    rw=1;
    addr=11'b00_0_0000_0000;
    #10
    addr=11'b10_0_0000_0000;
    #10
    addr=11'b11_1_0000_0000;
    
    #10
    rw=0;
    addr=11'b10_1_0000_0000;
    din =8'b1111_1111;
    #10
    addr=11'b01_1_0000_0000;
    din =8'b0000_0000;
    #10
    rw=1;
    addr=11'b01_1_0000_0000;
    #10
    cs=1;
    #30
    if(!error_flag)begin
        $display("///////////////");
        $display("Congratulation !! ");   
        $stop;
    end
    $stop;
end

integer     i=0;   
reg     [7:0]   compare     [0:4];
initial begin
    compare[0] = 8'b1111_1111;
    compare[1] = 8'b1111_1111;
    compare[2] = 8'b1111_1111;
    compare[3] = 8'b1111_1111;
    compare[4] = 8'b0000_0000;
end

always@(posedge clk)begin
    if(rw && i<=4)begin
        if(data !== compare[i]) begin
            $display("///////////////");
            if(i == 0)    
                $display("error!!! First time get data from ram.");
            if(i == 1)
                $display("error!!! Second time get data from ram.");
            if(i == 2)
                $display("error!!! Third time get data from ram.");
            if(i == 3)
                $display("error!!! Fourth time get data from ram.");
            if(i == 4)
                $display("error!!! Fifth time get data from ram.");                    
            $display("At %t ps.",$time);
            error_flag = 1;
        end
        i = i+1;
    end
end

endmodule