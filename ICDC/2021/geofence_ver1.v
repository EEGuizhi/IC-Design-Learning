// EEGuizhi
module geofence (
    input clk,
    input reset,
    input [9:0] X,
    input [9:0] Y,
    output reg valid,
    output reg is_inside
    );

    parameter INPUT = 0;
    parameter CALC = 1;
    parameter OUTPUT = 2;
    parameter NOTUSED = 3;

    reg [1:0] state;  // "0": input, "1": calculate, "2": output, "3": not used
    reg [1:0] next_state;
    reg [9:0] tar [0:1];  // target coords
    reg [9:0] rec [0:5][0:1]; // 6 receivers coords

    reg [2:0] count;
    reg [2:0] round;
    reg [2:0] right_times;  // count times of "vec1 is at right side of vec2", max is 6

    // combinational logics
    reg signed [10:0] vec1 [0:1];  // vector from rec to tar (coord 10bits + signed bit)
    reg signed [10:0] vec2 [0:1];  // vector from rec to another rec
    reg signed [20:0] v_cross1;  // cross part 1 (2 * 10bits + signed bit)
    reg signed [20:0] v_cross2;  // cross part 2
    reg right;

    // vector calc
    always @(*) begin
        vec1[0] = {1'b0, tar[0]} - {1'b0, rec[round][0]};
        vec1[1] = {1'b0, tar[1]} - {1'b0, rec[round][1]};
        vec2[0] = {1'b0, rec[count][0]} - {1'b0, rec[round][0]};
        vec2[1] = {1'b0, rec[count][1]} - {1'b0, rec[round][1]};
    end

    // cross value
    always @(*) begin
        v_cross1 = vec1[0] * vec2[1];  // vec1 x vec2 part 1
        v_cross2 = vec1[1] * vec2[0];  // vec1 x vec2 part 2
    end

    // direction of cross value
    always @(*) begin
        if(v_cross1 > v_cross2)
            right = 1;
        else
            right = 0;
    end

    // FSM
    always @(posedge clk or negedge reset) begin
        if(reset)
            state <= INPUT;
        else begin
            state <= next_state;
        end
    end
    always @(*) begin
        if(reset) begin
            next_state = INPUT;
        end
        else begin
            case (state)
                INPUT: begin
                    if(count > 6)
                        next_state = CALC;
                    else
                        next_state = INPUT;
                end
                CALC: begin
                    if(round == 6)
                        next_state = OUTPUT;
                    else
                        next_state = CALC;
                end
                OUTPUT: begin
                    next_state = INPUT;
                end
                NOTUSED: next_state = INPUT;
                default: next_state = INPUT;
            endcase
        end
    end

    // Algorithm
    always @(posedge clk) begin
        if(reset) begin  // init
            count <= 0;
            round <= 0;
            right_times <= 0;
        end
        else begin
            case (state)
                INPUT: begin  // read coords
                    if(count == 0) begin
                        tar[0] <= X;
                        tar[1] <= Y;
                        count <= count + 1;
                    end
                    else if(count <= 6) begin
                        rec[count-1][0] <= X;
                        rec[count-1][1] <= Y;
                        count <= count + 1;
                    end
                    else begin
                        count <= 0;
                        round <= 0;
                        right_times <= 0;
                    end
                end
                CALC: begin  // calc
                    if(round < 6) begin
                        if(round == count) begin  // vec2's from & to are same
                            count <= count + 1;
                        end
                        else if(right) begin  // if vec1 at right side of vec2, next round
                            right_times <= right_times + 1;
                            round <= round + 1;
                            count <= 0;
                        end
                        else if(count > 5) begin  // count exceed 5, calc finish
                            round <= round + 1;
                            count <= 0;
                        end
                        else begin
                            count <= count + 1;
                        end
                    end
                    else begin
                        if(right_times == 6)
                            is_inside <= 1;
                        else
                            is_inside <= 0;
                    end
                end
                OUTPUT: begin
                    count <= 0;
                    round <= 0;
                    right_times <= 0;
                end
                NOTUSED: begin
                    count <= 0;
                    round <= 0;
                    right_times <= 0;
                end
                default: begin
                    count <= 0;
                    round <= 0;
                    right_times <= 0;
                end
            endcase
        end
    end

    // valid signal control
    always @(negedge clk or negedge reset) begin
        if(reset) begin
            valid <= 0;
        end
        else begin
            if(state == OUTPUT)
                valid <= 1;
            else
                valid <= 0;
        end
    end
endmodule
