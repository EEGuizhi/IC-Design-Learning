//EEGuizhi  (Behavior sim Correct)
module JAM (
    input CLK,
    input RST,
    output reg [2:0] W,
    output reg [2:0] J,
    input [6:0] Cost,
    output reg [3:0] MatchCount,
    output reg [9:0] MinCost,
    output reg Valid );


    parameter READ = 0;
    parameter CALC = 1;
    parameter SWAP = 2;
    parameter OUTPUT = 3;

    reg [1:0] state;  // 0:input  1:calc  2:output  3:none
    reg [6:0] cost_data [0:7];
    wire [9:0] TotalCost;

    assign TotalCost    = cost_data[0] + cost_data[1] + cost_data[2] + cost_data[3]
                        + cost_data[4] + cost_data[5] + cost_data[6] + cost_data[7];

    parameter FIND_SWAP_POINT = 0;
    parameter FIND_SWAP_VALUE = 1;
    parameter SWITCHING = 2;
    parameter FINISH = 3;

    reg [1:0] swap_state;
    reg [2:0] swap_ptr;  // 交換點 pointer
    reg [2:0] ptr_saver;  // 儲存需要用的位置
    reg [2:0] ptr;
    reg [2:0] job [0:7];  // 第n個Worker的Job = job[n]
    reg Done;
    reg tmp;


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
                    end
                    else if(state == SWAP) begin
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
                    else begin
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


    always @(posedge CLK) begin
        if(RST) begin  // reset
            W <= 0;
            J <= 0;  // = job[0]
            tmp <= 0;
            state <= READ;
            MinCost <= 1023;
        end
        else begin
            case (state)
                READ: begin  // Calculate the sum
                    if(W == 7) begin
                        state <= CALC;  // next state
                    end
                    else begin
                        W <= W + 1;
                        J <= job[W + 1];
                    end
                end
                CALC: begin
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
                        state <= SWAP;  // switch jobs
                    end
                end
                SWAP: begin
                    if(swap_state == FINISH) begin
                        state <= READ;
                        W <= 0;
                        J <= job[0];
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
            READ: begin
                Valid <= 0;
            end
            OUTPUT: begin
                Valid <= 1;
            end
        endcase
    end

endmodule
