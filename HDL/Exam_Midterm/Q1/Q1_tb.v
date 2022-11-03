`timescale 1ns/10ps

module Q1_tb;
reg [7:0] data_a, data_b;
reg [2:0] command;

wire [7:0] yout;
wire z_flag, c_flag;
 
alu u1(.a(data_a), .b(data_b), .cmd(command), .y(yout), .z(z_flag), .c(c_flag));

initial begin
    command = 2'b00; 
    data_a =  8'hA3; 
    data_b =  8'h65;
#10 command = 2'b01;
#10 command = 2'b10; 
    data_a  = 8'hF0;
    data_b  = 8'h0E;
#10 command = 2'b11;
#10
$finish;
end
endmodule
