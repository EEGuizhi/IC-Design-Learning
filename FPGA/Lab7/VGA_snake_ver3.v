// EEGuizhi 4109061012

module VGA( 
    input rst_n,
    input clk,    //100MHz
	input up,
    input dn,
	input lf,
    input rt,
    output VGA_HS,    //Horizontal synchronize signal
    output VGA_VS,    //Vertical synchronize signal
    output [3:0] VGA_R,    //Signal RED
    output [3:0] VGA_G,    //Signal Green
    output [3:0] VGA_B     //Signal Blue
);

	//Horizontal Parameter
	parameter H_FRONT = 16;
	parameter H_SYNC  = 96;
	parameter H_BACK  = 48;
	parameter H_ACT   = 640;
	parameter H_TOTAL = H_FRONT + H_SYNC + H_BACK + H_ACT;

	//Vertical Parameter
	parameter V_FRONT = 10;
	parameter V_SYNC  = 2;
	parameter V_BACK  = 33;
	parameter V_ACT   = 480;
	parameter V_TOTAL = V_FRONT + V_SYNC + V_BACK + V_ACT;

	reg [9:0] H_cnt;
	reg [9:0] V_cnt;
	reg vga_hs;    //register for horizontal synchronize signal
	reg vga_vs;    //register for vertical synchronize signal
	reg [9:0] X;    //from 1~640
	reg [8:0] Y;    //from 1~480

	assign VGA_HS = vga_hs;
	assign VGA_VS = vga_vs;

	reg [11:0] VGA_RGB;

	assign VGA_R = VGA_RGB[11:8];
	assign VGA_G = VGA_RGB[7:4];
	assign VGA_B = VGA_RGB[3:0];

	//100MHz -> 25MHz
	wire clk_25;
	reg [1:0] count;
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			count <= 0;
		else
			count <= count + 1;
	end
	assign clk_25 = count[1];

	//Game clock (tick)
	wire g_clk;
	reg [24:0] g_cnt;
	always @(posedge clk or negedge rst_n) begin
			if(!rst_n)
				g_cnt <= 0;
			else
				g_cnt <= g_cnt + 1;
		end
	assign g_clk = g_cnt[24];

	//Horizontal counter
	always@(posedge clk_25 or negedge rst_n) begin    //count 0~800
		H_cnt <= (!rst_n)? H_TOTAL : (H_cnt < H_TOTAL)?  H_cnt+1'b1 : 10'd0; 
	end

	//Vertical counter
	always@(posedge VGA_HS or negedge rst_n) begin    //count 0~525
		V_cnt <= (!rst_n)? V_TOTAL : (V_cnt < V_TOTAL)?  V_cnt+1'b1 : 10'd0; 
	end

	//Horizontal Generator: Refer to the pixel clock
	always@(posedge clk_25 or negedge rst_n) begin
		if(!rst_n) begin
			vga_hs <= 1;
			X      <= 0;
		end
		else begin
			//Horizontal Sync
			if(H_cnt<=H_SYNC)    //Sync pulse start
				vga_hs <= 1'b0;    //horizontal synchronize pulse
			else
				vga_hs <= 1'b1;
			//Current X
			if( (H_cnt>=H_SYNC+H_BACK) && (H_cnt<=H_TOTAL-H_FRONT) )
				X <= X + 1;
			else
				X <= 0;
		end
	end

	//Vertical Generator: Refer to the horizontal sync
	always@(posedge VGA_HS or negedge rst_n) begin
		if(!rst_n) begin
			vga_vs <= 1;
			Y      <= 0;
		end
		else begin
			//Vertical Sync
			if (V_cnt<=V_SYNC)    //Sync pulse start
				vga_vs <= 0;
			else
				vga_vs <= 1;
			//Current Y
			if( (V_cnt>=V_SYNC+V_BACK) && (V_cnt<=V_TOTAL-V_FRONT) )
				Y <= Y + 1;
			else
				Y <= 0;
		end
	end





	// 邊長40x40正方形  共 640(16個) x 480(12個)
	reg [1:0] act_state;
	reg [2:0] len;
	reg [3:0] spos_x [0:4];
	reg [3:0] spos_y [0:4];
	reg [3:0] apple_x;
	reg [3:0] apple_y;

	always @(posedge g_clk or negedge rst_n) begin //action
		if(!rst_n) begin
			act_state <= 0; // 0:up 1:dn 2:lf 3:rt
		end
		else begin
			if(up && act_state != 1) //up:0
				act_state <= 0;
			else if(dn && act_state != 0) //down:1
				act_state <= 1;
			else if(lf && act_state != 3) //left:2
				act_state <= 2;
			else if(rt && act_state != 2) //right:3
				act_state <= 3;
			else
				act_state <= act_state;
		end
	end

	always @(posedge g_clk or negedge rst_n) begin
		if(!rst_n) begin
			len <= 2;
			apple_x <= 0;
			apple_y <= 13;
		end
		else begin
			if(apple_y == 13) begin //initial position
				apple_x <= g_cnt[6:2] % 16;
				apple_y <= g_cnt[10:4] % 12;
				if((apple_x == spos_x[0] && apple_y == spos_y[0]) || (apple_x == spos_x[1] && apple_y == spos_y[1])) begin
					apple_x <= apple_x + 1;
				end
			end
			else if(spos_x[0] == apple_x && spos_y[0] == apple_y) begin //eat apple
				if(len < 5)
					len <= len + 1;
				
				//Random
				apple_x <= g_cnt[6:2] % 16;
				apple_y <= g_cnt[10:4] % 12;

				case (len) //蘋果生成的位置與蛇重疊
					2: begin
						if((apple_x == spos_x[0] && apple_y == spos_y[0]) || (apple_x == spos_x[1] && apple_y == spos_y[1])) begin
							if(apple_x < 15)
								apple_x <= apple_x + 1;
							else
								apple_x <= 0;
							
							if(apple_y < 10)
								apple_y <= apple_y + 1;
							else
								apple_y <= 0;
						end
					end
					3: begin
						if((apple_x == spos_x[0] && apple_y == spos_y[0]) || (apple_x == spos_x[1] && apple_y == spos_y[1]) || (apple_x == spos_x[2] && apple_y == spos_y[2])) begin
							if(apple_x < 14)
								apple_x <= apple_x + 2;
							else
								apple_x <= 0;
							
							if(apple_y < 9)
								apple_y <= apple_y + 2;
							else
								apple_y <= 0;
						end
					end
					4: begin
						if((apple_x == spos_x[0] && apple_y == spos_y[0]) || (apple_x == spos_x[1] && apple_y == spos_y[1]) || (apple_x == spos_x[2] && apple_y == spos_y[2]) || (apple_x == spos_x[3] && apple_y == spos_y[3])) begin
							if(apple_x < 14)
								apple_x <= apple_x + 2;
							else
								apple_x <= 0;
							
							if(apple_y < 9)
								apple_y <= apple_y + 2;
							else
								apple_y <= 0;
						end
					end
					5: begin
						if((apple_x == spos_x[0] && apple_y == spos_y[0]) || (apple_x == spos_x[1] && apple_y == spos_y[1]) || (apple_x == spos_x[2] && apple_y == spos_y[2]) || (apple_x == spos_x[3] && apple_y == spos_y[3]) || (apple_x == spos_x[4] && apple_y == spos_y[4])) begin
							if(apple_x < 13)
								apple_x <= apple_x + 3;
							else
								apple_x <= 0;
							
							if(apple_y < 8)
								apple_y <= apple_y + 3;
							else
								apple_y <= 0;
						end
					end
					default: len <= 2;
				endcase
			end
		end
	end

	//Move
	always @(posedge g_clk or negedge rst_n) begin
		if(!rst_n) begin
			spos_x[0] <= 5; //initial position
			spos_y[0] <= 7;
			spos_x[1] <= 5;
			spos_y[1] <= 8;
			spos_x[2] <= 0;
			spos_y[2] <= 0;
			spos_x[3] <= 0;
			spos_y[3] <= 0;
			spos_x[4] <= 0;
			spos_y[4] <= 0;
		end
		else begin
			if(act_state == 0) begin
				spos_y[0] <= spos_y[0] - 1;
				spos_y[1] <= spos_y[0];
				spos_y[2] <= spos_y[1];
				spos_y[3] <= spos_y[2];
				spos_y[4] <= spos_y[3];

				spos_x[1] <= spos_x[0];
				spos_x[2] <= spos_x[1];
				spos_x[3] <= spos_x[2];
				spos_x[4] <= spos_x[3];

				if(spos_y[0] == 0 || spos_y[0] == 15) begin //超出螢幕
					spos_y[0] <= 11;
				end
			end
			else if(act_state == 1) begin
				spos_y[0] <= spos_y[0] + 1;
				spos_y[1] <= spos_y[0];
				spos_y[2] <= spos_y[1];
				spos_y[3] <= spos_y[2];
				spos_y[4] <= spos_y[3];

				spos_x[1] <= spos_x[0];
				spos_x[2] <= spos_x[1];
				spos_x[3] <= spos_x[2];
				spos_x[4] <= spos_x[3];

				if(spos_y[0] >= 11) begin //超出螢幕
					spos_y[0] <= 0;
				end
			end
			else if(act_state == 2) begin
				spos_x[0] <= spos_x[0] - 1;
				spos_x[1] <= spos_x[0];
				spos_x[2] <= spos_x[1];
				spos_x[3] <= spos_x[2];
				spos_x[4] <= spos_x[3];

				spos_y[1] <= spos_y[0];
				spos_y[2] <= spos_y[1];
				spos_y[3] <= spos_y[2];
				spos_y[4] <= spos_y[3];
			end
			else if(act_state == 3) begin
				spos_x[0] <= spos_x[0] + 1;
				spos_x[1] <= spos_x[0];
				spos_x[2] <= spos_x[1];
				spos_x[3] <= spos_x[2];
				spos_x[4] <= spos_x[3];

				spos_y[1] <= spos_y[0];
				spos_y[2] <= spos_y[1];
				spos_y[3] <= spos_y[2];
				spos_y[4] <= spos_y[3];
			end
		end
	end

	/*
		組合邏輯電路
		黑色  VGA_RGB = 12'h000;
		藍色  VGA_RGB = 12'h00f;
		綠色  VGA_RGB = 12'h0f0;
		青色  VGA_RGB = 12'h0ff;
		紅色  VGA_RGB = 12'hf00;
		洋紅  VGA_RGB = 12'hf0f;
		黃色  VGA_RGB = 12'hff0;
		白色  VGA_RGB = 12'hfff;
	*/
	always@(*) 
		begin
			if((X >= spos_x[0]*40 + 1) && (X <= spos_x[0]*40 + 39) && (Y >= spos_y[0]*40 + 1) && (Y <= spos_y[0]*40 + 39)) begin //第一節
				VGA_RGB = 12'hfff;
			end
			else if((X >= spos_x[1]*40 + 1) && (X <= spos_x[1]*40 + 39) && (Y >= spos_y[1]*40 + 1) && (Y <= spos_y[1]*40 + 39)) begin //第一節
				VGA_RGB = 12'hfff;
			end
			else if((X >= spos_x[2]*40 + 1) && (X <= spos_x[2]*40 + 39) && (Y >= spos_y[2]*40 + 1) && (Y <= spos_y[2]*40 + 39)) begin //第一節
				if(len >= 3)
					VGA_RGB = 12'hfff;
				else
					VGA_RGB = 12'h000;
			end
			else if((X >= spos_x[3]*40 + 1) && (X <= spos_x[3]*40 + 39) && (Y >= spos_y[3]*40 + 1) && (Y <= spos_y[3]*40 + 39)) begin //第一節
				if(len >= 4)
					VGA_RGB = 12'hfff;
				else
					VGA_RGB = 12'h000;
			end
			else if((X >= spos_x[4]*40 + 1) && (X <= spos_x[4]*40 + 39) && (Y >= spos_y[4]*40 + 1) && (Y <= spos_y[4]*40 + 39)) begin //第一節
				if(len >= 5)
					VGA_RGB = 12'hfff;
				else
					VGA_RGB = 12'h000;
			end
			else if((X >= apple_x*40 + 4) && (X <= apple_x*40 + 36) && (Y >= apple_y*40 + 4)  && (Y <= apple_y*40 + 36)) begin
					VGA_RGB = 12'hf00;
			end
			else
				VGA_RGB = 12'h000;
		end
endmodule 
