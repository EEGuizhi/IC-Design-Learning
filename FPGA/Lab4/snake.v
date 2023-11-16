//EEGuizhi

//模組宣告 I/O ports宣告
module snake(
    input clk,
    input rst_n,
    input sw, //R1  0:向右  1:向左
    input btn_c, //R15  降速
    output reg [3:0] seg7_sel,
    output reg [7:0] seg7
);

    reg [26:0] count;  // 提供不同頻率的clock count[n]比count[n+1]頻率快一倍
    reg [1:0] seg7_count;
    reg [4:0] state;  //22 states
    reg [4:0] seg_state [3:0];

	wire state_clk;
    wire seg_clk;

    //除頻功能
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			count <= 0;
		else
			count <= count + 1;
	end
	assign state_clk = btn_c ? count[26] : count[25];
    assign seg_clk = count[18];


    // States
    always @(posedge state_clk or negedge rst_n) begin
        if(!rst_n)begin
			state <= 0;
		end
		else if(!sw) begin //向右
            if (state == 21)
                state <= 0;
            else
                state <= state + 1;
		end
        else begin //向左
            if (state == 0)
                state <= 21;
            else
                state <= state - 1;
		end
        case(state)
            0:begin
                seg_state[3] <= 1;
                seg_state[2] <= 1;
                seg_state[1] <= 1;
                seg_state[0] <= 1;
            end
            1:begin
                seg_state[3] <= 0;
                seg_state[2] <= 1;
                seg_state[1] <= 1;
                seg_state[0] <= 4;
            end
            2:begin
                seg_state[3] <= 0;
                seg_state[2] <= 0;
                seg_state[1] <= 1;
                seg_state[0] <= 6;
            end
            3:begin
                seg_state[3] <= 0;
                seg_state[2] <= 0;
                seg_state[1] <= 2;
                seg_state[0] <= 6;
            end
            //
            4:begin
                seg_state[3] <= 0;
                seg_state[2] <= 2;
                seg_state[1] <= 2;
                seg_state[0] <= 10;
            end
            5:begin
                seg_state[3] <= 2;
                seg_state[2] <= 2;
                seg_state[1] <= 2;
                seg_state[0] <= 2;
            end
            6:begin
                seg_state[3] <= 11;
                seg_state[2] <= 2;
                seg_state[1] <= 2;
                seg_state[0] <= 0;
            end
            7:begin
                seg_state[3] <= 7;
                seg_state[2] <= 2;
                seg_state[1] <= 0;
                seg_state[0] <= 0;
            end
            //
            8:begin
                seg_state[3] <= 7;
                seg_state[2] <= 1;
                seg_state[1] <= 0;
                seg_state[0] <= 0;
            end
            9:begin
                seg_state[3] <= 5;
                seg_state[2] <= 1;
                seg_state[1] <= 1;
                seg_state[0] <= 0;
            end
            10:begin
                seg_state[3] <= 1;
                seg_state[2] <= 1;
                seg_state[1] <= 1;
                seg_state[0] <= 1;
            end
            11:begin
                seg_state[3] <= 0;
                seg_state[2] <= 1;
                seg_state[1] <= 1;
                seg_state[0] <= 4;
            end
            //
            12:begin
                seg_state[3] <= 0;
                seg_state[2] <= 0;
                seg_state[1] <= 1;
                seg_state[0] <= 14;
            end
            13:begin
                seg_state[3] <= 0;
                seg_state[2] <= 0;
                seg_state[1] <= 0;
                seg_state[0] <= 8;
            end
            14:begin
                seg_state[3] <= 0;
                seg_state[2] <= 0;
                seg_state[1] <= 3;
                seg_state[0] <= 16;
            end
            15:begin
                seg_state[3] <= 0;
                seg_state[2] <= 3;
                seg_state[1] <= 3;
                seg_state[0] <= 12;
            end
            //
            16:begin
                seg_state[3] <= 3;
                seg_state[2] <= 3;
                seg_state[1] <= 3;
                seg_state[0] <= 3;
            end
            17:begin
                seg_state[3] <= 13;
                seg_state[2] <= 3;
                seg_state[1] <= 3;
                seg_state[0] <= 0;
            end
            18:begin
                seg_state[3] <= 17;
                seg_state[2] <= 3;
                seg_state[1] <= 0;
                seg_state[0] <= 0;
            end
            19:begin
                seg_state[3] <= 9;
                seg_state[2] <= 0;
                seg_state[1] <= 0;
                seg_state[0] <= 0;
            end
            //
            20:begin
                seg_state[3] <= 15;
                seg_state[2] <= 1;
                seg_state[1] <= 0;
                seg_state[0] <= 0;
            end
            21:begin
                seg_state[3] <= 5;
                seg_state[2] <= 1;
                seg_state[1] <= 1;
                seg_state[0] <= 0;
            end
            default:begin
                seg_state[3] <= 0;
                seg_state[2] <= 0;
                seg_state[1] <= 0;
                seg_state[0] <= 0;
            end
        endcase
    end

    // seg7
    always @(posedge seg_clk or negedge rst_n) begin
		if(!rst_n)
			seg7_count <= 0;
		else
			seg7_count <= seg7_count + 1;
	end

    always @(posedge seg_clk or negedge rst_n) begin
		if(!rst_n) begin
			seg7_sel <= 0;
			seg7 <= 0;
		end
		else begin
			case(seg7_count)  // 如果切換得太快實際電路會反應不及 讓seg7_sel相當於4'b1111
				0:seg7_sel <= 4'b0001;
				1:seg7_sel <= 4'b0010;
				2:seg7_sel <= 4'b0100;
				3:seg7_sel <= 4'b1000;
			endcase
			case(seg_state[seg7_count])
                0:seg7 <= 8'b0000_0000;  //none
				1:seg7 <= 8'b0000_0001;  //上
                2:seg7 <= 8'b0100_0000;  //中
                3:seg7 <= 8'b0000_1000;  //下

                4:seg7 <= 8'b0000_0011;  //上 右上
                5:seg7 <= 8'b0010_0001;  //上 左上

                6:seg7 <= 8'b0100_0011;  //上 右上 中
                7:seg7 <= 8'b0110_0001;  //上 左上 中

                8:seg7 <= 8'b0000_1111;  //上 右上 右下 下
                9:seg7 <= 8'b0011_1001;  //上 左上 左下 下

                10:seg7 <= 8'b0100_0010;  //右上 中
                11:seg7 <= 8'b0110_0000;  //左上 中

                12:seg7 <= 8'b0000_1100;  //右下 下
                13:seg7 <= 8'b0001_1000;  //左下 下

                14:seg7 <= 8'b0000_0111;  //上 右上 右下
                15:seg7 <= 8'b0011_0001;  //上 左上 左下

                16:seg7 <= 8'b0000_1110;  //右上 右下 下
                17:seg7 <= 8'b0011_1000;  //左上 左下 下
			endcase
		end
	end
endmodule
