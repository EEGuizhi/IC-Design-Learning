//4109061012
module ram1024X8(clk, addr, data, rw, cs);
    input clk, rw, cs;
    input [9:0] addr;
    inout [7:0] data;

    reg [7:0] ram [0:1023];
    wire [7:0] dout;

    assign data = (!cs)&&(!rw) ? dout : 8'bzzzzzzzz;
    assign dout = ram[addr];

    always @(posedge clk) begin
        if((rw)&&(!cs)) //write mode
            ram[addr] <= data; 
    end
endmodule
