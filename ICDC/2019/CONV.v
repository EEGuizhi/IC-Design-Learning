`timescale 1ns/10ps
module CONV (
    input clk,
    input reset,

    input      ready,
    output reg busy,

    input signed [19:0] idata,
    output reg   [11:0] iaddr,

    output reg       cwr,
    output reg       crd,
    output reg [2:0] csel,

    output     [11:0] caddr_wr,
    output     [11:0] caddr_rd,

    input      [19:0] cdata_rd,
    output reg [19:0] cdata_wr
);

    // parameter true = 1;
    // parameter false = 0;

    // States
    parameter IDLE = 0;
    parameter CONV = 1;
    parameter RELU = 2;
    parameter POOL = 3;
    parameter OUTPUT = 4;

    // Kernel weights & bias settings
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

    // Outputs comb
    reg busy_nxt;
    reg [11:0] iaddr_nxt;
    reg cwr_nxt, crd_nxt;
    reg [2:0] csel_nxt;
    reg signed [19:0] cdata_wr_nxt;

    // State
    reg [2:0] cs, ns;

    // Coords
    reg [5:0] wr_row, wr_col, wr_row_nxt, wr_col_nxt;
    reg [5:0] rd_row, rd_col, rd_row_nxt, rd_col_nxt;

    // Convolution
    reg signed [19:0] weight, weight_nxt;
    reg signed [19:0] FIFO, FIFO_nxt;
    reg signed [39:0] mult, mult_nxt;
    reg signed [39:0] part_sum, part_sum_nxt;
    wire top, bottom, left, right, rounding;

    // Others
    reg [3:0] idx, idx_nxt;
    reg done, done_nxt;


    // Wires assignation
    assign caddr_wr = (cs != POOL) ? {wr_row, wr_col} : {2'b00, wr_row[4:0], wr_col[4:0]};
    assign caddr_rd = {rd_row, rd_col};

    assign top = (wr_row == 0) ? 1 : 0;  // window on the top (CONV state)
    assign bottom = (wr_row == 63) ? 1 : 0;
    assign left = (wr_col == 0) ? 1 : 0;
    assign right = (wr_col == 63) ? 1 : 0;

    assign rounding = (idx == 12) ? 1 : 0;  // round the sum (CONV state)


    // Sequential
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            cs <= IDLE;
            csel <= 0;
            cwr <= 0;
            crd <= 0;

            rd_row <= 0;
            rd_col <= 0;
            wr_row <= 0;
            wr_col <= 0;

            cdata_wr <= 0;
            weight <= 0;
            iaddr <= 0;
            FIFO <= 0;
            mult <= 0;
            part_sum <= 0;

            idx <= 0;
            busy <= 0;
            done <= 0;
        end else begin
            cs <= ns;
            csel <= csel_nxt;
            cwr <= cwr_nxt;
            crd <= crd_nxt;

            rd_row <= rd_row_nxt;
            rd_col <= rd_col_nxt;
            wr_row <= wr_row_nxt;
            wr_col <= wr_col_nxt;

            cdata_wr <= cdata_wr_nxt;
            weight <= weight_nxt;
            iaddr <= iaddr_nxt;
            FIFO <= FIFO_nxt;
            mult <= mult_nxt;
            part_sum <= part_sum_nxt;

            idx <= idx_nxt;
            busy <= busy_nxt;
            done <= done_nxt;
        end
    end


    // FSM
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
    always @(*) begin  // MEM select
        case (cs)
            CONV:
                csel_nxt = 3'b001;
            RELU:
                csel_nxt = 3'b001;
            POOL: begin
                if(idx == 5)
                    csel_nxt = 3'b011;  // saving after pooling
                else
                    csel_nxt = 3'b001;  // reading orig fmap
            end
            default:
                csel_nxt = 0;
        endcase
    end
    always @(*) begin  // write-out
        case (cs)
            CONV: begin
                if(rounding)
                    cwr_nxt = 1;
                else
                    cwr_nxt = 0;
            end
            RELU: begin
                if(ns == POOL)
                    cwr_nxt = 0;
                else
                    cwr_nxt = 1;
            end
            POOL: begin
                if(idx == 5)
                    cwr_nxt = 1;
                else
                    cwr_nxt = 0;
            end
            default:
                cwr_nxt = 0;
        endcase
    end
    always @(*) begin  // read-in
        case (cs)
            CONV: begin
                if(ns == RELU)
                    crd_nxt = 1;
                else
                    crd_nxt = crd;
            end
            RELU: begin
                if(caddr_rd == 4095)
                    crd_nxt = 0;
                else
                    crd_nxt = 1;
            end
            POOL: begin
                if(idx == 1 || idx == 2 || idx == 3 || idx == 4)
                    crd_nxt = 1;
                else
                    crd_nxt = 0;
            end
            default:
                crd_nxt = 0;
        endcase
    end

    always @(*) begin  // data reading's coord control
        case (cs)
            RELU:
                {rd_row_nxt, rd_col_nxt} = {rd_row, rd_col} + 1;
            POOL: begin
                case (idx)
                    1: begin
                        rd_row_nxt = wr_row << 1;
                        rd_col_nxt = wr_col << 1;
                    end
                    2: begin
                        rd_row_nxt = wr_row << 1;
                        rd_col_nxt = {wr_col[4:0], 1'b1};  // same as "(wr_col << 1) + 1"
                    end
                    3: begin
                        rd_row_nxt = {wr_row[4:0], 1'b1};
                        rd_col_nxt = wr_col << 1;
                    end
                    4: begin
                        rd_row_nxt = {wr_row[4:0], 1'b1};
                        rd_col_nxt = {wr_col[4:0], 1'b1};
                    end
                    default: begin
                        rd_row_nxt = rd_row;
                        rd_col_nxt = rd_col;
                    end
                endcase
            end
            OUTPUT: begin
                rd_row_nxt = 0;
                rd_col_nxt = 0;
            end
            default: begin
                rd_row_nxt = rd_row;
                rd_col_nxt = rd_col;
            end
        endcase
    end
    always @(*) begin  // data writing's coord control
        case (cs)
            CONV: begin
                if(done)
                    {wr_row_nxt, wr_col_nxt} = {wr_row, wr_col} + 1;
                else
                    {wr_row_nxt, wr_col_nxt} = {wr_row, wr_col};
            end
            RELU: begin
                wr_row_nxt = rd_row;
                wr_col_nxt = rd_col;
            end
            POOL: begin
                if(idx == 0)
                    {wr_row_nxt[4:0], wr_col_nxt[4:0]} = {wr_row[4:0], wr_col[4:0]} + 1;
                else
                    {wr_row_nxt, wr_col_nxt} = {wr_row, wr_col};
            end
            default: begin
                wr_row_nxt = rd_row;
                wr_col_nxt = rd_col;
            end
        endcase
    end

    always @(*) begin  // data to be saved
        case (cs)
            CONV: begin  // rounding
                if(rounding) begin
                    if(part_sum[15])
                        cdata_wr_nxt = part_sum[35:16] + (bias + 1);
                    else
                        cdata_wr_nxt = part_sum[35:16] + bias;
                end else
                    cdata_wr_nxt = cdata_wr;
            end
            RELU: begin  // ReLU operation
                if(cdata_rd[19] == 0)  // positive
                    cdata_wr_nxt = cdata_rd;
                else
                    cdata_wr_nxt = 0;
            end
            POOL: begin  // pooling
                if(idx == 0 || idx == 1)
                    cdata_wr_nxt = 0;
                else if(cdata_rd > cdata_wr)
                    cdata_wr_nxt = cdata_rd;
                else
                    cdata_wr_nxt = cdata_wr;
            end
            OUTPUT:
                cdata_wr_nxt = 0;
            default:
                cdata_wr_nxt = cdata_wr;
        endcase
    end


    // Convolution
    always @(*) begin  // kernel weights
        case (cs)
            CONV: begin
                case (idx)
                    1: weight_nxt = (!top && !left)     ? w_11 : 0;
                    2: weight_nxt = (!top)              ? w_12 : 0;
                    3: weight_nxt = (!top && !right)    ? w_13 : 0;
                    4: weight_nxt = (!left)             ? w_21 : 0;
                    5: weight_nxt =                       w_22;
                    6: weight_nxt = (!right)            ? w_23 : 0;
                    7: weight_nxt = (!bottom && !left)  ? w_31 : 0;
                    8: weight_nxt = (!bottom)           ? w_32 : 0;
                    9: weight_nxt = (!bottom && !right) ? w_33 : 0;
                    default: weight_nxt = 0;
                endcase
            end
            default:
                weight_nxt = 0;
        endcase
    end
    always @(*) begin  // get image data
        case (cs)
            CONV: begin
                case (idx)
                    0: iaddr_nxt = (!top && !left)     ? {wr_row - 6'd1, wr_col - 6'd1} : iaddr;
                    1: iaddr_nxt = (!top)              ? {wr_row - 6'd1, wr_col} : iaddr;
                    2: iaddr_nxt = (!top && !right)    ? {wr_row - 6'd1, wr_col + 6'd1} : iaddr;
                    3: iaddr_nxt = (!left)             ? {wr_row, wr_col - 6'd1} : iaddr;
                    4: iaddr_nxt = /*center*/            {wr_row, wr_col};
                    5: iaddr_nxt = (!right)            ? {wr_row, wr_col + 6'd1} : iaddr;
                    6: iaddr_nxt = (!bottom && !left)  ? {wr_row + 6'd1, wr_col - 6'd1} : iaddr;
                    7: iaddr_nxt = (!bottom)           ? {wr_row + 6'd1, wr_col} : iaddr;
                    8: iaddr_nxt = (!bottom && !right) ? {wr_row + 6'd1, wr_col + 6'd1} : iaddr;
                    default: iaddr_nxt = iaddr;
                endcase
            end
            default:
                iaddr_nxt = 0;
        endcase
    end
    always @(*) begin  // multiplier
        case (cs)
            CONV:
                mult_nxt = FIFO * weight;
            default:
                mult_nxt = 0;
        endcase
    end
    always @(*) begin
        case (cs)
            CONV:
                FIFO_nxt = idata;
            default:
                FIFO_nxt = 0;
        endcase
    end
    always @(*) begin  // tmp save multiplied num
        case (cs)
            CONV: begin
                if(done)
                    part_sum_nxt = 0;
                else if(!rounding)
                    part_sum_nxt = mult + part_sum;  // mult-add
                else
                    part_sum_nxt = part_sum;
            end
            default:
                part_sum_nxt = 0;
        endcase
    end


    // index control
    always @(*) begin
        case (cs)
            CONV: begin
                if(done)
                    idx_nxt = 0;
                else
                    idx_nxt = idx + 1;
            end
            RELU: begin
                if(ns == POOL)
                    idx_nxt = 1;
                else
                    idx_nxt = idx;
            end
            POOL: begin
                if(idx == 5)
                    idx_nxt = 0;
                else
                    idx_nxt = idx + 1;
            end
            default:
                idx_nxt = 0;
        endcase
    end

    // "busy" signal control
    always @(*) begin
        case (cs)
            IDLE: begin
                if(ready)
                    busy_nxt = 1;
                else
                    busy_nxt = 0;
            end
            OUTPUT:
                busy_nxt = 0;
            default:
                busy_nxt = busy;
        endcase
    end

    // "done" signal control
    always @(*) begin
        case (cs)
            CONV: begin
                if(rounding)
                    done_nxt = 1;
                else
                    done_nxt = 0;
            end
            default:
                done_nxt = 0;
        endcase
    end

endmodule
