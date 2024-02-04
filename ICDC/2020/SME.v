// EEGuizhi
module SME(
    input clk,
    input reset,
    input [7:0] chardata,
    input isstring,
    input ispattern,
    output reg match,
    output reg [4:0] match_index,
    output reg valid
);

    // State
    parameter READ = 0;
    parameter CALC = 1;
    parameter OUTPUT = 2;
    parameter NOTUSED = 3;

    // Special char (ASCII)
    parameter ST = 94;   // start char
    parameter ED = 36;   // end char
    parameter ANY = 46;  // any char
    parameter SP = 32;   // space char

    wire check_done;
    wire move_both_ptr, move_pat_ptr;

    reg [1:0] cs, ns;
    reg [7:0] str [0:33];  // save string (max 32 words + 1 head + 1 rear)
    reg [7:0] pat [0:10];   // save pattern (max 8 words)

    reg [5:0] str_ptr;   // string pointer(index)
    reg [3:0] pat_ptr;   // pattern pointer(index)
    reg [5:0] str_last;  // string length - 1
    reg [3:0] pat_last;  // pattern length - 1

    assign move_both_ptr = (
        pat[pat_ptr] == ANY ||
        pat[pat_ptr] == str[str_ptr]
    ) ? 1 : 0;
    assign move_pat_ptr = (
        (pat[pat_ptr] == ST && str[str_ptr-1] == SP) ||
        (pat[pat_ptr] == ED && str[str_ptr] == SP)
    ) ? 1 : 0;
    assign check_done = (
        (str_last - match_index + 2 == pat_last) ||  // failed
        (pat_ptr == pat_last+1)  // success
    ) ? 1 : 0;


    // FSM
    always @(posedge clk) begin
        if(reset)
            cs <= READ;
        else
            cs <= ns;
    end
    always @(*) begin
        case(cs)
            READ: begin
                if(isstring || ispattern)
                    ns = READ;
                else
                    ns = CALC;
            end
            CALC: begin
                if(check_done)
                    ns = OUTPUT;
                else
                    ns = CALC;
            end
            OUTPUT:
                ns = READ;
            default:
                ns = READ;
        endcase
    end

    // memory control
    integer i;
    always @(posedge clk) begin
        if(reset) begin
            str[0] <= SP;
            str[33] <= SP;
            for(i = 1; i < 33; i = i+1)
                str[i] <= 0;
        end
        else begin
            if(cs == READ && isstring) begin
                str[str_ptr] <= chardata;
                str[str_ptr+1] <= SP;
            end
        end
    end
    always @(posedge clk) begin
        if(reset) begin
            for(i = 0; i < 11; i = i+1)
                pat[i] <= 0;
        end
        else begin
            if(cs == READ && ispattern)
                pat[pat_ptr] <= chardata;
        end
    end

    // saving length
    always @(posedge clk) begin
        if(reset)
            str_last <= 1;
        else begin
            if(cs == READ && isstring)
                str_last <= str_ptr;
        end
    end
    always @(posedge clk) begin
        if(reset)
            pat_last <= 0;
        else begin
            if(cs == READ && ispattern)
                pat_last <= pat_ptr;
        end
    end

    // string pointer control
    always @(posedge clk) begin
        if(reset)
            str_ptr <= 1;  // saving start from index = 1
        else begin
            case(cs)
                READ: begin
                    if(isstring)
                        str_ptr <= str_ptr + 1;
                    else
                        str_ptr <= 1;
                end
                CALC: begin
                    if(move_both_ptr)
                        str_ptr <= str_ptr + 1;
                    else if(!move_pat_ptr)
                        str_ptr <= match_index + 2;
                end
                default:
                    str_ptr <= 1;
            endcase
        end
    end

    // pattern pointer control
    always @(posedge clk) begin
        if(reset)
            pat_ptr <= 0;
        else begin
            case(cs)
                READ: begin
                    if(ispattern)
                        pat_ptr <= pat_ptr + 1;
                    else
                        pat_ptr <= 0;
                end
                CALC: begin
                    if(move_both_ptr || move_pat_ptr)
                        pat_ptr <= pat_ptr + 1;
                    else
                        pat_ptr <= 0;
                end
                default:
                    pat_ptr <= 0;
            endcase
        end
    end

    // match index control
    always @(posedge clk) begin
        if(reset)
            match_index <= 0;
        else begin
            case(cs)
                CALC: begin
                    if(!move_both_ptr && !move_pat_ptr && !check_done)
                        match_index <= match_index + 1;
                end
                OUTPUT:
                    match_index <= match_index;
                default:
                    match_index <= 0;
            endcase
        end
    end

    // match
    always @(posedge clk) begin
        if(reset)
            match <= 0;
        else begin
            case(cs)
                CALC: begin
                    if(pat_ptr == pat_last+1)  // pat_ptr check done
                        match <= 1;
                    else
                        match <= 0;
                end
                OUTPUT:
                    match <= match;
                default:
                    match <= 0;
            endcase
        end
    end

    // valid control
    always @(posedge clk) begin
        if(reset)
            valid <= 0;
        else begin
            if(cs == OUTPUT)
                valid <= 1;
            else
                valid <= 0;
        end
    end
endmodule
