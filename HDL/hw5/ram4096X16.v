//4109061012
module ram4096X16(clk, addr, data, rw);
    input clk, rw;
    input [11:0] addr;
    inout [15:0] data;

    reg cs1, cs2, cs3, cs4;

    ram1024X8 ram11(.clk(clk), .addr(addr[9:0]), .data(data[15:8]), .rw(rw), .cs(cs1));
    ram1024X8 ram12(.clk(clk), .addr(addr[9:0]), .data(data[7:0]), .rw(rw), .cs(cs1));
    ram1024X8 ram21(.clk(clk), .addr(addr[9:0]), .data(data[15:8]), .rw(rw), .cs(cs2));
    ram1024X8 ram22(.clk(clk), .addr(addr[9:0]), .data(data[7:0]), .rw(rw), .cs(cs2));
    ram1024X8 ram31(.clk(clk), .addr(addr[9:0]), .data(data[15:8]), .rw(rw), .cs(cs3));
    ram1024X8 ram32(.clk(clk), .addr(addr[9:0]), .data(data[7:0]), .rw(rw), .cs(cs3));
    ram1024X8 ram41(.clk(clk), .addr(addr[9:0]), .data(data[15:8]), .rw(rw), .cs(cs4));
    ram1024X8 ram42(.clk(clk), .addr(addr[9:0]), .data(data[7:0]), .rw(rw), .cs(cs4));

    always @(*) begin
        case ({addr[11:10]})
            2'd0: {cs1, cs2, cs3, cs4} = 4'b0111;
            2'd1: {cs1, cs2, cs3, cs4} = 4'b1011;
            2'd2: {cs1, cs2, cs3, cs4} = 4'b1101;
            2'd3: {cs1, cs2, cs3, cs4} = 4'b1110;
            default: {cs1, cs2, cs3, cs4} = 4'b1111;
        endcase
    end

endmodule
