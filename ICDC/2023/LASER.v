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

    parameter INPUT = 0;  //states
    parameter MOVE_C1 = 1;
    parameter MOVE_C2 = 2;
    parameter FINISH = 3;

    parameter LAST_OBJ = 39;
    parameter LAST_POS = {4'b1111, 4'b1111};


    wire check_done;
    wire c1_finalcheck;
    wire c2_finalcheck;
    wire max_update;

    wire [3:0] dist_c1 [0:1];
    wire [3:0] dist_c2 [0:1];
    reg inside_c1, inside_c2;

    reg [3:0] objects [0:39][0:1];
    reg [5:0] obj_ptr;  // 40 objects, need 6 bits (2^6 - 1 = 63)
    reg [5:0] obj_counts;  // 
    reg [5:0] max_counts;  // 
    reg [3:0] best_pos [0:1];
    reg not_converge;

    reg [1:0] curr_state;
    reg [1:0] next_state;


    // Whether checking 40 objs is done
    assign check_done = (obj_ptr > LAST_OBJ) ? TRUE : FALSE;
    assign c1_finalcheck = (curr_state == MOVE_C1 && {C1Y, C1X} == LAST_POS) ? TRUE : FALSE;
    assign c2_finalcheck = (curr_state == MOVE_C2 && {C2Y, C2X} == LAST_POS) ? TRUE : FALSE;

    // Max count update
    assign max_update = (obj_counts > max_counts) ? TRUE : FALSE;

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
                        next_state = MOVE_C1;
                    else
                        next_state = INPUT;
                end
                MOVE_C1: begin
                    if(obj_ptr == LAST_OBJ+2 && {C1Y, C1X} == LAST_POS)  // 2 cycles after final counting
                        next_state = MOVE_C2;
                    else
                        next_state = MOVE_C1;
                end
                MOVE_C2: begin
                    if(obj_ptr == LAST_OBJ+2 && {C2Y, C2X} == LAST_POS)
                        if(not_converge)
                            next_state = MOVE_C1;
                        else
                            next_state = FINISH;
                    else
                        next_state = MOVE_C2;
                end
                FINISH: next_state = INPUT;
                default: next_state = 0;
            endcase
        end
    end


    // Objects coord saving
    always @(posedge CLK) begin
        if(curr_state == INPUT) begin
            objects[obj_ptr][x] <= X;
            objects[obj_ptr][y] <= Y;
        end
        else begin
            objects[obj_ptr][x] <= objects[obj_ptr][x];
            objects[obj_ptr][y] <= objects[obj_ptr][y];
        end
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
                MOVE_C1: begin
                    if({C1Y, C1X} == LAST_POS) begin
                        if(obj_ptr == LAST_OBJ+2)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= obj_ptr + 1;
                    end
                    else begin
                        if(check_done)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= obj_ptr + 1;
                    end
                end
                MOVE_C2: begin
                    if({C2Y, C2X} == LAST_POS) begin
                        if(obj_ptr == LAST_OBJ+2)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= obj_ptr + 1;
                    end
                    else begin
                        if(check_done)
                            obj_ptr <= 0;
                        else
                            obj_ptr <= obj_ptr + 1;
                    end
                end
                FINISH: obj_ptr <= 0;
                default: obj_ptr <= 0;
            endcase
        end
    end


    // Position control
    always @(posedge CLK) begin  // Circle 1
        if(RST)
            {C1Y, C1X} <= 0;
        else begin
            if(check_done) begin
                if(curr_state == MOVE_C1) begin
                    if({C1Y, C1X} == LAST_POS)  // prepare for C2 searching
                        {C1Y, C1X} <= {best_pos[y], best_pos[x]};
                    else  // next position
                        {C1Y, C1X} <= {C1Y, C1X} + 1;
                end
                else if(c2_finalcheck && not_converge)  // prepare for C1 searching
                    {C1Y, C1X} <= 0;
            end
            else if(DONE)  // reset
                {C1Y, C1X} <= 0;
        end
    end
    always @(posedge CLK) begin  // Circle 2
        if(RST)
            {C2Y, C2X} <= 0;
        else begin
            if(check_done) begin
                if(curr_state == MOVE_C2) begin
                    if({C2Y, C2X} == LAST_POS)  // prepare for C1 searching, or FINISH
                        {C2Y, C2X} <= {best_pos[y], best_pos[x]};
                    else  // next position
                        {C2Y, C2X} <= {C2Y, C2X} + 1;
                end
                else if(c1_finalcheck)  // prepare for C2 searching
                    {C2Y, C2X} <= 0;
            end
            else if(DONE)  // reset
                {C2Y, C2X} <= 0;
        end
    end


    // Logging best result
    always @(posedge CLK) begin  // counting objects
        if(RST)
            obj_counts <= 0;
        else begin
            if(curr_state == MOVE_C1 || curr_state == MOVE_C2) begin
                if(check_done)  // reset
                    obj_counts <= 0;
                else if(inside_c1 || inside_c2)  // counting
                    obj_counts <= obj_counts + 1;
            end
            else  // not counting when not searching C1 or C2
                obj_counts <= 0;
        end
    end
    always @(posedge CLK) begin  // logging max count
        if(RST)
            max_counts <= 0;
        else begin
            if(check_done && max_update)  // update max
                max_counts <= obj_counts;
            else if(DONE)  // reset
                max_counts <= 0;
        end
    end
    always @(posedge CLK) begin  // convergence checking
        if(RST)
            not_converge <= FALSE;
        else begin
            if(obj_ptr == LAST_OBJ+2 || DONE)  // reset
                not_converge <= FALSE;
            else if(check_done && max_update)
                not_converge <= TRUE;
        end
    end
    always @(posedge CLK) begin  // saving best position
        if(RST)
            {best_pos[y], best_pos[x]} <= 0;
        else begin
            if(check_done && max_update) begin
                if(curr_state == MOVE_C1)
                    {best_pos[y], best_pos[x]} <= {C1Y, C1X};
                else  // MOVE_C2
                    {best_pos[y], best_pos[x]} <= {C2Y, C2X};
            end
            else
                {best_pos[y], best_pos[x]} <= {best_pos[y], best_pos[x]};
        end
    end


    // Finish searching
    always @(posedge CLK) begin
        if(curr_state == FINISH && !RST)
            DONE <= TRUE;
        else  // RST or not FINISH
            DONE <= FALSE;
    end
endmodule
