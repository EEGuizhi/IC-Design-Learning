//4109061012
module ALU(a, b, op, y, cout);
    input [15:0] a, b;  // inputs
    input [2:0] op;

    output [15:0] y;  // outputs
    output cout;

    wire [16:0] q1, q2, q3, q4, q5, q6, q7, q8, Q1, Q2;

    assign q1 = a + b;  // arithmetic operations
    assign q2 = a - b;
    assign q3 = {1'b0, (a>b) ? a : b};
    assign q4 = {1'b0, (a<b) ? a : b};
    assign Q1 = op[1] ? (op[0] ? q4 : q3) : (op[0] ? q2 : q1);  //4:1 MUX

    assign q5 = {1'b0, a & b};  // logic operations
    assign q6 = {1'b0, a | b};
    assign q7 = {1'b0, a ^ b};
    assign q8 = {1'b0, a ~^ b};
    assign Q2 = op[1] ? (op[0] ? q8 : q7) : (op[0] ? q6 : q5);  //4:1 MUX

    assign {cout, y} = op[2] ? Q2 : Q1;  //2:1 MUX
endmodule
