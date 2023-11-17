// 4109061012
module vending_machine(
    input clk,
    input reset,
    input sel,
    input dollar_10,  // pulse
    input dollar_50,  // pulse
    input [1:0] item,
    output reg signed [3:0] price,
    output reg [2:0] item_rels,
    output reg change_return  // 0: selecting item & paying, 1: returning change
    );

    // Items
    parameter WATER = 0;  // 20 dollars
    parameter BLACK_TEA = 1;  // 30 dollars
    parameter COKE = 2;  // 40 dollars
    parameter JUICE = 3;  // 50 dollars

    // States
    parameter SP = 0;
    parameter RC = 1;

    reg [2:0] return_cycles;
    reg [1:0] sold_item;

    // FSM (return change signal control, state = if machine is returning change)
    always @(posedge clk) begin
        if(reset) begin
            change_return <= SP;
        end
        else begin
            case (change_return)
                SP: begin
                    if(sel || price >= 0)
                        change_return <= SP;
                    else
                        change_return <= RC;
                end
                RC: begin
                    if(return_cycles == 0)
                        change_return <= SP;
                    else
                        change_return <= RC;
                end
                default: change_return <= SP;
            endcase
        end
    end

    // Item selection
    always @(posedge clk) begin
        if(reset) begin
            sold_item <= 0;
        end
        else begin
            if(sel)
                sold_item <= item;
            else
                sold_item <= sold_item;
        end
    end

    // Showing price control
    always @(posedge clk) begin
        if(reset) begin
            price <= 0;
        end
        else begin
            case (change_return)
                SP: begin
                    if(sel) begin
                        case (item)
                            WATER:
                                price <= 2;
                            BLACK_TEA:
                                price <= 3;
                            COKE:
                                price <= 4;
                            JUICE:
                                price <= 5;
                            default: price <= 0;
                        endcase
                    end
                    else if(price == 0) begin
                        case (sold_item)
                            WATER:
                                price <= 2;
                            BLACK_TEA:
                                price <= 3;
                            COKE:
                                price <= 4;
                            JUICE:
                                price <= 5;
                            default: price <= 0;
                        endcase
                    end
                    else begin
                        if(dollar_10)
                            price <= price - 1;
                        else if(dollar_50)
                            price <= price - 5;
                        else
                            price <= price;
                    end
                end
                RC: begin
                    if(return_cycles == 0) begin
                        case (sold_item)
                            WATER:
                                price <= 2;
                            BLACK_TEA:
                                price <= 3;
                            COKE:
                                price <= 4;
                            JUICE:
                                price <= 5;
                            default: price <= 0;
                        endcase
                    end
                    else
                        price <= price;
                end
                default: price <= 0;
            endcase
        end
    end

    // Item release control
    always @(posedge clk) begin
        if(reset) begin
            item_rels <= 0;
        end
        else begin
            if(price > 0 && ((dollar_50 && price <= 5) || (dollar_10 && price <= 1))) begin
                case (sold_item)
                    WATER:
                        item_rels <= 3'b100;
                    BLACK_TEA:
                        item_rels <= 3'b101;
                    COKE:
                        item_rels <= 3'b110;
                    JUICE:
                        item_rels <= 3'b111;
                    default: item_rels <= 0;
                endcase
            end
            else begin
                item_rels <= 0;
            end
        end
    end

    // Change returning cycle control
    always @(posedge clk) begin
        if(reset) begin
            return_cycles <= 0;
        end
        else begin
            case (change_return)
                SP: begin
                    if(price == -4)
                        return_cycles <= 3;
                    else if(price == -3)
                        return_cycles <= 2;
                    else if(price == -2)
                        return_cycles <= 1;
                    else
                        return_cycles <= 0;
                end
                RC: begin
                    if(return_cycles != 0)
                        return_cycles <= return_cycles - 1;
                    else
                        return_cycles <= 0;
                end
                default: return_cycles <= 0;
            endcase
        end
    end
endmodule
