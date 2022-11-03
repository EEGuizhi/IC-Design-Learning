`timescale 1ns / 1ps
`define     CYCLE  10 
module tb_Q2;

reg     clk , enable;
wire    [2:0]   Q;

pattern_gen     u1(
.Q(Q),
.clk(clk),
.enable(enable)
);

always #(`CYCLE/2) clk =~clk;

reg     error_flag = 0;  
initial begin
    clk = 0;    //enable = 0;
    enable <= #5   0;
    enable <= #30  1;
    enable <= #90  0;
    enable <= #110 1;
    enable <= #130 0;
    
    #200
    if(!error_flag)begin
        $display("/////////////////////");
        $display("Congratulation !! ");
        $display("At %t ps.",$time);
        $stop;
    end
    $stop;
end

reg     [1:0]   cnt4=0;
always@(negedge clk)begin
if(enable!== 1'bx)
    if(enable)begin
        cnt4 <= cnt4 + 1;
        case(cnt4)
            0: begin
                if(Q !== 3'b001)begin
                    $display("/////////////////////");
                    $display("Error at first cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            end
            1: begin
                if(Q !== 3'b011)begin
                    $display("/////////////////////");
                    $display("Error at second cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            end    
            2: begin
                if(Q !== 3'b100)begin
                    $display("/////////////////////");
                    $display("Error at third cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            end         
            3: begin
                if(Q !== 3'b010)begin
                    $display("/////////////////////");
                    $display("Error at fourth cycle.");
                        $display("At %t ps.",$time);
                    //$stop;
                    error_flag = 1;
                end
            end  
        endcase
    end
    else begin
        if(Q !== 3'b000)begin
            $display("/////////////////////");
            $display("Error at non-enable cycle.");
                $display("At %t ps.",$time);
            $stop;
        end
        cnt4 <= 0;
    end
end
endmodule