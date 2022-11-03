//4109061012
module stimulus_ALU_1;
    wire [15:0] y;
    wire cout;
    reg [15:0] a, b;
    reg [2:0] op;

    ALU ALU(.a(a), .b(b), .op(op), .y, .cout);  //design instantiation

    initial begin
        a = 16'h8F54;  //setting a, b
        b = 16'h79F8;
        op = 3'b000;  //chage op every 10 time units
        #10
        op = 3'b001;
        #10
        op = 3'b010;
        #10
        op = 3'b011;
        #10
        op = 3'b100;
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
