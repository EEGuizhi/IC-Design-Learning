// 4109061012
module comparator_16b (
    input [15:0] data_a,
    input [15:0] data_b,
    output a_gt_b,
    output a_eq_b,
    output a_lt_b
    );

    wire [3:0] gt, eq, lt;

    comparator_4b c1_4b(.data_a(data_a[15:12]), .data_b(data_b[15:12]), .gt(gt[3]), .eq(eq[3]), .lt(lt[3]));
    comparator_4b c2_4b(.data_a(data_a[11:8]), .data_b(data_b[11:8]), .gt(gt[2]), .eq(eq[2]), .lt(lt[2]));
    comparator_4b c3_4b(.data_a(data_a[7:4]), .data_b(data_b[7:4]), .gt(gt[1]), .eq(eq[1]), .lt(lt[1]));
    comparator_4b c4_4b(.data_a(data_a[3:0]), .data_b(data_b[3:0]), .gt(gt[0]), .eq(eq[0]), .lt(lt[0]));

    comparator_4b c5_4b(.data_a(gt[3:0]), .data_b(lt[3:0]), .gt(a_gt_b), .eq(a_eq_b), .lt(a_lt_b));
endmodule
