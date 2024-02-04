// EEGuizhi
module geofence (
    input clk,
    input reset,
    input [9:0] X,
    input [9:0] Y,
    output reg valid,
    output reg is_inside
    );

    // Coords
    parameter x = 0;
    parameter y = 1;

    // True & False
    parameter TRUE = 1;
    parameter FALSE = 0;

    // States
    parameter INPUT = 0;
    parameter CALC = 1;
    parameter OUTPUT = 2;
    parameter NOTUSED = 3;

    integer i;  // used for generate circuit

    reg [1:0] cs, ns;         // states
    reg [9:0] tar [0:1];      // target coords
    reg [9:0] rec [0:5][0:1]; // 6 receivers coords

    reg [2:0] count, round;
    reg [2:0] right_times;  // counting times of "vec1 is at right side of vec2", max is 6

    wire signed [10:0] vec1 [0:1];  // vector from rec to tar (coord 10bits + signed bit)
    wire signed [10:0] vec2 [0:1];  // vector from rec to another rec
    wire signed [20:0] v_cross1;    // cross part 1 (2 * 10bits + signed bit)
    wire signed [20:0] v_cross2;    // cross part 2
    wire right;

    // Vectors
    assign vec1[x] = {1'b0, tar[x]} - {1'b0, rec[round][x]};
    assign vec1[y] = {1'b0, tar[y]} - {1'b0, rec[round][y]};
    assign vec2[x] = {1'b0, rec[count][x]} - {1'b0, rec[round][x]};
    assign vec2[y] = {1'b0, rec[count][y]} - {1'b0, rec[round][y]};

    // Cross value
    assign v_cross1 = vec1[x] * vec2[y];  // vec1 x vec2 part 1
    assign v_cross2 = vec1[y] * vec2[x];  // vec1 x vec2 part 2
    assign right = (v_cross1 > v_cross2 && count != 6 && round != 6) ? 1 : 0;  // direction of cross value


    // FSM
    always @(posedge clk or posedge reset) begin
        if(reset)
            cs <= INPUT;
        else
            cs <= ns;
    end
    always @(*) begin
        case (cs)
            INPUT: begin
                if(count == 7)
                    ns = CALC;
                else
                    ns = INPUT;
            end
            CALC: begin
                if(round == 6)
                    ns = OUTPUT;
                else
                    ns = CALC;
            end
            OUTPUT: begin
                if(valid)
                    ns = INPUT;
                else
                    ns = OUTPUT;
            end
            default:
                ns = INPUT;
        endcase
    end


    // inputs (to memory)
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            tar[x] <= 0;
            tar[y] <= 0;
        end
        else begin
            if(cs == INPUT && count == 0) begin
                tar[x] <= X;
                tar[y] <= Y;
            end
        end
    end
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i = 0; i < 6; i = i+1) begin
                rec[i][x] <= 0;
                rec[i][y] <= 0;
            end
        end
        else begin
            if(cs == INPUT && count != 7) begin
                rec[count - 1][x] <= X;
                rec[count - 1][y] <= Y;
            end
        end
    end

    // counting control
    always @(posedge clk or posedge reset) begin
        if(reset)
            count <= 0;
        else begin
            case(cs)
                INPUT: begin
                    if(count == 7)
                        count <= 0;
                    else
                        count <= count + 1;
                end
                CALC: begin
                    if(right || count == 6)
                        count <= 0;
                    else
                        count <= count + 1;
                end
                default:
                    count <= 0;
            endcase
        end
    end

    // rounds counting control
    always @(posedge clk or posedge reset) begin
        if(reset)
            round <= 0;
        else begin
            case(cs)
                CALC: begin
                    if(round != count && (right || count == 6))
                        round <= round + 1;
                end
                default:
                    round <= 0;
            endcase
        end
    end

    // counting right times
    always @(posedge clk or posedge reset) begin
        if(reset)
            right_times <= 0;
        else begin
            case(cs)
                CALC: begin
                    if(round != count && right)
                        right_times <= right_times + 1;
                end
                default:
                    right_times <= 0;
            endcase
        end
    end

    // inside signal
    always @(posedge clk or posedge reset) begin
        if(reset)
            is_inside <= 0;
        else begin
            if(round == 6 && right_times == 6)
                is_inside <= 1;
            else
                is_inside <= 0;
        end
    end


    // // Algorithm
    // always @(posedge clk) begin
    //     if(reset) begin  // init
    //         count <= 0;
    //         round <= 0;
    //         right_times <= 0;
    //     end
    //     else begin
    //         case (cs)
    //             INPUT: begin  // read coords
    //                 if(count == 0) begin
    //                     tar[0] <= X;
    //                     tar[1] <= Y;
    //                     count <= count + 1;
    //                 end
    //                 else if(count <= 6) begin
    //                     rec[count-1][0] <= X;
    //                     rec[count-1][1] <= Y;
    //                     count <= count + 1;
    //                 end
    //                 else begin
    //                     count <= 0;
    //                     round <= 0;
    //                     right_times <= 0;
    //                 end
    //             end
    //             CALC: begin  // calc
    //                 if(round < 6) begin
    //                     if(round == count) begin  // vec2's from & to are same
    //                         count <= count + 1;
    //                     end
    //                     else if(right) begin  // if vec1 at right side of vec2, next round
    //                         right_times <= right_times + 1;
    //                         round <= round + 1;
    //                         count <= 0;
    //                     end
    //                     else if(count > 5) begin  // count exceed 5, calc finish
    //                         round <= round + 1;
    //                         count <= 0;
    //                     end
    //                     else begin
    //                         count <= count + 1;
    //                     end
    //                 end
    //                 else begin
    //                     if(right_times == 6)
    //                         is_inside <= 1;
    //                     else
    //                         is_inside <= 0;
    //                 end
    //             end
    //             OUTPUT: begin
    //                 count <= 0;
    //                 round <= 0;
    //                 right_times <= 0;
    //             end
    //             NOTUSED: begin
    //                 count <= 0;
    //                 round <= 0;
    //                 right_times <= 0;
    //             end
    //             default: begin
    //                 count <= 0;
    //                 round <= 0;
    //                 right_times <= 0;
    //             end
    //         endcase
    //     end
    // end

    // valid signal control
    always @(posedge clk or posedge reset) begin
        if(reset)
            valid <= 0;
        else begin
            if(cs == OUTPUT && !valid)
                valid <= 1;
            else
                valid <= 0;
        end
    end
endmodule
