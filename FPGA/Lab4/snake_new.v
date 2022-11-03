//EEGuizhi 4109061012

//模組宣告
module snake(
    input clk,
    input rst_n,
    input sw, //0向右 1向左
    input btn_c, //降速
    output reg [3:0] seg7_sel,
    output reg [7:0] seg7
);

    reg [26:0] count; //d_clk
    reg [1:0] sel_count; //for seg7_sel
    reg [4:0] state; //22個狀態

    reg [3:0] seg_row1;
    reg [3:0] seg_row2;
    reg [3:0] seg_row3;
    reg [3:0] seg_col; 

    wire d_clk;

    //除頻
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			count <= 0;
		else
			count <= count + 1;
	end
	assign d_clk = btn_c ? count[26] : count[25];

    //States
    always @(posedge d_clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= 0;
            seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0000;
        end
        else if(!sw) begin
            if(state < 21)
                state <= state + 1;
            else
                state <= 0;
        end
        else begin
            if(state > 1)
                state <= state - 1;
            else
                state <= 21;
        end

        case (state)
            0: begin
                seg_row1 <= 4'b1111;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0000;
            end
            1: begin
                seg_row1 <= 4'b0111;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0001;
            end
            2: begin
                seg_row1 <= 4'b0011;  seg_row2 <= 4'b0001;  seg_row3 <= 4'b0000;  seg_col <= 4'b0001;
            end
            3: begin
                seg_row1 <= 4'b0001;  seg_row2 <= 4'b0011;  seg_row3 <= 4'b0000;  seg_col <= 4'b0001;
            end

            4: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0111;  seg_row3 <= 4'b0000;  seg_col <= 4'b0001;
            end
            5: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b1111;  seg_row3 <= 4'b0000;  seg_col <= 4'b0000;
            end
            6: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b1110;  seg_row3 <= 4'b0000;  seg_col <= 4'b1000;
            end
            7: begin
                seg_row1 <= 4'b1000;  seg_row2 <= 4'b1100;  seg_row3 <= 4'b0000;  seg_col <= 4'b1000;
            end

            8: begin
                seg_row1 <= 4'b1100;  seg_row2 <= 4'b1000;  seg_row3 <= 4'b0000;  seg_col <= 4'b1000;
            end
            9: begin
                seg_row1 <= 4'b1110;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b1000;
            end
            10: begin
                seg_row1 <= 4'b1111;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0000;
            end
            11: begin
                seg_row1 <= 4'b0111;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0001;
            end

            12: begin
                seg_row1 <= 4'b0011;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0011;
            end
            13: begin
                seg_row1 <= 4'b0001;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0001;  seg_col <= 4'b0011;
            end
            14: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0011;  seg_col <= 4'b0011;
            end
            15: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0111;  seg_col <= 4'b0010;
            end

            16: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b1111;  seg_col <= 4'b0000;
            end
            17: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b1110;  seg_col <= 4'b0100;
            end
            18: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b1100;  seg_col <= 4'b1100;
            end
            19: begin
                seg_row1 <= 4'b1000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b1000;  seg_col <= 4'b1100;
            end

            20: begin
                seg_row1 <= 4'b1100;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b1100;
            end
            21: begin
                seg_row1 <= 4'b1110;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b1000;
            end
            default: begin
                seg_row1 <= 4'b0000;  seg_row2 <= 4'b0000;  seg_row3 <= 4'b0000;  seg_col <= 4'b0000;
            end
        endcase
    end

    //seg7
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            sel_count <= 0;
        else begin
            if(sel_count == 3)
                sel_count <= 0;
            else
                sel_count <= sel_count + 1;
        end

        case (sel_count)
            0: begin
                seg7_sel <= 4'b0001;
                seg7 <= {1'b0,seg_row2[0],2'b00,seg_row3[0],seg_col[1],seg_col[0],seg_row1[0]};
            end
            1: begin
                seg7_sel <= 4'b0010;
                seg7 <= {1'b0,seg_row2[1],2'b00,seg_row3[1],2'b00,seg_row1[1]};
            end
            2: begin
                seg7_sel <= 4'b0100;
                seg7 <= {1'b0,seg_row2[2],2'b00,seg_row3[2],2'b00,seg_row1[2]};
            end
            3: begin
                seg7_sel <= 4'b1000;
                seg7 <= {1'b0,seg_row2[3],seg_col[3],seg_col[2],seg_row3[3],2'b00,seg_row1[3]};
            end
            default: begin
                seg7_sel <= 4'b0000;  seg7 <= 8'b00000000;
            end
        endcase
    end

endmodule 
