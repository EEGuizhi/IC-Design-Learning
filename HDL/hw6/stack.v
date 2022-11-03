//4109061012
module stack(clk, data_in, cmd, data_out, full, empty, error);
    input clk;
    input [7:0] data_in;
    input [1:0] cmd;
    output [7:0] data_out;
    output full;
    output empty;
    output error;

    reg [7:0] RAM [0:7];
    reg [2:0] sp;
    reg full;
    reg empty;
    reg error;
    reg [7:0] data_out;
    reg [1:0] state;
    wire [7:0] dout;

    parameter nop = 2'b00;
    parameter clr = 2'b01;
    parameter push = 2'b10;
    parameter pop = 2'b11;

    assign dout = RAM[sp];

    always @(posedge clk) begin //positive edge
        case (cmd)
            nop: state <= nop;
            clr: state <= clr;
            push: begin
                state = push;
                if(!full)
                    RAM[sp] <= data_in;
            end
            pop: state <= pop;
            default: state <= 2'd0;
        endcase

        data_out <= dout;
    end
    
    always @(negedge clk) begin //negative edge
        error = 1'b0;
        if(state == clr) begin
            error = 1'b0;
            full = 1'b0;
            empty = 1'b1;
            sp = 3'd0;
        end
        if(state == push) begin
            empty = 1'b0;
            if(full)
                error = 1'b1;
            else begin
                sp = sp + 1'd1;
                if(sp == 3'd0)
                    full = 1'b1;
            end
        end
        if(state == pop) begin
            full = 1'b0;
            if(empty)
                error = 1'b1;
            else begin
                sp = sp - 3'd1;
                if(sp == 3'd0)
                    empty = 1'b1; 
            end
        end
    end

endmodule
