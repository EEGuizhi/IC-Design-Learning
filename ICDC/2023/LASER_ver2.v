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
    parameter MOVE_C1 = 1;
    parameter LOC_C1 = 2;
    parameter MOVE_C2 = 3;
    parameter LOC_C2 = 4;
    parameter FINISH = 5;

    parameter LAST_OBJ = 39;
    parameter LAST_POS = {4'b1111, 4'b1111};


    wire max_update, equal_max;
    wire converge;

    wire [3:0] dist1_c1 [0:1];
    wire [3:0] dist1_c2 [0:1];
    wire [3:0] dist2_c1 [0:1];
    wire [3:0] dist2_c2 [0:1];
    wire count_obj1, count_obj2;
    reg obj1_inside_c1, obj1_inside_c2, obj2_inside_c1, obj2_inside_c2;
    reg check_done;

    reg [3:0] objects [0:39][0:1];
    reg [5:0] obj_ptr1, obj_ptr2;  // point to 40 objects, need 6 bits (2^6 = 64 > 40)
    reg [5:0] obj_counts;
    reg [5:0] max_counts;
    reg [3:0] best_pos [0:1];
    reg [3:0] last_pos [0:1];

    reg [2:0] curr_state;
    reg [2:0] next_state;


    // Max count update
    assign max_update = (obj_counts > max_counts) ? TRUE : FALSE;
    assign equal_max = (obj_counts == max_counts) ? TRUE : FALSE;

    // Convergence check
    assign converge = ({last_pos[y], last_pos[x]} == {best_pos[y], best_pos[x]}) ? TRUE : FALSE;

    // Inside circles checking
    assign dist1_c1[x] = (C1X > objects[obj_ptr1][x]) ? C1X - objects[obj_ptr1][x] : objects[obj_ptr1][x] - C1X;  // dist x to c1
    assign dist1_c1[y] = (C1Y > objects[obj_ptr1][y]) ? C1Y - objects[obj_ptr1][y] : objects[obj_ptr1][y] - C1Y;  // dist y to c1
    assign dist1_c2[x] = (C2X > objects[obj_ptr1][x]) ? C2X - objects[obj_ptr1][x] : objects[obj_ptr1][x] - C2X;  // dist x to c2
    assign dist1_c2[y] = (C2Y > objects[obj_ptr1][y]) ? C2Y - objects[obj_ptr1][y] : objects[obj_ptr1][y] - C2Y;  // dist y to c2
    assign dist2_c1[x] = (C1X > objects[obj_ptr2][x]) ? C1X - objects[obj_ptr2][x] : objects[obj_ptr2][x] - C1X;
    assign dist2_c1[y] = (C1Y > objects[obj_ptr2][y]) ? C1Y - objects[obj_ptr2][y] : objects[obj_ptr2][y] - C1Y;
    assign dist2_c2[x] = (C2X > objects[obj_ptr2][x]) ? C2X - objects[obj_ptr2][x] : objects[obj_ptr2][x] - C2X;
    assign dist2_c2[y] = (C2Y > objects[obj_ptr2][y]) ? C2Y - objects[obj_ptr2][y] : objects[obj_ptr2][y] - C2Y;

    always @(*) begin  // (0, 4), (1, 3), (2, 3), (3, 2), (3, 1), (4, 0)
        if((dist1_c1[x] + dist1_c1[y]) < 5 || (dist1_c1[x] == 3 && dist1_c1[y] == 2) || (dist1_c1[x] == 2 && dist1_c1[y] == 3))
            obj1_inside_c1 = TRUE;
        else
            obj1_inside_c1 = FALSE;
    end
    always @(*) begin  // (0, 4), (1, 3), (2, 3), (3, 2), (3, 1), (4, 0)
        if((dist1_c2[x] + dist1_c2[y]) < 5 || (dist1_c2[x] == 3 && dist1_c2[y] == 2) || (dist1_c2[x] == 2 && dist1_c2[y] == 3))
            obj1_inside_c2 = TRUE;
        else
            obj1_inside_c2 = FALSE;
    end
    always @(*) begin  // (0, 4), (1, 3), (2, 3), (3, 2), (3, 1), (4, 0)
        if((dist2_c1[x] + dist2_c1[y]) < 5 || (dist2_c1[x] == 3 && dist2_c1[y] == 2) || (dist2_c1[x] == 2 && dist2_c1[y] == 3))
            obj2_inside_c1 = TRUE;
        else
            obj2_inside_c1 = FALSE;
    end
    always @(*) begin  // (0, 4), (1, 3), (2, 3), (3, 2), (3, 1), (4, 0)
        if((dist2_c2[x] + dist2_c2[y]) < 5 || (dist2_c2[x] == 3 && dist2_c2[y] == 2) || (dist2_c2[x] == 2 && dist2_c2[y] == 3))
            obj2_inside_c2 = TRUE;
        else
            obj2_inside_c2 = FALSE;
    end


    // Whether checking 40 objs is done
    always @(*) begin
        if(obj_ptr2 == LAST_OBJ)
            check_done = TRUE;
        else
            check_done = FALSE;
    end


    // FSM
    always @(posedge CLK) begin
        if(RST)
            curr_state <= 0;
        else
            curr_state <= next_state;
    end
    always @(*) begin
        case(curr_state)
            INPUT: begin
                if(obj_ptr2 == LAST_OBJ)
                    next_state = MOVE_C1;
                else
                    next_state = INPUT;
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
                next_state = INPUT;
        endcase
    end


    // Objects coord saving
    always @(posedge CLK) begin
        if(curr_state == INPUT)
            {objects[obj_ptr2][y], objects[obj_ptr2][x]} <= {Y, X};
    end


    // Object pointers control
    always @(posedge CLK) begin
        if(RST)
            obj_ptr1 <= 0;
        else begin
            case(curr_state)
                MOVE_C1: begin
                    if(check_done)
                        obj_ptr1 <= 0;
                    else
                        obj_ptr1 <= obj_ptr1 + 1;
                end
                MOVE_C2: begin
                    if(check_done)
                        obj_ptr1 <= 0;
                    else
                        obj_ptr1 <= obj_ptr1 + 1;
                end
                default:
                    obj_ptr1 <= 0;
            endcase
        end
    end
    always @(posedge CLK) begin
        if(RST)
            obj_ptr2 <= 0;
        else begin
            case(curr_state)
                INPUT: begin
                    if(obj_ptr2 == LAST_OBJ)
                        obj_ptr2 <= 20;
                    else
                        obj_ptr2 <= obj_ptr2 + 1;
                end
                MOVE_C1: begin
                    if(check_done)
                        obj_ptr2 <= 20;
                    else
                        obj_ptr2 <= obj_ptr2 + 1;
                end
                MOVE_C2: begin
                    if(check_done)
                        obj_ptr2 <= 20;
                    else
                        obj_ptr2 <= obj_ptr2 + 1;
                end
                FINISH:
                    obj_ptr2 <= 0;
                default:
                    obj_ptr2 <= 20;
            endcase
        end
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
    assign count_obj1 = (obj1_inside_c1 || obj1_inside_c2) ? TRUE : FALSE;
    assign count_obj2 = (obj2_inside_c1 || obj2_inside_c2) ? TRUE : FALSE;
    always @(posedge CLK) begin  // counting objects
        if(RST)
            obj_counts <= 0;
        else begin
            case(curr_state)
                MOVE_C1: begin
                    if(check_done)  // reset
                        obj_counts <= 0;
                    else if(count_obj1 && count_obj2)  // counting
                        obj_counts <= obj_counts + 2;
                    else if(count_obj1 || count_obj2);
                        obj_counts <= obj_counts + 1;
                end
                MOVE_C2: begin
                    if(check_done)  // reset
                        obj_counts <= 0;
                    else if(count_obj1 && count_obj2)  // counting
                        obj_counts <= obj_counts + 2;
                    else if(count_obj1 || count_obj2);
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
            else if(curr_state == FINISH)  // reset
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
        if(RST)
            DONE <= FALSE;
        else begin
            if(curr_state == FINISH && !DONE)
                DONE <= TRUE;
            else
                DONE <= FALSE;
        end
    end
endmodule
