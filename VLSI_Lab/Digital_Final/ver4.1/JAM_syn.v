/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon Dec 12 15:17:12 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2XL U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2XL U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U5 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2X1 U6 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U7 ( .A(A[7]), .B(carry[7]), .Y(n3) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N106, N107, N108, N112, N113, N114, N115, N116, N117, N118, N119,
         N120, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, \job[0][2] , \job[0][1] , \job[0][0] ,
         \job[1][2] , \job[1][1] , \job[1][0] , \job[2][2] , \job[2][1] ,
         \job[2][0] , \job[3][2] , \job[3][1] , \job[3][0] , \job[4][2] ,
         \job[4][1] , \job[4][0] , \job[5][2] , \job[5][1] , \job[5][0] ,
         \job[6][2] , \job[6][1] , \job[6][0] , \job[7][2] , \job[7][1] ,
         \job[7][0] , N151, N152, N153, N154, N155, N156, N157, N158, N159,
         Done, N248, N249, N274, N275, N276, N290, N291, N292, N293, N465,
         N466, N467, N468, N469, N470, N471, N472, N473, N474, N562, N563,
         n140, n149, n174, n175, n176, n179, n180, n183, n184, n186, n190,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, \sub_0_root_sub_83/carry[1] , \sub_0_root_sub_83/carry[2] ,
         \sub_0_root_sub_83/A[0] , n497, n513, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730,
         n731, n732, n733, n734, n735;
  wire   [1:0] swap_state;
  wire   [1:0] state;
  wire   [9:0] TotalCost;

  JAM_DW01_add_0 r572 ( .A(TotalCost), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N474, N473, N472, N471, N470, N469, N468, N467, N466, N465}) );
  DFFQX1 Done_reg ( .D(n466), .CK(CLK), .Q(Done) );
  EDFFTRX1 sum_flag_reg ( .RN(n530), .D(n685), .E(n694), .CK(CLK), .QN(n190)
         );
  DFFQX1 \state_reg[0]  ( .D(n496), .CK(CLK), .Q(state[0]) );
  DFFQX1 \swap_state_reg[1]  ( .D(n491), .CK(CLK), .Q(swap_state[1]) );
  DFFQX1 \swap_state_reg[0]  ( .D(n489), .CK(CLK), .Q(swap_state[0]) );
  DFFX1 \TotalCost_reg[8]  ( .D(n456), .CK(CLK), .Q(TotalCost[8]), .QN(n653)
         );
  DFFX1 \TotalCost_reg[7]  ( .D(n457), .CK(CLK), .Q(TotalCost[7]), .QN(n179)
         );
  DFFQX1 \ptr_reg[1]  ( .D(n486), .CK(CLK), .Q(N113) );
  EDFFX1 \ptr_reg[0]  ( .D(n356), .E(n672), .CK(CLK), .Q(N112), .QN(n140) );
  DFFX1 \TotalCost_reg[4]  ( .D(n460), .CK(CLK), .Q(TotalCost[4]), .QN(n656)
         );
  DFFX1 \TotalCost_reg[5]  ( .D(n459), .CK(CLK), .Q(TotalCost[5]), .QN(n655)
         );
  DFFX1 \TotalCost_reg[3]  ( .D(n461), .CK(CLK), .Q(TotalCost[3]), .QN(n183)
         );
  DFFX1 \TotalCost_reg[6]  ( .D(n458), .CK(CLK), .Q(TotalCost[6]), .QN(n180)
         );
  DFFX1 \TotalCost_reg[2]  ( .D(n462), .CK(CLK), .Q(TotalCost[2]), .QN(n184)
         );
  DFFX1 \TotalCost_reg[1]  ( .D(n464), .CK(CLK), .Q(TotalCost[1]), .QN(n657)
         );
  DFFX1 \TotalCost_reg[0]  ( .D(n463), .CK(CLK), .Q(TotalCost[0]), .QN(n186)
         );
  EDFFX1 \job_reg[0][0]  ( .D(n381), .E(n228), .CK(CLK), .Q(\job[0][0] ) );
  EDFFX1 \job_reg[7][0]  ( .D(n662), .E(n337), .CK(CLK), .Q(\job[7][0] ), .QN(
        n175) );
  EDFFX1 \job_reg[7][1]  ( .D(n663), .E(n337), .CK(CLK), .Q(\job[7][1] ), .QN(
        n174) );
  DFFQX1 \state_reg[1]  ( .D(n465), .CK(CLK), .Q(state[1]) );
  EDFFX1 \swap_ptr_reg[1]  ( .D(n363), .E(n366), .CK(CLK), .Q(N248), .QN(n149)
         );
  EDFFX1 \job_reg[0][2]  ( .D(n229), .E(n228), .CK(CLK), .Q(\job[0][2] ) );
  DFFQX1 \sum_ptr_reg[0]  ( .D(n494), .CK(CLK), .Q(N106) );
  DFFQX1 \sum_ptr_reg[1]  ( .D(n493), .CK(CLK), .Q(N107) );
  EDFFX1 \job_reg[0][1]  ( .D(n234), .E(n228), .CK(CLK), .Q(\job[0][1] ) );
  DFFQX1 \job_reg[2][0]  ( .D(n471), .CK(CLK), .Q(\job[2][0] ) );
  DFFQX1 \job_reg[3][0]  ( .D(n474), .CK(CLK), .Q(\job[3][0] ) );
  DFFQX1 \job_reg[2][2]  ( .D(n469), .CK(CLK), .Q(\job[2][2] ) );
  DFFQX1 \job_reg[1][0]  ( .D(n468), .CK(CLK), .Q(\job[1][0] ) );
  DFFQX1 \job_reg[5][0]  ( .D(n480), .CK(CLK), .Q(\job[5][0] ) );
  DFFQX1 \job_reg[6][0]  ( .D(n483), .CK(CLK), .Q(\job[6][0] ) );
  DFFQX1 \job_reg[4][2]  ( .D(n475), .CK(CLK), .Q(\job[4][2] ) );
  DFFQX1 \job_reg[4][0]  ( .D(n477), .CK(CLK), .Q(\job[4][0] ) );
  DFFXL \TotalCost_reg[9]  ( .D(n455), .CK(CLK), .Q(TotalCost[9]), .QN(n176)
         );
  DFFQX1 \MinCost_reg[4]  ( .D(n450), .CK(CLK), .Q(n745) );
  DFFQX1 \MinCost_reg[8]  ( .D(n446), .CK(CLK), .Q(n741) );
  DFFQX1 \MinCost_reg[3]  ( .D(n451), .CK(CLK), .Q(n746) );
  DFFQX1 \MatchCount_reg[2]  ( .D(n442), .CK(CLK), .Q(n737) );
  DFFQX1 \MatchCount_reg[1]  ( .D(n443), .CK(CLK), .Q(n738) );
  DFFQX1 \MinCost_reg[1]  ( .D(n453), .CK(CLK), .Q(n748) );
  DFFQX1 \MinCost_reg[0]  ( .D(n454), .CK(CLK), .Q(n749) );
  DFFQX1 \MatchCount_reg[0]  ( .D(n444), .CK(CLK), .Q(n739) );
  DFFQX1 \MinCost_reg[9]  ( .D(n445), .CK(CLK), .Q(n740) );
  DFFQX1 \MinCost_reg[7]  ( .D(n447), .CK(CLK), .Q(n742) );
  DFFQX1 \MinCost_reg[6]  ( .D(n448), .CK(CLK), .Q(n743) );
  DFFQX1 Valid_reg ( .D(n440), .CK(CLK), .Q(n750) );
  DFFQX1 \MinCost_reg[2]  ( .D(n452), .CK(CLK), .Q(n747) );
  DFFQX1 \MinCost_reg[5]  ( .D(n449), .CK(CLK), .Q(n744) );
  DFFQX1 \MatchCount_reg[3]  ( .D(n441), .CK(CLK), .Q(n736) );
  DFFX1 \job_reg[5][2]  ( .D(n478), .CK(CLK), .Q(\job[5][2] ), .QN(n728) );
  DFFX1 \job_reg[2][1]  ( .D(n470), .CK(CLK), .Q(\job[2][1] ), .QN(n726) );
  DFFX1 \job_reg[3][1]  ( .D(n473), .CK(CLK), .Q(\job[3][1] ), .QN(n717) );
  DFFX1 \sum_ptr_reg[2]  ( .D(n492), .CK(CLK), .Q(N108), .QN(n686) );
  DFFX1 \job_reg[6][2]  ( .D(n481), .CK(CLK), .Q(\job[6][2] ), .QN(n714) );
  DFFX1 \job_reg[6][1]  ( .D(n482), .CK(CLK), .Q(\job[6][1] ), .QN(n715) );
  DFFX1 \job_reg[5][1]  ( .D(n479), .CK(CLK), .Q(\job[5][1] ), .QN(n729) );
  DFFX1 \job_reg[3][2]  ( .D(n472), .CK(CLK), .Q(\job[3][2] ), .QN(n716) );
  DFFX1 \job_reg[1][1]  ( .D(n467), .CK(CLK), .Q(\job[1][1] ), .QN(n719) );
  EDFFX1 \job_reg[7][2]  ( .D(n664), .E(n337), .CK(CLK), .Q(\job[7][2] ) );
  DFFX2 \ptr_reg[2]  ( .D(n487), .CK(CLK), .Q(N114), .QN(n586) );
  DFFX2 \ptr_saver_reg[2]  ( .D(n488), .CK(CLK), .Q(N117), .QN(n604) );
  DFFX2 \ptr_saver_reg[0]  ( .D(n485), .CK(CLK), .Q(N115), .QN(n713) );
  DFFX2 \swap_ptr_reg[0]  ( .D(n490), .CK(CLK), .Q(\sub_0_root_sub_83/A[0] ), 
        .QN(n567) );
  DFFX2 \swap_ptr_reg[2]  ( .D(n495), .CK(CLK), .Q(N249), .QN(n568) );
  DFFX2 \ptr_saver_reg[1]  ( .D(n484), .CK(CLK), .Q(N116), .QN(n603) );
  EDFFX2 \job_reg[1][2]  ( .D(n661), .E(n243), .CK(CLK), .Q(\job[1][2] ) );
  DFFX2 \job_reg[4][1]  ( .D(n476), .CK(CLK), .Q(\job[4][1] ), .QN(n723) );
  CLKINVX1 U392 ( .A(n740), .Y(n651) );
  CLKINVX1 U393 ( .A(n748), .Y(n646) );
  CLKINVX1 U394 ( .A(n747), .Y(n647) );
  CLKINVX1 U395 ( .A(n746), .Y(n648) );
  CLKINVX1 U396 ( .A(n743), .Y(n649) );
  CLKINVX1 U397 ( .A(n742), .Y(n650) );
  OAI22X1 U398 ( .A0(TotalCost[9]), .A1(n651), .B0(n652), .B1(n639), .Y(N562)
         );
  CLKINVX1 U399 ( .A(n739), .Y(n731) );
  CLKINVX1 U400 ( .A(n738), .Y(n732) );
  CLKINVX1 U401 ( .A(n737), .Y(n733) );
  NAND3X1 U402 ( .A(n670), .B(n669), .C(n307), .Y(n295) );
  NAND3X1 U403 ( .A(n713), .B(n603), .C(N117), .Y(n293) );
  OAI221X1 U404 ( .A0(n254), .A1(n295), .B0(n688), .B1(n293), .C0(n303), .Y(
        n290) );
  NAND3X1 U405 ( .A(N290), .B(n669), .C(n307), .Y(n311) );
  NAND3X1 U406 ( .A(N117), .B(n603), .C(N115), .Y(n310) );
  OAI221X1 U407 ( .A0(n254), .A1(n311), .B0(n688), .B1(n310), .C0(n317), .Y(
        n308) );
  NAND3X1 U408 ( .A(n603), .B(n604), .C(N115), .Y(n239) );
  NAND3X1 U409 ( .A(N116), .B(n604), .C(N115), .Y(n279) );
  OAI211X1 U410 ( .A0(n688), .A1(n279), .B0(n287), .C0(n288), .Y(n277) );
  NAND3X1 U411 ( .A(n713), .B(n604), .C(N116), .Y(n261) );
  OAI221X1 U412 ( .A0(n275), .A1(n254), .B0(n688), .B1(n261), .C0(n276), .Y(
        n259) );
  OAI211X1 U413 ( .A0(n393), .A1(n358), .B0(n522), .C0(n529), .Y(n219) );
  AOI211X1 U414 ( .A0(n365), .A1(n673), .B0(n282), .C0(n366), .Y(n351) );
  OAI221X1 U415 ( .A0(n253), .A1(n254), .B0(n688), .B1(n239), .C0(n255), .Y(
        n243) );
  AND3X2 U416 ( .A(n734), .B(n688), .C(n735), .Y(n497) );
  CLKBUFX3 U417 ( .A(N112), .Y(n526) );
  OAI32XL U418 ( .A0(n423), .A1(\job[3][1] ), .A2(n726), .B0(n725), .B1(
        \job[3][2] ), .Y(n425) );
  OAI211XL U419 ( .A0(\job[6][2] ), .A1(n728), .B0(n412), .C0(n413), .Y(n400)
         );
  OAI211XL U420 ( .A0(\job[7][2] ), .A1(n714), .B0(n409), .C0(n410), .Y(n408)
         );
  OAI211X1 U421 ( .A0(\job[5][2] ), .A1(n722), .B0(n420), .C0(n421), .Y(n405)
         );
  NOR2X2 U422 ( .A(n566), .B(\sub_0_root_sub_83/A[0] ), .Y(n563) );
  NOR2X2 U423 ( .A(n603), .B(N115), .Y(n600) );
  AOI2BB2X1 U424 ( .B0(n521), .B1(n519), .A0N(n686), .A1N(n538), .Y(n518) );
  OAI22X1 U425 ( .A0(n568), .A1(n553), .B0(N249), .B1(n552), .Y(N153) );
  OAI22X1 U426 ( .A0(n602), .A1(n604), .B0(N117), .B1(n601), .Y(N157) );
  OAI22X1 U427 ( .A0(n586), .A1(n576), .B0(N114), .B1(n575), .Y(N155) );
  OAI22X1 U428 ( .A0(n604), .A1(n594), .B0(N117), .B1(n593), .Y(N158) );
  OAI22X1 U429 ( .A0(n565), .A1(n568), .B0(N249), .B1(n564), .Y(N151) );
  OAI22X1 U430 ( .A0(n586), .A1(n572), .B0(N114), .B1(n571), .Y(N156) );
  BUFX16 U431 ( .A(n736), .Y(MatchCount[3]) );
  BUFX12 U432 ( .A(n744), .Y(MinCost[5]) );
  INVX12 U433 ( .A(n647), .Y(MinCost[2]) );
  BUFX12 U434 ( .A(n750), .Y(Valid) );
  OAI22X1 U435 ( .A0(n584), .A1(n586), .B0(N114), .B1(n583), .Y(N154) );
  OAI22X1 U436 ( .A0(n568), .A1(n557), .B0(N249), .B1(n556), .Y(N152) );
  INVX12 U437 ( .A(n649), .Y(MinCost[6]) );
  INVX12 U438 ( .A(n650), .Y(MinCost[7]) );
  INVX12 U439 ( .A(n651), .Y(MinCost[9]) );
  INVX12 U440 ( .A(n731), .Y(MatchCount[0]) );
  BUFX12 U441 ( .A(n749), .Y(MinCost[0]) );
  NOR2BXL U442 ( .AN(n749), .B(TotalCost[0]), .Y(n629) );
  INVX12 U443 ( .A(n646), .Y(MinCost[1]) );
  AO21XL U444 ( .A0(n657), .A1(n629), .B0(n748), .Y(n628) );
  INVX12 U445 ( .A(n732), .Y(MatchCount[1]) );
  INVX12 U446 ( .A(n733), .Y(MatchCount[2]) );
  INVX12 U447 ( .A(n648), .Y(MinCost[3]) );
  NOR2BXL U448 ( .AN(TotalCost[3]), .B(n746), .Y(n643) );
  BUFX12 U449 ( .A(n741), .Y(MinCost[8]) );
  AOI32XL U450 ( .A0(n638), .A1(n654), .A2(n637), .B0(n741), .B1(n653), .Y(
        n639) );
  BUFX12 U451 ( .A(n745), .Y(MinCost[4]) );
  NOR2XL U452 ( .A(n656), .B(n745), .Y(n642) );
  CLKINVX1 U453 ( .A(n686), .Y(n549) );
  NOR2XL U454 ( .A(n655), .B(n744), .Y(n634) );
  NAND2X1 U455 ( .A(TotalCost[2]), .B(n647), .Y(n640) );
  NOR2XL U456 ( .A(n653), .B(n741), .Y(n627) );
  CLKINVX1 U457 ( .A(n204), .Y(n671) );
  CLKINVX1 U458 ( .A(n201), .Y(n684) );
  OAI21X1 U459 ( .A0(n526), .A1(n567), .B0(n438), .Y(N118) );
  NAND3X1 U460 ( .A(N290), .B(n258), .C(N291), .Y(n280) );
  NAND3X1 U461 ( .A(N291), .B(N290), .C(n307), .Y(n333) );
  NAND3X1 U462 ( .A(n258), .B(n669), .C(N290), .Y(n241) );
  NOR2BX1 U463 ( .AN(n668), .B(N292), .Y(n258) );
  NAND3X1 U464 ( .A(N291), .B(n670), .C(n307), .Y(n322) );
  NAND3X1 U465 ( .A(n258), .B(n670), .C(N291), .Y(n262) );
  NOR2X1 U466 ( .A(n372), .B(n336), .Y(n348) );
  CLKINVX1 U467 ( .A(N291), .Y(n669) );
  OA21XL U468 ( .A0(n684), .A1(N562), .B0(n530), .Y(n513) );
  NAND2X1 U469 ( .A(n513), .B(n206), .Y(n204) );
  AOI2BB2X1 U470 ( .B0(n549), .B1(n517), .A0N(n549), .A1N(n533), .Y(n516) );
  AOI2BB2X1 U471 ( .B0(n515), .B1(n549), .A0N(n549), .A1N(n545), .Y(n520) );
  BUFX16 U472 ( .A(N107), .Y(W[1]) );
  BUFX20 U473 ( .A(N106), .Y(W[0]) );
  AOI221XL U474 ( .A0(\job[2][1] ), .A1(n544), .B0(\job[3][1] ), .B1(n543), 
        .C0(n536), .Y(n537) );
  NOR2BXL U475 ( .AN(TotalCost[0]), .B(n749), .Y(n624) );
  OAI21XL U476 ( .A0(n426), .A1(n427), .B0(n428), .Y(n401) );
  CLKBUFX3 U477 ( .A(n218), .Y(n522) );
  NOR2X2 U478 ( .A(n336), .B(RST), .Y(n282) );
  NAND2X2 U479 ( .A(swap_state[0]), .B(n690), .Y(n336) );
  NAND2X2 U480 ( .A(swap_state[1]), .B(n695), .Y(n335) );
  NOR2X1 U481 ( .A(n682), .B(state[1]), .Y(n222) );
  NOR4X1 U482 ( .A(n190), .B(W[0]), .C(W[1]), .D(N108), .Y(n223) );
  OAI22XL U483 ( .A0(n526), .A1(n336), .B0(n335), .B1(n140), .Y(n354) );
  NAND3X1 U484 ( .A(N117), .B(n713), .C(N116), .Y(n321) );
  NAND3X1 U485 ( .A(N116), .B(N117), .C(N115), .Y(n332) );
  CLKINVX1 U486 ( .A(n224), .Y(n673) );
  NAND2X1 U487 ( .A(n694), .B(n529), .Y(n224) );
  CLKINVX1 U488 ( .A(n351), .Y(n672) );
  OAI221XL U489 ( .A0(n235), .A1(n706), .B0(n236), .B1(n232), .C0(n237), .Y(
        n234) );
  OAI221XL U490 ( .A0(n230), .A1(n706), .B0(n231), .B1(n232), .C0(n233), .Y(
        n229) );
  OAI221XL U491 ( .A0(n328), .A1(n706), .B0(n274), .B1(n232), .C0(n273), .Y(
        n381) );
  CLKINVX1 U492 ( .A(n319), .Y(n665) );
  INVX3 U493 ( .A(n219), .Y(n675) );
  CLKINVX1 U494 ( .A(n230), .Y(n681) );
  CLKINVX1 U495 ( .A(n235), .Y(n680) );
  CLKINVX1 U496 ( .A(n345), .Y(n678) );
  CLKINVX1 U497 ( .A(n328), .Y(n679) );
  CLKINVX1 U498 ( .A(n375), .Y(n698) );
  NOR3X1 U499 ( .A(n702), .B(n364), .C(n349), .Y(n227) );
  CLKINVX1 U500 ( .A(n363), .Y(n702) );
  CLKINVX1 U501 ( .A(N118), .Y(n622) );
  XOR2X1 U502 ( .A(n363), .B(n364), .Y(n362) );
  CLKINVX1 U503 ( .A(n254), .Y(n693) );
  NAND2X1 U504 ( .A(n691), .B(n368), .Y(n735) );
  OAI21XL U505 ( .A0(n349), .A1(n702), .B0(n364), .Y(n368) );
  CLKINVX1 U506 ( .A(n438), .Y(n708) );
  INVX3 U507 ( .A(n348), .Y(n688) );
  CLKINVX1 U508 ( .A(n257), .Y(n709) );
  CLKINVX1 U509 ( .A(n232), .Y(n706) );
  NAND2BX1 U510 ( .AN(N562), .B(N563), .Y(n201) );
  CLKINVX1 U511 ( .A(W[1]), .Y(n547) );
  CLKINVX1 U512 ( .A(W[0]), .Y(n548) );
  NAND2X1 U513 ( .A(N154), .B(n673), .Y(n233) );
  OAI22XL U514 ( .A0(n351), .A1(n352), .B0(n353), .B1(n712), .Y(n486) );
  AOI221XL U515 ( .A0(n709), .A1(n687), .B0(n702), .B1(n691), .C0(n355), .Y(
        n352) );
  NOR2X1 U516 ( .A(n351), .B(n354), .Y(n353) );
  OAI31XL U517 ( .A0(n335), .A1(n525), .A2(n526), .B0(n688), .Y(n355) );
  CLKBUFX3 U518 ( .A(n207), .Y(n523) );
  NAND2XL U519 ( .A(N562), .B(n206), .Y(n207) );
  CLKBUFX3 U520 ( .A(n676), .Y(n529) );
  CLKINVX1 U521 ( .A(n238), .Y(n661) );
  AOI221XL U522 ( .A0(n681), .A1(n239), .B0(n240), .B1(n241), .C0(n242), .Y(
        n238) );
  OAI22XL U523 ( .A0(n233), .A1(n241), .B0(n231), .B1(n239), .Y(n242) );
  OAI221X1 U524 ( .A0(n254), .A1(n322), .B0(n688), .B1(n321), .C0(n329), .Y(
        n319) );
  AOI31X1 U525 ( .A0(n524), .A1(n567), .A2(n304), .B0(n330), .Y(n329) );
  OAI31XL U526 ( .A0(n306), .A1(n526), .A2(n712), .B0(n530), .Y(n330) );
  NAND2X1 U527 ( .A(N156), .B(n673), .Y(n273) );
  NAND2X1 U528 ( .A(N155), .B(n673), .Y(n237) );
  NAND2X1 U529 ( .A(N152), .B(n282), .Y(n236) );
  NAND2X1 U530 ( .A(N151), .B(n282), .Y(n231) );
  AOI32XL U531 ( .A0(n376), .A1(n697), .A2(N152), .B0(N151), .B1(n699), .Y(
        n377) );
  NAND2X1 U532 ( .A(N153), .B(n282), .Y(n274) );
  INVXL U533 ( .A(N154), .Y(n699) );
  INVXL U534 ( .A(N155), .Y(n697) );
  OAI221XL U535 ( .A0(N155), .A1(n705), .B0(N156), .B1(n704), .C0(n375), .Y(
        n374) );
  NAND2XL U536 ( .A(N157), .B(n282), .Y(n230) );
  NAND2XL U537 ( .A(N157), .B(n699), .Y(n375) );
  OAI221XL U538 ( .A0(N152), .A1(n697), .B0(N153), .B1(n696), .C0(n376), .Y(
        n373) );
  INVXL U539 ( .A(N156), .Y(n696) );
  NAND2XL U540 ( .A(N158), .B(n282), .Y(n235) );
  NAND2X1 U541 ( .A(N159), .B(n282), .Y(n328) );
  OAI22XL U542 ( .A0(n707), .A1(n319), .B0(n665), .B1(n326), .Y(n483) );
  AOI221XL U543 ( .A0(n679), .A1(n321), .B0(n271), .B1(n322), .C0(n327), .Y(
        n326) );
  OAI22XL U544 ( .A0(n273), .A1(n322), .B0(n274), .B1(n321), .Y(n327) );
  OAI22XL U545 ( .A0(n724), .A1(n290), .B0(n667), .B1(n301), .Y(n477) );
  AOI221XL U546 ( .A0(n679), .A1(n293), .B0(n271), .B1(n295), .C0(n302), .Y(
        n301) );
  OAI22XL U547 ( .A0(n273), .A1(n295), .B0(n274), .B1(n293), .Y(n302) );
  CLKINVX1 U548 ( .A(n308), .Y(n666) );
  CLKINVX1 U549 ( .A(n259), .Y(n659) );
  CLKINVX1 U550 ( .A(n290), .Y(n667) );
  CLKINVX1 U551 ( .A(n277), .Y(n658) );
  AO21X1 U552 ( .A0(n282), .A1(n369), .B0(n366), .Y(n345) );
  OAI21XL U553 ( .A0(n370), .A1(n371), .B0(n372), .Y(n369) );
  OAI211XL U554 ( .A0(N157), .A1(n699), .B0(n373), .C0(n374), .Y(n371) );
  OAI31XL U555 ( .A0(n697), .A1(N158), .A2(n698), .B0(n377), .Y(n370) );
  NOR2BX1 U556 ( .AN(N275), .B(n224), .Y(n245) );
  NOR2BX1 U557 ( .AN(N274), .B(n224), .Y(n240) );
  NOR2BX1 U558 ( .AN(N276), .B(n224), .Y(n271) );
  CLKINVX1 U559 ( .A(n243), .Y(n660) );
  OAI22XL U560 ( .A0(n717), .A1(n277), .B0(n658), .B1(n283), .Y(n473) );
  AOI221XL U561 ( .A0(n265), .A1(n279), .B0(n266), .B1(n280), .C0(n284), .Y(
        n283) );
  OAI221XL U562 ( .A0(n268), .A1(n279), .B0(n269), .B1(n280), .C0(n530), .Y(
        n284) );
  OAI22XL U563 ( .A0(n716), .A1(n277), .B0(n658), .B1(n278), .Y(n472) );
  AOI221XL U564 ( .A0(n681), .A1(n279), .B0(n240), .B1(n280), .C0(n281), .Y(
        n278) );
  OAI22XL U565 ( .A0(n233), .A1(n280), .B0(n231), .B1(n279), .Y(n281) );
  OAI22XL U566 ( .A0(n711), .A1(n277), .B0(n658), .B1(n285), .Y(n474) );
  AOI221XL U567 ( .A0(n248), .A1(n279), .B0(n249), .B1(n280), .C0(n286), .Y(
        n285) );
  OAI221XL U568 ( .A0(n251), .A1(n279), .B0(n252), .B1(n280), .C0(n530), .Y(
        n286) );
  OAI22XL U569 ( .A0(n730), .A1(n308), .B0(n666), .B1(n315), .Y(n480) );
  AOI221XL U570 ( .A0(n248), .A1(n310), .B0(n249), .B1(n311), .C0(n316), .Y(
        n315) );
  OAI221XL U571 ( .A0(n251), .A1(n310), .B0(n252), .B1(n311), .C0(n529), .Y(
        n316) );
  OAI22XL U572 ( .A0(n729), .A1(n308), .B0(n666), .B1(n313), .Y(n479) );
  AOI221XL U573 ( .A0(n680), .A1(n310), .B0(n245), .B1(n311), .C0(n314), .Y(
        n313) );
  OAI22XL U574 ( .A0(n237), .A1(n311), .B0(n236), .B1(n310), .Y(n314) );
  OAI22XL U575 ( .A0(n728), .A1(n308), .B0(n666), .B1(n309), .Y(n478) );
  AOI221XL U576 ( .A0(n292), .A1(n310), .B0(n294), .B1(n311), .C0(n312), .Y(
        n309) );
  OAI221XL U577 ( .A0(n297), .A1(n310), .B0(n298), .B1(n311), .C0(n530), .Y(
        n312) );
  OAI22XL U578 ( .A0(n727), .A1(n259), .B0(n659), .B1(n270), .Y(n471) );
  AOI221XL U579 ( .A0(n679), .A1(n261), .B0(n271), .B1(n262), .C0(n272), .Y(
        n270) );
  OAI22XL U580 ( .A0(n262), .A1(n273), .B0(n261), .B1(n274), .Y(n272) );
  OAI22XL U581 ( .A0(n726), .A1(n259), .B0(n659), .B1(n264), .Y(n470) );
  AOI221XL U582 ( .A0(n265), .A1(n261), .B0(n266), .B1(n262), .C0(n267), .Y(
        n264) );
  OAI221XL U583 ( .A0(n261), .A1(n268), .B0(n262), .B1(n269), .C0(n530), .Y(
        n267) );
  OAI22XL U584 ( .A0(n725), .A1(n259), .B0(n659), .B1(n260), .Y(n469) );
  AOI221XL U585 ( .A0(n681), .A1(n261), .B0(n240), .B1(n262), .C0(n263), .Y(
        n260) );
  OAI22XL U586 ( .A0(n233), .A1(n262), .B0(n231), .B1(n261), .Y(n263) );
  OAI22XL U587 ( .A0(n723), .A1(n290), .B0(n667), .B1(n299), .Y(n476) );
  AOI221XL U588 ( .A0(n680), .A1(n293), .B0(n245), .B1(n295), .C0(n300), .Y(
        n299) );
  OAI22XL U589 ( .A0(n237), .A1(n295), .B0(n236), .B1(n293), .Y(n300) );
  OAI22XL U590 ( .A0(n722), .A1(n290), .B0(n667), .B1(n291), .Y(n475) );
  AOI221XL U591 ( .A0(n292), .A1(n293), .B0(n294), .B1(n295), .C0(n296), .Y(
        n291) );
  OAI221XL U592 ( .A0(n293), .A1(n297), .B0(n295), .B1(n298), .C0(n530), .Y(
        n296) );
  OAI22XL U593 ( .A0(n715), .A1(n319), .B0(n665), .B1(n324), .Y(n482) );
  AOI221XL U594 ( .A0(n265), .A1(n321), .B0(n266), .B1(n322), .C0(n325), .Y(
        n324) );
  OAI221XL U595 ( .A0(n268), .A1(n321), .B0(n269), .B1(n322), .C0(n529), .Y(
        n325) );
  OAI22XL U596 ( .A0(n714), .A1(n319), .B0(n665), .B1(n320), .Y(n481) );
  AOI221XL U597 ( .A0(n292), .A1(n321), .B0(n294), .B1(n322), .C0(n323), .Y(
        n320) );
  OAI221XL U598 ( .A0(n297), .A1(n321), .B0(n298), .B1(n322), .C0(n529), .Y(
        n323) );
  OAI22XL U599 ( .A0(n720), .A1(n243), .B0(n660), .B1(n247), .Y(n468) );
  AOI221XL U600 ( .A0(n248), .A1(n239), .B0(n249), .B1(n241), .C0(n250), .Y(
        n247) );
  OAI221XL U601 ( .A0(n239), .A1(n251), .B0(n241), .B1(n252), .C0(n530), .Y(
        n250) );
  OAI22XL U602 ( .A0(n719), .A1(n243), .B0(n660), .B1(n244), .Y(n467) );
  AOI221XL U603 ( .A0(n680), .A1(n239), .B0(n245), .B1(n241), .C0(n246), .Y(
        n244) );
  OAI22XL U604 ( .A0(n241), .A1(n237), .B0(n236), .B1(n239), .Y(n246) );
  OAI22XL U605 ( .A0(n713), .A1(n345), .B0(n678), .B1(n350), .Y(n485) );
  AOI222XL U606 ( .A0(n349), .A1(n691), .B0(n526), .B1(n687), .C0(n524), .C1(
        n348), .Y(n350) );
  OAI21XL U607 ( .A0(n695), .A1(n378), .B0(n379), .Y(n489) );
  AO21X1 U608 ( .A0(n335), .A1(n380), .B0(n674), .Y(n379) );
  CLKINVX1 U609 ( .A(n378), .Y(n674) );
  CLKINVX1 U610 ( .A(n338), .Y(n663) );
  AOI221XL U611 ( .A0(n265), .A1(n332), .B0(n266), .B1(n333), .C0(n339), .Y(
        n338) );
  OAI221XL U612 ( .A0(n268), .A1(n332), .B0(n269), .B1(n333), .C0(n530), .Y(
        n339) );
  CLKINVX1 U613 ( .A(n331), .Y(n664) );
  AOI221XL U614 ( .A0(n292), .A1(n332), .B0(n294), .B1(n333), .C0(n334), .Y(
        n331) );
  OAI221XL U615 ( .A0(n297), .A1(n332), .B0(n298), .B1(n333), .C0(n529), .Y(
        n334) );
  CLKINVX1 U616 ( .A(n340), .Y(n662) );
  AOI221XL U617 ( .A0(n248), .A1(n332), .B0(n249), .B1(n333), .C0(n341), .Y(
        n340) );
  OAI221XL U618 ( .A0(n251), .A1(n332), .B0(n252), .B1(n333), .C0(n529), .Y(
        n341) );
  CLKBUFX3 U619 ( .A(n676), .Y(n530) );
  CLKINVX1 U620 ( .A(n526), .Y(n585) );
  NAND2X1 U621 ( .A(N154), .B(n694), .Y(n298) );
  NAND2X1 U622 ( .A(N156), .B(n694), .Y(n252) );
  NAND2X1 U623 ( .A(N155), .B(n694), .Y(n269) );
  NAND2X1 U624 ( .A(N152), .B(n687), .Y(n268) );
  NAND2X1 U625 ( .A(N151), .B(n687), .Y(n297) );
  NAND2BXL U626 ( .AN(N151), .B(N154), .Y(n376) );
  INVXL U627 ( .A(N158), .Y(n705) );
  INVXL U628 ( .A(N159), .Y(n704) );
  OAI22XL U629 ( .A0(n349), .A1(n677), .B0(n366), .B1(n567), .Y(n490) );
  OAI22XL U630 ( .A0(n364), .A1(n677), .B0(n366), .B1(n568), .Y(n495) );
  CLKINVX1 U631 ( .A(n366), .Y(n677) );
  CLKINVX1 U632 ( .A(n524), .Y(n566) );
  AOI2BB2X2 U633 ( .B0(n398), .B1(n399), .A0N(n703), .A1N(n400), .Y(n349) );
  OAI31XL U634 ( .A0(n401), .A1(n721), .A2(n402), .B0(n710), .Y(n399) );
  CLKINVX1 U635 ( .A(n403), .Y(n710) );
  NAND2X1 U636 ( .A(N153), .B(n687), .Y(n251) );
  NOR2BX1 U637 ( .AN(N157), .B(n336), .Y(n292) );
  NOR2BX1 U638 ( .AN(N275), .B(n335), .Y(n266) );
  NOR2BX1 U639 ( .AN(N274), .B(n335), .Y(n294) );
  NOR2BX1 U640 ( .AN(N276), .B(n335), .Y(n249) );
  NOR2X1 U641 ( .A(n705), .B(n336), .Y(n265) );
  NAND2X1 U642 ( .A(n526), .B(n567), .Y(n438) );
  NOR2X1 U643 ( .A(n704), .B(n336), .Y(n248) );
  CLKINVX1 U644 ( .A(n405), .Y(n721) );
  AO21X1 U645 ( .A0(n398), .A1(n404), .B0(n703), .Y(n363) );
  AO21X1 U646 ( .A0(n405), .A1(n402), .B0(n403), .Y(n404) );
  OAI2BB1X1 U647 ( .A0N(n405), .A1N(n406), .B0(n407), .Y(n403) );
  CLKINVX1 U648 ( .A(N119), .Y(n621) );
  INVX1 U649 ( .A(N290), .Y(n670) );
  NAND2X2 U650 ( .A(n694), .B(n365), .Y(n254) );
  INVX3 U651 ( .A(n525), .Y(n712) );
  INVX3 U652 ( .A(n335), .Y(n694) );
  NOR2BX1 U653 ( .AN(n400), .B(n703), .Y(n398) );
  AND2X2 U654 ( .A(N292), .B(n668), .Y(n307) );
  AND3X2 U655 ( .A(n407), .B(n405), .C(n398), .Y(n364) );
  CLKINVX1 U656 ( .A(N120), .Y(n623) );
  CLKINVX1 U657 ( .A(N293), .Y(n668) );
  INVX3 U658 ( .A(n336), .Y(n687) );
  INVX3 U659 ( .A(n357), .Y(n691) );
  NOR2X1 U660 ( .A(n688), .B(n568), .Y(n304) );
  NAND2X1 U661 ( .A(n691), .B(n222), .Y(n226) );
  NAND2X1 U662 ( .A(n336), .B(n335), .Y(n358) );
  NAND2X1 U663 ( .A(n526), .B(n712), .Y(n257) );
  NOR2X1 U664 ( .A(n683), .B(n682), .Y(n197) );
  NAND3X1 U665 ( .A(n603), .B(n604), .C(n713), .Y(n232) );
  NAND3X1 U666 ( .A(n525), .B(n586), .C(n526), .Y(n289) );
  CLKINVX1 U667 ( .A(n223), .Y(n685) );
  CLKINVX1 U668 ( .A(n354), .Y(n689) );
  CLKINVX1 U669 ( .A(n641), .Y(n652) );
  CLKINVX1 U670 ( .A(n627), .Y(n654) );
  INVX12 U671 ( .A(n518), .Y(J[1]) );
  CLKINVX1 U672 ( .A(n537), .Y(n519) );
  OAI32XL U673 ( .A0(n732), .A1(n737), .A2(n200), .B0(n202), .B1(n733), .Y(
        n442) );
  NAND3XL U674 ( .A(n684), .B(n671), .C(n739), .Y(n200) );
  OAI22XL U675 ( .A0(n203), .A1(n732), .B0(n738), .B1(n200), .Y(n443) );
  INVX12 U676 ( .A(n520), .Y(J[2]) );
  CLKINVX1 U677 ( .A(n546), .Y(n515) );
  INVX12 U678 ( .A(n516), .Y(J[0]) );
  CLKINVX1 U679 ( .A(n534), .Y(n517) );
  AOI2BB1XL U680 ( .A0N(n739), .A1N(n201), .B0(n204), .Y(n203) );
  OA21XL U681 ( .A0(n738), .A1(n201), .B0(n203), .Y(n202) );
  OAI2BB1XL U682 ( .A0N(MatchCount[3]), .A1N(n198), .B0(n199), .Y(n441) );
  OAI21XL U683 ( .A0(n737), .A1(n201), .B0(n202), .Y(n198) );
  OR4XL U684 ( .A(MatchCount[3]), .B(n733), .C(n732), .D(n200), .Y(n199) );
  OAI21XL U685 ( .A0(n671), .A1(n731), .B0(n205), .Y(n444) );
  OAI21XL U686 ( .A0(N562), .A1(n731), .B0(n671), .Y(n205) );
  OAI211X1 U687 ( .A0(n523), .A1(n657), .B0(n216), .C0(n529), .Y(n453) );
  NAND2XL U688 ( .A(MinCost[1]), .B(n523), .Y(n216) );
  OAI211X1 U689 ( .A0(n523), .A1(n184), .B0(n215), .C0(n529), .Y(n452) );
  NAND2XL U690 ( .A(n747), .B(n523), .Y(n215) );
  OAI211X1 U691 ( .A0(n523), .A1(n183), .B0(n214), .C0(n529), .Y(n451) );
  NAND2XL U692 ( .A(MinCost[3]), .B(n523), .Y(n214) );
  OAI211X1 U693 ( .A0(n523), .A1(n656), .B0(n213), .C0(n529), .Y(n450) );
  NAND2XL U694 ( .A(MinCost[4]), .B(n523), .Y(n213) );
  OAI211X1 U695 ( .A0(n523), .A1(n655), .B0(n212), .C0(n529), .Y(n449) );
  NAND2XL U696 ( .A(MinCost[5]), .B(n523), .Y(n212) );
  OAI211X1 U697 ( .A0(n523), .A1(n180), .B0(n211), .C0(n529), .Y(n448) );
  NAND2XL U698 ( .A(n743), .B(n523), .Y(n211) );
  OAI211X1 U699 ( .A0(n523), .A1(n179), .B0(n210), .C0(n529), .Y(n447) );
  NAND2XL U700 ( .A(n742), .B(n523), .Y(n210) );
  OAI211X1 U701 ( .A0(n523), .A1(n653), .B0(n209), .C0(n529), .Y(n446) );
  NAND2XL U702 ( .A(MinCost[8]), .B(n523), .Y(n209) );
  OAI211X1 U703 ( .A0(n523), .A1(n176), .B0(n208), .C0(n529), .Y(n445) );
  NAND2XL U704 ( .A(n740), .B(n523), .Y(n208) );
  OAI211X1 U705 ( .A0(n523), .A1(n186), .B0(n217), .C0(n529), .Y(n454) );
  NAND2XL U706 ( .A(MinCost[0]), .B(n523), .Y(n217) );
  OAI22XL U707 ( .A0(n351), .A1(n359), .B0(n586), .B1(n672), .Y(n487) );
  AOI211X1 U708 ( .A0(N114), .A1(n360), .B0(n361), .C0(n348), .Y(n359) );
  OAI221XL U709 ( .A0(n335), .A1(n712), .B0(n525), .B1(n336), .C0(n689), .Y(
        n360) );
  OAI22XL U710 ( .A0(n362), .A1(n357), .B0(n336), .B1(n289), .Y(n361) );
  OAI2BB2XL U711 ( .B0(n179), .B1(n522), .A0N(N472), .A1N(n675), .Y(n457) );
  CLKINVX1 U712 ( .A(RST), .Y(n676) );
  OAI2BB2XL U713 ( .B0(n176), .B1(n522), .A0N(N474), .A1N(n675), .Y(n455) );
  OAI2BB2XL U714 ( .B0(n653), .B1(n522), .A0N(N473), .A1N(n675), .Y(n456) );
  AOI211X1 U715 ( .A0(n692), .A1(n709), .B0(RST), .C0(n318), .Y(n317) );
  NOR3BXL U716 ( .AN(n304), .B(n524), .C(n567), .Y(n318) );
  CLKINVX1 U717 ( .A(n306), .Y(n692) );
  OA21XL U718 ( .A0(n526), .A1(N114), .B0(n262), .Y(n275) );
  AOI31X1 U719 ( .A0(n524), .A1(n567), .A2(n256), .B0(RST), .Y(n276) );
  AOI31X1 U720 ( .A0(n567), .A1(n149), .A2(n304), .B0(n305), .Y(n303) );
  OAI31XL U721 ( .A0(n306), .A1(n525), .A2(n526), .B0(n530), .Y(n305) );
  AO21X1 U722 ( .A0(n289), .A1(n280), .B0(n254), .Y(n287) );
  AOI31X1 U723 ( .A0(\sub_0_root_sub_83/A[0] ), .A1(n524), .A2(n256), .B0(RST), 
        .Y(n288) );
  OA21XL U724 ( .A0(n257), .A1(N114), .B0(n241), .Y(n253) );
  AOI31X1 U725 ( .A0(\sub_0_root_sub_83/A[0] ), .A1(n149), .A2(n256), .B0(RST), 
        .Y(n255) );
  NOR3X2 U726 ( .A(n227), .B(RST), .C(n226), .Y(n366) );
  OAI32X1 U727 ( .A0(n548), .A1(W[1]), .A2(n219), .B0(n392), .B1(n547), .Y(
        n493) );
  OA21XL U728 ( .A0(n219), .A1(W[0]), .B0(n522), .Y(n392) );
  NAND4X1 U729 ( .A(n385), .B(n226), .C(n688), .D(n529), .Y(n378) );
  NAND3BX1 U730 ( .AN(n365), .B(n694), .C(n386), .Y(n385) );
  NOR3X1 U731 ( .A(W[0]), .B(N108), .C(W[1]), .Y(n386) );
  OAI22XL U732 ( .A0(n522), .A1(n548), .B0(W[0]), .B1(n219), .Y(n494) );
  OAI22XL U733 ( .A0(n686), .A1(n522), .B0(n390), .B1(n219), .Y(n492) );
  XOR2X1 U734 ( .A(n391), .B(N108), .Y(n390) );
  NAND2X1 U735 ( .A(W[0]), .B(W[1]), .Y(n391) );
  OAI221X1 U736 ( .A0(n254), .A1(n333), .B0(n688), .B1(n332), .C0(n342), .Y(
        n337) );
  AOI31X1 U737 ( .A0(\sub_0_root_sub_83/A[0] ), .A1(n524), .A2(n304), .B0(n343), .Y(n342) );
  OAI31XL U738 ( .A0(n306), .A1(n712), .A2(n140), .B0(n530), .Y(n343) );
  OAI22XL U739 ( .A0(n603), .A1(n345), .B0(n678), .B1(n346), .Y(n484) );
  AOI222XL U740 ( .A0(n691), .A1(n347), .B0(n525), .B1(n687), .C0(N249), .C1(
        n348), .Y(n346) );
  XOR2X1 U741 ( .A(n702), .B(n349), .Y(n347) );
  OAI22XL U742 ( .A0(n604), .A1(n345), .B0(n678), .B1(n497), .Y(n488) );
  NAND2X1 U743 ( .A(N114), .B(n687), .Y(n734) );
  OAI22XL U744 ( .A0(n690), .A1(n378), .B0(n674), .B1(n384), .Y(n491) );
  NOR3X1 U745 ( .A(n358), .B(RST), .C(n227), .Y(n384) );
  NOR2X1 U746 ( .A(RST), .B(n691), .Y(n380) );
  OAI2BB2XL U747 ( .B0(n180), .B1(n522), .A0N(N471), .A1N(n675), .Y(n458) );
  OAI2BB2XL U748 ( .B0(n655), .B1(n522), .A0N(N470), .A1N(n675), .Y(n459) );
  OAI2BB2XL U749 ( .B0(n656), .B1(n522), .A0N(N469), .A1N(n675), .Y(n460) );
  OAI2BB2XL U750 ( .B0(n183), .B1(n522), .A0N(N468), .A1N(n675), .Y(n461) );
  OAI2BB2XL U751 ( .B0(n184), .B1(n522), .A0N(N467), .A1N(n675), .Y(n462) );
  OAI2BB2XL U752 ( .B0(n186), .B1(n522), .A0N(N465), .A1N(n675), .Y(n463) );
  OAI2BB2XL U753 ( .B0(n657), .B1(n522), .A0N(N466), .A1N(n675), .Y(n464) );
  OAI211X1 U754 ( .A0(n223), .A1(n335), .B0(n394), .C0(n380), .Y(n218) );
  NAND3X1 U755 ( .A(n687), .B(n395), .C(n396), .Y(n394) );
  OAI221XL U756 ( .A0(W[1]), .A1(n149), .B0(W[0]), .B1(n567), .C0(n397), .Y(
        n395) );
  CLKBUFX3 U757 ( .A(N113), .Y(n525) );
  OAI211X1 U758 ( .A0(n688), .A1(n232), .B0(n382), .C0(n383), .Y(n228) );
  NAND4X1 U759 ( .A(n693), .B(n258), .C(n670), .D(n669), .Y(n382) );
  AOI31X1 U760 ( .A0(n567), .A1(n149), .A2(n256), .B0(RST), .Y(n383) );
  OAI22XL U761 ( .A0(n683), .A1(n220), .B0(RST), .B1(n221), .Y(n465) );
  NOR2X1 U762 ( .A(n197), .B(n222), .Y(n221) );
  AOI2BB1XL U763 ( .A0N(n197), .A1N(Valid), .B0(RST), .Y(n440) );
  NOR3BXL U764 ( .AN(n220), .B(RST), .C(n206), .Y(n496) );
  NAND3X1 U765 ( .A(n432), .B(n433), .C(n434), .Y(n220) );
  NAND4X1 U766 ( .A(W[0]), .B(n393), .C(N108), .D(W[1]), .Y(n433) );
  OAI21XL U767 ( .A0(n223), .A1(n691), .B0(state[1]), .Y(n432) );
  NOR3X1 U768 ( .A(n222), .B(RST), .C(n197), .Y(n434) );
  OAI2BB2XL U769 ( .B0(RST), .B1(n225), .A0N(n225), .A1N(Done), .Y(n466) );
  AOI2BB1X1 U770 ( .A0N(n226), .A1N(n701), .B0(RST), .Y(n225) );
  CLKINVX1 U771 ( .A(n227), .Y(n701) );
  CLKBUFX3 U772 ( .A(N248), .Y(n524) );
  NAND3X1 U773 ( .A(n422), .B(n729), .C(\job[4][1] ), .Y(n420) );
  OAI221XL U774 ( .A0(\job[4][1] ), .A1(n729), .B0(\job[4][0] ), .B1(n730), 
        .C0(n422), .Y(n421) );
  NAND2X1 U775 ( .A(\job[5][2] ), .B(n722), .Y(n422) );
  XOR2X1 U776 ( .A(n438), .B(n439), .Y(N119) );
  XOR2X1 U777 ( .A(n149), .B(n525), .Y(n439) );
  CLKINVX1 U778 ( .A(\job[4][2] ), .Y(n722) );
  NAND3X1 U779 ( .A(n415), .B(n401), .C(n416), .Y(n407) );
  OAI2BB2XL U780 ( .B0(\job[1][2] ), .B1(n429), .A0N(n430), .A1N(\job[0][2] ), 
        .Y(n415) );
  NOR3X1 U781 ( .A(n402), .B(n721), .C(n406), .Y(n416) );
  NOR2X1 U782 ( .A(\job[0][2] ), .B(n430), .Y(n429) );
  CLKINVX1 U783 ( .A(\job[5][0] ), .Y(n730) );
  OAI31X1 U784 ( .A0(n387), .A1(N115), .A2(n700), .B0(n388), .Y(n365) );
  OAI21XL U785 ( .A0(n525), .A1(n603), .B0(n526), .Y(n387) );
  AOI32X1 U786 ( .A0(n389), .A1(n603), .A2(n525), .B0(N114), .B1(n604), .Y(
        n388) );
  CLKINVX1 U787 ( .A(n389), .Y(n700) );
  AOI2BB1X1 U788 ( .A0N(n417), .A1N(n418), .B0(n419), .Y(n406) );
  OAI22XL U789 ( .A0(\job[3][1] ), .A1(n723), .B0(\job[3][0] ), .B1(n724), .Y(
        n418) );
  OAI32X1 U790 ( .A0(n417), .A1(\job[4][1] ), .A2(n717), .B0(n716), .B1(
        \job[4][2] ), .Y(n419) );
  NOR2X1 U791 ( .A(n722), .B(\job[3][2] ), .Y(n417) );
  NAND3X1 U792 ( .A(n414), .B(n715), .C(\job[5][1] ), .Y(n412) );
  OAI221XL U793 ( .A0(\job[5][1] ), .A1(n715), .B0(\job[5][0] ), .B1(n707), 
        .C0(n414), .Y(n413) );
  NAND2X1 U794 ( .A(\job[6][2] ), .B(n728), .Y(n414) );
  AOI32X1 U795 ( .A0(n397), .A1(n149), .A2(W[1]), .B0(N108), .B1(n568), .Y(
        n396) );
  XOR2X1 U796 ( .A(n435), .B(n436), .Y(N120) );
  XOR2X1 U797 ( .A(n568), .B(N114), .Y(n436) );
  OAI21XL U798 ( .A0(n525), .A1(n708), .B0(n437), .Y(n435) );
  OAI21XL U799 ( .A0(n712), .A1(n438), .B0(n524), .Y(n437) );
  AOI2BB1X1 U800 ( .A0N(n423), .A1N(n424), .B0(n425), .Y(n402) );
  OAI22XL U801 ( .A0(\job[2][1] ), .A1(n717), .B0(\job[2][0] ), .B1(n711), .Y(
        n424) );
  NOR2X1 U802 ( .A(n716), .B(\job[2][2] ), .Y(n423) );
  OAI22XL U803 ( .A0(\job[1][1] ), .A1(n726), .B0(\job[1][0] ), .B1(n727), .Y(
        n427) );
  AOI32X1 U804 ( .A0(n718), .A1(n726), .A2(\job[1][1] ), .B0(\job[1][2] ), 
        .B1(n725), .Y(n428) );
  CLKINVX1 U805 ( .A(n426), .Y(n718) );
  NAND2X1 U806 ( .A(n693), .B(N114), .Y(n306) );
  CLKINVX1 U807 ( .A(\job[2][2] ), .Y(n725) );
  NOR2X1 U808 ( .A(n725), .B(\job[1][2] ), .Y(n426) );
  OAI2BB2XL U809 ( .B0(n349), .B1(n357), .A0N(n140), .A1N(n358), .Y(n356) );
  NAND2X1 U810 ( .A(\job[7][2] ), .B(n714), .Y(n411) );
  NAND2X1 U811 ( .A(N117), .B(n586), .Y(n389) );
  CLKINVX1 U812 ( .A(n408), .Y(n703) );
  NAND3X1 U813 ( .A(n411), .B(n174), .C(\job[6][1] ), .Y(n409) );
  OAI221XL U814 ( .A0(\job[6][1] ), .A1(n174), .B0(\job[6][0] ), .B1(n175), 
        .C0(n411), .Y(n410) );
  OAI2BB1X1 U815 ( .A0N(n719), .A1N(\job[0][1] ), .B0(n431), .Y(n430) );
  OAI22XL U816 ( .A0(\job[0][1] ), .A1(n719), .B0(\job[0][0] ), .B1(n720), .Y(
        n431) );
  CLKINVX1 U817 ( .A(\job[3][0] ), .Y(n711) );
  CLKINVX1 U818 ( .A(\job[2][0] ), .Y(n727) );
  NAND2X1 U819 ( .A(N249), .B(n686), .Y(n397) );
  CLKINVX1 U820 ( .A(\job[1][0] ), .Y(n720) );
  CLKINVX1 U821 ( .A(\job[4][0] ), .Y(n724) );
  CLKINVX1 U822 ( .A(swap_state[0]), .Y(n695) );
  CLKINVX1 U823 ( .A(\job[6][0] ), .Y(n707) );
  ADDFXL U824 ( .A(N249), .B(n586), .CI(\sub_0_root_sub_83/carry[2] ), .CO(
        N293), .S(N292) );
  ADDFX2 U825 ( .A(n524), .B(n712), .CI(\sub_0_root_sub_83/carry[1] ), .CO(
        \sub_0_root_sub_83/carry[2] ), .S(N291) );
  NOR2BX1 U826 ( .AN(n222), .B(Done), .Y(n206) );
  NOR2X1 U827 ( .A(n688), .B(N249), .Y(n256) );
  NAND2X1 U828 ( .A(swap_state[1]), .B(swap_state[0]), .Y(n357) );
  NAND3X1 U829 ( .A(n712), .B(n586), .C(n140), .Y(n372) );
  CLKINVX1 U830 ( .A(swap_state[1]), .Y(n690) );
  CLKINVX1 U831 ( .A(state[0]), .Y(n682) );
  NOR2X1 U832 ( .A(state[1]), .B(state[0]), .Y(n393) );
  CLKINVX1 U833 ( .A(state[1]), .Y(n683) );
  INVX12 U834 ( .A(n521), .Y(W[2]) );
  CLKINVX1 U835 ( .A(N108), .Y(n521) );
  OR2X1 U836 ( .A(n140), .B(\sub_0_root_sub_83/A[0] ), .Y(
        \sub_0_root_sub_83/carry[1] ) );
  XNOR2X1 U837 ( .A(\sub_0_root_sub_83/A[0] ), .B(n140), .Y(N290) );
  NOR2X1 U838 ( .A(n547), .B(W[0]), .Y(n544) );
  NOR2X1 U839 ( .A(n547), .B(n548), .Y(n543) );
  NOR2X1 U840 ( .A(n548), .B(W[1]), .Y(n541) );
  NOR2X1 U841 ( .A(W[0]), .B(W[1]), .Y(n540) );
  AO22X1 U842 ( .A0(\job[5][0] ), .A1(n541), .B0(\job[4][0] ), .B1(n540), .Y(
        n531) );
  AOI221XL U843 ( .A0(\job[6][0] ), .A1(n544), .B0(\job[7][0] ), .B1(n543), 
        .C0(n531), .Y(n534) );
  AO22X1 U844 ( .A0(\job[1][0] ), .A1(n541), .B0(\job[0][0] ), .B1(n540), .Y(
        n532) );
  AOI221XL U845 ( .A0(\job[2][0] ), .A1(n544), .B0(\job[3][0] ), .B1(n543), 
        .C0(n532), .Y(n533) );
  AO22X1 U846 ( .A0(\job[5][1] ), .A1(n541), .B0(\job[4][1] ), .B1(n540), .Y(
        n535) );
  AOI221XL U847 ( .A0(\job[6][1] ), .A1(n544), .B0(\job[7][1] ), .B1(n543), 
        .C0(n535), .Y(n538) );
  AO22X1 U848 ( .A0(\job[1][1] ), .A1(n541), .B0(\job[0][1] ), .B1(n540), .Y(
        n536) );
  AO22X1 U849 ( .A0(\job[5][2] ), .A1(n541), .B0(\job[4][2] ), .B1(n540), .Y(
        n539) );
  AOI221XL U850 ( .A0(\job[6][2] ), .A1(n544), .B0(\job[7][2] ), .B1(n543), 
        .C0(n539), .Y(n546) );
  AO22X1 U851 ( .A0(\job[1][2] ), .A1(n541), .B0(\job[0][2] ), .B1(n540), .Y(
        n542) );
  AOI221XL U852 ( .A0(\job[2][2] ), .A1(n544), .B0(\job[3][2] ), .B1(n543), 
        .C0(n542), .Y(n545) );
  NOR2X1 U853 ( .A(n566), .B(n567), .Y(n562) );
  NOR2X1 U854 ( .A(n567), .B(n524), .Y(n560) );
  NOR2X1 U855 ( .A(\sub_0_root_sub_83/A[0] ), .B(n524), .Y(n559) );
  AO22X1 U856 ( .A0(\job[5][0] ), .A1(n560), .B0(\job[4][0] ), .B1(n559), .Y(
        n550) );
  AOI221XL U857 ( .A0(\job[6][0] ), .A1(n563), .B0(\job[7][0] ), .B1(n562), 
        .C0(n550), .Y(n553) );
  AO22X1 U858 ( .A0(\job[1][0] ), .A1(n560), .B0(\job[0][0] ), .B1(n559), .Y(
        n551) );
  AOI221XL U859 ( .A0(\job[2][0] ), .A1(n563), .B0(\job[3][0] ), .B1(n562), 
        .C0(n551), .Y(n552) );
  AO22X1 U860 ( .A0(\job[5][1] ), .A1(n560), .B0(\job[4][1] ), .B1(n559), .Y(
        n554) );
  AOI221XL U861 ( .A0(\job[6][1] ), .A1(n563), .B0(\job[7][1] ), .B1(n562), 
        .C0(n554), .Y(n557) );
  AO22X1 U862 ( .A0(\job[1][1] ), .A1(n560), .B0(\job[0][1] ), .B1(n559), .Y(
        n555) );
  AOI221XL U863 ( .A0(\job[2][1] ), .A1(n563), .B0(\job[3][1] ), .B1(n562), 
        .C0(n555), .Y(n556) );
  AO22X1 U864 ( .A0(\job[5][2] ), .A1(n560), .B0(\job[4][2] ), .B1(n559), .Y(
        n558) );
  AOI221XL U865 ( .A0(\job[6][2] ), .A1(n563), .B0(\job[7][2] ), .B1(n562), 
        .C0(n558), .Y(n565) );
  AO22X1 U866 ( .A0(\job[1][2] ), .A1(n560), .B0(\job[0][2] ), .B1(n559), .Y(
        n561) );
  AOI221XL U867 ( .A0(\job[2][2] ), .A1(n563), .B0(\job[3][2] ), .B1(n562), 
        .C0(n561), .Y(n564) );
  NOR2X1 U868 ( .A(n712), .B(n526), .Y(n582) );
  NOR2X1 U869 ( .A(n712), .B(n585), .Y(n581) );
  NOR2X1 U870 ( .A(n585), .B(n525), .Y(n579) );
  NOR2X1 U871 ( .A(n526), .B(n525), .Y(n578) );
  AO22X1 U872 ( .A0(\job[5][0] ), .A1(n579), .B0(\job[4][0] ), .B1(n578), .Y(
        n569) );
  AOI221XL U873 ( .A0(\job[6][0] ), .A1(n582), .B0(\job[7][0] ), .B1(n581), 
        .C0(n569), .Y(n572) );
  AO22X1 U874 ( .A0(\job[1][0] ), .A1(n579), .B0(\job[0][0] ), .B1(n578), .Y(
        n570) );
  AOI221XL U875 ( .A0(\job[2][0] ), .A1(n582), .B0(\job[3][0] ), .B1(n581), 
        .C0(n570), .Y(n571) );
  AO22X1 U876 ( .A0(\job[5][1] ), .A1(n579), .B0(\job[4][1] ), .B1(n578), .Y(
        n573) );
  AOI221XL U877 ( .A0(\job[6][1] ), .A1(n582), .B0(\job[7][1] ), .B1(n581), 
        .C0(n573), .Y(n576) );
  AO22X1 U878 ( .A0(\job[1][1] ), .A1(n579), .B0(\job[0][1] ), .B1(n578), .Y(
        n574) );
  AOI221XL U879 ( .A0(\job[2][1] ), .A1(n582), .B0(\job[3][1] ), .B1(n581), 
        .C0(n574), .Y(n575) );
  AO22X1 U880 ( .A0(\job[5][2] ), .A1(n579), .B0(\job[4][2] ), .B1(n578), .Y(
        n577) );
  AOI221XL U881 ( .A0(\job[6][2] ), .A1(n582), .B0(\job[7][2] ), .B1(n581), 
        .C0(n577), .Y(n584) );
  AO22X1 U882 ( .A0(\job[1][2] ), .A1(n579), .B0(\job[0][2] ), .B1(n578), .Y(
        n580) );
  AOI221XL U883 ( .A0(\job[2][2] ), .A1(n582), .B0(\job[3][2] ), .B1(n581), 
        .C0(n580), .Y(n583) );
  NOR2X1 U884 ( .A(n603), .B(n713), .Y(n599) );
  NOR2X1 U885 ( .A(n713), .B(N116), .Y(n597) );
  NOR2X1 U886 ( .A(N115), .B(N116), .Y(n596) );
  AO22X1 U887 ( .A0(\job[5][0] ), .A1(n597), .B0(\job[4][0] ), .B1(n596), .Y(
        n587) );
  AOI221XL U888 ( .A0(\job[6][0] ), .A1(n600), .B0(\job[7][0] ), .B1(n599), 
        .C0(n587), .Y(n590) );
  AO22X1 U889 ( .A0(\job[1][0] ), .A1(n597), .B0(\job[0][0] ), .B1(n596), .Y(
        n588) );
  AOI221XL U890 ( .A0(\job[2][0] ), .A1(n600), .B0(\job[3][0] ), .B1(n599), 
        .C0(n588), .Y(n589) );
  OAI22XL U891 ( .A0(n604), .A1(n590), .B0(N117), .B1(n589), .Y(N159) );
  AO22X1 U892 ( .A0(\job[5][1] ), .A1(n597), .B0(\job[4][1] ), .B1(n596), .Y(
        n591) );
  AOI221XL U893 ( .A0(\job[6][1] ), .A1(n600), .B0(\job[7][1] ), .B1(n599), 
        .C0(n591), .Y(n594) );
  AO22X1 U894 ( .A0(\job[1][1] ), .A1(n597), .B0(\job[0][1] ), .B1(n596), .Y(
        n592) );
  AOI221XL U895 ( .A0(\job[2][1] ), .A1(n600), .B0(\job[3][1] ), .B1(n599), 
        .C0(n592), .Y(n593) );
  AO22X1 U896 ( .A0(\job[5][2] ), .A1(n597), .B0(\job[4][2] ), .B1(n596), .Y(
        n595) );
  AOI221XL U897 ( .A0(\job[6][2] ), .A1(n600), .B0(\job[7][2] ), .B1(n599), 
        .C0(n595), .Y(n602) );
  AO22X1 U898 ( .A0(\job[1][2] ), .A1(n597), .B0(\job[0][2] ), .B1(n596), .Y(
        n598) );
  AOI221XL U899 ( .A0(\job[2][2] ), .A1(n600), .B0(\job[3][2] ), .B1(n599), 
        .C0(n598), .Y(n601) );
  NOR2X1 U900 ( .A(n621), .B(N118), .Y(n618) );
  NOR2X1 U901 ( .A(n621), .B(n622), .Y(n617) );
  NOR2X1 U902 ( .A(n622), .B(N119), .Y(n615) );
  NOR2X1 U903 ( .A(N118), .B(N119), .Y(n614) );
  AO22X1 U904 ( .A0(\job[5][0] ), .A1(n615), .B0(\job[4][0] ), .B1(n614), .Y(
        n605) );
  AOI221XL U905 ( .A0(\job[6][0] ), .A1(n618), .B0(\job[7][0] ), .B1(n617), 
        .C0(n605), .Y(n608) );
  AO22X1 U906 ( .A0(\job[1][0] ), .A1(n615), .B0(\job[0][0] ), .B1(n614), .Y(
        n606) );
  AOI221XL U907 ( .A0(\job[2][0] ), .A1(n618), .B0(\job[3][0] ), .B1(n617), 
        .C0(n606), .Y(n607) );
  OAI22XL U908 ( .A0(n623), .A1(n608), .B0(N120), .B1(n607), .Y(N276) );
  AO22X1 U909 ( .A0(\job[5][1] ), .A1(n615), .B0(\job[4][1] ), .B1(n614), .Y(
        n609) );
  AOI221XL U910 ( .A0(\job[6][1] ), .A1(n618), .B0(\job[7][1] ), .B1(n617), 
        .C0(n609), .Y(n612) );
  AO22X1 U911 ( .A0(\job[1][1] ), .A1(n615), .B0(\job[0][1] ), .B1(n614), .Y(
        n610) );
  AOI221XL U912 ( .A0(\job[2][1] ), .A1(n618), .B0(\job[3][1] ), .B1(n617), 
        .C0(n610), .Y(n611) );
  OAI22XL U913 ( .A0(n623), .A1(n612), .B0(N120), .B1(n611), .Y(N275) );
  AO22X1 U914 ( .A0(\job[5][2] ), .A1(n615), .B0(\job[4][2] ), .B1(n614), .Y(
        n613) );
  AOI221XL U915 ( .A0(\job[6][2] ), .A1(n618), .B0(\job[7][2] ), .B1(n617), 
        .C0(n613), .Y(n620) );
  AO22X1 U916 ( .A0(\job[1][2] ), .A1(n615), .B0(\job[0][2] ), .B1(n614), .Y(
        n616) );
  AOI221XL U917 ( .A0(\job[2][2] ), .A1(n618), .B0(\job[3][2] ), .B1(n617), 
        .C0(n616), .Y(n619) );
  OAI22XL U918 ( .A0(n620), .A1(n623), .B0(N120), .B1(n619), .Y(N274) );
  OAI22XL U919 ( .A0(TotalCost[1]), .A1(n624), .B0(n624), .B1(n646), .Y(n626)
         );
  NAND2X1 U920 ( .A(TotalCost[7]), .B(n650), .Y(n638) );
  NAND2X1 U921 ( .A(TotalCost[6]), .B(n649), .Y(n633) );
  NOR3BXL U922 ( .AN(n633), .B(n627), .C(n634), .Y(n625) );
  NAND3X1 U923 ( .A(n626), .B(n638), .C(n625), .Y(n645) );
  NAND2X1 U924 ( .A(TotalCost[9]), .B(n651), .Y(n641) );
  NOR2X1 U925 ( .A(n643), .B(n642), .Y(n632) );
  OAI211X1 U926 ( .A0(n629), .A1(n657), .B0(n628), .C0(n640), .Y(n630) );
  OAI221XL U927 ( .A0(TotalCost[2]), .A1(n647), .B0(TotalCost[3]), .B1(n648), 
        .C0(n630), .Y(n631) );
  AOI222XL U928 ( .A0(n744), .A1(n655), .B0(n745), .B1(n656), .C0(n632), .C1(
        n631), .Y(n636) );
  NAND2BX1 U929 ( .AN(n634), .B(n633), .Y(n635) );
  OAI222XL U930 ( .A0(n636), .A1(n635), .B0(TotalCost[6]), .B1(n649), .C0(
        TotalCost[7]), .C1(n650), .Y(n637) );
  NAND3BX1 U931 ( .AN(N562), .B(n641), .C(n640), .Y(n644) );
  NOR4X1 U932 ( .A(n645), .B(n644), .C(n643), .D(n642), .Y(N563) );
endmodule

