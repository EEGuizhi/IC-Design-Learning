module VGA( 
	input btn,
	input rst_n,
	input clk,  // 100 MHz
	output VGA_HS,  // Horizontal synchronize signal
	output VGA_VS,  // Vertical synchronize signal
	output [3:0] VGA_R,  // Signal RED  
	output [3:0] VGA_G,	 // Signal Green   
	output [3:0] VGA_B   // Signal Blue
);
	// Horizontal Parameter
	parameter H_FRONT = 16;
	parameter H_SYNC  = 96;
	parameter H_BACK  = 48;
	parameter H_ACT   = 640;
	parameter H_TOTAL = H_FRONT + H_SYNC + H_BACK + H_ACT;

	// Vertical Parameter
	parameter V_FRONT = 10;
	parameter V_SYNC  = 2;
	parameter V_BACK  = 33;
	parameter V_ACT   = 480;
	parameter V_TOTAL = V_FRONT + V_SYNC + V_BACK + V_ACT;

	wire clk_25;  // 25MHz clk
	reg [1:0] count;

	reg [9:0] H_cnt; 
	reg [9:0] V_cnt;
	reg vga_hs;  // register for horizontal synchronize signal
	reg vga_vs;  // register for vertical synchronize signal
	reg [9:0] X;  // from 1~640
	reg [8:0] Y;  // from 1~480

	assign VGA_HS = vga_hs;
	assign VGA_VS = vga_vs;

	reg [11:0]	VGA_RGB;
	assign VGA_R = VGA_RGB[11:8];
	assign VGA_G = VGA_RGB[7:4];
	assign VGA_B = VGA_RGB[3:0];

	// 100 MHz -> 25MHz
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			count <= 0;
		else
			count <= count + 1;
	end
	assign clk_25 = count[1];

	// Horizontal counter
	always@(posedge clk_25 or negedge rst_n) begin  // count 0~800
		H_cnt <= (!rst_n) ? H_TOTAL : (H_cnt < H_TOTAL) ? H_cnt+1'b1 : 0; 
	end
	// Vertical counter
	always@(posedge VGA_HS or negedge rst_n) begin  // count 0~525
		V_cnt <= (!rst_n) ? V_TOTAL : (V_cnt < V_TOTAL) ? V_cnt+1'b1 : 0; 
	end

	// Horizontal Generator: Refer to the pixel clock
	always @(posedge clk_25 or negedge rst_n) begin 
		if(!rst_n) begin
			vga_hs <= 1;
			X <= 0;
		end
		else begin
			// Horizontal Sync
			if(H_cnt < H_SYNC)  // Sync pulse start
				vga_hs <= 0;  // horizontal synchronize pulse
			else
				vga_hs <= 1;
			// Current X
			if(H_cnt >= (H_SYNC + H_BACK) && H_cnt < (H_SYNC + H_BACK + H_ACT))
				X <= X + 1;
			else
				X <= 0;
		end
	end

	// Vertical Generator: Refer to the horizontal sync
	always @(posedge VGA_HS or negedge rst_n) begin
		if(!rst_n) begin
			vga_vs <= 1;
			Y <= 0;
		end
		else begin      
			// Vertical Sync
			if(V_cnt < V_SYNC)  // Sync pulse start
				vga_vs <= 0;
			else
				vga_vs <= 1;
			// Current Y
			if(V_cnt >= (V_SYNC + V_BACK) && V_cnt < (V_SYNC + V_BACK + V_ACT))
				Y <= Y + 1;
			else
				Y <= 0;
		end
	end


	wire in_cir;
	wire in_tri;
	wire [9:0] rx;
	wire [8:0] ry;
	wire [8:0] tri_y;

	assign rx = (X < 340) ? 340 - X : X - 340;
	assign ry = (Y < 400) ? 400 - Y : Y - 400;
	assign in_cir = ((rx*rx + ry*ry) <= 64) ? 1 : 0;  // inside circle

	assign tri_y = (X <= 320 && X > 220) ? 640 - 2*X : 2*X - 640;
	assign in_tri = (Y <= 200 && Y > 0 && X <= 420 && X >=220 && tri_y <= Y) ? 1 : 0;  // inside triangle

	/*
	黑色  VGA_RGB = 12'h000;
	藍色  VGA_RGB = 12'h00f;
	綠色  VGA_RGB = 12'h0f0;
	青色  VGA_RGB = 12'h0ff;
	紅色  VGA_RGB = 12'hf00;
	洋紅  VGA_RGB = 12'hf0f;
	黃色  VGA_RGB = 12'hff0;
	白色  VGA_RGB = 12'hfff;
	*/
	always @(*) begin
		if(btn) begin  // 030
			if( (X >= 25) && (X < 85) && (Y >= 45) && (Y <= 435) )  // 0
				VGA_RGB = 12'h00f;
			else if( (X >= 85) && (X < 145) && (((Y >= 45) && (Y <= 123)) || ((Y >= 357) && (Y <= 435))) )
				VGA_RGB = 12'h00f;
			else if( (X >= 145) && (X < 205) && (Y >= 45) && (Y <= 435) )
				VGA_RGB = 12'h00f;
			else if( (X >= 230) && (X < 350) && (((Y >= 45) && (Y <= 123)) || ((Y >= 201) && (Y <= 279)) || ((Y >= 357) && (Y <= 435))) )  // 3
				VGA_RGB = 12'hf00;
			else if( (X >= 350) && (X < 410) && (Y >= 45) && (Y <= 435) )
				VGA_RGB = 12'hf00;
			else if( (X >= 425) && (X < 495) && (Y >= 45) && (Y <= 435) )  // 0
				VGA_RGB = 12'hff0;
			else if( (X >= 495) && (X < 555) && (((Y >= 45) && (Y <= 123)) || ((Y >= 357) && (Y <= 435))) )
				VGA_RGB = 12'hff0;
			else if( (X >= 555) && (X < 615) && (Y >= 45) && (Y <= 435) )
				VGA_RGB = 12'hff0;
			else
				VGA_RGB = 12'h000;
		end
		else begin  // house
			if(in_cir)
				VGA_RGB = 12'hf00;
			else if(in_tri)
				VGA_RGB = 12'h0f0;
			else if( (X >= 270) && (X <= 370) && (Y >= 320) && (Y <= 480) )
				VGA_RGB = 12'hff0;
			else if( (X >= 220) && (X <= 420) && (Y >= 200) && (Y <= 480) )
				VGA_RGB = 12'h00f;
			else
				VGA_RGB = 12'h000;
		end
	end
endmodule
