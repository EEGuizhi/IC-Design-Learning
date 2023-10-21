//EEGuizhi  註：這次改coding style 使用大眾寫法
module geofence (
    input clk,
    input reset,
    input [9:0] X,
    input [9:0] Y,
    output reg valid,
    output reg is_inside
);

    // State
    reg [2:0] cs;
    reg [2:0] ns;

    // Data
    reg [9:0] coord [0:6][0:1];  // 目標物&接收器座標
    reg [2:0] count;  // 計次
    reg [2:0] pos_times;  // 為正的次數
    reg [2:0] seq [0:4];  // 除第一個接收器外，其他接收器的排序
    reg signed [20:0] v_cross1;  // 外積第一部分 (相乘完最大會到2倍bits + 正負)
    reg signed [20:0] v_cross2;  // 外積第二部分
    reg right;  // vecA在vecB右邊 (外積為正)

    // Vectors
    reg signed [10:0] vecA [0:1];  // A向量 (座標10bits + 正負1bit)
    reg signed [10:0] vecB [0:1];  // B向量
    wire [20:0] ext_vecA [0:1];
    wire [20:0] ext_vecB [0:1];
    reg [2:0] ptrO;  // 指向原點
    reg [2:0] ptrA;  // 指向A座標
    reg [2:0] ptrB;  // 指向B座標

    // Parameters
    parameter x = 0;
    parameter y = 1;
    parameter IDLE = 0;
    parameter INPUT = 1;
    parameter SORT = 2;
    parameter CALC = 3;
    parameter OUTPUT = 4;

    assign ext_vecA[x] = (vecA[x][10]) ? {10'b1, vecA[x]} : {10'b0, vecA[x]};
    assign ext_vecA[y] = (vecA[y][10]) ? {10'b1, vecA[y]} : {10'b0, vecA[y]};
    assign ext_vecB[x] = (vecB[x][10]) ? {10'b1, vecB[x]} : {10'b0, vecB[x]};
    assign ext_vecB[y] = (vecB[y][10]) ? {10'b1, vecB[y]} : {10'b0, vecB[y]};

    // Coord to Vector
    always @(*) begin
        vecA[x] = {1'b0, coord[ptrA][x]} - {1'b0, coord[ptrO][x]};
        vecA[y] = {1'b0, coord[ptrA][y]} - {1'b0, coord[ptrO][y]};
        vecB[x] = {1'b0, coord[ptrB][x]} - {1'b0, coord[ptrO][x]};
        vecB[y] = {1'b0, coord[ptrB][y]} - {1'b0, coord[ptrO][y]};
    end

    // vecA cross vecB
    always @(*) begin
        v_cross1 = ext_vecA[x] * ext_vecB[y];  // vecA x vecB 第一部分
        v_cross2 = ext_vecA[y] * ext_vecB[x];  // vecA x vecB 第二部分
    end

    // vecA at right side of vecB
    always @(*) begin
        if(v_cross1 > v_cross2)
            right = 1;
        else
            right = 0;
    end

    // FSM
    always @(posedge clk or posedge reset) begin
        if(reset) begin  // reset
            cs <= IDLE;
        end
        else begin
            cs <= ns;
        end
    end

    always @(*) begin
        case (cs)
            IDLE: begin
                if(reset)
                    ns = IDLE;
                else
                    ns = INPUT;
            end
            INPUT: begin  // 輸入座標
                if(count >= 6)
                    ns = SORT;
                else
                    ns = INPUT;
            end
            SORT: begin  // 接收器排序
                if(count == 5) 
                    ns = CALC;
                else
                    ns = SORT;
            end
            CALC: begin  // 判斷待測物位置
                if(!right || ptrA == 6)
                    ns = OUTPUT;
                else
                    ns = CALC;
            end
            OUTPUT: begin  // 輸出
                ns = INPUT;
            end
            default: ns <= IDLE;
        endcase
    end

    // Main
    always @(posedge clk or posedge reset) begin
        case (cs)
            IDLE: begin
                count <= 0;
                pos_times <= 0;
                ptrO <= 1;
                ptrA <= 2;
                ptrB <= 3;
            end
            INPUT: begin  // 輸入座標
                coord[count][x] <= X;
                coord[count][y] <= Y;
                if(ns == SORT)
                    count <= 0;
                else
                    count <= count + 1;
            end
            SORT: begin  // 接收器排序
                if(ns == CALC) begin
                    ptrO <= 1;  // 指向首個接收器
                    ptrA <= 0;  // 指向待測物
                    ptrB <= 2;  // 指向第二個接收器
                    is_inside <= 1;

                    // switch
                    coord[seq[0]][x] <= coord[2][x];
                    coord[seq[0]][y] <= coord[2][y];
                    coord[seq[1]][x] <= coord[3][x];
                    coord[seq[1]][y] <= coord[3][y];
                    coord[seq[2]][x] <= coord[4][x];
                    coord[seq[2]][y] <= coord[4][y];
                    coord[seq[3]][x] <= coord[5][x];
                    coord[seq[3]][y] <= coord[5][y];
                    coord[seq[4]][x] <= coord[6][x];
                    coord[seq[4]][y] <= coord[6][y];
                end
                else begin
                    if(ptrB == 7) begin  // next round
                        seq[count] <= pos_times + 2;
                        ptrB <= 1;
                        pos_times <= 0;
                        count <= count + 1;
                    end
                    else begin  // counting
                        if(right)
                            pos_times <= pos_times + 1;
                        else
                            pos_times <= pos_times;

                        if(ptrB+1 == ptrA)
                            ptrB <= ptrB + 2;
                        else
                            ptrB <= ptrB + 1;
                    end
                end
            end
            CALC: begin  // 判斷待測物位置
                if(!right) begin  // outside
                    is_inside <= 0;
                end
                else begin  // inside, next round
                    ptrA <= ptrA + 1;
                    if(ptrB == 6)
                        ptrB <= 1;
                    else
                        ptrB <= ptrB + 1;
                end
            end
            OUTPUT: begin  // 輸出(回INPUT前重置)
                count <= 0;
                pos_times <= 0;
                ptrO <= 1;
                ptrA <= 2;
                ptrB <= 3;
            end
            default: ;
        endcase
    end

    // Output control
    always @(negedge clk or posedge reset) begin
        if(reset || cs != OUTPUT)
            valid <= 0;
        else
            valid <= 1;
    end

endmodule
