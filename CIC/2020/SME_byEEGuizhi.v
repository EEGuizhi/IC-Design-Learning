// EEGuizhi
module SME(
    input clk,
    input reset,
    input signed [7:0] chardata,
    input isstring,
    input ispattern,
    output reg match,
    output reg [4:0] match_index,
    output reg valid );

    // 自訂的變數
    reg [1:0] state; // 電路執行狀態  "0":輸入  "1":比對可行  "2":比對失敗  "3":輸出
    reg signed [7:0] str [0:31]; // 儲存String (一個字1byte 最多32字元)
    reg signed [7:0] pat [0:9]; // 儲存Pattern (最多8字元) (tm題目沒說清楚 總之^跟$疑似沒包含在8以內)

    parameter signed START_CH = 94; // 定義特殊字元 (ASCII)
    parameter signed END_CH = 36;
    parameter signed ANY_CH = 46;
    parameter signed SPACE = 32;

    reg [5:0] str_ptr; // 指標 為目前在字串中的字元index
    reg [3:0] pat_ptr; // 指標 為目前在關鍵字中的字元index
    reg [4:0] str_len; // 字串長度-1
    reg [3:0] pat_len; // 關鍵字長度-1 (tm題目沒說清楚 總之^跟$疑似沒包含在8以內 所以要到更大)
    reg flag;
    reg need_start;
    reg need_end;


    // 組合邏輯
    always @(*) begin
        if(pat[0] == START_CH) begin
            need_start = 1;
        end
        else begin
            need_start = 0;
        end

        if(pat[pat_len] == END_CH) begin
            need_end = 1;
        end
        else begin
            need_end = 0;
        end
    end


    // 循序邏輯
    always @(posedge clk) begin
        if(reset) begin // INIT
            state <= 0;
            str_ptr <= 0;
            pat_ptr <= 0;
            str_len <= 0;
            pat_len <= 0;
            flag <= 0;
        end
        else if(state == 0) begin // INPUT
            if(isstring) begin // 輸入字串
                str[str_ptr] <= chardata;
                str_ptr <= str_ptr + 1;
                flag <= 1; // 輸入了String
            end
            else if(ispattern) begin // 輸入關鍵字
                pat[pat_ptr] <= chardata;
                pat_ptr <= pat_ptr + 1;
            end
            else begin // 輸入結束
                state <= 1;

                pat_len <= pat_ptr - 1; // 最後被加1次 所以-1
                if(flag) begin
                    str_len <= str_ptr - 1;
                end

                flag <= 0;
                str_ptr <= 0; // 指標歸零
                pat_ptr <= 0;
                match_index <= 0;
            end
        end
        else if(state == 1 && flag == 1 && pat_ptr-1 == pat_len) begin // success
            match <= 1;
            state <= 2;
        end
        else if(state == 1) begin // CALC
            if((str_len + 1 - match_index) >= (pat_len + 1 - need_start - need_end)) begin // 確認長度足夠
                if(pat[pat_ptr] == str[str_ptr]) begin
                    str_ptr <= str_ptr + 1;
                    pat_ptr <= pat_ptr + 1;
                    flag <= 1;
                end
                else if(pat[pat_ptr] == START_CH) begin
                    if(str_ptr == 0 || str[str_ptr-1] == SPACE) begin
                        pat_ptr <= pat_ptr + 1;
                        flag <= 1;
                    end
                    else begin
                        match_index <= match_index + 1;
                        str_ptr <= match_index + 1;
                        pat_ptr <= 0;
                        flag <= 0;
                    end
                end
                else if(pat[pat_ptr] == END_CH) begin
                    if(str_ptr-1 == str_len || str[str_ptr] == SPACE) begin
                        pat_ptr <= pat_ptr + 1;
                        flag <= 1;
                    end
                    else begin
                        match_index <= match_index + 1;
                        str_ptr <= match_index + 1;
                        pat_ptr <= 0;
                        flag <= 0;
                    end
                end
                else if(pat[pat_ptr] == ANY_CH) begin
                    str_ptr <= str_ptr + 1;
                    pat_ptr <= pat_ptr + 1;
                    flag <= 1;
                end
                else begin
                    match_index <= match_index + 1;
                    str_ptr <= match_index + 1;
                    pat_ptr <= 0;
                    flag <= 0;
                end
            end
            else begin
                match <= 0;
                state <= 2;
            end
        end
        else if(state == 2) begin // FINISH and OUTPUT
            state <= 0;
            str_ptr <= 0;
            pat_ptr <= 0;
            str_len <= str_len; // 由於String可能會續用 所以不改變str_len
            flag <= 0; // 借用flag = 0代表沒有輸入String
        end
    end

    // valid control
    always @(negedge clk) begin
        if(state == 2) begin
            valid <= 1;
        end
        else begin
            valid <= 0;
        end
    end

endmodule
