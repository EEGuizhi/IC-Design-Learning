module JAM (
    input CLK,
    input RST,
    output [2:0] W,
    output [2:0] J,
    input [6:0] Cost,
    output reg [3:0] MatchCount,
    output reg [9:0] MinCost,
    output reg Valid );


    parameter READ = 0;
    parameter CALC = 1;
    parameter SWAP = 2;
    parameter OUTPUT = 3;
    reg [1:0] state;

    parameter FIND_SWAP_POINT = 0;
    parameter FIND_SWAP_VALUE = 1;
    parameter SWITCHING = 2;
    parameter FINISH = 3;
    reg [1:0] swap_state;

    reg [2:0] swap_ptr;  // 交換點(swap point)的位置
    wire [2:0] next_swap_ptr;
    reg [2:0] ptr_saver;  // 暫存需要用的位置
    reg [2:0] ptr;
    reg [2:0] sum_ptr;  // 需要相加的位置
    reg sum_flag;  // 紀錄sum_ptr是否走過0~7
    reg Done;

    reg [2:0] job [0:7];
    reg [9:0] TotalCost;

    assign W = sum_ptr;
    assign J = job[sum_ptr];
    assign next_swap_ptr =  (job[6] < job[7]) ? 6 :
                            (job[5] < job[6]) ? 5 :
                            (job[4] < job[5]) ? 4 :
                            (job[3] < job[4]) ? 3 :
                            (job[2] < job[3]) ? 2 :
                            (job[1] < job[2]) ? 1 :
                            (job[0] < job[1]) ? 0 : 7;

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
                FIND_SWAP_POINT: begin  // 找尋 swap point
                end
                FIND_SWAP_VALUE: begin  // 找尋要跟 swap point 交換的數值
                    if(ptr != 0) begin  // swap point 右半邊全部走過一遍
                        if(job[swap_ptr] < job[ptr] && job[ptr] < job[ptr_saver]) begin  // get swap value
                            ptr_saver <= ptr;
                        end
                        ptr <= ptr + 1;
                    end
                    else begin
                        job[swap_ptr] <= job[ptr_saver];  // swap value in swap point
                        job[ptr_saver] <= job[swap_ptr];
                        ptr_saver <= (8 + swap_ptr) >> 1;  // 取中點 = (swap_ptr + 8) / 2
                        ptr <= 7;

                        swap_state <= SWITCHING;  // next state
                    end
                end
                SWITCHING: begin  // 交換其他數值
                    if(ptr > ptr_saver) begin
                        job[ptr] <= job[swap_ptr + 8 - ptr];  // swap
                        job[swap_ptr + 8 - ptr] <= job[ptr];
                        ptr <= ptr - 1;
                    end
                    else if(sum_ptr == 0) begin  // wait
                        swap_state <= FINISH;
                    end
                end
                FINISH: begin  // 結束交換 等待下一輪
                    if(state == CALC) begin
                        if(next_swap_ptr == 7) begin  // swap point not found = finish all
                            Done <= 1;
                            swap_state <= FINISH;
                        end
                        else begin
                            swap_ptr <= next_swap_ptr;
                            ptr_saver <= next_swap_ptr + 1;
                            ptr <= next_swap_ptr + 2;
                            swap_state <= FIND_SWAP_VALUE;  // next state
                        end
                    end
                end
            endcase
        end
    end


    // Summing (為了節省cycle 在交換的同時就將部分數值加好)
    always @(posedge CLK) begin
        if(RST) begin
            TotalCost <= 0;
            sum_ptr <= 0;
            sum_flag <= 0;
        end
        else begin
            case (swap_state)
                FIND_SWAP_POINT: begin
                end
                FIND_SWAP_VALUE: begin
                    if(sum_ptr < swap_ptr) begin
                        TotalCost <= TotalCost + Cost;
                        sum_ptr <= sum_ptr + 1;
                    end
                end
                SWITCHING: begin
                    if(sum_ptr != 0 || sum_flag == 0) begin
                        sum_flag <= 1;
                        TotalCost <= TotalCost + Cost;
                        sum_ptr <= sum_ptr + 1;
                    end
                    else begin
                        sum_flag <= 0;
                    end
                end
                FINISH: begin
                    if(state == READ) begin
                        TotalCost <= TotalCost + Cost;
                        sum_ptr <= sum_ptr + 1;
                    end
                    else begin
                        TotalCost <= 0;
                        sum_ptr <= 0;
                    end
                end
            endcase
        end
    end


    // State control & calc
    always @(posedge CLK) begin
        if(RST) begin  // reset
            Valid <= 0;
            MinCost <= 1023;
            state <= READ;
        end
        else begin
            case (state)
                READ: begin  // read initial costs
                    if(W == 7) begin
                        state <= CALC;  // next state
                    end
                end
                CALC: begin
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
                    if(sum_ptr == 0 && sum_flag == 1 || swap_state == FINISH) begin
                        state <= CALC;
                    end
                end
                OUTPUT: begin
                    Valid <= 1;
                    state <= OUTPUT;
                end
            endcase
        end
    end


endmodule
