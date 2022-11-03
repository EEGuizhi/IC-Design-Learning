`timescale 1ns / 1ps
`define     CYCLE  10 
module tb_Q3;

    reg     clk , reset;
    wire    [7:0]   number;
    
fibonacci_generator     u1(
.clk(clk) , 
.reset(reset) , 
.number(number)
);

always #(`CYCLE/2) clk =~clk;
reg     error_flag = 0;   
initial begin
    clk = 0; reset = 1;
    reset <= #(20-1) 0;
    reset <= #220 1;
    reset <= #(240-1) 0;
    reset <= #280 1;
    
    #300
    if(!error_flag)begin
        $display("Congratulation !! ");
        $display("At %t ps.",$time);
        $display("/////////////////////");
        $stop;
    end
    $stop;
    
end

 
reg     [4:0] cnt_fi; // decimal: 32
always@(negedge clk)begin
    if(reset) begin
        cnt_fi <= 0;
            
    end
    else begin
        if(cnt_fi <= 12) // 可以加到 13
            cnt_fi <= cnt_fi + 1;
        else
            cnt_fi <= 0;
            
        case(cnt_fi)
            0: 
                if(number !== 0) begin
                    $display("/////////////////////");
                    $display("Error at 1st clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            
            1: 
                if(number !== 1) begin
                    $display("/////////////////////");
                    $display("Error at 2nd clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
                
            2:
                if(number !== 1) begin
                    $display("/////////////////////");
                    $display("Error at 3rd clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            3:
                if(number !== 2) begin
                    $display("/////////////////////");
                    $display("Error at 4th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end                
            4:
                if(number !== 3) begin
                    $display("/////////////////////");
                    $display("Error at 5th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            5:
                if(number !== 5) begin
                    $display("/////////////////////");
                    $display("Error at 6th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            6:
                if(number !== 8) begin
                    $display("/////////////////////");
                    $display("Error at 7th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            7:
                if(number !== 13) begin
                    $display("/////////////////////");
                    $display("Error at 8th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            8:
                if(number !== 21) begin
                    $display("/////////////////////");
                    $display("Error at 9th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            9:
                if(number !== 34) begin
                    $display("/////////////////////");
                    $display("Error at 10th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            10:
                if(number !== 55) begin
                    $display("/////////////////////");
                    $display("Error at 11th clk cycle.");
                        $display("At %t ps.",$time);
                   // $stop;
                   error_flag = 1;
                end
            11:
                if(number !== 89) begin
                    $display("/////////////////////");
                    $display("Error at 12th clk cycle.");
                        $display("At %t ps.",$time);
                   // $stop;
                   error_flag = 1;
                end
            12:
                if(number !== 144) begin
                    $display("/////////////////////");
                    $display("Error at 13th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            13:
                if(number !== 233) begin
                    $display("/////////////////////");
                    $display("Error at 14th clk cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end             
        endcase
    end
end

endmodule