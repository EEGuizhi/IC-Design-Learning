//4109061012
module vending_machine(clk, reset, item, sel, dollar_10, dollar_50, price, item_rels, change_return);
    input clk;
    input reset, sel, dollar_10, dollar_50;
    input [1:0] item;
    output [3:0] price;
    output [2:0] item_rels;
    output change_return;

    reg [3:0] price;
    reg [2:0] item_rels;
    reg change_return;
    reg [3:0] return_cycles;
    reg [1:0] last_sold_item;
    reg [3:0] payment_state, next_state;

    always @(posedge clk) begin
        if(reset) begin
            item_rels = 3'b000;
            change_return = 1'b0;
            return_cycles = 4'd0;
            payment_state = 4'd0;
            next_state = 4'd0;
        end
        else begin
            if(sel)
                last_sold_item = item;

            payment_state = next_state;
            case(payment_state)
                4'd0:begin  //累積 NT0
                    item_rels = 3'b000;
                    case(last_sold_item)
                        2'b00: price = 4'b0010;  //water NT20
                        2'b01: price = 4'b0011;  //black tea NT30
                        2'b10: price = 4'b0100;  //coke NT40
                        2'b11: price = 4'b0101;  //juice NT50
                        default: $display("invalid control");
                    endcase
                    if(dollar_10) begin
                        next_state = 4'd1;
                        price = price - 4'd1;
                    end
                    if(dollar_50) begin
                        next_state = 4'd5;
                        price = price - 4'd5;
                    end
                end
                4'd1:begin  //累積 NT10
                    if(dollar_10) begin
                        next_state = 4'd2;
                        price = price - 4'd1;
                    end
                    if(dollar_50) begin
                        next_state = 4'd6;
                        price = price - 4'd5;
                    end
                end
                4'd2:begin  //累積 NT20
                    if(price == 4'd0) begin
                        item_rels = 3'b100;  //drop water
                        next_state = 4'b0;
                    end
                    if(dollar_10) begin
                        next_state = 4'd3;
                        price = price - 4'd1;
                    end
                    if(dollar_50) begin
                        next_state = 4'd7;
                        price = price - 4'd5;
                    end
                end
                4'd3:begin  //累積 NT30
                    if(price == 4'd0) begin
                        item_rels = 3'b101;  //drop tea
                        next_state = 4'b0;
                    end
                    if(dollar_10) begin
                        next_state = 4'd4;
                        price = price - 4'd1;
                    end
                    if(dollar_50) begin
                        next_state = 4'd8;
                        price = price - 4'd5;
                    end
                end
                4'd4:begin  //累積 NT40
                    if(price == 4'd0) begin
                        item_rels = 3'b110;  //drop coke
                        next_state = 4'b0;
                    end
                    if(dollar_10) begin
                        next_state = 4'd5;
                        price = price - 4'd1;
                    end
                    if(dollar_50) begin
                        next_state = 4'd9;
                        price = price - 4'd5;
                    end
                end
                4'd5:begin  //累積 NT50
                    if(price == 4'b1101) begin
                        item_rels = 3'b100;  //drop water
                        return_cycles = return_cycles + 4'b0011;
                    end
                    if(price == 4'b1110) begin
                        item_rels = 3'b101;  //drop tea
                        return_cycles = return_cycles + 4'b0010;
                    end
                    if(price == 4'b1111) begin
                        item_rels = 3'b110;  //drop coke
                        return_cycles = return_cycles + 4'b0001;
                    end
                    if(price == 4'd0) begin
                        item_rels = 3'b111;  //drop juice
                    end
                    next_state = 4'b0;
                end
                4'd6:begin  //累積 NT60
                    if(price == 4'b1100) begin
                        item_rels = 3'b100;  //drop water
                        return_cycles = return_cycles + 4'b0100;
                    end
                    if(price == 4'b1101) begin
                        item_rels = 3'b101;  //drop tea
                        return_cycles = return_cycles + 4'b0011;
                    end
                    if(price == 4'b1110) begin
                        item_rels = 3'b110;  //drop coke
                        return_cycles = return_cycles + 4'b0010;
                    end
                    if(price == 4'b1111) begin
                        item_rels = 3'b111;  //drop juice
                        return_cycles = return_cycles + 4'b0001;
                    end
                    next_state = 4'b0;
                end
                4'd7:begin  //累積 NT70
                    if(price == 4'b1100) begin
                        item_rels = 3'b101;  //drop tea
                        return_cycles = return_cycles + 4'b0100;
                    end
                    if(price == 4'b1101) begin
                        item_rels = 3'b110;  //drop coke
                        return_cycles = return_cycles + 4'b0011;
                    end
                    if(price == 4'b1110) begin
                        item_rels = 3'b111;  //drop juice
                        return_cycles = return_cycles + 4'b0010;
                    end
                    next_state = 4'b0;
                end
                4'd8:begin  //累積 NT80
                    if(price == 4'b1100) begin
                        item_rels = 3'b110;  //drop coke
                        return_cycles = return_cycles + 4'b0100;
                    end
                    if(price == 4'b1101) begin
                        item_rels = 3'b111;  //drop juice
                        return_cycles = return_cycles + 4'b0011;
                    end
                    next_state = 4'b0;
                end
                4'd9:begin  //累積 NT90
                    if(price == 4'b1100) begin
                        item_rels = 3'b111;  //drop juice
                        return_cycles = return_cycles + 4'b0100;
                    end
                    next_state = 4'b0;
                end
                default: next_state = 4'b0000;
            endcase

            if(return_cycles > 4'b0000) begin
                change_return = 1'b1;
                return_cycles = return_cycles - 4'b0001;
            end
            else
                change_return = 1'b0;
        end  
    end
endmodule
