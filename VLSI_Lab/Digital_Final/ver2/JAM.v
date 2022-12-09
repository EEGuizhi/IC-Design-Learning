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
    parameter OUTPUT = 2;
    reg [1:0] state;

    reg [6:0] cost_data [0:7][0:7];  // Workers對應Jobs的工作成本表格
    reg [2:0] job [0:7];  // 第n個Worker的Job = job[n]
    reg [2:0] next_job [0:7];
    
    wire [9:0] TotalCost;
    
    assign TotalCost    = cost_data[0][job[0]]
                        + cost_data[1][job[1]]
                        + cost_data[2][job[2]]
                        + cost_data[3][job[3]]
                        + cost_data[4][job[4]]
                        + cost_data[5][job[5]]
                        + cost_data[6][job[6]]
                        + cost_data[7][job[7]];


    // jobs assignment 字典序演算法(方法提供by題目)
    always @(*) begin
        if(job[6] < job[7]) begin // 7>6
            next_job[0] = job[0];
            next_job[1] = job[1];
            next_job[2] = job[2];
            next_job[3] = job[3];
            next_job[4] = job[4];
            next_job[5] = job[5];
            next_job[6] = job[7];
            next_job[7] = job[6];
        end
        else if(job[5] < job[6]) begin // 6>7 & 6>5
            if(job[7] > job[5]) begin // 6>7>5
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[3];
                next_job[4] = job[4];
                next_job[5] = job[7];
                next_job[6] = job[5];
                next_job[7] = job[6];
            end
            else begin // 6>5>7
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[3];
                next_job[4] = job[4];
                next_job[5] = job[6];
                next_job[6] = job[7];
                next_job[7] = job[5];
            end
        end
        else if(job[4] < job[5]) begin // 5>4 & 5>6>7
            if(job[7] > job[4]) begin // 5>6>7>4
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[3];
                next_job[4] = job[7];
                next_job[5] = job[4];
                next_job[6] = job[6];
                next_job[7] = job[5];
            end
            else if(job[6] > job[4]) begin // 5>6>4>7
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[3];
                next_job[4] = job[6];
                next_job[5] = job[7];
                next_job[6] = job[4];
                next_job[7] = job[5];
            end
            else begin // 5>4>6>7
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[3];
                next_job[4] = job[5];
                next_job[5] = job[7];
                next_job[6] = job[6];
                next_job[7] = job[4];
            end
        end
        else if(job[3] < job[4]) begin // 4>3 & 4>5>6>7
            if(job[7] > job[3]) begin // 4>5>6>7>3
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[7];
                next_job[4] = job[3];
                next_job[5] = job[6];
                next_job[6] = job[5];
                next_job[7] = job[4];
            end
            else if(job[6] > job[3]) begin // 4>5>6>3>7
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[6];
                next_job[4] = job[7];
                next_job[5] = job[3];
                next_job[6] = job[5];
                next_job[7] = job[4];
            end
            else if(job[5] > job[3]) begin // 4>5>3>6>7
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[5];
                next_job[4] = job[7];
                next_job[5] = job[6];
                next_job[6] = job[3];
                next_job[7] = job[4];
            end
            else begin // 4>3>5>6>7
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[2];
                next_job[3] = job[4];
                next_job[4] = job[7];
                next_job[5] = job[6];
                next_job[6] = job[5];
                next_job[7] = job[3];
            end
        end
        else if(job[2] < job[3]) begin // 3>2 & 3>4>5>6>7
            if(job[7] > job[2]) begin
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[7];
                next_job[3] = job[2];
                next_job[4] = job[6];
                next_job[5] = job[5];
                next_job[6] = job[4];
                next_job[7] = job[3];
            end
            else if(job[6] > job[2]) begin
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[6];
                next_job[3] = job[7];
                next_job[4] = job[2];
                next_job[5] = job[5];
                next_job[6] = job[4];
                next_job[7] = job[3];
            end
            else if(job[5] > job[2]) begin
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[5];
                next_job[3] = job[7];
                next_job[4] = job[6];
                next_job[5] = job[2];
                next_job[6] = job[4];
                next_job[7] = job[3];
            end
            else if(job[4] > job[2]) begin
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[4];
                next_job[3] = job[7];
                next_job[4] = job[6];
                next_job[5] = job[5];
                next_job[6] = job[2];
                next_job[7] = job[3];
            end
            else begin
                next_job[0] = job[0];
                next_job[1] = job[1];
                next_job[2] = job[3];
                next_job[3] = job[7];
                next_job[4] = job[6];
                next_job[5] = job[5];
                next_job[6] = job[4];
                next_job[7] = job[2];
            end
        end
        else if(job[1] < job[2]) begin // 2>1 & 2>3>4>5>6>7
            if(job[7] > job[1]) begin
                next_job[0] = job[0];
                next_job[1] = job[7];
                next_job[2] = job[1];
                next_job[3] = job[6];
                next_job[4] = job[5];
                next_job[5] = job[4];
                next_job[6] = job[3];
                next_job[7] = job[2];
            end
            else if(job[6] > job[1]) begin
                next_job[0] = job[0];
                next_job[1] = job[6];
                next_job[2] = job[7];
                next_job[3] = job[1];
                next_job[4] = job[5];
                next_job[5] = job[4];
                next_job[6] = job[3];
                next_job[7] = job[2];
            end
            else if(job[5] > job[1]) begin
                next_job[0] = job[0];
                next_job[1] = job[5];
                next_job[2] = job[7];
                next_job[3] = job[6];
                next_job[4] = job[1];
                next_job[5] = job[4];
                next_job[6] = job[3];
                next_job[7] = job[2];
            end
            else if(job[4] > job[1]) begin
                next_job[0] = job[0];
                next_job[1] = job[4];
                next_job[2] = job[7];
                next_job[3] = job[6];
                next_job[4] = job[5];
                next_job[5] = job[1];
                next_job[6] = job[3];
                next_job[7] = job[2];
            end
            else if(job[3] > job[1]) begin
                next_job[0] = job[0];
                next_job[1] = job[3];
                next_job[2] = job[7];
                next_job[3] = job[6];
                next_job[4] = job[5];
                next_job[5] = job[4];
                next_job[6] = job[1];
                next_job[7] = job[2];
            end
            else begin
                next_job[0] = job[0];
                next_job[1] = job[2];
                next_job[2] = job[7];
                next_job[3] = job[6];
                next_job[4] = job[5];
                next_job[5] = job[4];
                next_job[6] = job[3];
                next_job[7] = job[1];
            end
        end
        else if(job[0] < job[1]) begin // 1>0 & 1>2>3>4>5>6>7
            if(job[7] > job[0]) begin
                next_job[0] = job[7];
                next_job[1] = job[0];
                next_job[2] = job[6];
                next_job[3] = job[5];
                next_job[4] = job[4];
                next_job[5] = job[3];
                next_job[6] = job[2];
                next_job[7] = job[1];
            end
            else if(job[6] > job[0]) begin
                next_job[0] = job[6];
                next_job[1] = job[7];
                next_job[2] = job[0];
                next_job[3] = job[5];
                next_job[4] = job[4];
                next_job[5] = job[3];
                next_job[6] = job[2];
                next_job[7] = job[1];
            end
            else if(job[5] > job[0]) begin
                next_job[0] = job[5];
                next_job[1] = job[7];
                next_job[2] = job[6];
                next_job[3] = job[0];
                next_job[4] = job[4];
                next_job[5] = job[3];
                next_job[6] = job[2];
                next_job[7] = job[1];
            end
            else if(job[4] > job[0]) begin
                next_job[0] = job[4];
                next_job[1] = job[7];
                next_job[2] = job[6];
                next_job[3] = job[5];
                next_job[4] = job[0];
                next_job[5] = job[3];
                next_job[6] = job[2];
                next_job[7] = job[1];
            end
            else if(job[3] > job[0]) begin
                next_job[0] = job[3];
                next_job[1] = job[7];
                next_job[2] = job[6];
                next_job[3] = job[5];
                next_job[4] = job[4];
                next_job[5] = job[0];
                next_job[6] = job[2];
                next_job[7] = job[1];
            end
            else if(job[2] > job[0]) begin
                next_job[0] = job[2];
                next_job[1] = job[7];
                next_job[2] = job[6];
                next_job[3] = job[5];
                next_job[4] = job[4];
                next_job[5] = job[3];
                next_job[6] = job[0];
                next_job[7] = job[1];
            end
            else begin
                next_job[0] = job[1];
                next_job[1] = job[7];
                next_job[2] = job[6];
                next_job[3] = job[5];
                next_job[4] = job[4];
                next_job[5] = job[3];
                next_job[6] = job[2];
                next_job[7] = job[0];
            end
        end
        else begin // 0>1>2>3>4>5>6>7 Final
            next_job[0] = job[0];
            next_job[1] = job[1];
            next_job[2] = job[2];
            next_job[3] = job[3];
            next_job[4] = job[4];
            next_job[5] = job[5];
            next_job[6] = job[6];
            next_job[7] = job[7];
        end
    end

    wire done;

    assign done = ({job[0], job[1], job[2], job[3], job[4], job[5], job[6], job[7]} == 24'o76543210) ? 1 : 0;

    always @(posedge CLK) begin
        if(RST) begin  // reset
            W <= 0;
            J <= 0;
            state <= INPUT;
            MinCost <= 1023;

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
            case (state)
                INPUT: begin
                    cost_data[W][J] <= Cost;
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

                    // Jobs assignment
                    if(done) begin
                        state <= OUTPUT;  // next state
                    end
                    job[0] <= next_job[0];
                    job[1] <= next_job[1];
                    job[2] <= next_job[2];
                    job[3] <= next_job[3];
                    job[4] <= next_job[4];
                    job[5] <= next_job[5];
                    job[6] <= next_job[6];
                    job[7] <= next_job[7];
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
            end
            OUTPUT: begin
                Valid <= 1;
            end
        endcase
    end

endmodule
