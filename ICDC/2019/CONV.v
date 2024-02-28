`timescale 1ns/10ps
module CONV (
    clk, reset, busy, ready, iaddr, idata,
    cwr, caddr_wr, cdata_wr, crd, caddr_rd, cdata_rd, csel
);

    parameter true = 1;
    parameter false = 0;

    // States
    parameter IDLE = 0;
    parameter CONV = 1;
    parameter RELU = 2;
    parameter POOL = 3;
    parameter OUTPUT = 4;

    // kernel weights & bias
    parameter w_11 = 20'h0A89E;
    parameter w_12 = 20'h092D5;
    parameter w_13 = 20'h06D43;
    parameter w_21 = 20'h01004;
    parameter w_22 = 20'hF8F71;
    parameter w_23 = 20'hF6E54;
    parameter w_31 = 20'hFA6D7;
    parameter w_32 = 20'hFC834;
    parameter w_33 = 20'hFAC19;
    parameter bias = 20'h01310;

    // IO
    input wire clk, reset;
    input wire ready;
    output reg busy;

    input wire signed [19:0] idata;
    output reg [11:0] iaddr;

    output reg cwr, crd;
    output reg [2:0] csel;
    input wire signed [19:0] cdata_rd;
    output reg signed [19:0] cdata_wr;
    output [11:0] caddr_wr, caddr_rd;

    // State
    reg [2:0] cs, ns;

    // Coords
    reg [5:0] wr_row, wr_col;
    reg [5:0] rd_row, rd_col;

    // Convolution
    reg [11:0] next_addr;
    reg signed [19:0] weight;
    reg signed [39:0] part_sum;
    wire signed [39:0] mult_ans;

    reg should_add;
    wire top, bottom, left, right;

    // Others
    reg [3:0] idx;
    reg [1:0] count;
    reg done, rounding;
    wire last_mult;

    // Wires assignation
    assign caddr_wr = (cs != POOL) ? {wr_row, wr_col} : {wr_row[4:0], wr_col[4:0]};
    assign caddr_rd = {rd_row << 6, rd_col};

    assign mult_ans = idata * weight;
    assign last_mult = (idx == 8) ? true : false;

    assign top = (wr_row == 0) ? true : false;
    assign bottom = (wr_row == 63) ? true : false;
    assign left = (wr_col == 0) ? true : false;
    assign right = (wr_col == 63) ? true : false;


    // FSM
    always @(posedge clk or posedge reset) begin
        if(reset)
            cs <= IDLE;
        else
            cs <= ns;
    end
    always @(posedge clk or posedge reset) begin
        case (cs)
            IDLE: begin
                if(ready)
                    ns = CONV;
                else
                    ns = IDLE;
            end
            CONV: begin
                if(caddr_wr == 4095 && done)
                    ns = RELU;
                else
                    ns = CONV;
            end
            RELU: begin
                if(caddr_wr == 4095)
                    ns = POOL;
                else
                    ns = RELU;
            end
            POOL: begin
                if(caddr_rd == 4095 && done)
                    ns = OUTPUT;
                else
                    ns = POOL;
            end
            default:
                ns = IDLE;
        endcase
    end


    // Memory control
    always @(posedge clk or posedge reset) begin  // MEM select
        if(reset)
            csel <= 0;
        else begin
            case (cs)
                CONV:
                    csel <= 3'b001;
                RELU:
                    csel <= 3'b001;
                POOL: begin
                    if(done)
                        csel <= 3'b011;  // saving after pooling
                    else
                        csel <= 3'b001;  // reading orig fmap
                end
                default:
                    csel <= 0;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin  // write-out
        if(reset)
            cwr <= false;
        else begin
            case (cs)
                CONV: begin
                    if(last_mult)
                        cwr <= true;
                    else
                        cwr <= false;
                end
                RELU:
                    cwr <= true;
                POOL: begin
                    if(done)
                        cwr <= true;
                    else
                        cwr <= false;
                end
                default:
                    cwr <= false;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin  // read-in
        if(reset)
            crd <= false;
        else begin
            case (cs)
                CONV: begin
                    if(ns == RELU)
                        crd <= true;
                end
                RELU: begin
                    if(caddr_rd == 4095)
                        crd <= false;
                    else
                        crd <= true;
                end
                POOL: begin
                    if(!done)
                        crd <= true;
                    else
                        crd <= false;
                end
                default:
                    crd <= false;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            rd_row <= 0;
            rd_col <= 0;
        end else begin
            case (cs)
                RELU:
                    {rd_row, rd_col} <= {rd_row, rd_col} + 1;
                POOL: begin
                    case (count)
                        0: begin
                            rd_row <= wr_row << 2;
                            rd_col <= wr_col << 1;
                        end
                        1: begin
                            rd_row <= wr_row << 2;
                            rd_col <= wr_col << 1 + 1;
                        end
                        2: begin
                            rd_row <= wr_row << 2 + 1;
                            rd_col <= wr_col << 1;
                        end
                        3: begin
                            rd_row <= wr_row << 2 + 1;
                            rd_col <= wr_col << 1 + 1;
                        end
                    endcase
                end
                OUTPUT: begin
                    rd_row <= 0;
                    rd_col <= 0;
                end
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin  // write data
        if(reset) begin
            wr_row <= 0;
            wr_col <= 0;
        end else begin
            case (cs)
                CONV: begin
                    if(done)
                        {wr_row, wr_col} <= {wr_row, wr_col} + 1;
                end
                RELU: begin
                    wr_row <= rd_row;
                    wr_col <= rd_col;
                end
                POOL: begin
                    {wr_row[4:0], wr_col[4:0]} <= {wr_row[4:0], wr_col[4:0]} + 1;
                end
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset)
            cdata_wr <= 0;
        else begin
            case (cs)
                CONV: begin  // rounding
                    if(rounding)
                        cdata_wr <= (part_sum[15] == 1) ? part_sum[35:16] + 1 : part_sum[35:16];
                end
                RELU: begin  // ReLU operation
                    if(cdata_rd > 0)
                        cdata_wr <= cdata_rd;
                end
                POOL: begin  // pooling
                    if(done)
                        cdata_wr <= 0;
                    else if(cdata_rd > cdata_wr)
                        cdata_wr <= cdata_rd;
                end
                OUTPUT:
                    cdata_wr <= 0;
            endcase
        end
    end


    // Convolution
    always @(*) begin  // kernel weights
        case (idx)
            0: weight = w_11;
            1: weight = w_12;
            2: weight = w_13;
            3: weight = w_21;
            4: weight = w_22;
            5: weight = w_23;
            6: weight = w_31;
            7: weight = w_32;
            8: weight = w_33;
            default: weight = 0;
        endcase
    end
    always @(*) begin  // next image data
        case (idx)
            0: next_addr = caddr_wr - 1024;
            1: next_addr = caddr_wr - 1023;
            2: next_addr = caddr_wr - 1;
            3: next_addr = caddr_wr;
            4: next_addr = caddr_wr + 1;
            5: next_addr = caddr_wr + 1023;
            6: next_addr = caddr_wr + 1024;
            7: next_addr = caddr_wr + 1025;
            default: next_addr = caddr_wr - 1025;
        endcase
    end
    always @(posedge clk or posedge reset) begin  // get image data
        if(reset) begin
            iaddr <= 0;
        end else begin
            case (cs)
                CONV: begin
                    if(!done && !last_mult)
                        iaddr <= next_addr;
                end
            endcase
        end
    end

    always @(*) begin  // if this idx should add to sum
        case ({top, bottom, left, right})
            4'b1000: begin  // top
                if(idx == 0 || idx == 1 || idx == 2)
                    should_add = false;
                else
                    should_add = true;
            end
            4'b0100: begin  // bottom
                if(idx == 6 || idx == 7 || idx == 8)
                    should_add = false;
                else
                    should_add = true;
            end
            4'b0010: begin  // left
                if(idx == 0 || idx == 3 || idx == 6)
                    should_add = false;
                else
                    should_add = true;
            end
            4'b0001: begin  // right
                if(idx == 2 || idx == 5 || idx == 8)
                    should_add = false;
                else
                    should_add = true;
            end
            4'b1010: begin  // top left
                if(idx == 4 || idx == 5 || idx == 7 || idx == 8)
                    should_add = true;
                else
                    should_add = false;
            end
            4'b1001: begin  // top right
                if(idx == 3 || idx == 4 || idx == 6 || idx == 7)
                    should_add = true;
                else
                    should_add = false;
            end
            4'b0110: begin  // bottom left
                if(idx == 4 || idx == 5 || idx == 7 || idx == 8)
                    should_add = true;
                else
                    should_add = false;
            end
            4'b0101: begin  // bottom right
                if(idx == 3 || idx == 4 || idx == 6 || idx == 7)
                    should_add = true;
                else
                    should_add = false;
            end
            default:
                should_add = true;
        endcase
    end
    always @(posedge clk or posedge reset) begin  // tmp save multiplied num
        if(reset)
            part_sum <= 0;
        else begin
            case (cs)
                CONV: begin
                    if(done)
                        part_sum <= 0;
                    else if(should_add)
                        part_sum <= part_sum + mult_ans;
                end
            endcase
        end
    end

    // Pooling
    always @(posedge clk or posedge reset) begin
        if(reset)
            count <= 0;
        else begin
            case (cs)
                POOL: begin
                    if(count == 0 && csel == 3'b001)
                        count <= count;
                    else
                        count <= count + 1;
                end
                default:
                    count <= 0;
            endcase
        end
    end


    // index control
    always @(posedge clk or posedge reset) begin
        if(reset)
            idx <= 0;
        else begin
            case (cs)
                CONV: begin
                    if(done)
                        idx <= 0;
                    else
                        idx <= idx + 1;
                end
                default:
                    idx <= 0;
            endcase
        end
    end


    // "busy" signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            busy <= true;
        else begin
            case (cs)
                CONV:
                    busy <= true;
                OUTPUT:
                    busy <= false;
            endcase
        end
    end

    // "rounding" signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            rounding <= false;
        else begin
            case (cs)
                CONV: begin
                    // finish 9 mult-sum, do rounding
                    if(rounding)
                        rounding <= false;
                    else if(last_mult)
                        rounding <= true;
                end
                default:
                    rounding <= false;
            endcase
        end
    end

    // "done" signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            done <= false;
        else begin
            case (cs)
                CONV: begin
                    if(rounding)
                        done <= true;
                    else
                        done <= false;
                end
                POOL: begin
                    
                end
                default:
                    done <= false;
            endcase
        end
    end

endmodule
