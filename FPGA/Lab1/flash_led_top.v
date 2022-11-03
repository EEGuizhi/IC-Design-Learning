// EEGuizhi
`timescale 1ns / 1ps

// module
module flash_led_top(
    input clk,
    input rst_n,
    input btn_c,
    output [15:0] led
);

// Register
reg [15:0] led;
reg [24:0] count;
reg [3:0] loop1;
reg [3:0] loop2;
reg [7:0] loop3;

wire d_clk;

// frequency division
always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        count <= 0;
    else
        count <= count + 1;
end
assign d_clk = count[24];

// LED light control
always@(posedge d_clk or negedge rst_n) begin
    if(!rst_n) begin
        led <= 16'b1000_0001_0000_0001;
        loop1 <= 4'b1000;
        loop2 <= 4'b0001;
        loop3 <= 8'b0000_0001;
    end
    else begin
        case(btn_c)
            0 : begin
                if(loop1 != 4'b0001) begin
                    loop1 <= loop1 >> 1;
                end
                else begin
                    loop1 <= 4'b1000;
                end
                
                if(loop2 != 4'b1000) begin
                    loop2 <= loop2 << 1;
                end
                else begin
                    loop2 <= 4'b0001;
                end
                
                if(loop3 != 8'b10000_000) begin
                    loop3 <= loop3 << 1;
                end
                else begin
                    loop3 <= 8'b0000_0001;
                end
        end
            1 : begin
                if(loop1 != 4'b1000) begin
                    loop1 <= loop1 << 1;
                end
                else begin
                    loop1 <= 4'b0001;
                end
                
                if(loop2 != 4'b0001) begin
                    loop2 <= loop2 >> 1;
                end
                else begin
                    loop2 <= 4'b1000;
                end
                
                if(loop3 != 8'b000_00001) begin
                    loop3 <= loop3 >> 1;
                end
                else begin
                    loop3 <= 8'b1000_0000;
                end
            end
        endcase
        led[15:8] <= loop3[7:0];
        led[7:4] <= loop2[3:0];
        led[3:0] <= loop1[3:0];
    end
end

endmodule 
