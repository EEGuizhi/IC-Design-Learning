`timescale 1ns / 1ps
`define     CYCLE  10 
module Q4_tb;
reg          clk;
reg          start;
reg          din;
wire [4:0]   length; //max length;
 
max_detection u1 (clk , start , din , length);
 
always #(`CYCLE/2) clk =~clk;
initial begin
    clk = 1'd1;
    @(negedge clk)
    #00 start = 1'd0;
        
    #30 start = 1'd1;
    
    #10 start = 1'd0;
end

initial begin
    clk = 1'd1;
    @(negedge clk)
    #00 din = 1'd0;//0
        
    #20 din = 1'd1;//20
    
    #20 din = 1'd0;//40
    
    #10 din = 1'd1;//50
    
    #30 din = 1'd0;//80
    
    #10 din = 1'd1;//90
    
    #10 din = 1'd0;//100
    
    #10 din = 1'd1;//110
    
    #20 din = 1'd0;//130
    
    #20 din = 1'd1;//150
    
    #10 din = 1'd0;//160
    
    #10 din = 1'd1;//170
    
    #10 din = 1'd0;//180
    
    #10 din = 1'd1;//190
    
    #10 din = 1'd0;//200
    
    #10 din = 1'd1;//210
    
    #50 din = 1'd0;//260
    
    #10 din = 1'd1;//270
    
    #10 din = 1'd0;//280
    
    #20 din = 1'd1;//300
    
    #10 din = 1'd0;//310
    
    #10 din = 1'd0;//320
    
    #20 din = 1'd1;//340
    
    #10 din = 1'd0;//350
    
    #50            //400
        $display("/////////////////////");
        $display("Error");
        $display("At %t ps.",$time);
        $stop;
end

reg     [5:0] cnt_fi; // decimal: 32
always@(negedge clk)begin
    if (start == 1)
        cnt_fi = 0;
    else begin
        if (cnt_fi < 33)
            cnt_fi <= cnt_fi + 1;
        else
            cnt_fi <= 0;
            
        if (cnt_fi == 33) begin
            if (length === 7) begin
                $display("/////////////////////");
                $display("Congratulation !! ");
                $display("At %t ps.",$time);
                $stop;
            end
        end
    end
end

endmodule