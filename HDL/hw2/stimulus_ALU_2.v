// 4109061012
module stimulus_ALU_2;
    wire [15:0] y;
    wire cout;
    reg [15:0] a, b;
    reg [2:0] op;

    ALU ALU(.a(a), .b(b), .op(op), .y, .cout);  //design instantiation

    initial begin
        a = 16'b1001_0011_1101_0010;  //setting a, b
        b = 16'b1110_1100_1001_0111;
        op = 3'b100;  //chage op every 10 time units
        #10
        op = 3'b101;
        #10
        op = 3'b110;
        #10
        op = 3'b111;
        #10
        $finish;
    end
endmodule
