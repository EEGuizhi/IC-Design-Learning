// 4109061012
module debouncing_circuit(
    input clk,
    input in,
    output reg out
    );

    reg prev_in;
    reg counter = 0;

    always @(posedge clk) begin
        prev_in <= in;
    end

    always @(posedge clk) begin
        if(prev_in == in && counter < 1)
            counter <= counter + 1;
        else if(prev_in != in)
            counter <= 0;
        else
            counter <= counter;
    end

    always @(posedge clk) begin
        if(counter == 1 && prev_in == in)
            out <= in;
        else
            out <= out;
    end
endmodule
