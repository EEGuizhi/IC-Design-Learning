// EEGuizhi
module LASER (
    input CLK,
    input RST,
    input [3:0] X,
    input [3:0] Y,
    output reg [3:0] C1X,
    output reg [3:0] C1Y,
    output reg [3:0] C2X,
    output reg [3:0] C2Y,
    output reg DONE
    );


    parameter x = 0;  // coords
    parameter y = 1;

    parameter TRUE = 1;  // T&F
    parameter FALSE = 0;

    parameter INPUT = 0;  // states
    parameter SORTING = 1;
    parameter FIND_ROW = 2;
    parameter MOVE_C1 = 3;
    parameter LOC_C1 = 4;
    parameter MOVE_C2 = 5;
    parameter LOC_C2 = 6;
    parameter FINISH = 7;

    parameter LAST_OBJ = 39;
    parameter LAST_POS = {4'b1111, 4'b1111};


    wire c1_y_lower;
    wire [3:0] low_y;
    wire [3:0] high_y;

    wire check_done;
    wire max_update, equal_max;
    wire exchange, restart;

    wire [3:0] dist_c1 [0:1];
    wire [3:0] dist_c2 [0:1];
    reg inside_c1, inside_c2;

    reg [3:0] objects [0:39][0:1];
    reg [5:0] obj_ptr;  // point to 40 objects, need 6 bits (2^6 = 64 > 40)
    reg [5:0] row_ends [0:14];  // saving every row's end, equals to "next row's start"
    reg [3:0] row_ptr;  // point to row_ends, row_ends[row_ptr] is where the "row_ptr"th row's end

    reg [5:0] obj_counts;
    reg [5:0] max_counts;
    reg [3:0] best_pos [0:1];
    reg [3:0] last_pos [0:1];
    reg not_converge;

    reg [2:0] curr_state;
    reg [2:0] next_state;


    // Search bound
    assign c1_y_lower = (C1Y < C2Y) ? TRUE : FALSE;
    assign low_y = c1_y_lower ? C1Y : C2Y;
    assign high_y = c1_y_lower ? C2Y : C1Y;

    // Sorting
    assign exchange = ({objects[obj_ptr][y], objects[obj_ptr][x]} > {objects[obj_ptr+1][y], objects[obj_ptr+1][x]}) ? TRUE : FALSE;
    assign restart = (obj_ptr == (LAST_OBJ-1 - obj_counts)) ? TRUE : FALSE;

    // Whether checking 40 objs is done
    assign check_done = (high_y == 11 || high_y == 12 || high_y == 13 || high_y == 14 || high_y == 15) ?
                            (obj_ptr == LAST_OBJ+1) ? TRUE : FALSE
                        :
                            (obj_ptr == row_ends[high_y+4]) ? TRUE : FALSE;

    // Max count update
    assign max_update = (obj_counts > max_counts) ? TRUE : FALSE;
    assign equal_max = (obj_counts == max_counts) ? TRUE : FALSE;

    // Inside circles checking
    assign dist_c1[x] = (C1X > objects[obj_ptr][x]) ? C1X - objects[obj_ptr][x] : objects[obj_ptr][x] - C1X;  // dist x to c1
    assign dist_c1[y] = (C1Y > objects[obj_ptr][y]) ? C1Y - objects[obj_ptr][y] : objects[obj_ptr][y] - C1Y;  // dist y to c1
    assign dist_c2[x] = (C2X > objects[obj_ptr][x]) ? C2X - objects[obj_ptr][x] : objects[obj_ptr][x] - C2X;  // dist x to c2
    assign dist_c2[y] = (C2Y > objects[obj_ptr][y]) ? C2Y - objects[obj_ptr][y] : objects[obj_ptr][y] - C2Y;  // dist y to c2
    always @(*) begin  // (0, 4), (1, 3), (2, 3), (3, 2), (3, 1), (4, 0)
        if((dist_c1[x] + dist_c1[y]) < 5)
            inside_c1 = TRUE;
        else if((dist_c1[x] == 3 && dist_c1[y] == 2) || (dist_c1[x] == 2 && dist_c1[y] == 3))
            inside_c1 = TRUE;
        else
            inside_c1 = FALSE;
    end
    always @(*) begin  // (0, 4), (1, 3), (2, 3), (3, 2), (3, 1), (4, 0)
        if((dist_c2[x] + dist_c2[y]) < 5)
            inside_c2 = TRUE;
        else if((dist_c2[x] == 3 && dist_c2[y] == 2) || (dist_c2[x] == 2 && dist_c2[y] == 3))
            inside_c2 = TRUE;
        else
            inside_c2 = FALSE;
    end


    // FSM
    always @(posedge CLK) begin
        if(RST)
            curr_state <= 0;
        else
            curr_state <= next_state;
    end
    always @(*) begin
        if(RST)
            next_state = 0;
        else begin
            case(curr_state)
                INPUT: begin
                    if(obj_ptr == LAST_OBJ)
                        next_state = SORTING;
                    else
                        next_state = INPUT;
                end
                SORTING: begin
                    if(obj_counts == LAST_OBJ-1)
                        next_state = FIND_ROW;
                    else
                        next_state = SORTING;
                end
                FIND_ROW: begin
                    if(obj_ptr == LAST_OBJ+1 && row_ptr == 15)
                        next_state = MOVE_C1;
                    else
                        next_state = FIND_ROW;
                end
                MOVE_C1: begin
                    if(check_done && {C1Y, C1X} == LAST_POS)
                        next_state = LOC_C1;
                    else
                        next_state = MOVE_C1;
                end
                LOC_C1: begin
                    if(not_converge)
                        next_state = MOVE_C2;
                    else
                        next_state = FINISH;
                end
                MOVE_C2: begin
                    if(check_done && {C2Y, C2X} == LAST_POS)
                        next_state = LOC_C2;
                    else
                        next_state = MOVE_C2;
                end
                LOC_C2: begin
                    if(not_converge)
                        next_state = MOVE_C1;
                    else
                        next_state = FINISH;
                end
                FINISH: begin
                    if(DONE)
                        next_state = INPUT;
                    else
                        next_state = FINISH;
                end
                default:
                    next_state = 0;
            endcase
        end
    end


    // Objects coord saving
    always @(posedge CLK) begin
        case(curr_state)
            INPUT:
                {objects[obj_ptr][y], objects[obj_ptr][x]} <= {Y, X};
            SORTING: begin
                if(exchange) begin
                    {objects[obj_ptr][y], objects[obj_ptr][x]} <= {objects[obj_ptr+1][y], objects[obj_ptr+1][x]};
                    {objects[obj_ptr+1][y], objects[obj_ptr+1][x]} <= {objects[obj_ptr][y], objects[obj_ptr][x]};
                end
            end
            default: begin
                objects[obj_ptr][x] <= objects[obj_ptr][x];
                objects[obj_ptr][y] <= objects[obj_ptr][y];
            end 
        endcase
    end


    // Object pointer control
    always @(posedge CLK) begin
        if(RST)
            obj_ptr <= 0;
        else begin
            case(curr_state)
                INPUT: begin
                    if(obj_ptr == LAST_OBJ)
                        obj_ptr <= 0;
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                SORTING: begin
                    if(restart)
                        obj_ptr <= 0;
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                FIND_ROW: begin
                    if(obj_ptr != LAST_OBJ+1 && row_ptr == objects[obj_ptr][y])
                        obj_ptr <= obj_ptr + 1;
                    else
                        obj_ptr <= obj_ptr;
                end
                MOVE_C1: begin
                    if(check_done) begin
                        if(low_y == 0 || low_y == 1 || low_y == 2 || low_y == 3 || low_y == 4)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= row_ends[low_y - 5];
                    end
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                MOVE_C2: begin
                    if(check_done) begin
                        if(low_y == 0 || low_y == 1 || low_y == 2 || low_y == 3 || low_y == 4)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= row_ends[low_y - 5];
                    end
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                default:
                    obj_ptr <= 0;
            endcase
        end
    end


    // Get every row's end, equals to "next row's start"
    always @(posedge CLK) begin  // saving every row's end
        if(curr_state == FIND_ROW)
            row_ends[row_ptr] <= obj_ptr;
    end
    always @(posedge CLK) begin  // row pointer control
        if(RST || curr_state == SORTING)
            row_ptr <= 0;
        else if(curr_state == FIND_ROW && (row_ptr != objects[obj_ptr][y] || obj_ptr == LAST_OBJ+1))
            row_ptr <= row_ptr + 1;
    end


    // Position control
    always @(posedge CLK) begin  // Circle 1
        if(RST)
            {C1Y, C1X} <= 0;
        else begin
            case(curr_state)
                MOVE_C1: begin
                    if(check_done)  // next position
                        {C1Y, C1X} <= {C1Y, C1X} + 1;
                end
                LOC_C1:
                    {C1Y, C1X} <= {best_pos[y], best_pos[x]};
                MOVE_C2:
                    {C1Y, C1X} <= {C1Y, C1X};
                LOC_C2: begin
                    if(not_converge)
                        {C1Y, C1X} <= 0;
                end
                FINISH:
                    {C1Y, C1X} <= {C1Y, C1X};
                default:  // reset
                    {C1Y, C1X} <= 0;
            endcase
        end
    end
    always @(posedge CLK) begin  // Circle 2
        if(RST)
            {C2Y, C2X} <= 0;
        else begin
            case(curr_state)
                MOVE_C1:
                    {C2Y, C2X} <= {C2Y, C2X};
                LOC_C1: begin
                    if(not_converge)
                        {C2Y, C2X} <= 0;
                end
                MOVE_C2: begin
                    if(check_done)  // next position
                        {C2Y, C2X} <= {C2Y, C2X} + 1;
                end
                LOC_C2:
                    {C2Y, C2X} <= {best_pos[y], best_pos[x]};
                FINISH:
                    {C2Y, C2X} <= {C2Y, C2X};
                default:  // reset
                    {C2Y, C2X} <= 0;
            endcase
        end
    end


    // Logging best result
    always @(posedge CLK) begin  // counting objects
        if(RST)
            obj_counts <= 0;
        else begin
            case(curr_state)
                SORTING: begin
                    if(restart)
                        obj_counts <= obj_counts + 1;
                end
                MOVE_C1: begin
                    if(check_done)  // reset
                        obj_counts <= 0;
                    else if(inside_c1 || inside_c2)  // counting
                        obj_counts <= obj_counts + 1;
                end
                MOVE_C2: begin
                    if(check_done)  // reset
                        obj_counts <= 0;
                    else if(inside_c1 || inside_c2)  // counting
                        obj_counts <= obj_counts + 1;
                end
                default:
                    obj_counts <= 0;
            endcase
        end
    end
    always @(posedge CLK) begin  // logging max count
        if(RST)
            max_counts <= 0;
        else begin
            if(max_update)  // update max
                max_counts <= obj_counts;
            else if(curr_state == FIND_ROW || DONE)  // reset
                max_counts <= 0;
        end
    end
    always @(posedge CLK) begin  // convergence checking
        if(RST)
            not_converge <= FALSE;
        else begin
            case(curr_state)
                MOVE_C1: begin
                    if(max_update)
                        not_converge <= TRUE;
                end
                MOVE_C2: begin
                    if(max_update)
                        not_converge <= TRUE;
                end
                default:
                    not_converge <= FALSE;
            endcase
        end
    end
    always @(posedge CLK) begin  // saving best position
        if(RST)
            {best_pos[y], best_pos[x]} <= 0;
        else begin
            case(curr_state)
                MOVE_C1: begin
                    if(max_update || equal_max)
                        {best_pos[y], best_pos[x]} <= {C1Y, C1X};
                end
                LOC_C1:
                    {best_pos[y], best_pos[x]} <= {C2Y, C2X};
                MOVE_C2: begin
                    if(max_update || equal_max)
                        {best_pos[y], best_pos[x]} <= {C2Y, C2X};
                end
                LOC_C2:
                    {best_pos[y], best_pos[x]} <= {C1Y, C1X};
                default:
                    {best_pos[y], best_pos[x]} <= 0;
            endcase
        end
    end


    // Finish searching
    always @(posedge CLK) begin
        if(!RST && !DONE && curr_state == FINISH)
            DONE <= TRUE;
        else  // RST or not FINISH
            DONE <= FALSE;
    end
endmodule
