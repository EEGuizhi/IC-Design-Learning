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
    output reg change_return
    );

    // Items
    parameter WATER = 0;
    parameter BLACK_TEA = 1;
    parameter COKE = 2;
    parameter JUICE = 3;

    // States
    parameter IDLE = 0;
    parameter SELECT = 1;
    parameter PAYING = 2;
    parameter RETURN = 3;

    reg [3:0] return_cycles;
    reg [1:0] sold_item;
    reg [1:0] payment_state;  // 0: IDLE, 1: selecting item, 2: paying, 3: returning change

    // FSM
    always @(posedge clk) begin
        if(reset) begin
            payment_state <= IDLE;
        end
        else begin
            case (payment_state)
                IDLE: begin
                    if(sel)
                        payment_state <= SELECT;
                    else
                        payment_state <= IDLE;
                end
                SELECT: begin
                    if(sel)
                        payment_state <= SELECT;
                    else
                        payment_state <= PAYING;
                end
                PAYING: begin
                    if(price > 0)
                        payment_state <= PAYING;
                    else
                        payment_state <= RETURN;
                end
                RETURN: begin
                    if(return_cycles > 0)
                        payment_state <= RETURN;
                    else
                        payment_state <= IDLE;
                end
                default: payment_state <= IDLE;
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
            case (payment_state)
                IDLE: price <= 0;
                SELECT: begin
                    case (sold_item)
                        WATER:  // NT20
                            price <= 2;
                        BLACK_TEA:  // NT30
                            price <= 3;
                        COKE:  // NT40
                            price <= 4;
                        JUICE:  // NT50
                            price <= 5;
                        default: price <= 0;
                    endcase
                end
                PAYING: begin
                    if(dollar_10)
                        price <= price - 1;
                    else if(dollar_50)
                        price <= price - 5;
                    else
                        price <= price;
                end
                RETURN: begin
                    if(return_cycles > 0)
                        price <= price;
                    else
                        price <= 0;
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
            if(price <= 0 && payment_state == PAYING)
                item_rels <= 0;
            else
                item_rels <= 0;
        end
    end

    // Change returning control
    always @(posedge clk) begin
        if(reset) begin
            return_cycles <= 0;
            change_return <= 0;
        end
        else begin
            case (payment_state)
                IDLE: begin
                    return_cycles <= 0;
                    change_return <= 0;
                end
                SELECT: begin
                    return_cycles <= 0;
                    change_return <= 0;
                end
                PAYING: begin
                    change_return <= 0;
                    if(price == -4)
                        return_cycles <= 4;
                    else if(price == -3)
                        return_cycles <= -3;
                    else if(price == -2)
                        return_cycles <= -2;
                    else if(price == -1)
                        return_cycles <= -1;
                    else
                        return_cycles <= 0;
                end
                RETURN: begin
                    if(return_cycles > 0) begin
                        change_return <= 1;
                        return_cycles <= return_cycles - 1;
                    end
                    else begin
                        change_return <= 0;
                    end
                end
                default: begin
                    return_cycles <= 0;
                    change_return <= 0;
                end
            endcase
        end
    end
endmodule
