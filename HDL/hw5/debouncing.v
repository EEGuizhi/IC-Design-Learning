//4109061012
module debouncing(clk, sig_in, sig_out);
    input clk;
    input sig_in;
    output sig_out;

    reg sig_out;
    reg [1:0] state;
    reg [1:0] next_state;

    always @(posedge clk) begin
        state = next_state;

        if(sig_out) begin //當前輸出為1
            case (state)
                2'd0: begin
                    if(!sig_in)
                        next_state = 2'd1;
                    else
                        next_state = 2'd0;
                end
                2'd1: begin
                    if(!sig_in)
                        next_state = 2'd2;
                    else
                        next_state = 2'd0;
                end
                2'd2: begin
                    if(!sig_in) begin
                        next_state = 2'd0;
                        sig_out = 1'b0;
                    end
                    else
                        next_state = 2'd0;
                end
                2'd3: ;
                default: next_state = 2'd0;
            endcase
        end
        else begin //當前輸出為0
            case (state)
                2'd0: begin
                    if(sig_in)
                        next_state = 2'd1;
                    else
                        next_state = 2'd0;
                end
                2'd1: begin
                    if(sig_in)
                        next_state = 2'd2;
                    else
                        next_state = 2'd0;
                end
                2'd2: begin
                    if(sig_in) begin
                        next_state = 2'd0;
                        sig_out = 1'b1;
                    end
                    else
                        next_state = 2'd0;
                end
                2'd3: ;
                default: next_state = 2'd0;
            endcase
        end
    end
endmodule
