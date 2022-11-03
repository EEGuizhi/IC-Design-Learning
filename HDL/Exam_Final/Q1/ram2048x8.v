module ram2048x8(clk, addr, data, rw, cs);
    input clk, rw, cs;
    input [10:0] addr;
    inout [7:0] data;

    reg cs1, cs2, cs3;

    always @(*) begin
        if(!cs) begin
            case ({addr[10:9]})
                2'd0: {cs1, cs2, cs3} = 3'b011;
                2'd1: {cs1, cs2, cs3} = 3'b101;
                2'd2: {cs1, cs2, cs3} = 3'b110;
                2'd3:;
                default: {cs1, cs2, cs3} = 3'b111;
            endcase
        end
        else
            {cs1, cs2, cs3} = 3'b111;
    end

    ram1024x4 ram1(.clk(clk), .addr(addr[9:0]), .data(data[7:4]), .rw(rw), .cs(cs1));
    ram1024x4 ram2(.clk(clk), .addr(addr[9:0]), .data(data[3:0]), .rw(rw), .cs(cs1));
    ram512x8 ram3(.clk(clk), .addr(addr[8:0]), .data(data[7:0]), .rw(rw), .cs(cs2));
    ram512x8 ram4(.clk(clk), .addr(addr[8:0]), .data(data[7:0]), .rw(rw), .cs(cs3));

endmodule
