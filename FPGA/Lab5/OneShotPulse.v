// EEGuizhi
`define CYCLE 130000

module lab5(
	input clk,
	input rst_n,
	input btn_r,
	input btn_up,
	input btn_dn,
	input btn_l,
	output reg [7:0] seg7,
	output reg [3:0] seg7_sel
);

	reg [20:0] count;
	wire d_clk;

	reg press_flag_1;
	reg press_flag_m1;
	reg press_flag_10;
	reg press_flag_m10;

	wire flag_1_pulse;
	wire flag_m1_pulse;
	wire flag_10_pulse;
	wire flag_m10_pulse;

	reg signed [10:0] press_count;
	reg [9:0] tmp_count;

	reg [7:0] seg7_temp[0:3];
	reg [1:0] seg7_count;

	// 除頻
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			count <= 0;
		end
		else begin
			if(count >= `CYCLE)
				count <= 0;
			else
				count <= count + 1;
		end
	end
	assign d_clk = count >= (`CYCLE/2) ? 1 : 0;  // 掃描七段顯示器時脈

	// One shot
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			press_flag_1 <= 0;
			press_flag_m1 <= 0;
			press_flag_10 <= 0;
			press_flag_m10 <= 0;
		end
		else begin
			press_flag_1 <= btn_r;
			press_flag_m1 <= btn_l;
			press_flag_10 <= btn_up;
			press_flag_m10 <= btn_dn;
		end
	end
	assign flag_1_pulse = {btn_r,press_flag_1} == 2'b10 ? 1 : 0;
	assign flag_m1_pulse = {btn_l,press_flag_m1} == 2'b10 ? 1 : 0;
	assign flag_10_pulse = {btn_up,press_flag_10} == 2'b10 ? 1 : 0;
	assign flag_m10_pulse = {btn_dn,press_flag_m10} == 2'b10 ? 1 : 0;

	// 計算按壓次數
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			press_count <= 0;
		end
		else begin
			if(flag_1_pulse)
				press_count <= press_count + 1;
			if(flag_m1_pulse)
				press_count <= press_count - 1;
			if(flag_10_pulse)
				press_count <= press_count + 10;
			if(flag_m10_pulse)
				press_count <= press_count - 10;
		end
	end

	// Show
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			seg7_temp[0] <= 0;
			seg7_temp[1] <= 0;
			seg7_temp[2] <= 0;
			seg7_temp[3] <= 0;
		end
		else begin
			if(press_count >= 0) begin
				tmp_count <= press_count[6:0];
				seg7_temp[3] <= press_count / 1000;
				seg7_temp[2] <= (press_count % 1000) / 100;
				seg7_temp[1] <= (press_count % 100) / 10;
				seg7_temp[0] <= press_count % 10;
			end
			else begin
				tmp_count <= ~press_count[6:0] + 7'b0000001;
				seg7_temp[3] <= 10;
				seg7_temp[2] <= (tmp_count % 1000) / 100;
				seg7_temp[1] <= (tmp_count % 100) / 10;
				seg7_temp[0] <= tmp_count % 10;
			end
			
		end
	end

	// Output
	always @(posedge d_clk or negedge rst_n)begin
		if(!rst_n)begin
			seg7_count <= 0;
		end
		else begin
			seg7_count <= seg7_count + 1;
		end
	end
	always @(posedge d_clk or negedge rst_n)begin
		if(!rst_n)begin
			seg7_sel <= 4'b1111;
			seg7 <= 8'b0011_1111;
		end
		else begin
			case(seg7_count)
				0: seg7_sel <= 4'b0001;
				1: seg7_sel <= 4'b0010;
				2: seg7_sel <= 4'b0100;
				3: seg7_sel <= 4'b1000;
			endcase
			case(seg7_temp[seg7_count])
				0:seg7 <= 8'b0011_1111;
				1:seg7 <= 8'b0000_0110;
				2:seg7 <= 8'b0101_1011;
				3:seg7 <= 8'b0100_1111;
				4:seg7 <= 8'b0110_0110;
				5:seg7 <= 8'b0110_1101;
				6:seg7 <= 8'b0111_1101;
				7:seg7 <= 8'b0000_0111;
				8:seg7 <= 8'b0111_1111;
				9:seg7 <= 8'b0110_1111;
				10:seg7 <= 8'b0100_0000;
			endcase
		end
	end
endmodule
