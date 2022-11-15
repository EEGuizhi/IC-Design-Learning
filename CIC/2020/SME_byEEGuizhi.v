//4109061012 陳柏翔 (未完成)
module SME(
    input clk,
    input reset,
    input [7:0] chardata,
    input isstring,
    input ispattern,
    output reg match,
    output reg [4:0] match_index,
    output reg valid );

    // 自訂的變數
    reg [1:0] state; // 電路執行狀態  "0":輸入  "1":比對可行  "2":比對失敗  "3":輸出
    reg [7:0] str [0:31]; // 儲存String (一個字1byte 最多32字元)
    reg [7:0] pat [0:7]; // 儲存Pattern (最多8字元)

    parameter START_CH = 16'h5E; // 定義特殊字元 (ASCII)
    parameter END_CH = 16'h24;
    parameter ANY_CH = 16'h2E;
    parameter SPACE = 16'h20;

    reg [4:0] str_ptr; // 指標 為目前在字串中的字元index
    reg [2:0] pat_ptr; // 指標 為目前在關鍵字中的字元index
    reg [4:0] str_len; // 字串長度-1
    reg [2:0] pat_len; // 關鍵字長度-1
    reg [2:0] match_times; // 相同的次數-1
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
        end
        else if(state == 0) begin // INPUT
            if(isstring) begin // 輸入字串
                str[str_ptr] <= chardata;
                str_ptr <= str_ptr + 1;
                str_len <= 0;
            end
            else if(ispattern) begin // 輸入關鍵字
                pat[pat_ptr] <= chardata;
                pat_ptr <= pat_ptr + 1;
                pat_len <= 0;
            end
            else begin // 輸入結束
                state <= 1;

                str_len <= str_ptr - 1; // 最後被加1次 所以-1
                pat_len <= pat_ptr - 1;
                str_ptr <= 0; // 指標歸零
                pat_ptr <= 0;
                match_index <= 0;
                
                match_times <= 0; // 計次歸零
                match_index <= 0;
            end
        end
        else if(state == 1) begin // CALC
            if((str_len - match_index + 1) >= (pat_len - need_start - need_end + 1)) begin // 確認長度足夠
                if(pat[pat_ptr] == str[str_ptr]) begin
                    str_ptr <= str_ptr + 1;
                    pat_ptr <= pat_ptr + 1;
                    flag <= 1;
                end
                else if(pat[pat_ptr] == START_CH) begin
                    if(str_ptr == 0 || str[str_ptr-1] == SPACE) begin
                        pat_ptr <= pat_ptr + 1;
                        flag <= 0;
                    end
                    else begin
                        match_index <= match_index + 1;
                        str_ptr <= match_index + 1;
                        pat_ptr <= 0;
                        flag <= 0;
                    end
                end
                else if(pat[pat_ptr] == END_CH) begin
                    if(str_ptr-1 == str_len || str[str_ptr+1] == SPACE) begin
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

                if(flag == 1 && pat_ptr == pat_len) begin
                    match <= 1;
                    state <= 2;
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
            // 由於String可能會續用 所以沒有將str_len歸零
        end
    end

    // valid control
    always @(negedge clk) begin
        if(state == 0) begin
            valid <= 0;
        end
        else if(state == 2) begin
            valid <= 1;
        end
    end

endmodule
