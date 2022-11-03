module debouncing_circuit(clk,in,out);
input clk;
input in;
output out;
reg out; 
reg [2:0] state, next_state;

parameter detect_0 = 3'b000; //out = 0, count = 0
parameter detect_1 = 3'b001; //out = 0, count = 1
parameter detect_2 = 3'b010; //out = 0, count = 2
parameter detect_3 = 3'b011; //out = 0, count = 3
parameter detect_4 = 3'b100; //out = 1, count = 0
parameter detect_5 = 3'b101; //out = 1, count = 1
parameter detect_6 = 3'b110; //out = 1, count = 2
parameter detect_7 = 3'b111; //out = 1, count = 3

always @(posedge clk) begin
    state = next_state;
end

always @(state or in) begin
    case(state)
        detect_0:
		begin
    		if(in)
			next_state = detect_1;
			else
			next_state = detect_0;
        end
		detect_1:
		begin
    		if(in)
			next_state = detect_2;
			else
			next_state = detect_0;
		end
		detect_2:
		begin
    	    if(in)
		    next_state = detect_3;
		    else
    	    next_state = detect_0;
	    end
	    detect_3:
	    begin
		    if(in)begin
		    next_state = detect_4;
		    out = 1;
		    end
		    else
		    next_state = detect_0;
	    end

        detect_4:
		begin
    		if(!in)
			next_state = detect_5;
			else
			next_state = detect_4;
        end
		detect_5:
		begin
    		if(!in)
			next_state = detect_6;
			else
			next_state = detect_4;
		end
		detect_6:
		begin
    	    if(!in)
		    next_state = detect_7;
		    else
    	    next_state = detect_4;
	    end
	    detect_7:
	    begin
		    if(!in)begin
		    next_state = detect_0;
		    out = 0;
		    end
		    else
		    next_state = detect_4;
	    end
		default: next_state = detect_0;
    endcase
end

endmodule
