// EEGuizhi
`timescale 1ns / 1ps

// module
module seg7_counter(
    input clk,
    input slow,
    input rst_n,
    output [7:0] seg7,
    output [7:0] seg7_sel,
    output [15:0] LED
);

// Register
reg [7:0] seg7;
reg [3:0] seg7_cnt;
reg [24:0] count;
reg [15:0] LED;
wire d_clk;

// frequency division
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        count <= 0;
    else
        count <= count + 1;
end

assign d_clk = (slow == 1'b1) ? count[24] : count[23];  // slow按下後減速

// Set the chip select signal
assign seg7_sel = 8'b0000_0001;

// Seven segment display light control
always @(posedge d_clk or negedge rst_n)begin
    if(!rst_n)
        seg7_cnt <= 15;
    else
        seg7_cnt <= seg7_cnt - 1;
end

always @(posedge d_clk or negedge rst_n)begin
    if(!rst_n)begin
        seg7 <= 8'b1111_0001;
        LED <= 16'b1111_1111_1111_1111;
    end
    else begin
        case(seg7_cnt)
            0:begin
                seg7 <= 8'b0011_1111;
                LED <= 16'b1000_0000_0000_0000;
            end
            1:begin 
                seg7 <= 8'b0000_0110;
                LED <= 16'b1100_0000_0000_0000;
            end
            2:begin 
                seg7 <= 8'b0101_1011;
                LED <= 16'b1110_0000_0000_0000;
            end
            3:begin 
                seg7 <= 8'b0100_1111;
                LED <= 16'b1111_0000_0000_0000;
            end
            4:begin 
                seg7 <= 8'b0110_0110;
                LED <= 16'b1111_1000_0000_0000;
            end
            5:begin 
                seg7 <= 8'b0110_1101;
                LED <= 16'b1111_1100_0000_0000;
            end
            6:begin 
                seg7 <= 8'b0111_1101;
                LED <= 16'b1111_1110_0000_0000;
            end
            7:begin 
                seg7 <= 8'b0000_0111;
                LED <= 16'b1111_1111_0000_0000;
            end
            8:begin 
                seg7 <= 8'b0111_1111;
                LED <= 16'b1111_1111_1000_0000;
            end
            9:begin 
                seg7 <= 8'b0110_1111;
                LED <= 16'b1111_1111_1100_0000;
            end
            10:begin 
                seg7 <= 8'b1111_0111; //A
                LED <= 16'b1111_1111_1110_0000;
            end
            11:begin 
                seg7 <= 8'b1111_1111; //B
                LED <= 16'b1111_1111_1111_0000;
            end
            12:begin 
                seg7 <= 8'b1011_1001; //C
                LED <= 16'b1111_1111_1111_1000;
            end
            13:begin 
                seg7 <= 8'b1011_1111; //D
                LED <= 16'b1111_1111_1111_1100;
            end
            14:begin 
                seg7 <= 8'b1111_1001; //E
                LED <= 16'b1111_1111_1111_1110;
            end
            15:begin 
                seg7 <= 8'b1111_0001; //F
                LED <= 16'b1111_1111_1111_1111;
            end
            default: seg7 <= 8'b1111_0001;
        endcase
    end
end

endmodule
