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


    wire [3:0] dist_c1 [0:1];
    wire [3:0] dist_c2 [0:1];
    reg inside_c1, inside_c2;

    reg [3:0] objects [0:39][0:1];
    reg [5:0] obj_ptr;
    reg [5:0] obj_counts;  // 
    reg [5:0] max_counts;  // 
    reg [3:0] best_pos [0:1];
    reg update_max;

    wire check_done;
    wire c1_endsearch;
    wire c2_endsearch;

    reg [1:0] curr_state;
    reg [1:0] next_state;


    // Whether checking 40 objs is done
    assign check_done = (obj_ptr == LAST_OBJ + 1) ? TRUE : FALSE;
    assign c1_endsearch = (curr_state == MOVE_C1 && {C1Y, C1X} == LAST_POS && check_done) ? TRUE : FALSE;
    assign c2_endsearch = (curr_state == MOVE_C2 && {C2Y, C2X} == LAST_POS && check_done) ? TRUE : FALSE;

    // Inside circles checking
    assign dist_c1[x] = (C1X > objects[obj_ptr][x]) ? C1X - objects[obj_ptr][x] : objects[obj_ptr][x] - C1X;  // dist x to c1
    assign dist_c1[y] = (C1Y > objects[obj_ptr][x]) ? C1Y - objects[obj_ptr][y] : objects[obj_ptr][y] - C1Y;  // dist y to c1
    assign dist_c2[x] = (C2X > objects[obj_ptr][x]) ? C2X - objects[obj_ptr][x] : objects[obj_ptr][x] - C2X;  // dist x to c2
    assign dist_c2[y] = (C2Y > objects[obj_ptr][x]) ? C2Y - objects[obj_ptr][y] : objects[obj_ptr][y] - C2Y;  // dist y to c2
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
                    if(obj_counts == LAST_OBJ)
                        next_state = MOVE_C1;
                    else
                        next_state = INPUT;
                end
                MOVE_C1: begin
                    if(check_done && {C1Y, C1X} == LAST_POS)
                        next_state = MOVE_C2;
                    else
                        next_state = MOVE_C1;
                end
                MOVE_C2: begin
                    if(check_done && {C2Y, C2X} == LAST_POS)
                        if(update_max)
                            next_state = MOVE_C1;
                        else
                            next_state = FINISH;
                    else
                        next_state = MOVE_C2;
                end
                FINISH: begin
                    
                end
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
                    if(check_done)
                        obj_ptr <= 0;
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                MOVE_C2: begin
                    if(check_done)
                        obj_ptr <= 0;
                    else
                        obj_ptr <= obj_ptr + 1;
                end
                FINISH: obj_ptr <= 0;
                default: obj_ptr <= 0;
            endcase
        end
    end


    // Position control
    always @(posedge CLK) begin
        if(RST) begin
            {C1Y, C1X} <= 0;
            {C2Y, C2X} <= 0;
        end
        else begin
            if(c1_endsearch) begin
                {C1Y, C1X} <= {best_pos[y], best_pos[x]};
                {C1Y, C1X} <= 0;
            end
            else if(c2_endsearch) begin
                {C2Y, C2X} <= {best_pos[y], best_pos[x]};
                if(update_max)
                    {C1Y, C1X} <= 0;
                else
                    {C1Y, C1X} <= {C1Y, C1X};
            end
            else begin
                {C1Y, C1X} <= {C1Y, C1X};
                {C2Y, C2X} <= {C2Y, C2X};
            end
        end
    end


    // Logging best result
    always @(posedge CLK) begin
        if(RST)
            obj_counts <= 0;
        else begin
            case(curr_state)
                INPUT: obj_counts <= 0;
                MOVE_C1: begin
                    if(check_done)
                        obj_counts <= 0;
                    else if(inside_c1 || inside_c2)
                        obj_counts <= obj_counts + 1;
                    else
                        obj_counts <= obj_counts;
                end
                MOVE_C2: begin
                    if(check_done)
                        obj_counts <= 0;
                    else if(inside_c1 || inside_c2)
                        obj_counts <= obj_counts + 1;
                    else
                        obj_counts <= obj_counts;
                end
                FINISH: obj_counts <= 0;
                default: obj_counts <= 0;
            endcase
        end
    end
    always @(posedge CLK) begin
        if(RST) begin
            max_counts <= 0;
            update_max <= FALSE;
        end
        else begin
            if(c1_endsearch || c2_endsearch) begin
                max_counts <= max_counts;
                update_max <= FALSE;
            end
            else begin
                if(obj_counts > max_counts) begin
                    max_counts <= obj_counts;
                    update_max <= TRUE;
                end
                else begin
                    max_counts <= max_counts;
                    update_max <= update_max;
                end
            end
        end
    end
    always @(posedge CLK) begin
        if(RST)
            {best_pos[y], best_pos[x]} <= 0;
        else begin
            if(check_done && obj_counts > max_counts) begin
                if(curr_state == MOVE_C1)
                    {best_pos[y], best_pos[x]} <= {C1Y, C1X};
                else  // curr_state == MOVE_C2
                    {best_pos[y], best_pos[x]} <= {C2Y, C2X};
            end
            else
                {best_pos[y], best_pos[x]} <= {best_pos[y], best_pos[x]};
        end
    end

endmodule
