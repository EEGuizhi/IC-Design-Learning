module ram1024x4(clk, addr, data, rw, cs);
    input clk, rw, cs;
    input [9:0] addr;
    inout [3:0] data;

    reg [3:0] ram [0:1023];
    wire [3:0] dout;

    assign data = (!cs)&&(rw) ? dout : 4'bzzzz;
    assign dout = ram[addr];

    always @(posedge clk) begin
        if((!rw)&&(!cs)) //write mode
            ram[addr] <= data; 
    end
endmodule
