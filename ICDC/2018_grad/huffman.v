`timescale 1ns/10ps
module huffman (
    clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6
);

    // true & false
    parameter true = 1;
    parameter false = 0;

    // State
    parameter INPUT = 0;
    parameter F_SORT = 1;  // first sorting
    parameter DE_SAME = 2;
    parameter SORT = 3;
    parameter ENCODE_COMB = 4;
    parameter OUTPUT = 5;

    // Symbol
    parameter A1 = 'h1;
    parameter A2 = 'h2;
    parameter A3 = 'h3;
    parameter A4 = 'h4;
    parameter A5 = 'h5;
    parameter A6 = 'h6;

    // Used for assign values
    integer i;


    // IO
    input clk, reset, gray_valid;
    input [7:0] gray_data;
    output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
    output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
    output [7:0] M1, M2, M3, M4, M5, M6;
    output reg CNT_valid, code_valid;

    // Inside
    reg [2:0] cs, ns;
    reg [7:0] prob [0:5];
    reg [7:0] code [0:5];
    reg [7:0] mask [0:5];

    reg [2:0] order [0:5];
    reg [2:0] idx_1, idx_2, last_order;
    reg [7:0] sum_1, sum_2;
    reg flag;

    wire found_insert_index;
    assign found_insert_index = (sum_1 >= sum_2 || idx_2 == 7) ? true : false;


    assign {CNT1, CNT2, CNT3, CNT4, CNT5, CNT6} = {
        prob[0], prob[1], prob[2], prob[3], prob[4], prob[5]
    };
    assign {HC1, HC2, HC3, HC4, HC5, HC6} = {
        code[0], code[1], code[2], code[3], code[4], code[5]
    };
    assign {M1, M2, M3, M4, M5, M6} = {
        mask[0], mask[1], mask[2], mask[3], mask[4], mask[5]
    };


    // FSM
    always @(posedge clk or posedge reset) begin
        if(reset)
            cs <= INPUT;
        else
            cs <= ns;
    end
    always @(*) begin
        case(cs)
            INPUT: begin
                if(!gray_valid && flag)  // "flag" temp to represent as inputted
                    ns = F_SORT;
                else
                    ns = INPUT;
            end
            F_SORT: begin
                if(idx_1 == 5 && idx_2 == 5)
                    ns = DE_SAME;
                else
                    ns = F_SORT;
            end
            DE_SAME: begin
                if(idx_1 == 5 && last_order == 4)
                    ns = ENCODE_COMB;
                else
                    ns = DE_SAME;
            end
            SORT: begin
                if(!flag && found_insert_index && idx_1 == 5)
                    ns = ENCODE_COMB;
                else
                    ns = SORT;
            end
            ENCODE_COMB: begin
                if(idx_1 == 5) begin
                    if(last_order == 1)
                        ns = OUTPUT;
                    else
                        ns = SORT;
                end else begin
                    ns = ENCODE_COMB;
                end
            end
            OUTPUT:
                ns = INPUT;
            default:
                ns = INPUT;
        endcase
    end


    // Counting
    always @(posedge clk or posedge reset) begin
        if(reset)
            CNT_valid <= false;
        else begin
            if(cs == INPUT && !gray_valid && flag)
                CNT_valid <= true;
            else
                CNT_valid <= false;
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i = 0; i < 6; i = i+1)
                prob[i] <= 0;
        end else begin
            if(gray_valid) begin
                case(gray_data)
                    A1: prob[0] <= prob[0] + 1;
                    A2: prob[1] <= prob[1] + 1;
                    A3: prob[2] <= prob[2] + 1;
                    A4: prob[3] <= prob[3] + 1;
                    A5: prob[4] <= prob[4] + 1;
                    A6: prob[5] <= prob[5] + 1;
                endcase
            end
        end
    end


    // Encoding (huffman code & mask)
    always @(posedge clk or posedge reset) begin
        if(reset)
            code_valid <= false;
        else begin
            if(cs == OUTPUT)
                code_valid <= true;
            else
                code_valid <= false;
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i = 0; i < 6; i = i+1)
                code[i] <= 0;
        end else begin
            case(cs)
                F_SORT: begin  // reset
                    for(i = 0; i < 6; i = i+1)
                        code[i] <= 0;
                end
                ENCODE_COMB: begin
                    if(order[idx_1] == last_order) begin  // smaller => 1, larger => 0 (not change)
                        case(mask[idx_1])
                            8'b0000_0000: code[idx_1][0] <= 1;
                            8'b0000_0001: code[idx_1][1] <= 1;
                            8'b0000_0011: code[idx_1][2] <= 1;
                            8'b0000_0111: code[idx_1][3] <= 1;
                            8'b0000_1111: code[idx_1][4] <= 1;
                            8'b0001_1111: code[idx_1][5] <= 1;
                            8'b0011_1111: code[idx_1][6] <= 1;
                            8'b0111_1111: code[idx_1][7] <= 1;
                        endcase
                    end
                end
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i = 0; i < 6; i = i+1)
                mask[i] <= 0;
        end else begin
            case(cs)
                F_SORT: begin
                    for(i = 0; i < 6; i = i+1)  // reset
                        mask[i] <= 0;
                end
                ENCODE_COMB: begin
                    if(order[idx_1] == last_order - 1 || order[idx_1] == last_order)  // only last 2 order need to add mask
                        mask[idx_1] <= (mask[idx_1] << 1) + 1;
                end
            endcase
        end
    end


    // Order
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i = 0; i < 6; i = i+1)
                order[i] <= 0;
        end else begin
            case(cs)
                F_SORT: begin
                    if(prob[idx_2] > prob[idx_1])
                        order[idx_1] <= order[idx_1] + 1;
                end
                DE_SAME: begin
                    if(flag && order[idx_1] == last_order)  // has same prob
                        order[idx_1] <= order[idx_1] + 1;
                end
                SORT: begin
                    if(!flag && found_insert_index || idx_2 == 7) begin  // has found insert index, start changing order
                        if(order[idx_1] == last_order)
                            order[idx_1] <= idx_2 + 1;
                        else if(order[idx_1] > idx_2 || idx_2 == 7)
                            order[idx_1] <= order[idx_1] + 1;
                    end
                end
                ENCODE_COMB: begin
                    if(order[idx_1] == last_order)
                        order[idx_1] <= last_order - 1;
                end
                default: begin
                    for(i = 0; i < 6; i = i+1)
                        order[i] <= 0;
                end
            endcase
        end
    end

    // Summing
    always @(posedge clk or posedge reset) begin
        if(reset)
            sum_1 <= 0;
        else begin
            case(cs)
                DE_SAME:  // reset sum values
                    sum_1 <= 0;
                SORT: begin
                    if(flag && order[idx_1] == idx_2)
                        sum_1 <= sum_1 + prob[idx_1];
                    else if(!flag && !found_insert_index)
                        sum_1 <= 0;
                end
                ENCODE_COMB:
                    sum_1 <= 0;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset)
            sum_2 <= 0;
        else begin
            case(cs)
                DE_SAME:  // reset sum values
                    sum_2 <= 0;
                SORT: begin
                    if(!flag && found_insert_index)
                        sum_2 <= 0;
                end
                ENCODE_COMB: begin
                    if(order[idx_1] == last_order || order[idx_1] == last_order - 1)
                        sum_2 <= sum_2 + prob[idx_1];
                end
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset)
            flag <= false;
        else begin
            case(cs)
                INPUT: begin
                    if(gray_valid)  // means inputted
                        flag <= true;
                end
                F_SORT:
                    flag <= false;  // prepare for DE_SAME state, means hasn't detected the same order
                DE_SAME: begin
                    if(idx_1 == 5)
                        flag <= false;
                    else if(order[idx_1] == last_order)  // find same order
                        flag <= true;
                end
                SORT: begin  // in here "flag" means finish summing
                    if(flag && idx_1 == 5 || idx_2 == 7)  // not summing
                        flag <= false;
                    else if(!flag && !found_insert_index)  // not find insert index yet
                        flag <= true;
                end
                ENCODE_COMB:
                    flag <= true;  // prepare for SORT state, means summing
                OUTPUT:
                    flag <= false;
            endcase
        end
    end


    // Index control
    always @(posedge clk or posedge reset) begin
        if(reset)
            idx_1 <= 0;
        else begin
            case(cs)
                F_SORT: begin
                    if(idx_2 == 5)
                        idx_1 <= idx_1 + 1;
                    else if(idx_1 == 5 && idx_2 == 5)
                        idx_1 <= 0;
                end
                DE_SAME: begin
                    if(idx_1 == 5)  // reset
                        idx_1 <= 0;
                    else
                        idx_1 <= idx_1 + 1;
                end
                SORT: begin
                    if(idx_1 == 5)  // reset
                        idx_1 <= 0;
                    else if(flag || found_insert_index)
                        idx_1 <= idx_1 + 1;
                end
                ENCODE_COMB: begin
                    if(idx_1 == 5)  // reset
                        idx_1 <= 0;
                    else
                        idx_1 <= idx_1 + 1;
                end
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset)
            idx_2 <= 0;
        else begin
            case(cs)
                F_SORT: begin
                    if(idx_2 == 5)
                        idx_2 <= 0;
                    else
                        idx_2 <= idx_2 + 1;
                end
                SORT: begin
                    if(!flag && !found_insert_index)
                        idx_2 <= idx_2 - 1;
                end
                ENCODE_COMB: begin
                    if(idx_1 == 5)
                        idx_2 <= last_order - 2;
                end
                default:
                    idx_2 <= 0;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset)
            last_order <= 0;
        else begin
            case(cs)
                DE_SAME: begin
                    if(idx_1 == 5)
                        last_order <= last_order + 1;
                end
                ENCODE_COMB: begin
                    if(idx_1 == 5)  // done combine
                        last_order <= last_order - 1;
                end
                OUTPUT:
                    last_order <= 0;
            endcase
        end
    end

endmodule
