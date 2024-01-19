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


    wire check_done, c1_search_done, c2_search_done;
    wire max_update, equal_max;
    wire exchange, restart;
    wire converge;

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

    reg [2:0] curr_state;
    reg [2:0] next_state;


    // Sorting
    assign exchange = ({objects[obj_ptr][y], objects[obj_ptr][x]} > {objects[obj_ptr+1][y], objects[obj_ptr+1][x]}) ? TRUE : FALSE;
    assign restart = (obj_ptr == (LAST_OBJ-1 - obj_counts)) ? TRUE : FALSE;

    // Whether checking 40 objs is done
    assign c1_search_done = (C1Y == 11 || C1Y == 12 || C1Y == 13 || C1Y == 14 || C1Y == 15) ?
                            (obj_ptr == LAST_OBJ+1) ? TRUE : FALSE
                        :
                            (obj_ptr == row_ends[C1Y+4]) ? TRUE : FALSE;
    assign c2_search_done = (C2Y == 11 || C2Y == 12 || C2Y == 13 || C2Y == 14 || C2Y == 15) ?
                            (obj_ptr == LAST_OBJ+1) ? TRUE : FALSE
                        :
                            (obj_ptr == row_ends[C2Y+4]) ? TRUE : FALSE;
    assign check_done = (curr_state == MOVE_C1) ? c1_search_done : c2_search_done;

    // Max count update
    assign max_update = (obj_counts > max_counts) ? TRUE : FALSE;
    assign equal_max = (obj_counts == max_counts) ? TRUE : FALSE;

    // Convergence check
    assign converge = ({last_pos[y], last_pos[x]} == {best_pos[y], best_pos[x]}) ? TRUE : FALSE;

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
                    if(converge)
                        next_state = FINISH;
                    else
                        next_state = MOVE_C2;
                end
                MOVE_C2: begin
                    if(check_done && {C2Y, C2X} == LAST_POS)
                        next_state = LOC_C2;
                    else
                        next_state = MOVE_C2;
                end
                LOC_C2: begin
                    if(converge)
                        next_state = FINISH;
                    else
                        next_state = MOVE_C1;
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
                        if(C1Y == 0 || C1Y == 1 || C1Y == 2 || C1Y == 3 || C1Y == 4)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= row_ends[C1Y - 5];
                    end
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                MOVE_C2: begin
                    if(check_done) begin
                        if(C2Y == 0 || C2Y == 1 || C2Y == 2 || C2Y == 3 || C2Y == 4)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= row_ends[C2Y - 5];
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
                    if(!converge)
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
                    if(!converge)
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
                    else if(inside_c1 && !inside_c2)  // counting
                        obj_counts <= obj_counts + 1;
                end
                MOVE_C2: begin
                    if(check_done)  // reset
                        obj_counts <= 0;
                    else if(inside_c2 && !inside_c1)  // counting
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
            else if(curr_state == FIND_ROW || curr_state == LOC_C1 || curr_state == LOC_C2)  // reset
                max_counts <= 0;
        end
    end
    always @(posedge CLK) begin  // (position) convergence checking
        if(RST) begin
            last_pos[y] <= 0;
            last_pos[x] <= 0;
        end
        else begin
            case(curr_state)
                LOC_C1: begin  // saving c2 before MOVE_C2
                    last_pos[y] <= C2Y;
                    last_pos[x] <= C2X;
                end
                LOC_C1: begin  // saving c1 before MOVE_C1
                    last_pos[y] <= C1Y;
                    last_pos[x] <= C1X;
                end
                default: begin
                    last_pos[y] <= last_pos[y];
                    last_pos[x] <= last_pos[x];
                end
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
                MOVE_C2: begin
                    if(max_update || equal_max)
                        {best_pos[y], best_pos[x]} <= {C2Y, C2X};
                end
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
