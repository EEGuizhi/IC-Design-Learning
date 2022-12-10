//EEGuizhi  (Behavior sim Correct) (介於ver3與ver4間的設計 約360000 cycles)
module JAM (
    input CLK,
    input RST,
    output [2:0] W,
    output [2:0] J,
    input [6:0] Cost,
    output reg [3:0] MatchCount,
    output reg [9:0] MinCost,
    output reg Valid );

    parameter INIT = 0;
    parameter CALC = 1;
    parameter SWAP = 2;
    parameter OUTPUT = 3;
    reg [1:0] state;

    parameter FIND_SWAP_POINT = 0;
    parameter FIND_SWAP_VALUE = 1;
    parameter SWITCHING = 2;
    parameter FINISH = 3;
    reg [1:0] swap_state;

    reg [6:0] cost_data [0:7];  // 暫存Workers對應Jobs的工作成本
    reg [2:0] swap_ptr;  // 交換點 pointer
    reg [2:0] ptr_saver;  // 儲存需要用的位置
    reg [2:0] ptr;
    reg [2:0] job [0:7];  // 第n個Worker的Job = job[n]
    reg Done;

    reg [2:0] sum_ptr;
    reg sum_flag;
    wire [9:0] TotalCost;

    // Calculate the sum
    assign TotalCost    = ((cost_data[0] + cost_data[1])
                        + (cost_data[2] + cost_data[3]))
                        + ((cost_data[4] + cost_data[5])
                        + (cost_data[6] + cost_data[7]));

    assign W = sum_ptr;
    assign J = job[sum_ptr];


    // Jobs assignment 字典序演算法(方法提供by題目)
    always @(posedge CLK) begin
        if(RST) begin
            swap_state <= FINISH;
            Done <= 0;
            
            job[0] <= 0;  // initial jobs
            job[1] <= 1;
            job[2] <= 2;
            job[3] <= 3;
            job[4] <= 4;
            job[5] <= 5;
            job[6] <= 6;
            job[7] <= 7;
        end
        else begin
            case (swap_state)
                FIND_SWAP_POINT: begin
                    if(job[ptr-1] < job[ptr]) begin
                        swap_ptr <= ptr - 1;
                        ptr_saver <= ptr;
                        ptr <= ptr + 1;
                        swap_state <= FIND_SWAP_VALUE;
                    end
                    else begin
                        ptr <= ptr - 1;
                        if(ptr == 1) begin
                            Done <= 1;
                            swap_state <= FINISH;
                        end
                    end
                end
                FIND_SWAP_VALUE: begin
                    if(ptr != 0) begin
                        if(job[swap_ptr] < job[ptr] && job[ptr] < job[ptr_saver]) begin
                            ptr_saver <= ptr;
                        end
                        ptr <= ptr + 1;
                    end
                    else begin
                        job[swap_ptr] <= job[ptr_saver];  // swap
                        job[ptr_saver] <= job[swap_ptr];
                        swap_state <= SWITCHING;
                        ptr <= 7;
                        ptr_saver <= (8 + swap_ptr) >> 1;  // (swap_ptr + 8) / 2
                    end
                end
                SWITCHING: begin
                    if(ptr > ptr_saver) begin
                        job[ptr] <= job[swap_ptr + 8 - ptr];  // swap
                        job[swap_ptr + 8 - ptr] <= job[ptr];
                        ptr <= ptr - 1;
                    end
                    else if(sum_ptr == 0) begin
                        swap_state <= FINISH;
                    end
                end
                FINISH: begin
                    if(state == CALC) begin
                        swap_state <= FIND_SWAP_POINT;
                        swap_ptr <= 7;
                        ptr_saver <= 7;
                        ptr <= 7;
                    end
                end
            endcase
        end
    end


    // Summing
    always @(posedge CLK) begin
        if(RST) begin
            sum_ptr <= 0;
        end
        else begin
            case (swap_state)
                FIND_SWAP_POINT: begin
                    sum_flag <= 0;
                end
                FIND_SWAP_VALUE: begin
                    sum_ptr <= swap_ptr;
                end
                SWITCHING: begin
                    if(sum_ptr != 0 || sum_flag == 0) begin
                        cost_data[sum_ptr] <= Cost;
                        sum_flag <= 1;
                        sum_ptr <= sum_ptr + 1;
                    end
                end
                FINISH: begin
                    if(state == INIT) begin
                        cost_data[sum_ptr] <= Cost;
                        sum_ptr <= sum_ptr + 1;
                    end
                end
            endcase
        end
    end


    always @(posedge CLK) begin
        if(RST) begin  // reset
            MinCost <= 1023;
            state <= INIT;
        end
        else begin
            case (state)
                INIT: begin  // read initial costs
                    if(W == 7) begin
                        state <= CALC;  // next state
                    end
                end
                CALC: begin
                    // MinCost, MatchCount
                    if(Done) begin
                        state <= OUTPUT;  // next state
                    end
                    else begin
                        if(TotalCost < MinCost) begin  // smaller
                            MinCost <= TotalCost;
                            MatchCount <= 1;
                        end
                        else if(TotalCost == MinCost) begin  // equal
                            MatchCount <= MatchCount + 1;
                        end
                        state <= SWAP;  // switch jobs
                    end
                end
                SWAP: begin
                    // Jobs assignment
                    if(swap_state == FINISH) begin
                        state <= CALC;
                    end
                end
                OUTPUT: begin
                    state <= OUTPUT;
                end
            endcase
        end
    end


    always @(negedge CLK) begin
        if(state == OUTPUT) begin
            Valid <= 1;
        end
        else begin
            Valid <= 0;
        end
    end

endmodule
