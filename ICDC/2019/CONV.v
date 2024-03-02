`timescale 1ns/10ps
module CONV (
    input clk,
    input reset,

    input ready,
    output reg busy,

    input signed [19:0] idata,
    output reg [11:0] iaddr,

    output reg cwr,
    output reg crd,
    output reg [2:0] csel,

    output [11:0] caddr_wr,
    output [11:0] caddr_rd,

    input signed [19:0] cdata_rd,
    output reg signed [19:0] cdata_wr
);

    // parameter true = 1;
    // parameter false = 0;

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

    // Outputs comb
    reg nxt_busy;
    reg [11:0] nxt_iaddr;
    reg nxt_cwr, nxt_crd;
    reg [2:0] nxt_csel;
    reg signed [19:0] nxt_cdata_wr;

    // State
    reg [2:0] cs, ns;

    // Coords
    reg [5:0] wr_row, wr_col, nxt_wr_row, nxt_wr_col;
    reg [5:0] rd_row, rd_col, nxt_rd_row, nxt_rd_col;

    // Convolution
    reg signed [19:0] weight, nxt_weight;
    reg signed [39:0] part_sum, nxt_part_sum;
    wire top, bottom, left, right;

    // Others
    reg [3:0] idx, nxt_idx;
    reg done, nxt_done;
    reg rounding, nxt_rounding;
    wire last_mult;

    // Wires assignation
    assign caddr_wr = (cs != POOL) ? {wr_row, wr_col} : {2'b00, wr_row[4:0], wr_col[4:0]};
    assign caddr_rd = {rd_row, rd_col};

    assign last_mult = (idx == 9) ? 1 : 0;
    assign top = (wr_row == 0) ? 1 : 0;
    assign bottom = (wr_row == 63) ? 1 : 0;
    assign left = (wr_col == 0) ? 1 : 0;
    assign right = (wr_col == 63) ? 1 : 0;


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
        else
            csel <= nxt_csel;
    end
    always @(*) begin
        case (cs)
            CONV:
                nxt_csel = 3'b001;
            RELU:
                nxt_csel = 3'b001;
            POOL: begin
                if(idx == 5)
                    nxt_csel = 3'b011;  // saving after pooling
                else
                    nxt_csel = 3'b001;  // reading orig fmap
            end
            default:
                nxt_csel = 0;
        endcase
    end

    always @(posedge clk or posedge reset) begin  // write-out
        if(reset)
            cwr <= 0;
        else
            cwr <= nxt_cwr;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                if(rounding)
                    nxt_cwr = 1;
                else
                    nxt_cwr = 0;
            end
            RELU: begin
                if(ns == POOL)
                    nxt_cwr = 0;
                else
                    nxt_cwr = 1;
            end
            POOL: begin
                if(idx == 5)
                    nxt_cwr = 1;
                else
                    nxt_cwr = 0;
            end
            default:
                nxt_cwr = 0;
        endcase
    end

    always @(posedge clk or posedge reset) begin  // read-in
        if(reset)
            crd <= 0;
        else
            crd <= nxt_crd;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                if(ns == RELU)
                    nxt_crd = 1;
                else
                    nxt_crd = crd;
            end
            RELU: begin
                if(caddr_rd == 4095)
                    nxt_crd = 0;
                else
                    nxt_crd = 1;
            end
            POOL: begin
                if(idx == 1 || idx == 2 || idx == 3 || idx == 4)
                    nxt_crd = 1;
                else
                    nxt_crd = 0;
            end
            default:
                nxt_crd = 0;
        endcase
    end

    always @(posedge clk or posedge reset) begin  // read coord control
        if(reset) begin
            rd_row <= 0;
            rd_col <= 0;
        end else begin
            rd_row <= nxt_rd_row;
            rd_col <= nxt_rd_col;
        end
    end
    always @(*) begin
        case (cs)
            RELU:
                {nxt_rd_row, nxt_rd_col} = {rd_row, rd_col} + 1;
            POOL: begin
                case (idx)
                    1: begin
                        nxt_rd_row = wr_row << 1;
                        nxt_rd_col = wr_col << 1;
                    end
                    2: begin
                        nxt_rd_row = wr_row << 1;
                        nxt_rd_col = {wr_col[4:0], 1'b1};  // same as "(wr_col << 1) + 1"
                    end
                    3: begin
                        nxt_rd_row = {wr_row[4:0], 1'b1};
                        nxt_rd_col = wr_col << 1;
                    end
                    4: begin
                        nxt_rd_row = {wr_row[4:0], 1'b1};
                        nxt_rd_col = {wr_col[4:0], 1'b1};
                    end
                    default: begin
                        nxt_rd_row = rd_row;
                        nxt_rd_col = rd_col;
                    end
                endcase
            end
            OUTPUT: begin
                nxt_rd_row = 0;
                nxt_rd_col = 0;
            end
            default: begin
                nxt_rd_row = rd_row;
                nxt_rd_col = rd_col;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin  // write coord control
        if(reset) begin
            wr_row <= 0;
            wr_col <= 0;
        end else begin
            wr_row <= nxt_wr_row;
            wr_col <= nxt_wr_col;
        end
    end
    always @(*) begin
        case (cs)
            CONV: begin
                if(done)
                    {nxt_wr_row, nxt_wr_col} = {wr_row, wr_col} + 1;
                else
                    {nxt_wr_row, nxt_wr_col} = {wr_row, wr_col};
            end
            RELU: begin
                nxt_wr_row = rd_row;
                nxt_wr_col = rd_col;
            end
            POOL: begin
                if(idx == 0)
                    {nxt_wr_row[4:0], nxt_wr_col[4:0]} = {wr_row[4:0], wr_col[4:0]} + 1;
                else
                    {nxt_wr_row, nxt_wr_col} = {wr_row, wr_col};
            end
            default: begin
                nxt_wr_row = rd_row;
                nxt_wr_col = rd_col;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin  // data to be saved
        if(reset)
            cdata_wr <= 0;
        else
            cdata_wr <= nxt_cdata_wr;
    end
    always @(*) begin
        case (cs)
            CONV: begin  // rounding
                if(rounding) begin
                    if(part_sum[15])
                        nxt_cdata_wr = part_sum[35:16] + (bias + 1);
                    else
                        nxt_cdata_wr = part_sum[35:16] + bias;
                end else
                    nxt_cdata_wr = cdata_wr;
            end
            RELU: begin  // ReLU operation
                if(cdata_rd > 0)
                    nxt_cdata_wr = cdata_rd;
                else
                    nxt_cdata_wr = 0;
            end
            POOL: begin  // pooling
                if(cwr || idx == 1)
                    nxt_cdata_wr = 0;
                else if(cdata_rd > cdata_wr)
                    nxt_cdata_wr = cdata_rd;
                else
                    nxt_cdata_wr = cdata_wr;
            end
            OUTPUT:
                nxt_cdata_wr = 0;
            default:
                nxt_cdata_wr = cdata_wr;
        endcase
    end


    // Convolution
    always @(posedge clk or posedge reset) begin  // kernel weights
        if(reset)
            weight <= 0;
        else
            weight <= nxt_weight;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                case (idx)
                    0: nxt_weight = (!top && !left)     ? w_11 : 0;
                    1: nxt_weight = (!top)              ? w_12 : 0;
                    2: nxt_weight = (!top && !right)    ? w_13 : 0;
                    3: nxt_weight = (!left)             ? w_21 : 0;
                    4: nxt_weight =                       w_22;
                    5: nxt_weight = (!right)            ? w_23 : 0;
                    6: nxt_weight = (!bottom && !left)  ? w_31 : 0;
                    7: nxt_weight = (!bottom)           ? w_32 : 0;
                    8: nxt_weight = (!bottom && !right) ? w_33 : 0;
                    default: nxt_weight = 0;
                endcase
            end
            default:
                nxt_weight = 0;
        endcase
    end

    always @(posedge clk or posedge reset) begin  // get image data
        if(reset)
            iaddr <= 0;
        else
            iaddr <= nxt_iaddr;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                case (idx)
                    0: nxt_iaddr = (!top && !left)     ? {wr_row - 6'd1, wr_col - 6'd1} : iaddr;
                    1: nxt_iaddr = (!top)              ? {wr_row - 6'd1, wr_col} : iaddr;
                    2: nxt_iaddr = (!top && !right)    ? {wr_row - 6'd1, wr_col + 6'd1} : iaddr;
                    3: nxt_iaddr = (!left)             ? {wr_row, wr_col - 6'd1} : iaddr;
                    4: nxt_iaddr = /* center */          {wr_row, wr_col};
                    5: nxt_iaddr = (!right)            ? {wr_row, wr_col + 6'd1} : iaddr;
                    6: nxt_iaddr = (!bottom && !left)  ? {wr_row + 6'd1, wr_col - 6'd1} : iaddr;
                    7: nxt_iaddr = (!bottom)           ? {wr_row + 6'd1, wr_col} : iaddr;
                    8: nxt_iaddr = (!bottom && !right) ? {wr_row + 6'd1, wr_col + 6'd1} : iaddr;
                    default: nxt_iaddr = iaddr;
                endcase
            end
            default:
                nxt_iaddr = 0;
        endcase
    end

    always @(posedge clk or posedge reset) begin  // tmp save multiplied num
        if(reset)
            part_sum <= 0;
        else
            part_sum <= nxt_part_sum;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                if(done)
                    nxt_part_sum = 0;
                else if(!rounding)
                    nxt_part_sum = part_sum + (idata * weight);
                else
                    nxt_part_sum = part_sum;
            end
            default:
                nxt_part_sum = 0;
        endcase
    end


    // index control
    always @(posedge clk or posedge reset) begin
        if(reset)
            idx <= 0;
        else
            idx <= nxt_idx;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                if(done)
                    nxt_idx = 0;
                else
                    nxt_idx = idx + 1;
            end
            RELU: begin
                if(ns == POOL)
                    nxt_idx = 1;
                else
                    nxt_idx = idx;
            end
            POOL: begin
                if(idx == 5)
                    nxt_idx = 0;
                else
                    nxt_idx = idx + 1;
            end
            default:
                nxt_idx = 0;
        endcase
    end


    // "busy" signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            busy <= 0;
        else
            busy <= nxt_busy;
    end
    always @(*) begin
        case (cs)
            IDLE: begin
                if(ready)
                    nxt_busy = 1;
                else
                    nxt_busy = 0;
            end
            OUTPUT:
                nxt_busy = 0;
            default:
                nxt_busy = busy;
        endcase
    end


    // "rounding" signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            rounding <= 0;
        else
            rounding <= nxt_rounding;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                // finish 9 mult-sum, do rounding
                if(rounding)
                    nxt_rounding = 0;
                else if(last_mult)
                    nxt_rounding = 1;
                else
                    nxt_rounding = rounding;
            end
            default:
                nxt_rounding = 0;
        endcase
    end

    // "done" signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            done <= 0;
        else
            done <= nxt_done;
    end
    always @(*) begin
        case (cs)
            CONV: begin
                if(rounding)
                    nxt_done = 1;
                else
                    nxt_done = 0;
            end
            default:
                nxt_done = 0;
        endcase
    end

endmodule
