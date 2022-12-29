//EEGuizhi
module geofence (
    input clk,
    input reset,
    input [9:0] X,
    input [9:0] Y,
    output reg valid,
    output reg is_inside );


    // State
    parameter INPUT = 0;
    parameter CHECK = 1;
    parameter CALC = 2;
    parameter OUTPUT = 3;
    reg [1:0] state;

    // Store Data
    parameter x = 0;
    parameter y = 1;
    reg [9:0] tar [0:1];  // 目標物座標
    reg [9:0] rec [0:5][0:1];  // 6個接收器座標

    // check & calc
    reg [2:0] count;  // 計次
    reg [2:0] round;  // 回合
    reg signed [20:0] v_cross1;  // 外積第一部分 (相乘完最大會到2倍bits + 正負)
    reg signed [20:0] v_cross2;  // 外積第二部分
    // reg [3:0] ptr;  // 指向某一bit
    reg flag;

    wire signed [10:0] vec1 [0:1];  // 當前rec往tar的向量 (座標10bits + 正負1bit)
    wire signed [10:0] vec2 [0:1];  // 當前rec往另一個rec的向量

    // 計算向量
    assign vec1[x] = {1'b0, tar[x]} - {1'b0, rec[round][x]};
    assign vec1[y] = {1'b0, tar[y]} - {1'b0, rec[round][y]};
    assign vec2[x] = {1'b0, rec[count][x]} - {1'b0, rec[round][x]};
    assign vec2[y] = {1'b0, rec[count][y]} - {1'b0, rec[round][y]};


    // Main
    always @(posedge clk) begin
        if(reset) begin  // init
            state <= 0;
            count <= 0;
            round <= 0;
        end
        else begin
            case (state)
                INPUT: begin  // 輸入座標
                    if(count == 0) begin
                        tar[x] <= X;
                        tar[y] <= Y;
                        count <= count + 1;
                    end
                    else if(count <= 6) begin
                        rec[count-1][x] <= X;
                        rec[count-1][y] <= Y;
                        count <= count + 1;
                    end
                    else begin  // next state
                        count <= 0;
                        state <= CALC;
                    end
                end
                CHECK: begin  // 檢查是否在範圍內
                    // "round"表示現在是以rec[round]作為原點 總共會有6個round (0~5)
                    if(round < 6 && is_inside == 1) begin
                        if(v_cross1 > v_cross2) begin  // 確認外積方向vec1在vec2右邊 進下一round
                            count <= 0;
                            round <= round + 1;
                        end
                        count <= count + 1;
                        state <= CALC;
                    end
                    else begin
                        state <= OUTPUT;  // next state
                    end
                end
                CALC: begin
                    if(round == count || ptr == 10) begin  // vec2的起始與終點相同
                        state <= CHECK;
                    end
                    else begin
                        state <= CALC;
                    end
                end
                OUTPUT: begin
                    state <= INPUT;
                    count <= 0;
                    round <= 0;
                end
                default: ;
            endcase
        end
    end

    always @(posedge clk) begin
        v_cross1 = vec1[0] * vec2[1];  // vec1 x vec2 第一部分 00010  11111  =  00010 + 00100 + 01000 + 10000 + 00000
        v_cross2 = vec1[1] * vec2[0];  // vec1 x vec2 第二部分 11110
    end

    // // Calc
    // always @(posedge clk) begin
    //     case (state)
    //         INPUT: begin
    //             v_cross1 <= 0;
    //             v_cross2 <= 0;
    //             ptr <= 0;
    //         end
    //         CHECK: begin
    //             v_cross1 <= 0;
    //             v_cross2 <= 0;
    //             ptr <= 0;
    //         end
    //         CALC: begin  // 向量外積
    //             if(vec2[y][ptr] == 1) begin
    //                 v_cross1 <= v_cross1 + (vec1[x] << ptr);
    //             end
    //             if(vec2[x][ptr] == 1) begin
    //                 v_cross2 <= v_cross2 + (vec1[y] << ptr);
    //             end
    //             ptr <= ptr + 1;
    //         end
    //         OUTPUT: begin
    //         end
    //         default: ;
    //     endcase
    // end


    // Output control
    always @(posedge clk) begin
        if(reset) begin
            valid <= 0;
            is_inside <= 1;
        end
        else begin
            case (state)
                INPUT: begin
                    valid <= 0;
                    is_inside <= 1;
                end
                CALC: begin
                    if(count == 6) begin
                        is_inside <= 0;
                    end
                end
                OUTPUT: begin
                    valid <= 1;
                end
            endcase
        end
    end


endmodule
/*
渴望社交、想受歡迎 --> 發現沒人理自己 --> 去看動漫好了
       ^                                    |
       |        Otaku Circulation           |
       |                                    v
看完動漫空虛期 <-- 變得黏在電腦前 <-- 邊看邊獲得心靈滿足

*/