//EEGuizhi  (Behavior sim Wrong) (Unfinished)
module JAM (
    input CLK,
    input RST,
    output reg [2:0] W,
    output reg [2:0] J,
    input [6:0] Cost,
    output reg [3:0] MatchCount,
    output reg [9:0] MinCost,
    output reg Valid );


    parameter INPUT = 0;
    parameter CALC = 1;
    parameter SWAP = 2;
    parameter OUTPUT = 3;

    reg [1:0] state;  // 0:input  1:calc  2:output  3:none
    reg [6:0] cost_data [0:7][0:7];  // Workers對應Jobs的工作成本表格
    reg [9:0] TotalCost;
    reg [2:0] adding_ptr;

    parameter FIND_SWAP_POINT = 0;
    parameter FIND_SWAP_VALUE = 1;
    parameter SWITCHING = 2;
    parameter FINISH = 3;

    reg [1:0] swap_state;
    reg [2:0] swap_ptr;  // 交換點 pointer
    reg [2:0] ptr_saver;  // 儲存需要用的位置
    reg [2:0] ptr;
    reg [2:0] job [0:7];  // 第n個Worker的Job = job[n]
    reg [2:0] next_job [0:7];
    reg Done;

    wire [3:0] swap_ptr_plus8;

    assign swap_ptr_plus8 = swap_ptr + 8;


    // Calculate the sum
    // always @(*) begin
    //     next_TotalCost[0]   = cost_data[0][job[0]]
    //                         + cost_data[1][job[1]]
    //                         + cost_data[2][job[2]]
    //                         + cost_data[3][job[3]];

    //     next_TotalCost[1]   = cost_data[4][job[4]]
    //                         + cost_data[5][job[5]]
    //                         + cost_data[6][job[6]]
    //                         + cost_data[7][job[7]];
    // end


    // Jobs assignment 字典序演算法(方法提供by題目)
    always @(posedge CLK) begin
        if(RST) begin
            swap_state <= FINISH;
            adding_ptr <= 0;
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
                        TotalCost <= 0;
                        swap_state <= FIND_SWAP_VALUE;
                    end
                    else begin
                        ptr <= ptr - 1;
                        if(job[ptr] > job[ptr_saver]) begin  // find max value
                            ptr_saver <= ptr;
                        end
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
                        if(adding_ptr < swap_ptr) begin
                            TotalCost <= TotalCost + cost_data[adding_ptr][job[adding_ptr]];
                            adding_ptr <= adding_ptr + 1;
                        end
                    end
                    else if(adding_ptr < swap_ptr) begin
                        TotalCost <= TotalCost + cost_data[adding_ptr][job[adding_ptr]];
                        adding_ptr <= adding_ptr + 1;
                    end
                    else begin
                        job[swap_ptr] <= job[ptr_saver];  // swap
                        job[ptr_saver] <= job[swap_ptr];
                        swap_state <= SWITCHING;
                        
                        ptr <= 7;
                        ptr_saver <= swap_ptr_plus8[3:1];  // (swap_ptr + 8) / 2

                        if(swap_ptr_plus8[0] == 0) begin
                            TotalCost <= TotalCost + cost_data[swap_ptr][job[ptr_saver]] + cost_data[swap_ptr_plus8[3:1]][job[swap_ptr_plus8[3:1]]];
                        end
                        else begin
                            TotalCost <= TotalCost + cost_data[swap_ptr][job[ptr_saver]];
                        end
                    end
                end
                SWITCHING: begin
                    if(ptr > ptr_saver) begin
                        job[ptr] <= job[swap_ptr_plus8 - ptr];  // swap
                        job[swap_ptr_plus8 - ptr] <= job[ptr];
                        ptr <= ptr - 1;

                        // summing
                        TotalCost <= TotalCost + cost_data[ptr][job[swap_ptr_plus8 - ptr]] + cost_data[swap_ptr_plus8 - ptr][job[ptr]];
                    end
                    else begin
                        swap_state <= FINISH;
                    end
                end
                FINISH: begin
                    if(state == CALC) begin
                        swap_state <= FIND_SWAP_POINT;
                        adding_ptr <= 0;
                        swap_ptr <= 7;
                        ptr_saver <= 7;
                        ptr <= 7;
                    end
                end
            endcase
        end
    end


    always @(posedge CLK) begin
        if(RST) begin  // reset
            W <= 0;
            J <= 0;
            state <= INPUT;
            MinCost <= 1023;
        end
        else begin
            case (state)
                INPUT: begin
                    if(W == 7 && J == 7) begin
                        J <= 0;
                        W <= 0;
                        state <= CALC;  // next state
                    end
                    else if(J == 7) begin
                        W <= W + 1;
                        J <= 0;
                    end
                    else begin
                        J <= J + 1;
                    end   
                end
                CALC: begin
                    // MinCost, MatchCount
                    if(TotalCost < MinCost) begin  // smaller
                        MinCost <= TotalCost;
                        MatchCount <= 1;
                    end
                    else if(TotalCost == MinCost) begin  // equal
                        MatchCount <= MatchCount + 1;
                    end

                    if(Done) begin
                        state <= OUTPUT;  // next state
                    end
                    else begin
                        state <= SWAP;  // switch the jobs
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
        case (state)
            INPUT: begin
                Valid <= 0;
                cost_data[W][J] <= Cost;
            end
            OUTPUT: begin
                Valid <= 1;
            end
        endcase
    end

endmodule
