// 4109061012
module top (
    input clk,
    input reset,
    input [7:0] Din,
    input i_valid,
    input busy,
    output [7:0] Dout,
    output reg o_valid
);

    reg en;
    reg flag;
    reg state;
    reg [3:0] addr;

    wire [7:0] data;
    assign data = i_valid ? Din : 'bz;  // data 在輸入時接到Din 其他時間接到高阻抗 (inout的常見寫法)
    assign Dout = o_valid ? data : 0;  // 當o_valid為1時輸出Dout 其他時間都輸出0

    Memory mem(.clk(clk), .rst(reset), .r_w(i_valid), .en(en), .data(data), .addr(addr));

    always @(posedge clk) begin
        if(reset) begin
            state <= 0;
            addr <= 0;
            o_valid <= 0;
            flag <= 0;  // 紀錄是否輸入過
        end
        else begin
            case (state)
                0: begin  // input state
                    if(i_valid) begin
                        addr <= addr + 1;
                        flag <= 1;
                    end
                    else if(flag && ~busy) begin  // 輸入過 而且 不busy
                        addr <= addr - 1;
                        state <= 1;
                    end
                end
                1: begin  // output state
                    if(addr == 0) begin
                        state <= 0;
                        flag <= 0;
                        o_valid <= 0;
                    end
                    else begin
                        addr <= addr - 1;
                    end
                end
                default: state <= 0;
            endcase
        end
    end


    always @(negedge clk) begin
        if(reset) begin
            en <= 1;
        end
        else begin
            case(state)
                0: begin
                    if(i_valid) begin
                        en <= 1;
                    end
                    else begin
                        en <= 0;
                    end
                end
                1: begin
                    en <= 1;
                end
                default: ;
            endcase
        end
    end

endmodule
