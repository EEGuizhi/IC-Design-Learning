//4109061012
module vending_machine_testbench;
    reg clk;
    reg reset;
    reg [1:0] item;
    reg sel;
    reg dollar_10, dollar_50;
    wire [3:0] price;
    wire [2:0] item_rels;
    wire change_return;
    vending_machine VM(.clk(clk), .reset(reset), .item(item), .sel(sel), .dollar_10(dollar_10), .dollar_50(dollar_50), .price(price), .item_rels(item_rels), .change_return(change_return));

    initial begin  //initial value at t=0
        clk = 1'b1;
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
    end
    always #5 clk = ~clk;
    initial begin
        #5  //clk#1
        {reset, sel, dollar_10, dollar_50} = 4'b1000;
        item = 2'b00;
        #10  //clk#2
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #10  //clk#3
        {reset, sel, dollar_10, dollar_50} = 4'b0100;
        item = 2'b01;
        #10  //clk#4
        {reset, sel, dollar_10, dollar_50} = 4'b0100;
        item = 2'b10;
        #10  //clk#5
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b11;

        #10  //clk#6
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b00;
        #10  //clk#7
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b00;
        #10  //clk#8
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b00;
        #10  //clk#9
        {reset, sel, dollar_10, dollar_50} = 4'b0001;
        item = 2'b00;
        #10  //clk#10
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;

        #50  //clk#15
        {reset, sel, dollar_10, dollar_50} = 4'b0100;
        item = 2'b01;
        #10  //clk#16
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b00;
        #10  //clk#17
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b00;
        #10  //clk#18
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b11;
        #10  //clk#19
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b00;
        #10  //clk#20
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;

        #10  //clk#21
        {reset, sel, dollar_10, dollar_50} = 4'b0001;
        item = 2'b00;
        #10  //clk#22
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #10  //clk#23
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #10  //clk#24
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #10  //clk#25
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b10;

        #10  //clk#26
        {reset, sel, dollar_10, dollar_50} = 4'b0100;
        item = 2'b11;
        #10  //clk#27
        {reset, sel, dollar_10, dollar_50} = 4'b0010;
        item = 2'b10;
        #10  //clk#28
        {reset, sel, dollar_10, dollar_50} = 4'b0001;
        item = 2'b00;
        #10  //clk#29
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #10  //clk#30
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;

        #10  //clk#31
        {reset, sel, dollar_10, dollar_50} = 4'b1000;
        item = 2'b00;
        #10  //clk#32
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #30  //clk#35
        {reset, sel, dollar_10, dollar_50} = 4'b0000;
        item = 2'b00;
        #5
        $finish;
    end
endmodule
