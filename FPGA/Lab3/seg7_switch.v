// EEGuizhi
`define CYCLE 100000 // 單一cycle

// module
module seg7_switch(
	input clk,
	input rst_n,
	input [7:0] switch,
	output [7:0] seg7,
	output [3:0] seg7_sel );

	// 暫存器
	reg [7:0] seg7;
	reg [3:0] seg7_sel;
	reg [3:0] seg7_temp [0:3];
	reg [1:0] seg7_count;

	reg [29:0] count;
	wire d_clk;

	// 除頻
	always @(posedge clk or negedge rst_n)begin
		if(!rst_n)
			count <= 0;
		else if (count >= `CYCLE)
			count <= 0;
		else
			count <= count + 1;
	end
	assign d_clk = count > (`CYCLE/2) ? 0 : 1;

	//switch binary to decimal
	always @(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			seg7_temp[0] <= 0;
			seg7_temp[1] <= 0;
			seg7_temp[2] <= 0;
			seg7_temp[3] <= 0;
		end
		else begin
			// 有號十進制
			case (switch[7:4])
				4'b0000:begin  //00
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 0;
				end
				4'b0001:begin  //01
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 1;
				end
				4'b0010:begin  //02
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 2;
				end
				4'b0011:begin  //03
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 3;
				end
				4'b0100:begin  //04
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 4;
				end
				4'b0101:begin  //05
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 5;
				end
				4'b0110:begin  //06
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 6;
				end
				4'b0111:begin  //07
					seg7_temp[3] <= 0;
					seg7_temp[2] <= 7;
				end
				4'b1000:begin  //-8
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 8;
				end
				4'b1001:begin  //-7
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 7;
				end
				4'b1010:begin  //-6
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 6;
				end
				4'b1011:begin  //-5
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 5;
				end
				4'b1100:begin  //-4
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 4;
				end
				4'b1101:begin  //-3
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 3;
				end
				4'b1110:begin  //-2
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 2;
				end
				4'b1111:begin  //-1
					seg7_temp[3] <= 10;
					seg7_temp[2] <= 1;
				end
				default: seg7_temp[2] <= 0;
			endcase

			// 無號十進制
			seg7_temp[1] <= (switch[3:0] % 100) / 10;
			seg7_temp[0] <= switch[3:0] % 10;
		end
	end


	//七段顯示器
	always @(posedge d_clk or negedge rst_n)begin //顯示
		if(!rst_n)begin
			seg7_count <= 0;
		end
		else begin
			seg7_count <= seg7_count + 1;
		end
	end

	always @(posedge d_clk or negedge rst_n)begin
		if(!rst_n)begin
			seg7_sel <= 0;
			seg7 <= 0;
		end
		else begin
			case(seg7_count)  // 輪流輸出到四個seg7
				0: seg7_sel <= 4'b0001;
				1: seg7_sel <= 4'b0010;
				2: seg7_sel <= 4'b0100;
				3: seg7_sel <= 4'b1000;
			endcase
			case(seg7_temp[seg7_count])  // 輸出該seg7的數值
				0: seg7 <= 8'b0011_1111;
                1: seg7 <= 8'b0000_0110;
                2: seg7 <= 8'b0101_1011;
                3: seg7 <= 8'b0100_1111;
                4: seg7 <= 8'b0110_0110;
                5: seg7 <= 8'b0110_1101;
                6: seg7 <= 8'b0111_1101;
                7: seg7 <= 8'b0000_0111;
                8: seg7 <= 8'b0111_1111;
                9: seg7 <= 8'b0110_1111;
				10: seg7 <= 8'b0100_0000;  // 負號
			endcase
		end
	end
endmodule
