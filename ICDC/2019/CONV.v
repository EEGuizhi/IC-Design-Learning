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
    reg signed [19:0] weight;
    reg signed [39:0] part_sum;
    // reg signed [39:0] mult_ans;
    wire top, bottom, left, right;

    // Others
    reg [3:0] idx;
    reg done, rounding;
    wire last_mult;

    // Wires assignation
    assign caddr_wr = (cs != POOL) ? {wr_row, wr_col} : {2'b00, wr_row[4:0], wr_col[4:0]};
    assign caddr_rd = {rd_row, rd_col};

    assign last_mult = (idx == 9) ? true : false;
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
    always @(*) begin
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
                if(caddr_wr == 1023 && idx == 0)
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
                    if(idx == 5)
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
                    if(rounding)
                        cwr <= true;
                    else
                        cwr <= false;
                end
                RELU: begin
                    if(ns == POOL)
                        cwr <= false;
                    else
                        cwr <= true;
                end
                POOL: begin
                    if(idx == 5)
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
                    if(idx == 1 || idx == 2 || idx == 3 || idx == 4)
                        crd <= true;
                    else
                        crd <= false;
                end
                default:
                    crd <= false;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin  // read coord control
        if(reset) begin
            rd_row <= 0;
            rd_col <= 0;
        end else begin
            case (cs)
                RELU:
                    {rd_row, rd_col} <= {rd_row, rd_col} + 1;
                POOL: begin
                    case (idx)
                        1: begin
                            rd_row <= wr_row << 1;
                            rd_col <= wr_col << 1;
                        end
                        2: begin
                            rd_row <= wr_row << 1;
                            rd_col <= {wr_col[4:0], 1'b1};  // same as "(wr_col << 1) + 1"
                        end
                        3: begin
                            rd_row <= {wr_row[4:0], 1'b1};
                            rd_col <= wr_col << 1;
                        end
                        4: begin
                            rd_row <= {wr_row[4:0], 1'b1};
                            rd_col <= {wr_col[4:0], 1'b1};
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
    always @(posedge clk or posedge reset) begin  // write coord control
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
                    if(idx == 0)
                        {wr_row[4:0], wr_col[4:0]} <= {wr_row[4:0], wr_col[4:0]} + 1;
                end
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin  // data to be saved
        if(reset)
            cdata_wr <= 0;
        else begin
            case (cs)
                CONV: begin  // rounding
                    if(rounding)
                        cdata_wr <= (part_sum[15] == 1) ? part_sum[35:16] + bias + 1 : part_sum[35:16] + bias;
                end
                RELU: begin  // ReLU operation
                    if(cdata_rd > 0)
                        cdata_wr <= cdata_rd;
                    else
                        cdata_wr <= 0;
                end
                POOL: begin  // pooling
                    if(cwr)
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
    always @(posedge clk or posedge reset) begin  // kernel weights
        if(reset)
            weight <= 0;
        else begin
            case (cs)
                CONV: begin
                    case (idx)
                        0: weight <= (!top && !left)     ? w_11 : 0;
                        1: weight <= (!top)              ? w_12 : 0;
                        2: weight <= (!top && !right)    ? w_13 : 0;
                        3: weight <= (!left)             ? w_21 : 0;
                        4: weight <=                       w_22;
                        5: weight <= (!right)            ? w_23 : 0;
                        6: weight <= (!bottom && !left)  ? w_31 : 0;
                        7: weight <= (!bottom)           ? w_32 : 0;
                        8: weight <= (!bottom && !right) ? w_33 : 0;
                        default: weight <= 0;
                    endcase
                end
                default:
                    weight <= 0;
            endcase
        end
    end
    always @(posedge clk or posedge reset) begin  // get image data
        if(reset) begin
            iaddr <= 0;
        end else begin
            case (cs)
                CONV: begin
                    case (idx)
                        0: if(!top && !left)     iaddr <= {wr_row - 6'd1, wr_col - 6'd1};
                        1: if(!top)              iaddr <= {wr_row - 6'd1, wr_col};
                        2: if(!top && !right)    iaddr <= {wr_row - 6'd1, wr_col + 6'd1};
                        3: if(!left)             iaddr <= {wr_row, wr_col - 6'd1};
                        4: /* center */          iaddr <= {wr_row, wr_col};
                        5: if(!right)            iaddr <= {wr_row, wr_col + 6'd1};
                        6: if(!bottom && !left)  iaddr <= {wr_row + 6'd1, wr_col - 6'd1};
                        7: if(!bottom)           iaddr <= {wr_row + 6'd1, wr_col};
                        8: if(!bottom && !right) iaddr <= {wr_row + 6'd1, wr_col + 6'd1};
                    endcase
                end
                default:
                    iaddr <= 0;
            endcase
        end
    end

    always @(posedge clk or posedge reset) begin  // tmp save multiplied num
        if(reset)
            part_sum <= 0;
        else begin
            case (cs)
                CONV: begin
                    if(done)
                        part_sum <= 0;
                    else if(!rounding)
                        part_sum <= part_sum + (idata * weight);
                end
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
                POOL: begin
                    if(idx == 5)
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
            busy <= false;
        else begin
            case (cs)
                IDLE: begin
                    if(ready)
                        busy <= true;
                    else
                        busy <= false;
                end
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
                default:
                    done <= false;
            endcase
        end
    end

endmodule
