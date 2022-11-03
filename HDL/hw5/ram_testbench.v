//4109061012
module ram_testbench();
    reg clk;
    reg rw;
    reg [11:0] addr;
    reg [15:0] din;
    wire [15:0] data;

    ram4096X16 ram(.clk(clk), .addr(addr), .data(data), .rw(rw));

    parameter w = 1;
    parameter r = 0;

    assign data = din;

    initial clk = 1'b0;
    always #5 clk = ~clk;
    initial begin
        //k = 0 to 7, write mode
        {rw, addr, din} = {w, 12'h000, 16'h0000};  #10
        {rw, addr, din} = {w, 12'h400, 16'h0400};  #10
        {rw, addr, din} = {w, 12'h800, 16'h0800};  #10
        {rw, addr, din} = {w, 12'hc00, 16'h0c00};  #10

        {rw, addr, din} = {w, 12'h001, 16'h0001};  #10
        {rw, addr, din} = {w, 12'h401, 16'h0401};  #10
        {rw, addr, din} = {w, 12'h801, 16'h0801};  #10
        {rw, addr, din} = {w, 12'hc01, 16'h0c01};  #10

        {rw, addr, din} = {w, 12'h002, 16'h0002};  #10
        {rw, addr, din} = {w, 12'h402, 16'h0402};  #10
        {rw, addr, din} = {w, 12'h802, 16'h0802};  #10
        {rw, addr, din} = {w, 12'hc02, 16'h0c02};  #10

        {rw, addr, din} = {w, 12'h003, 16'h0003};  #10
        {rw, addr, din} = {w, 12'h403, 16'h0403};  #10
        {rw, addr, din} = {w, 12'h803, 16'h0803};  #10
        {rw, addr, din} = {w, 12'hc03, 16'h0c03};  #10

        {rw, addr, din} = {w, 12'h004, 16'h0004};  #10
        {rw, addr, din} = {w, 12'h404, 16'h0404};  #10
        {rw, addr, din} = {w, 12'h804, 16'h0804};  #10
        {rw, addr, din} = {w, 12'hc04, 16'h0c04};  #10

        {rw, addr, din} = {w, 12'h005, 16'h0005};  #10
        {rw, addr, din} = {w, 12'h405, 16'h0405};  #10
        {rw, addr, din} = {w, 12'h805, 16'h0805};  #10
        {rw, addr, din} = {w, 12'hc05, 16'h0c05};  #10

        {rw, addr, din} = {w, 12'h006, 16'h0006};  #10
        {rw, addr, din} = {w, 12'h406, 16'h0406};  #10
        {rw, addr, din} = {w, 12'h806, 16'h0806};  #10
        {rw, addr, din} = {w, 12'hc06, 16'h0c06};  #10

        {rw, addr, din} = {w, 12'h007, 16'h0007};  #10
        {rw, addr, din} = {w, 12'h407, 16'h0407};  #10
        {rw, addr, din} = {w, 12'h807, 16'h0807};  #10
        {rw, addr, din} = {w, 12'hc07, 16'h0c07};  #10
        
        //k = 1 to 4, read mode
        din = 16'bzzzzzzzzzzzzzzzz;
        {rw, addr} = {r, 12'hc01};  #10
        {rw, addr} = {r, 12'h801};  #10
        {rw, addr} = {r, 12'h401};  #10
        {rw, addr} = {r, 12'h001};  #10

        {rw, addr} = {r, 12'hc02};  #10
        {rw, addr} = {r, 12'h802};  #10
        {rw, addr} = {r, 12'h402};  #10
        {rw, addr} = {r, 12'h002};  #10

        {rw, addr} = {r, 12'hc03};  #10
        {rw, addr} = {r, 12'h803};  #10
        {rw, addr} = {r, 12'h403};  #10
        {rw, addr} = {r, 12'h003};  #10

        {rw, addr} = {r, 12'hc04};  #10
        {rw, addr} = {r, 12'h804};  #10
        {rw, addr} = {r, 12'h404};  #10
        {rw, addr} = {r, 12'h004};  #10

        //k = 0 to 7, write mode
        {rw, addr, din} = {w, 12'h000, 16'h0000};  #10
        {rw, addr, din} = {w, 12'h400, 16'h0004};  #10
        {rw, addr, din} = {w, 12'h800, 16'h0008};  #10
        {rw, addr, din} = {w, 12'hc00, 16'h000c};  #10

        {rw, addr, din} = {w, 12'h001, 16'h0100};  #10
        {rw, addr, din} = {w, 12'h401, 16'h0104};  #10
        {rw, addr, din} = {w, 12'h801, 16'h0108};  #10
        {rw, addr, din} = {w, 12'hc01, 16'h010c};  #10

        {rw, addr, din} = {w, 12'h002, 16'h0200};  #10
        {rw, addr, din} = {w, 12'h402, 16'h0204};  #10
        {rw, addr, din} = {w, 12'h802, 16'h0208};  #10
        {rw, addr, din} = {w, 12'hc02, 16'h020c};  #10

        {rw, addr, din} = {w, 12'h003, 16'h0300};  #10
        {rw, addr, din} = {w, 12'h403, 16'h0304};  #10
        {rw, addr, din} = {w, 12'h803, 16'h0308};  #10
        {rw, addr, din} = {w, 12'hc03, 16'h030c};  #10

        {rw, addr, din} = {w, 12'h004, 16'h0400};  #10
        {rw, addr, din} = {w, 12'h404, 16'h0404};  #10
        {rw, addr, din} = {w, 12'h804, 16'h0408};  #10
        {rw, addr, din} = {w, 12'hc04, 16'h040c};  #10

        {rw, addr, din} = {w, 12'h005, 16'h0500};  #10
        {rw, addr, din} = {w, 12'h405, 16'h0504};  #10
        {rw, addr, din} = {w, 12'h805, 16'h0508};  #10
        {rw, addr, din} = {w, 12'hc05, 16'h050c};  #10

        {rw, addr, din} = {w, 12'h006, 16'h0600};  #10
        {rw, addr, din} = {w, 12'h406, 16'h0604};  #10
        {rw, addr, din} = {w, 12'h806, 16'h0608};  #10
        {rw, addr, din} = {w, 12'hc06, 16'h060c};  #10

        {rw, addr, din} = {w, 12'h007, 16'h0700};  #10
        {rw, addr, din} = {w, 12'h407, 16'h0704};  #10
        {rw, addr, din} = {w, 12'h807, 16'h0708};  #10
        {rw, addr, din} = {w, 12'hc07, 16'h070c};  #10

        // k = 3 to 0, read mode
        din = 16'bzzzzzzzzzzzzzzzz;
        {rw, addr} = {r, 12'h003};  #10
        {rw, addr} = {r, 12'h403};  #10
        {rw, addr} = {r, 12'h803};  #10
        {rw, addr} = {r, 12'hc03};  #10

        {rw, addr} = {r, 12'h002};  #10
        {rw, addr} = {r, 12'h402};  #10
        {rw, addr} = {r, 12'h802};  #10
        {rw, addr} = {r, 12'hc02};  #10

        {rw, addr} = {r, 12'h001};  #10
        {rw, addr} = {r, 12'h401};  #10
        {rw, addr} = {r, 12'h801};  #10
        {rw, addr} = {r, 12'hc01};  #10
        
        {rw, addr} = {r, 12'h000};  #10
        {rw, addr} = {r, 12'h400};  #10
        {rw, addr} = {r, 12'h800};  #10
        {rw, addr} = {r, 12'hc00};  #10
        $finish;
    end

endmodule
