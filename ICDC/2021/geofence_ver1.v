//EEGuizhi
module geofence (
    input clk,
    input reset,
    input [9:0] X,
    input [9:0] Y,
    output reg valid,
    output reg is_inside );


    // 自訂變數
    reg [1:0] state; // 當前執行狀態 "0":輸入  "1":計算  "2":輸出
    reg [9:0] tar [0:1]; // 目標物座標
    reg [9:0] rec [0:5][0:1]; // 6個接收器座標

    reg [2:0] count; // 計次
    reg [2:0] round; // 回合
    reg [2:0] right_times; // vec1在vec2右邊的次數 上限要計到6次

    // 組合邏輯 (即reg合成後會是wire)
    reg signed [10:0] vec1 [0:1]; // 當前rec往tar的向量 (座標10bits + 正負1bit)
    reg signed [10:0] vec2 [0:1]; // 當前rec往另一個rec的向量
    reg signed [20:0] v_cross1; // 外積第一部分 (相乘完最大會到2倍bits + 正負)
    reg signed [20:0] v_cross2; // 外積第二部分
    reg right;
    
    // 計算向量
    always @(*) begin
        vec1[0] = {1'b0, tar[0]} - {1'b0, rec[round][0]};
        vec1[1] = {1'b0, tar[1]} - {1'b0, rec[round][1]};
        vec2[0] = {1'b0, rec[count][0]} - {1'b0, rec[round][0]};
        vec2[1] = {1'b0, rec[count][1]} - {1'b0, rec[round][1]};
    end

    // 向量外積
    always @(*) begin
        v_cross1 = vec1[0] * vec2[1]; // vec1 x vec2 第一部分
        v_cross2 = vec1[1] * vec2[0]; // vec1 x vec2 第二部分
    end

    // 確認外積方向
    always @(*) begin
        if(v_cross1 > v_cross2) begin
            right = 1;
        end
        else begin
            right = 0;
        end
    end


    // 循序邏輯
    always @(posedge clk) begin
        if(reset) begin // init
            state <= 0;
            count <= 0;
            round <= 0;
            right_times <= 0;
        end
        else begin
            case (state)
                0: begin // 輸入座標
                    if(count == 0) begin
                        tar[0] <= X;
                        tar[1] <= Y;
                        count <= count + 1;
                    end
                    else if(count <= 6) begin
                        rec[count-1][0] <= X;
                        rec[count-1][1] <= Y;
                        count <= count + 1;
                    end
                    else begin
                        count <= 0;
                        round <= 0;
                        right_times <= 0;
                        state <= 1;
                    end
                end
                1: begin // 計算 (搭配組合邏輯)
                    // "round"表示現在是以rec[round]作為原點 總共會有6個round (0~5)
                    if(round < 6) begin
                        if(round == count) begin // vec2的起始與終點相同
                            count <= count + 1;
                        end
                        else if(right) begin // 如果vec1在vec2右邊 直接進下一round
                            right_times <= right_times + 1;
                            round <= round + 1;
                            count <= 0;
                        end
                        else if(count > 5) begin // count超出範圍 表示已經計算完所有可能
                            round <= round + 1;
                            count <= 0;
                        end
                        else begin
                            count <= count + 1;
                        end
                    end
                    else begin
                        state <= 2; // 已經完成6個round 進入輸出階段
                        if(right_times == 6) begin
                            is_inside <= 1;
                        end
                        else begin
                            is_inside <= 0;
                        end
                    end
                end
                2: begin
                    state <= 0;
                    count <= 0;
                    round <= 0;
                    right_times <= 0;
                end
                default: ;
            endcase
        end
    end

    always @(negedge clk) begin
        case (state)
            0: begin
                valid <= 0;
            end
            2: begin
                valid <= 1;
            end 
            default: ;
        endcase
    end

endmodule
