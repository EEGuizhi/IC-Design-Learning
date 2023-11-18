// EEGuizhi
module SME(
    input clk,
    input reset,
    input signed [7:0] chardata,
    input isstring,
    input ispattern,
    output reg match,
    output reg [4:0] match_index,
    output reg valid
    );

    reg [1:0] state;  // "0": read, "1": calc, "2": output, "3": not used
    reg [1:0] next_state;
    reg signed [7:0] str [0:31];  // save string (a word = 1byte, max 32 bits)
    reg signed [7:0] pat [0:9];  // save pattern (max 8 words)

    // states
    parameter READ = 0;
    parameter CALC = 1;
    parameter OUTPUT = 2;
    parameter NOTUSED = 3;

    // special char (ASCII)
    parameter signed START_CH = 94;
    parameter signed END_CH = 36;
    parameter signed ANY_CH = 46;
    parameter signed SPACE = 32;

    reg [5:0] str_ptr;  // pointer, point to a char in string
    reg [3:0] pat_ptr;  // pointer, point to a char in pattern
    reg [4:0] str_last;  // string length - 1
    reg [3:0] pat_last;  // pattern length - 1
    reg flag;  // multipurpose

    wire need_start = (pat[0] == START_CH) ? 1 : 0;
    wire need_end = (pat[pat_last] == END_CH) ? 1 : 0;

    wire success = (flag && pat_ptr-1 == pat_last) ? 1 : 0;
    wire failed = ((str_last+1 - match_index) < (pat_last+1 - need_start - need_end)) ? 1 : 0;

    wire both_ptr_next = (pat[pat_ptr] == str[str_ptr] || pat[pat_ptr] == ANY_CH) ? 1 : 0;
    wire pat_ptr_next =
        (pat[pat_ptr] == START_CH && (str_ptr == 0 || str[str_ptr-1] == SPACE)) ||
        (pat[pat_ptr] == END_CH && (str_ptr-1 == str_last || str[str_ptr] == SPACE)) ? 1 : 0;


    // FSM
    always @(posedge clk or negedge reset) begin
        if(reset)
            state <= READ;
        else
            state <= next_state;
    end

    always @(*) begin
        if(reset) begin
            next_state = READ;
        end
        else begin
            case (state)
                READ: begin
                    if(isstring || ispattern)
                        next_state = READ;
                    else
                        next_state = CALC;
                end
                CALC: begin
                    if(success || failed)
                        next_state = OUTPUT;
                    else
                        next_state = CALC;
                end
                OUTPUT: next_state = READ;
                default: next_state = READ;
            endcase
        end
    end

    // Algorithm
    always @(posedge clk) begin
        if(reset) begin  // init
            str_ptr <= 0;
            pat_ptr <= 0;
            str_last <= 0;
            pat_last <= 0;
            match <= 0;
            flag <= 0;
        end
        else begin
            case (state)
                READ: begin
                    if(isstring) begin  // reading string
                        str[str_ptr] <= chardata;
                        str_ptr <= str_ptr + 1;
                        flag <= 1;  // log string has been read
                    end
                    else if(ispattern) begin  // reading pattern
                        pat[pat_ptr] <= chardata;
                        pat_ptr <= pat_ptr + 1;
                    end
                    else begin  // finish reading
                        pat_last <= pat_ptr - 1;  // reading last time +1, so need to be -1
                        if(flag)
                            str_last <= str_ptr - 1;
                        else
                            str_last <= str_last;

                        // reset registers
                        flag <= 0;
                        str_ptr <= 0;
                        pat_ptr <= 0;
                        match_index <= 0;
                    end
                end
                CALC: begin
                    if(success) begin
                        match <= 1;
                    end
                    else if(failed) begin
                        match <= 0;
                    end
                    else if(both_ptr_next) begin
                        str_ptr <= str_ptr + 1;
                        pat_ptr <= pat_ptr + 1;
                        flag <= 1;
                    end
                    else if(pat_ptr_next) begin
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
                OUTPUT: begin
                    str_ptr <= 0;
                    pat_ptr <= 0;
                    str_last <= str_last;  // string may continue, do not reset str_last
                    flag <= 0;  // flag = 0 means no input string
                end
                default: begin
                    str_ptr <= 0;
                    pat_ptr <= 0;
                    str_last <= 0;
                    pat_last <= 0;
                    match <= 0;
                    flag <= 0;
                end
            endcase
        end
    end

    // valid signal control
    always @(negedge clk or negedge reset) begin
        if(state == OUTPUT)
            valid <= 1;
        else
            valid <= 0;
    end
endmodule
