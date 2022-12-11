//EEGuizhi
module JAM (
    input CLK,
    input RST,
    output reg [2:0] W,
    output reg [2:0] J,
    input [6:0] Cost,
    output reg [3:0] MatchCount,
    output reg [9:0] MinCost,
    output reg Valid );


    reg [6:0] cost_data [0:7][0:7]; //Workers對應Jobs的工作成本表格
    reg [2:0] job [0:7]; //第n個Worker的Job = job[n]
    reg [1:0] state; //0:input  1:calculate  2:output  3:none
    reg [9:0] total_cost;

    always @(*) begin
        // Calculate
        total_cost = cost_data[0][job[0]]
                   + cost_data[1][job[1]]
                   + cost_data[2][job[2]]
                   + cost_data[3][job[3]]
                   + cost_data[4][job[4]]
                   + cost_data[5][job[5]]
                   + cost_data[6][job[6]]
                   + cost_data[7][job[7]];
    end

    always @(posedge CLK) begin
        if(RST) begin //reset
            W <= 0;
            J <= 0;
            state <= 0;
            MinCost <= 1023;

            job[0] <= 0; //initial jobs
            job[1] <= 1;
            job[2] <= 2;
            job[3] <= 3;
            job[4] <= 4;
            job[5] <= 5;
            job[6] <= 6;
            job[7] <= 7;
        end
        else begin
            if(state == 0) begin //state：input data
                if(W == 7 && J == 7) begin
                    J <= 0;
                    W <= 0;
                    state <= 1; //done
                end
                else if(J == 7) begin
                    W <= W + 1;
                    J <= 0;
                end
                else begin
                    J <= J + 1;
                end   
            end
            else if(state == 1) begin //state：calculating
                //MinCost, MatchCount
                if(total_cost < MinCost) begin
                    MinCost <= total_cost;
                    MatchCount <= 1;
                end
                else if(total_cost == MinCost) begin
                    MatchCount <= MatchCount + 1;
                end
                else begin //Larger
                    MinCost <= MinCost;
                end

                //字典序演算法(方法提供by題目)
                if(job[6] < job[7]) begin // 7>6
                    job[6] <= job[7];
                    job[7] <= job[6];
                end
                else if(job[5] < job[6]) begin // 6>7 & 6>5
                    if(job[7] > job[5]) begin // 6>7>5
                        job[5] <= job[7];
                        job[6] <= job[5];
                        job[7] <= job[6];
                    end
                    else begin // 6>5>7
                        job[5] <= job[6];
                        job[6] <= job[7];
                        job[7] <= job[5];
                    end
                end
                else if(job[4] < job[5]) begin // 5>4 & 5>6>7
                    if(job[7] > job[4]) begin // 5>6>7>4
                        job[4] <= job[7];
                        job[5] <= job[4];
                        job[7] <= job[5];
                    end
                    else if(job[6] > job[4]) begin // 5>6>4>7
                        job[4] <= job[6];
                        job[5] <= job[7];
                        job[6] <= job[4];
                        job[7] <= job[5];
                    end
                    else begin // 5>4>6>7
                        job[4] <= job[5];
                        job[5] <= job[7];
                        job[7] <= job[4];
                    end
                end
                else if(job[3] < job[4]) begin // 4>3 & 4>5>6>7
                    if(job[7] > job[3]) begin // 4>5>6>7>3
                        job[3] <= job[7];
                        job[4] <= job[3];
                        job[7] <= job[4];
                        job[6] <= job[5];
                        job[5] <= job[6];
                    end
                    else if(job[6] > job[3]) begin // 4>5>6>3>7
                        job[3] <= job[6];
                        job[4] <= job[7];
                        job[5] <= job[3];
                        job[6] <= job[5];
                        job[7] <= job[4];
                    end
                    else if(job[5] > job[3]) begin // 4>5>3>6>7
                        job[3] <= job[5];
                        job[4] <= job[7];
                        job[5] <= job[6];
                        job[6] <= job[3];
                        job[7] <= job[4];
                    end
                    else begin // 4>3>5>6>7
                        job[3] <= job[4];
                        job[4] <= job[7];
                        job[5] <= job[6];
                        job[6] <= job[5];
                        job[7] <= job[3];
                    end
                end
                else if(job[2] < job[3]) begin // 3>2 & 3>4>5>6>7
                    if(job[7] > job[2]) begin
                        job[2] <= job[7];
                        job[3] <= job[2];
                        job[4] <= job[6];
                        job[6] <= job[4];
                        job[7] <= job[3];
                    end
                    else if(job[6] > job[2]) begin
                        job[2] <= job[6];
                        job[3] <= job[7];
                        job[4] <= job[2];
                        job[6] <= job[4];
                        job[7] <= job[3];
                    end
                    else if(job[5] > job[2]) begin
                        job[2] <= job[5];
                        job[3] <= job[7];
                        job[4] <= job[6];
                        job[5] <= job[2];
                        job[6] <= job[4];
                        job[7] <= job[3];
                    end
                    else if(job[4] > job[2]) begin
                        job[2] <= job[4];
                        job[3] <= job[7];
                        job[4] <= job[6];
                        job[6] <= job[2];
                        job[7] <= job[3];
                    end
                    else begin
                        job[2] <= job[3];
                        job[3] <= job[7];
                        job[4] <= job[6];
                        job[6] <= job[4];
                        job[7] <= job[2];
                    end
                end
                else if(job[1] < job[2]) begin // 2>1 & 2>3>4>5>6>7
                    if(job[7] > job[1]) begin
                        job[1] <= job[7];
                        job[2] <= job[1];
                        job[3] <= job[6];
                        job[4] <= job[5];
                        job[5] <= job[4];
                        job[6] <= job[3];
                        job[7] <= job[2];
                    end
                    else if(job[6] > job[1]) begin
                        job[1] <= job[6];
                        job[2] <= job[7];
                        job[3] <= job[1];
                        job[4] <= job[5];
                        job[5] <= job[4];
                        job[6] <= job[3];
                        job[7] <= job[2];
                    end
                    else if(job[5] > job[1]) begin
                        job[1] <= job[5];
                        job[2] <= job[7];
                        job[3] <= job[6];
                        job[4] <= job[1];
                        job[5] <= job[4];
                        job[6] <= job[3];
                        job[7] <= job[2];
                    end
                    else if(job[4] > job[1]) begin
                        job[1] <= job[4];
                        job[2] <= job[7];
                        job[3] <= job[6];
                        job[4] <= job[5];
                        job[5] <= job[1];
                        job[6] <= job[3];
                        job[7] <= job[2];
                    end
                    else if(job[3] > job[1]) begin
                        job[1] <= job[3];
                        job[2] <= job[7];
                        job[3] <= job[6];
                        job[4] <= job[5];
                        job[5] <= job[4];
                        job[6] <= job[1];
                        job[7] <= job[2];
                    end
                    else begin
                        job[1] <= job[2];
                        job[2] <= job[7];
                        job[3] <= job[6];
                        job[4] <= job[5];
                        job[5] <= job[4];
                        job[6] <= job[3];
                        job[7] <= job[1];
                    end
                end
                else if(job[0] < job[1]) begin // 1>0 & 1>2>3>4>5>6>7
                    if(job[7] > job[0]) begin
                        job[0] <= job[7];
                        job[1] <= job[0];
                        job[2] <= job[6];
                        job[3] <= job[5];
                        job[5] <= job[3];
                        job[6] <= job[2];
                        job[7] <= job[1];
                    end
                    else if(job[6] > job[0]) begin
                        job[0] <= job[6];
                        job[1] <= job[7];
                        job[2] <= job[0];
                        job[3] <= job[5];
                        job[5] <= job[3];
                        job[6] <= job[2];
                        job[7] <= job[1];
                    end
                    else if(job[5] > job[0]) begin
                        job[0] <= job[5];
                        job[1] <= job[7];
                        job[2] <= job[6];
                        job[3] <= job[0];
                        job[5] <= job[3];
                        job[6] <= job[2];
                        job[7] <= job[1];
                    end
                    else if(job[4] > job[0]) begin
                        job[0] <= job[4];
                        job[1] <= job[7];
                        job[2] <= job[6];
                        job[3] <= job[5];
                        job[4] <= job[0];
                        job[5] <= job[3];
                        job[6] <= job[2];
                        job[7] <= job[1];
                    end
                    else if(job[3] > job[0]) begin
                        job[0] <= job[3];
                        job[1] <= job[7];
                        job[2] <= job[6];
                        job[3] <= job[5];
                        job[5] <= job[0];
                        job[6] <= job[2];
                        job[7] <= job[1];
                    end
                    else if(job[2] > job[0]) begin
                        job[0] <= job[2];
                        job[1] <= job[7];
                        job[2] <= job[6];
                        job[3] <= job[5];
                        job[4] <= job[4];
                        job[5] <= job[3];
                        job[6] <= job[0];
                        job[7] <= job[1];
                    end
                    else begin
                        job[0] <= job[1];
                        job[1] <= job[7];
                        job[2] <= job[6];
                        job[3] <= job[5];
                        job[4] <= job[4];
                        job[5] <= job[3];
                        job[6] <= job[2];
                        job[7] <= job[0];
                    end
                end
                else begin // 0>1>2>3>4>5>6>7 Final
                    state <= 2; //output
                end
            end
        end
    end

    always @(negedge CLK) begin
        if(state == 0) begin //state：input data
            Valid <= 0;
            cost_data[W][J] <= Cost;
        end
        else if(state == 2) begin //state：output
            Valid <= 1;
        end
    end

endmodule
