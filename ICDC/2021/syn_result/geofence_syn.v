/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03
// Date      : Mon Feb  5 00:18:35 2024
/////////////////////////////////////////////////////////////


module geofence_DW_cmp_0 ( A, B, TC, GE_LT, GE_GT_EQ, GE_LT_GT_LE, EQ_NE );
  input [20:0] A;
  input [20:0] B;
  input TC, GE_LT, GE_GT_EQ;
  output GE_LT_GT_LE, EQ_NE;
  wire   n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186;

  CLKINVX1 U57 ( .A(n161), .Y(n130) );
  CLKINVX1 U58 ( .A(A[17]), .Y(n126) );
  CLKINVX1 U59 ( .A(A[12]), .Y(n128) );
  CLKINVX1 U60 ( .A(B[13]), .Y(n137) );
  CLKINVX1 U61 ( .A(A[14]), .Y(n127) );
  CLKINVX1 U62 ( .A(B[15]), .Y(n136) );
  CLKINVX1 U63 ( .A(B[11]), .Y(n138) );
  CLKINVX1 U64 ( .A(A[8]), .Y(n131) );
  CLKINVX1 U65 ( .A(A[10]), .Y(n129) );
  CLKINVX1 U66 ( .A(B[9]), .Y(n139) );
  CLKINVX1 U67 ( .A(A[5]), .Y(n132) );
  CLKINVX1 U68 ( .A(B[6]), .Y(n140) );
  CLKINVX1 U69 ( .A(B[4]), .Y(n141) );
  CLKINVX1 U70 ( .A(n175), .Y(n134) );
  CLKINVX1 U71 ( .A(B[18]), .Y(n135) );
  CLKINVX1 U72 ( .A(A[19]), .Y(n125) );
  CLKINVX1 U73 ( .A(A[3]), .Y(n133) );
  CLKINVX1 U74 ( .A(B[1]), .Y(n142) );
  CLKINVX1 U75 ( .A(A[20]), .Y(n124) );
  NAND2X1 U76 ( .A(n143), .B(n144), .Y(GE_LT_GT_LE) );
  OAI211X1 U77 ( .A0(B[20]), .A1(n124), .B0(n145), .C0(n146), .Y(n144) );
  OAI21XL U78 ( .A0(n147), .A1(n148), .B0(n149), .Y(n146) );
  OAI222XL U79 ( .A0(A[15]), .A1(n150), .B0(n136), .B1(n150), .C0(A[15]), .C1(
        n136), .Y(n149) );
  OAI222XL U80 ( .A0(B[14]), .A1(n127), .B0(B[14]), .B1(n151), .C0(n127), .C1(
        n151), .Y(n150) );
  OAI222XL U81 ( .A0(A[13]), .A1(n152), .B0(n137), .B1(n152), .C0(A[13]), .C1(
        n137), .Y(n151) );
  OAI222XL U82 ( .A0(B[12]), .A1(n128), .B0(B[12]), .B1(n153), .C0(n128), .C1(
        n153), .Y(n152) );
  NAND2X1 U83 ( .A(A[11]), .B(n138), .Y(n153) );
  OAI21XL U84 ( .A0(A[15]), .A1(n136), .B0(n154), .Y(n148) );
  OAI22XL U85 ( .A0(n155), .A1(n127), .B0(B[14]), .B1(n155), .Y(n154) );
  OAI21XL U86 ( .A0(A[13]), .A1(n137), .B0(n156), .Y(n155) );
  OAI22XL U87 ( .A0(n157), .A1(n128), .B0(B[12]), .B1(n157), .Y(n156) );
  NOR2X1 U88 ( .A(n138), .B(A[11]), .Y(n157) );
  AOI221XL U89 ( .A0(A[10]), .A1(n130), .B0(n158), .B1(n159), .C0(n160), .Y(
        n147) );
  OAI22XL U90 ( .A0(B[10]), .A1(n129), .B0(B[10]), .B1(n161), .Y(n160) );
  OAI22XL U91 ( .A0(n129), .A1(n162), .B0(B[10]), .B1(n162), .Y(n159) );
  OAI21XL U92 ( .A0(A[9]), .A1(n139), .B0(n163), .Y(n162) );
  OAI22XL U93 ( .A0(n164), .A1(n131), .B0(B[8]), .B1(n164), .Y(n163) );
  NOR2BX1 U94 ( .AN(B[7]), .B(A[7]), .Y(n164) );
  OAI21XL U95 ( .A0(n165), .A1(n166), .B0(n167), .Y(n158) );
  OAI222XL U96 ( .A0(A[6]), .A1(n168), .B0(n140), .B1(n168), .C0(A[6]), .C1(
        n140), .Y(n167) );
  OAI222XL U97 ( .A0(B[5]), .A1(n132), .B0(B[5]), .B1(n169), .C0(n132), .C1(
        n169), .Y(n168) );
  NAND2X1 U98 ( .A(A[4]), .B(n141), .Y(n169) );
  OAI21XL U99 ( .A0(A[6]), .A1(n140), .B0(n170), .Y(n166) );
  OAI22XL U100 ( .A0(n171), .A1(n132), .B0(B[5]), .B1(n171), .Y(n170) );
  NOR2X1 U101 ( .A(n141), .B(A[4]), .Y(n171) );
  AOI221XL U102 ( .A0(A[3]), .A1(n134), .B0(n172), .B1(n173), .C0(n174), .Y(
        n165) );
  OAI22XL U103 ( .A0(B[3]), .A1(n133), .B0(B[3]), .B1(n175), .Y(n174) );
  OAI22XL U104 ( .A0(n176), .A1(n133), .B0(B[3]), .B1(n176), .Y(n173) );
  NOR2BX1 U105 ( .AN(B[2]), .B(A[2]), .Y(n176) );
  AO22X1 U106 ( .A0(n177), .A1(A[0]), .B0(A[1]), .B1(n142), .Y(n172) );
  AOI2BB1X1 U107 ( .A0N(n142), .A1N(A[1]), .B0(B[0]), .Y(n177) );
  NAND2BX1 U108 ( .AN(B[2]), .B(A[2]), .Y(n175) );
  OAI222XL U109 ( .A0(A[9]), .A1(n178), .B0(n178), .B1(n139), .C0(A[9]), .C1(
        n139), .Y(n161) );
  OAI222XL U110 ( .A0(B[8]), .A1(n131), .B0(B[8]), .B1(n179), .C0(n179), .C1(
        n131), .Y(n178) );
  NAND2BX1 U111 ( .AN(B[7]), .B(A[7]), .Y(n179) );
  OAI22XL U112 ( .A0(n180), .A1(n125), .B0(B[19]), .B1(n180), .Y(n145) );
  OAI21XL U113 ( .A0(A[18]), .A1(n135), .B0(n181), .Y(n180) );
  OAI22XL U114 ( .A0(n182), .A1(n126), .B0(B[17]), .B1(n182), .Y(n181) );
  NOR2BX1 U115 ( .AN(B[16]), .B(A[16]), .Y(n182) );
  OAI222XL U116 ( .A0(B[20]), .A1(n183), .B0(n124), .B1(n183), .C0(B[20]), 
        .C1(n124), .Y(n143) );
  OAI222XL U117 ( .A0(B[19]), .A1(n125), .B0(B[19]), .B1(n184), .C0(n125), 
        .C1(n184), .Y(n183) );
  OAI222XL U118 ( .A0(A[18]), .A1(n185), .B0(n135), .B1(n185), .C0(A[18]), 
        .C1(n135), .Y(n184) );
  OAI222XL U119 ( .A0(B[17]), .A1(n126), .B0(B[17]), .B1(n186), .C0(n126), 
        .C1(n186), .Y(n185) );
  NAND2BX1 U120 ( .AN(B[16]), .B(A[16]), .Y(n186) );
endmodule


module geofence_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFX2 U2_9 ( .A(A[9]), .B(n10), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFX2 U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n7), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n3), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n4), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n2), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U2 ( .A(B[1]), .Y(n2) );
  NAND2X1 U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
  XNOR2X1 U5 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n4) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n5) );
  CLKINVX1 U8 ( .A(B[2]), .Y(n3) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n7) );
  CLKINVX1 U10 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n8) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n9) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n10) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n7), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n3), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n2), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n10), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n4), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U2 ( .A(B[3]), .Y(n4) );
  CLKINVX1 U3 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U4 ( .A(B[1]), .Y(n2) );
  NAND2X1 U5 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U6 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U7 ( .A(B[2]), .Y(n3) );
  CLKINVX1 U8 ( .A(B[4]), .Y(n5) );
  XNOR2X1 U9 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n8) );
  CLKINVX1 U11 ( .A(B[9]), .Y(n10) );
  CLKINVX1 U12 ( .A(B[6]), .Y(n7) );
  CLKINVX1 U13 ( .A(B[8]), .Y(n9) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFX2 U2_9 ( .A(A[9]), .B(n10), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFX2 U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n7), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n3), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n4), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n2), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  CLKINVX1 U1 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U2 ( .A(B[1]), .Y(n2) );
  NAND2X1 U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
  XNOR2X1 U5 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n4) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n5) );
  CLKINVX1 U8 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U9 ( .A(B[2]), .Y(n3) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n7) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n8) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n9) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n10) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n7), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n3), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n2), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n4), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n10), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  CLKINVX1 U1 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U2 ( .A(B[3]), .Y(n4) );
  CLKINVX1 U3 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U4 ( .A(B[1]), .Y(n2) );
  NAND2X1 U5 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U6 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U7 ( .A(B[2]), .Y(n3) );
  CLKINVX1 U8 ( .A(B[4]), .Y(n5) );
  XNOR2X1 U9 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n8) );
  CLKINVX1 U11 ( .A(B[9]), .Y(n10) );
  CLKINVX1 U12 ( .A(B[6]), .Y(n7) );
  CLKINVX1 U13 ( .A(B[8]), .Y(n9) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW_mult_tc_1 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n24, n25, n26, n27, n28, n30, n31, n32, n33, n34,
         n35, n36, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n113, n114, n115, n116, n117,
         n118, n119, n120, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452;

  ADDFXL U5 ( .A(n26), .B(n25), .CI(n5), .CO(n4), .S(product[19]) );
  ADDFXL U6 ( .A(n27), .B(n31), .CI(n6), .CO(n5), .S(product[18]) );
  ADDFXL U7 ( .A(n34), .B(n32), .CI(n7), .CO(n6), .S(product[17]) );
  ADDFXL U8 ( .A(n35), .B(n39), .CI(n8), .CO(n7), .S(product[16]) );
  ADDFXL U9 ( .A(n40), .B(n44), .CI(n9), .CO(n8), .S(product[15]) );
  ADDFXL U10 ( .A(n45), .B(n51), .CI(n10), .CO(n9), .S(product[14]) );
  ADDFXL U11 ( .A(n52), .B(n57), .CI(n11), .CO(n10), .S(product[13]) );
  ADDFXL U12 ( .A(n58), .B(n65), .CI(n12), .CO(n11), .S(product[12]) );
  ADDFXL U13 ( .A(n66), .B(n73), .CI(n13), .CO(n12), .S(product[11]) );
  ADDFXL U14 ( .A(n74), .B(n79), .CI(n14), .CO(n13), .S(product[10]) );
  ADDFXL U15 ( .A(n80), .B(n86), .CI(n15), .CO(n14), .S(product[9]) );
  ADDFXL U16 ( .A(n87), .B(n91), .CI(n16), .CO(n15), .S(product[8]) );
  ADDFXL U17 ( .A(n92), .B(n96), .CI(n17), .CO(n16), .S(product[7]) );
  ADDFXL U18 ( .A(n98), .B(n97), .CI(n18), .CO(n17), .S(product[6]) );
  ADDFXL U19 ( .A(n99), .B(n102), .CI(n19), .CO(n18), .S(product[5]) );
  ADDFXL U20 ( .A(n103), .B(n104), .CI(n20), .CO(n19), .S(product[4]) );
  ADDFXL U21 ( .A(n105), .B(n110), .CI(n21), .CO(n20), .S(product[3]) );
  ADDFXL U22 ( .A(n176), .B(n166), .CI(n22), .CO(n21), .S(product[2]) );
  ADDHXL U23 ( .A(n111), .B(n177), .CO(n22), .S(product[1]) );
  ADDFXL U25 ( .A(n28), .B(n123), .CI(n113), .CO(n24), .S(n25) );
  ADDFXL U26 ( .A(n360), .B(n114), .CI(n30), .CO(n26), .S(n27) );
  CMPR42X1 U28 ( .A(n134), .B(n124), .C(n36), .D(n115), .ICI(n33), .S(n32), 
        .ICO(n30), .CO(n31) );
  CMPR42X1 U29 ( .A(n125), .B(n116), .C(n362), .D(n41), .ICI(n38), .S(n35), 
        .ICO(n33), .CO(n34) );
  CMPR42X1 U31 ( .A(n135), .B(n126), .C(n42), .D(n46), .ICI(n43), .S(n40), 
        .ICO(n38), .CO(n39) );
  ADDFXL U32 ( .A(n48), .B(n144), .CI(n117), .CO(n41), .S(n42) );
  CMPR42X1 U33 ( .A(n365), .B(n53), .C(n54), .D(n47), .ICI(n50), .S(n45), 
        .ICO(n43), .CO(n44) );
  ADDFXL U34 ( .A(n127), .B(n118), .CI(n136), .CO(n46), .S(n47) );
  CMPR42X1 U36 ( .A(n137), .B(n128), .C(n55), .D(n60), .ICI(n56), .S(n52), 
        .ICO(n50), .CO(n51) );
  CMPR42X1 U37 ( .A(n155), .B(n119), .C(n62), .D(n145), .ICI(n59), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U38 ( .A(n363), .B(n67), .C(n68), .D(n61), .ICI(n64), .S(n58), 
        .ICO(n56), .CO(n57) );
  CMPR42X1 U39 ( .A(n129), .B(n156), .C(n146), .D(n120), .ICI(n70), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U41 ( .A(n138), .B(n71), .C(n76), .D(n69), .ICI(n72), .S(n66), 
        .ICO(n64), .CO(n65) );
  CMPR42X1 U42 ( .A(n157), .B(n106), .C(n147), .D(n130), .ICI(n75), .S(n69), 
        .ICO(n67), .CO(n68) );
  CMPR42X1 U45 ( .A(n148), .B(n83), .C(n77), .D(n81), .ICI(n78), .S(n74), 
        .ICO(n72), .CO(n73) );
  CMPR42X1 U46 ( .A(n122), .B(n139), .C(n168), .D(n158), .ICI(n131), .S(n77), 
        .ICO(n75), .CO(n76) );
  CMPR42X1 U47 ( .A(n169), .B(n84), .C(n85), .D(n88), .ICI(n82), .S(n80), 
        .ICO(n78), .CO(n79) );
  ADDFXL U48 ( .A(n140), .B(n149), .CI(n159), .CO(n81), .S(n82) );
  ADDHXL U49 ( .A(n132), .B(n107), .CO(n83), .S(n84) );
  CMPR42X1 U50 ( .A(n160), .B(n141), .C(n93), .D(n90), .ICI(n89), .S(n87), 
        .ICO(n85), .CO(n86) );
  ADDFXL U51 ( .A(n150), .B(n133), .CI(n170), .CO(n88), .S(n89) );
  CMPR42X1 U52 ( .A(n171), .B(n151), .C(n161), .D(n95), .ICI(n94), .S(n92), 
        .ICO(n90), .CO(n91) );
  ADDHXL U53 ( .A(n142), .B(n108), .CO(n93), .S(n94) );
  CMPR42X1 U54 ( .A(n143), .B(n172), .C(n162), .D(n152), .ICI(n100), .S(n97), 
        .ICO(n95), .CO(n96) );
  ADDFXL U55 ( .A(n163), .B(n173), .CI(n101), .CO(n98), .S(n99) );
  ADDHXL U56 ( .A(n153), .B(n109), .CO(n100), .S(n101) );
  ADDFXL U57 ( .A(n174), .B(n154), .CI(n164), .CO(n102), .S(n103) );
  ADDHXL U58 ( .A(n175), .B(n165), .CO(n104), .S(n105) );
  CLKINVX1 U262 ( .A(n62), .Y(n363) );
  CLKINVX1 U263 ( .A(n48), .Y(n365) );
  INVX3 U264 ( .A(n374), .Y(n359) );
  CLKINVX1 U265 ( .A(n357), .Y(n370) );
  CLKINVX1 U266 ( .A(n36), .Y(n362) );
  CLKBUFX3 U267 ( .A(n405), .Y(n349) );
  NAND2X1 U268 ( .A(n350), .B(n449), .Y(n405) );
  INVX3 U269 ( .A(a[5]), .Y(n366) );
  INVX3 U270 ( .A(a[3]), .Y(n367) );
  INVX3 U271 ( .A(a[1]), .Y(n368) );
  CLKBUFX3 U272 ( .A(n403), .Y(n350) );
  XNOR2X1 U273 ( .A(a[2]), .B(a[1]), .Y(n403) );
  CLKBUFX3 U274 ( .A(n384), .Y(n352) );
  XNOR2X1 U275 ( .A(a[4]), .B(a[3]), .Y(n384) );
  CLKBUFX3 U276 ( .A(n387), .Y(n351) );
  NAND2X1 U277 ( .A(n352), .B(n450), .Y(n387) );
  CLKBUFX3 U278 ( .A(n381), .Y(n353) );
  NAND2X1 U279 ( .A(n354), .B(n451), .Y(n381) );
  CLKBUFX3 U280 ( .A(n382), .Y(n354) );
  XNOR2X1 U281 ( .A(a[6]), .B(a[5]), .Y(n382) );
  NAND2X2 U282 ( .A(a[1]), .B(n369), .Y(n378) );
  CLKBUFX3 U283 ( .A(n393), .Y(n355) );
  NAND2X1 U284 ( .A(n356), .B(n452), .Y(n393) );
  INVX3 U285 ( .A(a[7]), .Y(n364) );
  INVX3 U286 ( .A(a[9]), .Y(n361) );
  INVX3 U287 ( .A(a[0]), .Y(n369) );
  CLKBUFX3 U288 ( .A(n390), .Y(n356) );
  XNOR2X1 U289 ( .A(a[8]), .B(a[7]), .Y(n390) );
  CLKBUFX3 U290 ( .A(a[10]), .Y(n358) );
  CLKBUFX3 U291 ( .A(b[0]), .Y(n357) );
  CLKINVX1 U292 ( .A(n28), .Y(n360) );
  XOR2X1 U293 ( .A(n371), .B(n372), .Y(product[20]) );
  XOR2X1 U294 ( .A(n4), .B(n24), .Y(n372) );
  NAND2X1 U295 ( .A(n373), .B(n374), .Y(n371) );
  XOR2X1 U296 ( .A(b[10]), .B(n358), .Y(n373) );
  NOR2X1 U297 ( .A(n369), .B(n370), .Y(product[0]) );
  XOR2X1 U298 ( .A(n375), .B(n376), .Y(n71) );
  NAND2BX1 U299 ( .AN(n376), .B(n375), .Y(n70) );
  NAND2X1 U300 ( .A(n377), .B(n374), .Y(n375) );
  XOR2X1 U301 ( .A(b[1]), .B(n358), .Y(n377) );
  OAI2BB1X1 U302 ( .A0N(n369), .A1N(n378), .B0(n379), .Y(n376) );
  OAI22XL U303 ( .A0(n380), .A1(n353), .B0(n354), .B1(n383), .Y(n62) );
  OAI22XL U304 ( .A0(n352), .A1(n385), .B0(n386), .B1(n351), .Y(n48) );
  OAI22XL U305 ( .A0(n354), .A1(n388), .B0(n389), .B1(n353), .Y(n36) );
  OAI22XL U306 ( .A0(n356), .A1(n391), .B0(n392), .B1(n355), .Y(n28) );
  OAI22XL U307 ( .A0(n357), .A1(n378), .B0(n394), .B1(n369), .Y(n177) );
  OAI22XL U308 ( .A0(n394), .A1(n378), .B0(n395), .B1(n369), .Y(n176) );
  XOR2X1 U309 ( .A(b[1]), .B(n368), .Y(n394) );
  OAI22XL U310 ( .A0(n395), .A1(n378), .B0(n396), .B1(n369), .Y(n175) );
  XOR2X1 U311 ( .A(b[2]), .B(n368), .Y(n395) );
  OAI22XL U312 ( .A0(n396), .A1(n378), .B0(n397), .B1(n369), .Y(n174) );
  XOR2X1 U313 ( .A(b[3]), .B(n368), .Y(n396) );
  OAI22XL U314 ( .A0(n397), .A1(n378), .B0(n398), .B1(n369), .Y(n173) );
  XOR2X1 U315 ( .A(b[4]), .B(n368), .Y(n397) );
  OAI22XL U316 ( .A0(n398), .A1(n378), .B0(n399), .B1(n369), .Y(n172) );
  XOR2X1 U317 ( .A(b[5]), .B(n368), .Y(n398) );
  OAI22XL U318 ( .A0(n399), .A1(n378), .B0(n400), .B1(n369), .Y(n171) );
  XOR2X1 U319 ( .A(b[6]), .B(n368), .Y(n399) );
  OAI22XL U320 ( .A0(n400), .A1(n378), .B0(n401), .B1(n369), .Y(n170) );
  XOR2X1 U321 ( .A(b[7]), .B(n368), .Y(n400) );
  OAI22XL U322 ( .A0(n401), .A1(n378), .B0(n402), .B1(n369), .Y(n169) );
  XOR2X1 U323 ( .A(b[8]), .B(n368), .Y(n401) );
  OAI2BB2XL U324 ( .B0(n402), .B1(n378), .A0N(n379), .A1N(a[0]), .Y(n168) );
  XOR2X1 U325 ( .A(b[10]), .B(a[1]), .Y(n379) );
  XOR2X1 U326 ( .A(b[9]), .B(n368), .Y(n402) );
  NOR2X1 U327 ( .A(n350), .B(n370), .Y(n166) );
  OAI22XL U328 ( .A0(n404), .A1(n349), .B0(n350), .B1(n406), .Y(n165) );
  XOR2X1 U329 ( .A(n367), .B(n357), .Y(n404) );
  OAI22XL U330 ( .A0(n406), .A1(n349), .B0(n350), .B1(n407), .Y(n164) );
  XOR2X1 U331 ( .A(b[1]), .B(n367), .Y(n406) );
  OAI22XL U332 ( .A0(n407), .A1(n349), .B0(n350), .B1(n408), .Y(n163) );
  XOR2X1 U333 ( .A(b[2]), .B(n367), .Y(n407) );
  OAI22XL U334 ( .A0(n408), .A1(n349), .B0(n350), .B1(n409), .Y(n162) );
  XOR2X1 U335 ( .A(b[3]), .B(n367), .Y(n408) );
  OAI22XL U336 ( .A0(n409), .A1(n349), .B0(n350), .B1(n410), .Y(n161) );
  XOR2X1 U337 ( .A(b[4]), .B(n367), .Y(n409) );
  OAI22XL U338 ( .A0(n410), .A1(n349), .B0(n350), .B1(n411), .Y(n160) );
  XOR2X1 U339 ( .A(b[5]), .B(n367), .Y(n410) );
  OAI22XL U340 ( .A0(n411), .A1(n349), .B0(n350), .B1(n412), .Y(n159) );
  XOR2X1 U341 ( .A(b[6]), .B(n367), .Y(n411) );
  OAI22XL U342 ( .A0(n412), .A1(n349), .B0(n350), .B1(n413), .Y(n158) );
  XOR2X1 U343 ( .A(b[7]), .B(n367), .Y(n412) );
  OAI22XL U344 ( .A0(n413), .A1(n349), .B0(n350), .B1(n414), .Y(n157) );
  XOR2X1 U345 ( .A(b[8]), .B(n367), .Y(n413) );
  OAI22XL U346 ( .A0(n414), .A1(n349), .B0(n350), .B1(n415), .Y(n156) );
  XOR2X1 U347 ( .A(b[9]), .B(n367), .Y(n414) );
  AO21X1 U348 ( .A0(n349), .A1(n350), .B0(n415), .Y(n155) );
  XOR2X1 U349 ( .A(b[10]), .B(n367), .Y(n415) );
  NOR2X1 U350 ( .A(n352), .B(n370), .Y(n154) );
  OAI22XL U351 ( .A0(n416), .A1(n351), .B0(n352), .B1(n417), .Y(n153) );
  XOR2X1 U352 ( .A(n366), .B(n357), .Y(n416) );
  OAI22XL U353 ( .A0(n417), .A1(n351), .B0(n352), .B1(n418), .Y(n152) );
  XOR2X1 U354 ( .A(b[1]), .B(n366), .Y(n417) );
  OAI22XL U355 ( .A0(n418), .A1(n351), .B0(n352), .B1(n419), .Y(n151) );
  XOR2X1 U356 ( .A(b[2]), .B(n366), .Y(n418) );
  OAI22XL U357 ( .A0(n419), .A1(n351), .B0(n352), .B1(n420), .Y(n150) );
  XOR2X1 U358 ( .A(b[3]), .B(n366), .Y(n419) );
  OAI22XL U359 ( .A0(n420), .A1(n351), .B0(n352), .B1(n421), .Y(n149) );
  XOR2X1 U360 ( .A(b[4]), .B(n366), .Y(n420) );
  OAI22XL U361 ( .A0(n421), .A1(n351), .B0(n352), .B1(n422), .Y(n148) );
  XOR2X1 U362 ( .A(b[5]), .B(n366), .Y(n421) );
  OAI22XL U363 ( .A0(n422), .A1(n351), .B0(n352), .B1(n423), .Y(n147) );
  XOR2X1 U364 ( .A(b[6]), .B(n366), .Y(n422) );
  OAI22XL U365 ( .A0(n423), .A1(n351), .B0(n352), .B1(n424), .Y(n146) );
  XOR2X1 U366 ( .A(b[7]), .B(n366), .Y(n423) );
  OAI22XL U367 ( .A0(n424), .A1(n351), .B0(n352), .B1(n386), .Y(n145) );
  XOR2X1 U368 ( .A(b[9]), .B(n366), .Y(n386) );
  XOR2X1 U369 ( .A(b[8]), .B(n366), .Y(n424) );
  AO21X1 U370 ( .A0(n351), .A1(n352), .B0(n385), .Y(n144) );
  XOR2X1 U371 ( .A(b[10]), .B(n366), .Y(n385) );
  NOR2X1 U372 ( .A(n354), .B(n370), .Y(n143) );
  OAI22XL U373 ( .A0(n425), .A1(n353), .B0(n354), .B1(n426), .Y(n142) );
  XOR2X1 U374 ( .A(n364), .B(n357), .Y(n425) );
  OAI22XL U375 ( .A0(n426), .A1(n353), .B0(n354), .B1(n427), .Y(n141) );
  XOR2X1 U376 ( .A(b[1]), .B(n364), .Y(n426) );
  OAI22XL U377 ( .A0(n427), .A1(n353), .B0(n354), .B1(n428), .Y(n140) );
  XOR2X1 U378 ( .A(b[2]), .B(n364), .Y(n427) );
  OAI22XL U379 ( .A0(n428), .A1(n353), .B0(n354), .B1(n429), .Y(n139) );
  XOR2X1 U380 ( .A(b[3]), .B(n364), .Y(n428) );
  OAI22XL U381 ( .A0(n429), .A1(n353), .B0(n354), .B1(n380), .Y(n138) );
  XOR2X1 U382 ( .A(b[5]), .B(n364), .Y(n380) );
  XOR2X1 U383 ( .A(b[4]), .B(n364), .Y(n429) );
  OAI22XL U384 ( .A0(n383), .A1(n353), .B0(n354), .B1(n430), .Y(n137) );
  XOR2X1 U385 ( .A(b[6]), .B(n364), .Y(n383) );
  OAI22XL U386 ( .A0(n430), .A1(n353), .B0(n354), .B1(n431), .Y(n136) );
  XOR2X1 U387 ( .A(b[7]), .B(n364), .Y(n430) );
  OAI22XL U388 ( .A0(n431), .A1(n353), .B0(n354), .B1(n389), .Y(n135) );
  XOR2X1 U389 ( .A(b[9]), .B(n364), .Y(n389) );
  XOR2X1 U390 ( .A(b[8]), .B(n364), .Y(n431) );
  AO21X1 U391 ( .A0(n353), .A1(n354), .B0(n388), .Y(n134) );
  XOR2X1 U392 ( .A(b[10]), .B(n364), .Y(n388) );
  NOR2X1 U393 ( .A(n356), .B(n370), .Y(n133) );
  OAI22XL U394 ( .A0(n432), .A1(n355), .B0(n356), .B1(n433), .Y(n132) );
  XOR2X1 U395 ( .A(n361), .B(n357), .Y(n432) );
  OAI22XL U396 ( .A0(n433), .A1(n355), .B0(n356), .B1(n434), .Y(n131) );
  XOR2X1 U397 ( .A(b[1]), .B(n361), .Y(n433) );
  OAI22XL U398 ( .A0(n434), .A1(n355), .B0(n356), .B1(n435), .Y(n130) );
  XOR2X1 U399 ( .A(b[2]), .B(n361), .Y(n434) );
  OAI22XL U400 ( .A0(n435), .A1(n355), .B0(n356), .B1(n436), .Y(n129) );
  XOR2X1 U401 ( .A(b[3]), .B(n361), .Y(n435) );
  OAI22XL U402 ( .A0(n436), .A1(n355), .B0(n356), .B1(n437), .Y(n128) );
  XOR2X1 U403 ( .A(b[4]), .B(n361), .Y(n436) );
  OAI22XL U404 ( .A0(n437), .A1(n355), .B0(n356), .B1(n438), .Y(n127) );
  XOR2X1 U405 ( .A(b[5]), .B(n361), .Y(n437) );
  OAI22XL U406 ( .A0(n438), .A1(n355), .B0(n356), .B1(n439), .Y(n126) );
  XOR2X1 U407 ( .A(b[6]), .B(n361), .Y(n438) );
  OAI22XL U408 ( .A0(n439), .A1(n355), .B0(n356), .B1(n440), .Y(n125) );
  XOR2X1 U409 ( .A(b[7]), .B(n361), .Y(n439) );
  OAI22XL U410 ( .A0(n440), .A1(n355), .B0(n356), .B1(n392), .Y(n124) );
  XOR2X1 U411 ( .A(b[9]), .B(n361), .Y(n392) );
  XOR2X1 U412 ( .A(b[8]), .B(n361), .Y(n440) );
  AO21X1 U413 ( .A0(n355), .A1(n356), .B0(n391), .Y(n123) );
  XOR2X1 U414 ( .A(b[10]), .B(n361), .Y(n391) );
  NOR2X1 U415 ( .A(n359), .B(n370), .Y(n122) );
  NOR2X1 U416 ( .A(n359), .B(n441), .Y(n120) );
  XNOR2X1 U417 ( .A(b[2]), .B(n358), .Y(n441) );
  NOR2X1 U418 ( .A(n359), .B(n442), .Y(n119) );
  XNOR2X1 U419 ( .A(b[3]), .B(n358), .Y(n442) );
  NOR2X1 U420 ( .A(n359), .B(n443), .Y(n118) );
  XNOR2X1 U421 ( .A(b[4]), .B(n358), .Y(n443) );
  NOR2X1 U422 ( .A(n359), .B(n444), .Y(n117) );
  XNOR2X1 U423 ( .A(b[5]), .B(n358), .Y(n444) );
  NOR2X1 U424 ( .A(n359), .B(n445), .Y(n116) );
  XNOR2X1 U425 ( .A(b[6]), .B(n358), .Y(n445) );
  NOR2X1 U426 ( .A(n359), .B(n446), .Y(n115) );
  XNOR2X1 U427 ( .A(b[7]), .B(n358), .Y(n446) );
  NOR2X1 U428 ( .A(n359), .B(n447), .Y(n114) );
  XNOR2X1 U429 ( .A(b[8]), .B(n358), .Y(n447) );
  NOR2X1 U430 ( .A(n359), .B(n448), .Y(n113) );
  XNOR2X1 U431 ( .A(b[9]), .B(n358), .Y(n448) );
  OAI21XL U432 ( .A0(n357), .A1(n368), .B0(n378), .Y(n111) );
  OAI32X1 U433 ( .A0(n367), .A1(n357), .A2(n350), .B0(n367), .B1(n349), .Y(
        n110) );
  XOR2X1 U434 ( .A(a[3]), .B(a[2]), .Y(n449) );
  OAI32X1 U435 ( .A0(n366), .A1(n357), .A2(n352), .B0(n366), .B1(n351), .Y(
        n109) );
  XOR2X1 U436 ( .A(a[5]), .B(a[4]), .Y(n450) );
  OAI32X1 U437 ( .A0(n364), .A1(n357), .A2(n354), .B0(n364), .B1(n353), .Y(
        n108) );
  XOR2X1 U438 ( .A(a[7]), .B(a[6]), .Y(n451) );
  OAI32X1 U439 ( .A0(n361), .A1(n357), .A2(n356), .B0(n361), .B1(n355), .Y(
        n107) );
  XOR2X1 U440 ( .A(a[9]), .B(a[8]), .Y(n452) );
  NOR3BXL U441 ( .AN(n358), .B(n357), .C(n359), .Y(n106) );
  XOR2X1 U442 ( .A(n358), .B(a[9]), .Y(n374) );
endmodule


module geofence_DW_mult_tc_0 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n24, n25, n26, n27, n28, n30, n31, n32, n33, n34,
         n35, n36, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n113, n114, n115, n116, n117,
         n118, n119, n120, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452;

  ADDFXL U5 ( .A(n26), .B(n25), .CI(n5), .CO(n4), .S(product[19]) );
  ADDFXL U6 ( .A(n27), .B(n31), .CI(n6), .CO(n5), .S(product[18]) );
  ADDFXL U7 ( .A(n34), .B(n32), .CI(n7), .CO(n6), .S(product[17]) );
  ADDFXL U8 ( .A(n35), .B(n39), .CI(n8), .CO(n7), .S(product[16]) );
  ADDFXL U9 ( .A(n40), .B(n44), .CI(n9), .CO(n8), .S(product[15]) );
  ADDFXL U10 ( .A(n45), .B(n51), .CI(n10), .CO(n9), .S(product[14]) );
  ADDFXL U11 ( .A(n52), .B(n57), .CI(n11), .CO(n10), .S(product[13]) );
  ADDFXL U12 ( .A(n58), .B(n65), .CI(n12), .CO(n11), .S(product[12]) );
  ADDFXL U13 ( .A(n66), .B(n73), .CI(n13), .CO(n12), .S(product[11]) );
  ADDFXL U14 ( .A(n74), .B(n79), .CI(n14), .CO(n13), .S(product[10]) );
  ADDFXL U15 ( .A(n80), .B(n86), .CI(n15), .CO(n14), .S(product[9]) );
  ADDFXL U16 ( .A(n87), .B(n91), .CI(n16), .CO(n15), .S(product[8]) );
  ADDFXL U17 ( .A(n92), .B(n96), .CI(n17), .CO(n16), .S(product[7]) );
  ADDFXL U18 ( .A(n98), .B(n97), .CI(n18), .CO(n17), .S(product[6]) );
  ADDFXL U19 ( .A(n99), .B(n102), .CI(n19), .CO(n18), .S(product[5]) );
  ADDFXL U20 ( .A(n103), .B(n104), .CI(n20), .CO(n19), .S(product[4]) );
  ADDFXL U21 ( .A(n105), .B(n110), .CI(n21), .CO(n20), .S(product[3]) );
  ADDFXL U22 ( .A(n176), .B(n166), .CI(n22), .CO(n21), .S(product[2]) );
  ADDHXL U23 ( .A(n111), .B(n177), .CO(n22), .S(product[1]) );
  ADDFXL U25 ( .A(n28), .B(n123), .CI(n113), .CO(n24), .S(n25) );
  ADDFXL U26 ( .A(n360), .B(n114), .CI(n30), .CO(n26), .S(n27) );
  CMPR42X1 U28 ( .A(n134), .B(n124), .C(n36), .D(n115), .ICI(n33), .S(n32), 
        .ICO(n30), .CO(n31) );
  CMPR42X1 U29 ( .A(n125), .B(n116), .C(n362), .D(n41), .ICI(n38), .S(n35), 
        .ICO(n33), .CO(n34) );
  CMPR42X1 U31 ( .A(n135), .B(n126), .C(n42), .D(n46), .ICI(n43), .S(n40), 
        .ICO(n38), .CO(n39) );
  ADDFXL U32 ( .A(n48), .B(n144), .CI(n117), .CO(n41), .S(n42) );
  CMPR42X1 U33 ( .A(n365), .B(n53), .C(n54), .D(n47), .ICI(n50), .S(n45), 
        .ICO(n43), .CO(n44) );
  ADDFXL U34 ( .A(n127), .B(n118), .CI(n136), .CO(n46), .S(n47) );
  CMPR42X1 U36 ( .A(n137), .B(n128), .C(n55), .D(n60), .ICI(n56), .S(n52), 
        .ICO(n50), .CO(n51) );
  CMPR42X1 U37 ( .A(n155), .B(n119), .C(n62), .D(n145), .ICI(n59), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U38 ( .A(n363), .B(n67), .C(n68), .D(n61), .ICI(n64), .S(n58), 
        .ICO(n56), .CO(n57) );
  CMPR42X1 U39 ( .A(n129), .B(n156), .C(n146), .D(n120), .ICI(n70), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U41 ( .A(n138), .B(n71), .C(n76), .D(n69), .ICI(n72), .S(n66), 
        .ICO(n64), .CO(n65) );
  CMPR42X1 U42 ( .A(n157), .B(n106), .C(n147), .D(n130), .ICI(n75), .S(n69), 
        .ICO(n67), .CO(n68) );
  CMPR42X1 U45 ( .A(n148), .B(n83), .C(n77), .D(n81), .ICI(n78), .S(n74), 
        .ICO(n72), .CO(n73) );
  CMPR42X1 U46 ( .A(n122), .B(n139), .C(n168), .D(n158), .ICI(n131), .S(n77), 
        .ICO(n75), .CO(n76) );
  CMPR42X1 U47 ( .A(n169), .B(n84), .C(n85), .D(n88), .ICI(n82), .S(n80), 
        .ICO(n78), .CO(n79) );
  ADDFXL U48 ( .A(n140), .B(n149), .CI(n159), .CO(n81), .S(n82) );
  ADDHXL U49 ( .A(n132), .B(n107), .CO(n83), .S(n84) );
  CMPR42X1 U50 ( .A(n160), .B(n141), .C(n93), .D(n90), .ICI(n89), .S(n87), 
        .ICO(n85), .CO(n86) );
  ADDFXL U51 ( .A(n150), .B(n133), .CI(n170), .CO(n88), .S(n89) );
  CMPR42X1 U52 ( .A(n171), .B(n151), .C(n161), .D(n95), .ICI(n94), .S(n92), 
        .ICO(n90), .CO(n91) );
  ADDHXL U53 ( .A(n142), .B(n108), .CO(n93), .S(n94) );
  CMPR42X1 U54 ( .A(n143), .B(n172), .C(n162), .D(n152), .ICI(n100), .S(n97), 
        .ICO(n95), .CO(n96) );
  ADDFXL U55 ( .A(n163), .B(n173), .CI(n101), .CO(n98), .S(n99) );
  ADDHXL U56 ( .A(n153), .B(n109), .CO(n100), .S(n101) );
  ADDFXL U57 ( .A(n174), .B(n154), .CI(n164), .CO(n102), .S(n103) );
  ADDHXL U58 ( .A(n175), .B(n165), .CO(n104), .S(n105) );
  CLKINVX1 U262 ( .A(n62), .Y(n363) );
  CLKINVX1 U263 ( .A(n48), .Y(n365) );
  INVX3 U264 ( .A(n374), .Y(n359) );
  CLKINVX1 U265 ( .A(n357), .Y(n370) );
  CLKINVX1 U266 ( .A(n36), .Y(n362) );
  CLKBUFX3 U267 ( .A(n405), .Y(n349) );
  NAND2X1 U268 ( .A(n350), .B(n449), .Y(n405) );
  INVX3 U269 ( .A(a[5]), .Y(n366) );
  INVX3 U270 ( .A(a[3]), .Y(n367) );
  INVX3 U271 ( .A(a[1]), .Y(n368) );
  CLKBUFX3 U272 ( .A(n403), .Y(n350) );
  XNOR2X1 U273 ( .A(a[2]), .B(a[1]), .Y(n403) );
  CLKBUFX3 U274 ( .A(n384), .Y(n352) );
  XNOR2X1 U275 ( .A(a[4]), .B(a[3]), .Y(n384) );
  CLKBUFX3 U276 ( .A(n387), .Y(n351) );
  NAND2X1 U277 ( .A(n352), .B(n450), .Y(n387) );
  CLKBUFX3 U278 ( .A(n381), .Y(n353) );
  NAND2X1 U279 ( .A(n354), .B(n451), .Y(n381) );
  CLKBUFX3 U280 ( .A(n382), .Y(n354) );
  XNOR2X1 U281 ( .A(a[6]), .B(a[5]), .Y(n382) );
  NAND2X2 U282 ( .A(a[1]), .B(n369), .Y(n378) );
  CLKBUFX3 U283 ( .A(n393), .Y(n355) );
  NAND2X1 U284 ( .A(n356), .B(n452), .Y(n393) );
  INVX3 U285 ( .A(a[7]), .Y(n364) );
  INVX3 U286 ( .A(a[9]), .Y(n361) );
  INVX3 U287 ( .A(a[0]), .Y(n369) );
  CLKBUFX3 U288 ( .A(n390), .Y(n356) );
  XNOR2X1 U289 ( .A(a[8]), .B(a[7]), .Y(n390) );
  CLKBUFX3 U290 ( .A(a[10]), .Y(n358) );
  CLKBUFX3 U291 ( .A(b[0]), .Y(n357) );
  CLKINVX1 U292 ( .A(n28), .Y(n360) );
  XOR2X1 U293 ( .A(n371), .B(n372), .Y(product[20]) );
  XOR2X1 U294 ( .A(n4), .B(n24), .Y(n372) );
  NAND2X1 U295 ( .A(n373), .B(n374), .Y(n371) );
  XOR2X1 U296 ( .A(b[10]), .B(n358), .Y(n373) );
  NOR2X1 U297 ( .A(n369), .B(n370), .Y(product[0]) );
  XOR2X1 U298 ( .A(n375), .B(n376), .Y(n71) );
  NAND2BX1 U299 ( .AN(n376), .B(n375), .Y(n70) );
  NAND2X1 U300 ( .A(n377), .B(n374), .Y(n375) );
  XOR2X1 U301 ( .A(b[1]), .B(n358), .Y(n377) );
  OAI2BB1X1 U302 ( .A0N(n369), .A1N(n378), .B0(n379), .Y(n376) );
  OAI22XL U303 ( .A0(n380), .A1(n353), .B0(n354), .B1(n383), .Y(n62) );
  OAI22XL U304 ( .A0(n352), .A1(n385), .B0(n386), .B1(n351), .Y(n48) );
  OAI22XL U305 ( .A0(n354), .A1(n388), .B0(n389), .B1(n353), .Y(n36) );
  OAI22XL U306 ( .A0(n356), .A1(n391), .B0(n392), .B1(n355), .Y(n28) );
  OAI22XL U307 ( .A0(n357), .A1(n378), .B0(n394), .B1(n369), .Y(n177) );
  OAI22XL U308 ( .A0(n394), .A1(n378), .B0(n395), .B1(n369), .Y(n176) );
  XOR2X1 U309 ( .A(b[1]), .B(n368), .Y(n394) );
  OAI22XL U310 ( .A0(n395), .A1(n378), .B0(n396), .B1(n369), .Y(n175) );
  XOR2X1 U311 ( .A(b[2]), .B(n368), .Y(n395) );
  OAI22XL U312 ( .A0(n396), .A1(n378), .B0(n397), .B1(n369), .Y(n174) );
  XOR2X1 U313 ( .A(b[3]), .B(n368), .Y(n396) );
  OAI22XL U314 ( .A0(n397), .A1(n378), .B0(n398), .B1(n369), .Y(n173) );
  XOR2X1 U315 ( .A(b[4]), .B(n368), .Y(n397) );
  OAI22XL U316 ( .A0(n398), .A1(n378), .B0(n399), .B1(n369), .Y(n172) );
  XOR2X1 U317 ( .A(b[5]), .B(n368), .Y(n398) );
  OAI22XL U318 ( .A0(n399), .A1(n378), .B0(n400), .B1(n369), .Y(n171) );
  XOR2X1 U319 ( .A(b[6]), .B(n368), .Y(n399) );
  OAI22XL U320 ( .A0(n400), .A1(n378), .B0(n401), .B1(n369), .Y(n170) );
  XOR2X1 U321 ( .A(b[7]), .B(n368), .Y(n400) );
  OAI22XL U322 ( .A0(n401), .A1(n378), .B0(n402), .B1(n369), .Y(n169) );
  XOR2X1 U323 ( .A(b[8]), .B(n368), .Y(n401) );
  OAI2BB2XL U324 ( .B0(n402), .B1(n378), .A0N(n379), .A1N(a[0]), .Y(n168) );
  XOR2X1 U325 ( .A(b[10]), .B(a[1]), .Y(n379) );
  XOR2X1 U326 ( .A(b[9]), .B(n368), .Y(n402) );
  NOR2X1 U327 ( .A(n350), .B(n370), .Y(n166) );
  OAI22XL U328 ( .A0(n404), .A1(n349), .B0(n350), .B1(n406), .Y(n165) );
  XOR2X1 U329 ( .A(n367), .B(n357), .Y(n404) );
  OAI22XL U330 ( .A0(n406), .A1(n349), .B0(n350), .B1(n407), .Y(n164) );
  XOR2X1 U331 ( .A(b[1]), .B(n367), .Y(n406) );
  OAI22XL U332 ( .A0(n407), .A1(n349), .B0(n350), .B1(n408), .Y(n163) );
  XOR2X1 U333 ( .A(b[2]), .B(n367), .Y(n407) );
  OAI22XL U334 ( .A0(n408), .A1(n349), .B0(n350), .B1(n409), .Y(n162) );
  XOR2X1 U335 ( .A(b[3]), .B(n367), .Y(n408) );
  OAI22XL U336 ( .A0(n409), .A1(n349), .B0(n350), .B1(n410), .Y(n161) );
  XOR2X1 U337 ( .A(b[4]), .B(n367), .Y(n409) );
  OAI22XL U338 ( .A0(n410), .A1(n349), .B0(n350), .B1(n411), .Y(n160) );
  XOR2X1 U339 ( .A(b[5]), .B(n367), .Y(n410) );
  OAI22XL U340 ( .A0(n411), .A1(n349), .B0(n350), .B1(n412), .Y(n159) );
  XOR2X1 U341 ( .A(b[6]), .B(n367), .Y(n411) );
  OAI22XL U342 ( .A0(n412), .A1(n349), .B0(n350), .B1(n413), .Y(n158) );
  XOR2X1 U343 ( .A(b[7]), .B(n367), .Y(n412) );
  OAI22XL U344 ( .A0(n413), .A1(n349), .B0(n350), .B1(n414), .Y(n157) );
  XOR2X1 U345 ( .A(b[8]), .B(n367), .Y(n413) );
  OAI22XL U346 ( .A0(n414), .A1(n349), .B0(n350), .B1(n415), .Y(n156) );
  XOR2X1 U347 ( .A(b[9]), .B(n367), .Y(n414) );
  AO21X1 U348 ( .A0(n349), .A1(n350), .B0(n415), .Y(n155) );
  XOR2X1 U349 ( .A(b[10]), .B(n367), .Y(n415) );
  NOR2X1 U350 ( .A(n352), .B(n370), .Y(n154) );
  OAI22XL U351 ( .A0(n416), .A1(n351), .B0(n352), .B1(n417), .Y(n153) );
  XOR2X1 U352 ( .A(n366), .B(n357), .Y(n416) );
  OAI22XL U353 ( .A0(n417), .A1(n351), .B0(n352), .B1(n418), .Y(n152) );
  XOR2X1 U354 ( .A(b[1]), .B(n366), .Y(n417) );
  OAI22XL U355 ( .A0(n418), .A1(n351), .B0(n352), .B1(n419), .Y(n151) );
  XOR2X1 U356 ( .A(b[2]), .B(n366), .Y(n418) );
  OAI22XL U357 ( .A0(n419), .A1(n351), .B0(n352), .B1(n420), .Y(n150) );
  XOR2X1 U358 ( .A(b[3]), .B(n366), .Y(n419) );
  OAI22XL U359 ( .A0(n420), .A1(n351), .B0(n352), .B1(n421), .Y(n149) );
  XOR2X1 U360 ( .A(b[4]), .B(n366), .Y(n420) );
  OAI22XL U361 ( .A0(n421), .A1(n351), .B0(n352), .B1(n422), .Y(n148) );
  XOR2X1 U362 ( .A(b[5]), .B(n366), .Y(n421) );
  OAI22XL U363 ( .A0(n422), .A1(n351), .B0(n352), .B1(n423), .Y(n147) );
  XOR2X1 U364 ( .A(b[6]), .B(n366), .Y(n422) );
  OAI22XL U365 ( .A0(n423), .A1(n351), .B0(n352), .B1(n424), .Y(n146) );
  XOR2X1 U366 ( .A(b[7]), .B(n366), .Y(n423) );
  OAI22XL U367 ( .A0(n424), .A1(n351), .B0(n352), .B1(n386), .Y(n145) );
  XOR2X1 U368 ( .A(b[9]), .B(n366), .Y(n386) );
  XOR2X1 U369 ( .A(b[8]), .B(n366), .Y(n424) );
  AO21X1 U370 ( .A0(n351), .A1(n352), .B0(n385), .Y(n144) );
  XOR2X1 U371 ( .A(b[10]), .B(n366), .Y(n385) );
  NOR2X1 U372 ( .A(n354), .B(n370), .Y(n143) );
  OAI22XL U373 ( .A0(n425), .A1(n353), .B0(n354), .B1(n426), .Y(n142) );
  XOR2X1 U374 ( .A(n364), .B(n357), .Y(n425) );
  OAI22XL U375 ( .A0(n426), .A1(n353), .B0(n354), .B1(n427), .Y(n141) );
  XOR2X1 U376 ( .A(b[1]), .B(n364), .Y(n426) );
  OAI22XL U377 ( .A0(n427), .A1(n353), .B0(n354), .B1(n428), .Y(n140) );
  XOR2X1 U378 ( .A(b[2]), .B(n364), .Y(n427) );
  OAI22XL U379 ( .A0(n428), .A1(n353), .B0(n354), .B1(n429), .Y(n139) );
  XOR2X1 U380 ( .A(b[3]), .B(n364), .Y(n428) );
  OAI22XL U381 ( .A0(n429), .A1(n353), .B0(n354), .B1(n380), .Y(n138) );
  XOR2X1 U382 ( .A(b[5]), .B(n364), .Y(n380) );
  XOR2X1 U383 ( .A(b[4]), .B(n364), .Y(n429) );
  OAI22XL U384 ( .A0(n383), .A1(n353), .B0(n354), .B1(n430), .Y(n137) );
  XOR2X1 U385 ( .A(b[6]), .B(n364), .Y(n383) );
  OAI22XL U386 ( .A0(n430), .A1(n353), .B0(n354), .B1(n431), .Y(n136) );
  XOR2X1 U387 ( .A(b[7]), .B(n364), .Y(n430) );
  OAI22XL U388 ( .A0(n431), .A1(n353), .B0(n354), .B1(n389), .Y(n135) );
  XOR2X1 U389 ( .A(b[9]), .B(n364), .Y(n389) );
  XOR2X1 U390 ( .A(b[8]), .B(n364), .Y(n431) );
  AO21X1 U391 ( .A0(n353), .A1(n354), .B0(n388), .Y(n134) );
  XOR2X1 U392 ( .A(b[10]), .B(n364), .Y(n388) );
  NOR2X1 U393 ( .A(n356), .B(n370), .Y(n133) );
  OAI22XL U394 ( .A0(n432), .A1(n355), .B0(n356), .B1(n433), .Y(n132) );
  XOR2X1 U395 ( .A(n361), .B(n357), .Y(n432) );
  OAI22XL U396 ( .A0(n433), .A1(n355), .B0(n356), .B1(n434), .Y(n131) );
  XOR2X1 U397 ( .A(b[1]), .B(n361), .Y(n433) );
  OAI22XL U398 ( .A0(n434), .A1(n355), .B0(n356), .B1(n435), .Y(n130) );
  XOR2X1 U399 ( .A(b[2]), .B(n361), .Y(n434) );
  OAI22XL U400 ( .A0(n435), .A1(n355), .B0(n356), .B1(n436), .Y(n129) );
  XOR2X1 U401 ( .A(b[3]), .B(n361), .Y(n435) );
  OAI22XL U402 ( .A0(n436), .A1(n355), .B0(n356), .B1(n437), .Y(n128) );
  XOR2X1 U403 ( .A(b[4]), .B(n361), .Y(n436) );
  OAI22XL U404 ( .A0(n437), .A1(n355), .B0(n356), .B1(n438), .Y(n127) );
  XOR2X1 U405 ( .A(b[5]), .B(n361), .Y(n437) );
  OAI22XL U406 ( .A0(n438), .A1(n355), .B0(n356), .B1(n439), .Y(n126) );
  XOR2X1 U407 ( .A(b[6]), .B(n361), .Y(n438) );
  OAI22XL U408 ( .A0(n439), .A1(n355), .B0(n356), .B1(n440), .Y(n125) );
  XOR2X1 U409 ( .A(b[7]), .B(n361), .Y(n439) );
  OAI22XL U410 ( .A0(n440), .A1(n355), .B0(n356), .B1(n392), .Y(n124) );
  XOR2X1 U411 ( .A(b[9]), .B(n361), .Y(n392) );
  XOR2X1 U412 ( .A(b[8]), .B(n361), .Y(n440) );
  AO21X1 U413 ( .A0(n355), .A1(n356), .B0(n391), .Y(n123) );
  XOR2X1 U414 ( .A(b[10]), .B(n361), .Y(n391) );
  NOR2X1 U415 ( .A(n359), .B(n370), .Y(n122) );
  NOR2X1 U416 ( .A(n359), .B(n441), .Y(n120) );
  XNOR2X1 U417 ( .A(b[2]), .B(n358), .Y(n441) );
  NOR2X1 U418 ( .A(n359), .B(n442), .Y(n119) );
  XNOR2X1 U419 ( .A(b[3]), .B(n358), .Y(n442) );
  NOR2X1 U420 ( .A(n359), .B(n443), .Y(n118) );
  XNOR2X1 U421 ( .A(b[4]), .B(n358), .Y(n443) );
  NOR2X1 U422 ( .A(n359), .B(n444), .Y(n117) );
  XNOR2X1 U423 ( .A(b[5]), .B(n358), .Y(n444) );
  NOR2X1 U424 ( .A(n359), .B(n445), .Y(n116) );
  XNOR2X1 U425 ( .A(b[6]), .B(n358), .Y(n445) );
  NOR2X1 U426 ( .A(n359), .B(n446), .Y(n115) );
  XNOR2X1 U427 ( .A(b[7]), .B(n358), .Y(n446) );
  NOR2X1 U428 ( .A(n359), .B(n447), .Y(n114) );
  XNOR2X1 U429 ( .A(b[8]), .B(n358), .Y(n447) );
  NOR2X1 U430 ( .A(n359), .B(n448), .Y(n113) );
  XNOR2X1 U431 ( .A(b[9]), .B(n358), .Y(n448) );
  OAI21XL U432 ( .A0(n357), .A1(n368), .B0(n378), .Y(n111) );
  OAI32X1 U433 ( .A0(n367), .A1(n357), .A2(n350), .B0(n367), .B1(n349), .Y(
        n110) );
  XOR2X1 U434 ( .A(a[3]), .B(a[2]), .Y(n449) );
  OAI32X1 U435 ( .A0(n366), .A1(n357), .A2(n352), .B0(n366), .B1(n351), .Y(
        n109) );
  XOR2X1 U436 ( .A(a[5]), .B(a[4]), .Y(n450) );
  OAI32X1 U437 ( .A0(n364), .A1(n357), .A2(n354), .B0(n364), .B1(n353), .Y(
        n108) );
  XOR2X1 U438 ( .A(a[7]), .B(a[6]), .Y(n451) );
  OAI32X1 U439 ( .A0(n361), .A1(n357), .A2(n356), .B0(n361), .B1(n355), .Y(
        n107) );
  XOR2X1 U440 ( .A(a[9]), .B(a[8]), .Y(n452) );
  NOR3BXL U441 ( .AN(n358), .B(n357), .C(n359), .Y(n106) );
  XOR2X1 U442 ( .A(n358), .B(a[9]), .Y(n374) );
endmodule


module geofence ( clk, reset, X, Y, valid, is_inside );
  input [9:0] X;
  input [9:0] Y;
  input clk, reset;
  output valid, is_inside;
  wire   n665, \tar[0][9] , \tar[0][8] , \tar[0][7] , \tar[0][6] , \tar[0][5] ,
         \tar[0][4] , \tar[0][3] , \tar[0][2] , \tar[0][1] , \tar[0][0] ,
         \tar[1][9] , \tar[1][8] , \tar[1][7] , \tar[1][6] , \tar[1][5] ,
         \tar[1][4] , \tar[1][3] , \tar[1][2] , \tar[1][1] , \tar[1][0] ,
         \rec[0][0][9] , \rec[0][0][8] , \rec[0][0][7] , \rec[0][0][6] ,
         \rec[0][0][5] , \rec[0][0][4] , \rec[0][0][3] , \rec[0][0][2] ,
         \rec[0][0][1] , \rec[0][0][0] , \rec[0][1][9] , \rec[0][1][8] ,
         \rec[0][1][7] , \rec[0][1][6] , \rec[0][1][5] , \rec[0][1][4] ,
         \rec[0][1][3] , \rec[0][1][2] , \rec[0][1][1] , \rec[0][1][0] ,
         \rec[1][0][9] , \rec[1][0][8] , \rec[1][0][7] , \rec[1][0][6] ,
         \rec[1][0][5] , \rec[1][0][4] , \rec[1][0][3] , \rec[1][0][2] ,
         \rec[1][0][1] , \rec[1][0][0] , \rec[1][1][9] , \rec[1][1][8] ,
         \rec[1][1][7] , \rec[1][1][6] , \rec[1][1][5] , \rec[1][1][4] ,
         \rec[1][1][3] , \rec[1][1][2] , \rec[1][1][1] , \rec[1][1][0] ,
         \rec[2][0][9] , \rec[2][0][8] , \rec[2][0][7] , \rec[2][0][6] ,
         \rec[2][0][5] , \rec[2][0][4] , \rec[2][0][3] , \rec[2][0][2] ,
         \rec[2][0][1] , \rec[2][0][0] , \rec[2][1][9] , \rec[2][1][8] ,
         \rec[2][1][7] , \rec[2][1][6] , \rec[2][1][5] , \rec[2][1][4] ,
         \rec[2][1][3] , \rec[2][1][2] , \rec[2][1][1] , \rec[2][1][0] ,
         \rec[3][0][9] , \rec[3][0][8] , \rec[3][0][7] , \rec[3][0][6] ,
         \rec[3][0][5] , \rec[3][0][4] , \rec[3][0][3] , \rec[3][0][2] ,
         \rec[3][0][1] , \rec[3][0][0] , \rec[3][1][9] , \rec[3][1][8] ,
         \rec[3][1][7] , \rec[3][1][6] , \rec[3][1][5] , \rec[3][1][4] ,
         \rec[3][1][3] , \rec[3][1][2] , \rec[3][1][1] , \rec[3][1][0] ,
         \rec[4][0][9] , \rec[4][0][8] , \rec[4][0][7] , \rec[4][0][6] ,
         \rec[4][0][5] , \rec[4][0][4] , \rec[4][0][3] , \rec[4][0][2] ,
         \rec[4][0][1] , \rec[4][0][0] , \rec[4][1][9] , \rec[4][1][8] ,
         \rec[4][1][7] , \rec[4][1][6] , \rec[4][1][5] , \rec[4][1][4] ,
         \rec[4][1][3] , \rec[4][1][2] , \rec[4][1][1] , \rec[4][1][0] ,
         \rec[5][0][9] , \rec[5][0][8] , \rec[5][0][7] , \rec[5][0][6] ,
         \rec[5][0][5] , \rec[5][0][4] , \rec[5][0][3] , \rec[5][0][2] ,
         \rec[5][0][1] , \rec[5][0][0] , \rec[5][1][9] , \rec[5][1][8] ,
         \rec[5][1][7] , \rec[5][1][6] , \rec[5][1][5] , \rec[5][1][4] ,
         \rec[5][1][3] , \rec[5][1][2] , \rec[5][1][1] , \rec[5][1][0] ,
         \vec1[0][10] , \vec1[0][9] , \vec1[0][8] , \vec1[0][7] , \vec1[0][6] ,
         \vec1[0][5] , \vec1[0][4] , \vec1[0][3] , \vec1[0][2] , \vec1[0][1] ,
         \vec1[0][0] , \vec1[1][10] , \vec1[1][9] , \vec1[1][8] , \vec1[1][7] ,
         \vec1[1][6] , \vec1[1][5] , \vec1[1][4] , \vec1[1][3] , \vec1[1][2] ,
         \vec1[1][1] , \vec1[1][0] , N149, N150, N151, N152, N153, N154, N155,
         N156, N157, N158, N165, N166, N167, N168, N169, N170, N171, N172,
         N173, N174, \vec2[0][10] , \vec2[0][9] , \vec2[0][8] , \vec2[0][7] ,
         \vec2[0][6] , \vec2[0][5] , \vec2[0][4] , \vec2[0][3] , \vec2[0][2] ,
         \vec2[0][1] , \vec2[0][0] , \vec2[1][10] , \vec2[1][9] , \vec2[1][8] ,
         \vec2[1][7] , \vec2[1][6] , \vec2[1][5] , \vec2[1][4] , \vec2[1][3] ,
         \vec2[1][2] , \vec2[1][1] , \vec2[1][0] , N181, N182, N183, N184,
         N185, N186, N187, N188, N189, N190, N197, N198, N199, N200, N201,
         N202, N203, N204, N205, N206, N207, N267, N268, N269, N294, n17, n18,
         n19, n20, n21, n22, n45, n46, n49, n51, n53, n55, n58, n59, n61, n62,
         n63, n69, n90, n91, n93, n94, n95, n97, n99, n101, n102, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n517, n518, n519, n520, n521, n523, n524, n525, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664;
  wire   [2:0] round;
  wire   [20:0] v_cross1;
  wire   [20:0] v_cross2;
  wire   [1:0] ns;
  wire   [2:0] right_times;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  geofence_DW_cmp_0 gt_49 ( .A(v_cross1), .B(v_cross2), .TC(1'b1), .GE_LT(1'b0), .GE_GT_EQ(1'b1), .GE_LT_GT_LE(N207) );
  geofence_DW01_sub_0 sub_43 ( .A({1'b0, N149, N150, N151, N152, N153, N154, 
        N155, N156, N157, N158}), .B({1'b0, N165, N166, N167, N168, N169, N170, 
        N171, N172, N173, N174}), .CI(1'b0), .DIFF({\vec2[0][10] , 
        \vec2[0][9] , \vec2[0][8] , \vec2[0][7] , \vec2[0][6] , \vec2[0][5] , 
        \vec2[0][4] , \vec2[0][3] , \vec2[0][2] , \vec2[0][1] , \vec2[0][0] })
         );
  geofence_DW01_sub_1 sub_42 ( .A({1'b0, \tar[1][9] , \tar[1][8] , \tar[1][7] , 
        \tar[1][6] , \tar[1][5] , \tar[1][4] , \tar[1][3] , \tar[1][2] , 
        \tar[1][1] , \tar[1][0] }), .B({1'b0, N197, N198, N199, N200, N201, 
        N202, N203, N204, N205, N206}), .CI(1'b0), .DIFF({\vec1[1][10] , 
        \vec1[1][9] , \vec1[1][8] , \vec1[1][7] , \vec1[1][6] , \vec1[1][5] , 
        \vec1[1][4] , \vec1[1][3] , \vec1[1][2] , \vec1[1][1] , \vec1[1][0] })
         );
  geofence_DW01_sub_2 sub_44 ( .A({1'b0, N181, N182, N183, N184, N185, N186, 
        N187, N188, N189, N190}), .B({1'b0, N197, N198, N199, N200, N201, N202, 
        N203, N204, N205, N206}), .CI(1'b0), .DIFF({\vec2[1][10] , 
        \vec2[1][9] , \vec2[1][8] , \vec2[1][7] , \vec2[1][6] , \vec2[1][5] , 
        \vec2[1][4] , \vec2[1][3] , \vec2[1][2] , \vec2[1][1] , \vec2[1][0] })
         );
  geofence_DW01_sub_3 sub_41 ( .A({1'b0, \tar[0][9] , \tar[0][8] , \tar[0][7] , 
        \tar[0][6] , \tar[0][5] , \tar[0][4] , \tar[0][3] , \tar[0][2] , 
        \tar[0][1] , \tar[0][0] }), .B({1'b0, N165, N166, N167, N168, N169, 
        N170, N171, N172, N173, N174}), .CI(1'b0), .DIFF({\vec1[0][10] , 
        \vec1[0][9] , \vec1[0][8] , \vec1[0][7] , \vec1[0][6] , \vec1[0][5] , 
        \vec1[0][4] , \vec1[0][3] , \vec1[0][2] , \vec1[0][1] , \vec1[0][0] })
         );
  geofence_DW_mult_tc_1 mult_48 ( .a({\vec1[1][10] , \vec1[1][9] , 
        \vec1[1][8] , \vec1[1][7] , \vec1[1][6] , \vec1[1][5] , \vec1[1][4] , 
        \vec1[1][3] , \vec1[1][2] , \vec1[1][1] , \vec1[1][0] }), .b({
        \vec2[0][10] , \vec2[0][9] , \vec2[0][8] , \vec2[0][7] , \vec2[0][6] , 
        \vec2[0][5] , \vec2[0][4] , \vec2[0][3] , \vec2[0][2] , \vec2[0][1] , 
        \vec2[0][0] }), .product({SYNOPSYS_UNCONNECTED__0, v_cross2}) );
  geofence_DW_mult_tc_0 mult_47 ( .a({\vec1[0][10] , \vec1[0][9] , 
        \vec1[0][8] , \vec1[0][7] , \vec1[0][6] , \vec1[0][5] , \vec1[0][4] , 
        \vec1[0][3] , \vec1[0][2] , \vec1[0][1] , \vec1[0][0] }), .b({
        \vec2[1][10] , \vec2[1][9] , \vec2[1][8] , \vec2[1][7] , \vec2[1][6] , 
        \vec2[1][5] , \vec2[1][4] , \vec2[1][3] , \vec2[1][2] , \vec2[1][1] , 
        \vec2[1][0] }), .product({SYNOPSYS_UNCONNECTED__1, v_cross1}) );
  DFFRX1 \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(n598), .QN(n146) );
  DFFRX1 \count_reg[2]  ( .D(N269), .CK(clk), .RN(n613), .QN(n188) );
  DFFRX1 valid_reg ( .D(n634), .CK(clk), .RN(n525), .Q(n665), .QN(n144) );
  DFFRX1 \tar_reg[1][9]  ( .D(n175), .CK(clk), .RN(n524), .Q(\tar[1][9] ), 
        .QN(n158) );
  DFFRX1 \tar_reg[1][8]  ( .D(n174), .CK(clk), .RN(n525), .Q(\tar[1][8] ), 
        .QN(n159) );
  DFFRX1 \tar_reg[1][7]  ( .D(n173), .CK(clk), .RN(n524), .Q(\tar[1][7] ), 
        .QN(n160) );
  DFFRX1 \tar_reg[1][6]  ( .D(n172), .CK(clk), .RN(n525), .Q(\tar[1][6] ), 
        .QN(n161) );
  DFFRX1 \tar_reg[1][5]  ( .D(n171), .CK(clk), .RN(n524), .Q(\tar[1][5] ), 
        .QN(n162) );
  DFFRX1 \tar_reg[1][4]  ( .D(n170), .CK(clk), .RN(n525), .Q(\tar[1][4] ), 
        .QN(n163) );
  DFFRX1 \tar_reg[1][3]  ( .D(n169), .CK(clk), .RN(n524), .Q(\tar[1][3] ), 
        .QN(n164) );
  DFFRX1 \tar_reg[1][2]  ( .D(n168), .CK(clk), .RN(n525), .Q(\tar[1][2] ), 
        .QN(n165) );
  DFFRX1 \tar_reg[1][1]  ( .D(n167), .CK(clk), .RN(n524), .Q(\tar[1][1] ), 
        .QN(n166) );
  DFFRX1 \tar_reg[1][0]  ( .D(n186), .CK(clk), .RN(n525), .Q(\tar[1][0] ), 
        .QN(n147) );
  DFFRX1 \tar_reg[0][9]  ( .D(n185), .CK(clk), .RN(n524), .Q(\tar[0][9] ), 
        .QN(n148) );
  DFFRX1 \tar_reg[0][8]  ( .D(n184), .CK(clk), .RN(n525), .Q(\tar[0][8] ), 
        .QN(n149) );
  DFFRX1 \tar_reg[0][7]  ( .D(n183), .CK(clk), .RN(n524), .Q(\tar[0][7] ), 
        .QN(n150) );
  DFFRX1 \tar_reg[0][6]  ( .D(n182), .CK(clk), .RN(n525), .Q(\tar[0][6] ), 
        .QN(n151) );
  DFFRX1 \tar_reg[0][5]  ( .D(n181), .CK(clk), .RN(n524), .Q(\tar[0][5] ), 
        .QN(n152) );
  DFFRX1 \tar_reg[0][4]  ( .D(n180), .CK(clk), .RN(n525), .Q(\tar[0][4] ), 
        .QN(n153) );
  DFFRX1 \tar_reg[0][3]  ( .D(n179), .CK(clk), .RN(n524), .Q(\tar[0][3] ), 
        .QN(n154) );
  DFFRX1 \tar_reg[0][2]  ( .D(n178), .CK(clk), .RN(n525), .Q(\tar[0][2] ), 
        .QN(n155) );
  DFFRX1 \tar_reg[0][1]  ( .D(n177), .CK(clk), .RN(n524), .Q(\tar[0][1] ), 
        .QN(n156) );
  DFFRX1 \tar_reg[0][0]  ( .D(n176), .CK(clk), .RN(n525), .Q(\tar[0][0] ), 
        .QN(n157) );
  DFFRX1 \count_reg[0]  ( .D(N267), .CK(clk), .RN(n524), .Q(n638), .QN(n190)
         );
  DFFRX1 is_inside_reg ( .D(N294), .CK(clk), .RN(n525), .QN(n521) );
  DFFRX1 \round_reg[1]  ( .D(n194), .CK(clk), .RN(n524), .Q(round[1]), .QN(
        n661) );
  DFFRXL \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(n524), .Q(n145) );
  DFFRXL \rec_reg[5][1][9]  ( .D(n315), .CK(clk), .RN(n525), .Q(\rec[5][1][9] ) );
  DFFRXL \rec_reg[5][1][8]  ( .D(n314), .CK(clk), .RN(n524), .Q(\rec[5][1][8] ) );
  DFFRXL \rec_reg[5][1][7]  ( .D(n313), .CK(clk), .RN(n525), .Q(\rec[5][1][7] ) );
  DFFRXL \rec_reg[5][1][1]  ( .D(n307), .CK(clk), .RN(n524), .Q(\rec[5][1][1] ) );
  DFFRXL \rec_reg[5][1][0]  ( .D(n316), .CK(clk), .RN(n525), .Q(\rec[5][1][0] ) );
  DFFRXL \rec_reg[5][0][8]  ( .D(n304), .CK(clk), .RN(n524), .Q(\rec[5][0][8] ) );
  DFFRXL \rec_reg[5][0][6]  ( .D(n302), .CK(clk), .RN(n525), .Q(\rec[5][0][6] ) );
  DFFRXL \rec_reg[5][0][5]  ( .D(n301), .CK(clk), .RN(n524), .Q(\rec[5][0][5] ) );
  DFFRXL \rec_reg[5][0][4]  ( .D(n300), .CK(clk), .RN(n525), .Q(\rec[5][0][4] ) );
  DFFRXL \rec_reg[5][0][3]  ( .D(n299), .CK(clk), .RN(n524), .Q(\rec[5][0][3] ) );
  DFFRXL \rec_reg[5][0][2]  ( .D(n298), .CK(clk), .RN(n525), .Q(\rec[5][0][2] ) );
  DFFRXL \rec_reg[5][0][1]  ( .D(n297), .CK(clk), .RN(n524), .Q(\rec[5][0][1] ) );
  DFFRXL \rec_reg[4][1][9]  ( .D(n295), .CK(clk), .RN(n525), .Q(\rec[4][1][9] ) );
  DFFRXL \rec_reg[4][1][8]  ( .D(n294), .CK(clk), .RN(n524), .Q(\rec[4][1][8] ) );
  DFFRXL \rec_reg[4][1][7]  ( .D(n293), .CK(clk), .RN(n525), .Q(\rec[4][1][7] ) );
  DFFRXL \rec_reg[4][1][1]  ( .D(n287), .CK(clk), .RN(n524), .Q(\rec[4][1][1] ) );
  DFFRXL \rec_reg[4][1][0]  ( .D(n296), .CK(clk), .RN(n525), .Q(\rec[4][1][0] ) );
  DFFRXL \rec_reg[4][0][8]  ( .D(n284), .CK(clk), .RN(n524), .Q(\rec[4][0][8] ) );
  DFFRXL \rec_reg[4][0][6]  ( .D(n282), .CK(clk), .RN(n525), .Q(\rec[4][0][6] ) );
  DFFRXL \rec_reg[4][0][5]  ( .D(n281), .CK(clk), .RN(n524), .Q(\rec[4][0][5] ) );
  DFFRXL \rec_reg[4][0][4]  ( .D(n280), .CK(clk), .RN(n525), .Q(\rec[4][0][4] ) );
  DFFRXL \rec_reg[4][0][3]  ( .D(n279), .CK(clk), .RN(n524), .Q(\rec[4][0][3] ) );
  DFFRXL \rec_reg[4][0][2]  ( .D(n278), .CK(clk), .RN(n525), .Q(\rec[4][0][2] ) );
  DFFRXL \rec_reg[4][0][1]  ( .D(n277), .CK(clk), .RN(n524), .Q(\rec[4][0][1] ) );
  DFFRXL \rec_reg[3][1][9]  ( .D(n275), .CK(clk), .RN(n525), .Q(\rec[3][1][9] ) );
  DFFRXL \rec_reg[3][1][8]  ( .D(n274), .CK(clk), .RN(n524), .Q(\rec[3][1][8] ) );
  DFFRXL \rec_reg[3][1][7]  ( .D(n273), .CK(clk), .RN(n525), .Q(\rec[3][1][7] ) );
  DFFRXL \rec_reg[3][1][1]  ( .D(n267), .CK(clk), .RN(n524), .Q(\rec[3][1][1] ) );
  DFFRXL \rec_reg[3][1][0]  ( .D(n276), .CK(clk), .RN(n525), .Q(\rec[3][1][0] ) );
  DFFRXL \rec_reg[3][0][8]  ( .D(n264), .CK(clk), .RN(n524), .Q(\rec[3][0][8] ) );
  DFFRXL \rec_reg[3][0][6]  ( .D(n262), .CK(clk), .RN(n525), .Q(\rec[3][0][6] ) );
  DFFRXL \rec_reg[3][0][5]  ( .D(n261), .CK(clk), .RN(n524), .Q(\rec[3][0][5] ) );
  DFFRXL \rec_reg[3][0][4]  ( .D(n260), .CK(clk), .RN(n525), .Q(\rec[3][0][4] ) );
  DFFRXL \rec_reg[3][0][3]  ( .D(n259), .CK(clk), .RN(n524), .Q(\rec[3][0][3] ) );
  DFFRXL \rec_reg[3][0][2]  ( .D(n258), .CK(clk), .RN(n525), .Q(\rec[3][0][2] ) );
  DFFRXL \rec_reg[3][0][1]  ( .D(n257), .CK(clk), .RN(n524), .Q(\rec[3][0][1] ) );
  DFFRXL \rec_reg[2][1][9]  ( .D(n255), .CK(clk), .RN(n525), .Q(\rec[2][1][9] ) );
  DFFRXL \rec_reg[2][1][8]  ( .D(n254), .CK(clk), .RN(n524), .Q(\rec[2][1][8] ) );
  DFFRXL \rec_reg[2][1][7]  ( .D(n253), .CK(clk), .RN(n525), .Q(\rec[2][1][7] ) );
  DFFRXL \rec_reg[2][1][1]  ( .D(n247), .CK(clk), .RN(n524), .Q(\rec[2][1][1] ) );
  DFFRXL \rec_reg[2][1][0]  ( .D(n256), .CK(clk), .RN(n525), .Q(\rec[2][1][0] ) );
  DFFRXL \rec_reg[2][0][8]  ( .D(n244), .CK(clk), .RN(n524), .Q(\rec[2][0][8] ) );
  DFFRXL \rec_reg[2][0][6]  ( .D(n242), .CK(clk), .RN(n525), .Q(\rec[2][0][6] ) );
  DFFRXL \rec_reg[2][0][5]  ( .D(n241), .CK(clk), .RN(n524), .Q(\rec[2][0][5] ) );
  DFFRXL \rec_reg[2][0][4]  ( .D(n240), .CK(clk), .RN(n525), .Q(\rec[2][0][4] ) );
  DFFRXL \rec_reg[2][0][3]  ( .D(n239), .CK(clk), .RN(n524), .Q(\rec[2][0][3] ) );
  DFFRXL \rec_reg[2][0][2]  ( .D(n238), .CK(clk), .RN(n525), .Q(\rec[2][0][2] ) );
  DFFRXL \rec_reg[2][0][1]  ( .D(n237), .CK(clk), .RN(n524), .Q(\rec[2][0][1] ) );
  DFFRXL \rec_reg[1][1][9]  ( .D(n235), .CK(clk), .RN(n525), .Q(\rec[1][1][9] ) );
  DFFRXL \rec_reg[1][1][8]  ( .D(n234), .CK(clk), .RN(n524), .Q(\rec[1][1][8] ) );
  DFFRXL \rec_reg[1][1][7]  ( .D(n233), .CK(clk), .RN(n525), .Q(\rec[1][1][7] ) );
  DFFRXL \rec_reg[1][1][1]  ( .D(n227), .CK(clk), .RN(n524), .Q(\rec[1][1][1] ) );
  DFFRXL \rec_reg[1][1][0]  ( .D(n236), .CK(clk), .RN(n525), .Q(\rec[1][1][0] ) );
  DFFRXL \rec_reg[1][0][8]  ( .D(n224), .CK(clk), .RN(n524), .Q(\rec[1][0][8] ) );
  DFFRXL \rec_reg[1][0][6]  ( .D(n222), .CK(clk), .RN(n525), .Q(\rec[1][0][6] ) );
  DFFRXL \rec_reg[1][0][5]  ( .D(n221), .CK(clk), .RN(n524), .Q(\rec[1][0][5] ) );
  DFFRXL \rec_reg[1][0][4]  ( .D(n220), .CK(clk), .RN(n525), .Q(\rec[1][0][4] ) );
  DFFRXL \rec_reg[1][0][3]  ( .D(n219), .CK(clk), .RN(n524), .Q(\rec[1][0][3] ) );
  DFFRXL \rec_reg[1][0][2]  ( .D(n218), .CK(clk), .RN(n525), .Q(\rec[1][0][2] ) );
  DFFRXL \rec_reg[1][0][1]  ( .D(n217), .CK(clk), .RN(n524), .Q(\rec[1][0][1] ) );
  DFFRXL \rec_reg[5][1][6]  ( .D(n312), .CK(clk), .RN(n525), .Q(\rec[5][1][6] ) );
  DFFRXL \rec_reg[5][1][5]  ( .D(n311), .CK(clk), .RN(n524), .Q(\rec[5][1][5] ) );
  DFFRXL \rec_reg[5][1][4]  ( .D(n310), .CK(clk), .RN(n525), .Q(\rec[5][1][4] ) );
  DFFRXL \rec_reg[5][1][3]  ( .D(n309), .CK(clk), .RN(n524), .Q(\rec[5][1][3] ) );
  DFFRXL \rec_reg[5][1][2]  ( .D(n308), .CK(clk), .RN(n525), .Q(\rec[5][1][2] ) );
  DFFRXL \rec_reg[5][0][9]  ( .D(n305), .CK(clk), .RN(n524), .Q(\rec[5][0][9] ) );
  DFFRXL \rec_reg[5][0][7]  ( .D(n303), .CK(clk), .RN(n525), .Q(\rec[5][0][7] ) );
  DFFRXL \rec_reg[5][0][0]  ( .D(n306), .CK(clk), .RN(n524), .Q(\rec[5][0][0] ) );
  DFFRXL \rec_reg[4][1][6]  ( .D(n292), .CK(clk), .RN(n525), .Q(\rec[4][1][6] ) );
  DFFRXL \rec_reg[4][1][5]  ( .D(n291), .CK(clk), .RN(n524), .Q(\rec[4][1][5] ) );
  DFFRXL \rec_reg[4][1][4]  ( .D(n290), .CK(clk), .RN(n525), .Q(\rec[4][1][4] ) );
  DFFRXL \rec_reg[4][1][3]  ( .D(n289), .CK(clk), .RN(n524), .Q(\rec[4][1][3] ) );
  DFFRXL \rec_reg[4][1][2]  ( .D(n288), .CK(clk), .RN(n525), .Q(\rec[4][1][2] ) );
  DFFRXL \rec_reg[4][0][9]  ( .D(n285), .CK(clk), .RN(n524), .Q(\rec[4][0][9] ) );
  DFFRXL \rec_reg[4][0][7]  ( .D(n283), .CK(clk), .RN(n525), .Q(\rec[4][0][7] ) );
  DFFRXL \rec_reg[4][0][0]  ( .D(n286), .CK(clk), .RN(n524), .Q(\rec[4][0][0] ) );
  DFFRXL \rec_reg[3][1][6]  ( .D(n272), .CK(clk), .RN(n525), .Q(\rec[3][1][6] ) );
  DFFRXL \rec_reg[3][1][5]  ( .D(n271), .CK(clk), .RN(n524), .Q(\rec[3][1][5] ) );
  DFFRXL \rec_reg[3][1][4]  ( .D(n270), .CK(clk), .RN(n525), .Q(\rec[3][1][4] ) );
  DFFRXL \rec_reg[3][1][3]  ( .D(n269), .CK(clk), .RN(n524), .Q(\rec[3][1][3] ) );
  DFFRXL \rec_reg[3][1][2]  ( .D(n268), .CK(clk), .RN(n525), .Q(\rec[3][1][2] ) );
  DFFRXL \rec_reg[3][0][9]  ( .D(n265), .CK(clk), .RN(n524), .Q(\rec[3][0][9] ) );
  DFFRXL \rec_reg[3][0][7]  ( .D(n263), .CK(clk), .RN(n525), .Q(\rec[3][0][7] ) );
  DFFRXL \rec_reg[3][0][0]  ( .D(n266), .CK(clk), .RN(n524), .Q(\rec[3][0][0] ) );
  DFFRXL \rec_reg[2][1][6]  ( .D(n252), .CK(clk), .RN(n525), .Q(\rec[2][1][6] ) );
  DFFRXL \rec_reg[2][1][5]  ( .D(n251), .CK(clk), .RN(n524), .Q(\rec[2][1][5] ) );
  DFFRXL \rec_reg[2][1][4]  ( .D(n250), .CK(clk), .RN(n525), .Q(\rec[2][1][4] ) );
  DFFRXL \rec_reg[2][1][3]  ( .D(n249), .CK(clk), .RN(n524), .Q(\rec[2][1][3] ) );
  DFFRXL \rec_reg[2][1][2]  ( .D(n248), .CK(clk), .RN(n525), .Q(\rec[2][1][2] ) );
  DFFRXL \rec_reg[2][0][9]  ( .D(n245), .CK(clk), .RN(n524), .Q(\rec[2][0][9] ) );
  DFFRXL \rec_reg[2][0][7]  ( .D(n243), .CK(clk), .RN(n525), .Q(\rec[2][0][7] ) );
  DFFRXL \rec_reg[2][0][0]  ( .D(n246), .CK(clk), .RN(n524), .Q(\rec[2][0][0] ) );
  DFFRXL \rec_reg[1][1][6]  ( .D(n232), .CK(clk), .RN(n525), .Q(\rec[1][1][6] ) );
  DFFRXL \rec_reg[1][1][5]  ( .D(n231), .CK(clk), .RN(n524), .Q(\rec[1][1][5] ) );
  DFFRXL \rec_reg[1][1][4]  ( .D(n230), .CK(clk), .RN(n525), .Q(\rec[1][1][4] ) );
  DFFRXL \rec_reg[1][1][3]  ( .D(n229), .CK(clk), .RN(n524), .Q(\rec[1][1][3] ) );
  DFFRXL \rec_reg[1][1][2]  ( .D(n228), .CK(clk), .RN(n525), .Q(\rec[1][1][2] ) );
  DFFRXL \rec_reg[1][0][9]  ( .D(n225), .CK(clk), .RN(n524), .Q(\rec[1][0][9] ) );
  DFFRXL \rec_reg[1][0][7]  ( .D(n223), .CK(clk), .RN(n525), .Q(\rec[1][0][7] ) );
  DFFRXL \rec_reg[1][0][0]  ( .D(n226), .CK(clk), .RN(n524), .Q(\rec[1][0][0] ) );
  DFFRXL \rec_reg[0][1][9]  ( .D(n215), .CK(clk), .RN(n599), .Q(\rec[0][1][9] ), .QN(n658) );
  DFFRXL \rec_reg[0][1][8]  ( .D(n214), .CK(clk), .RN(n599), .Q(\rec[0][1][8] ), .QN(n657) );
  DFFRXL \rec_reg[0][1][7]  ( .D(n213), .CK(clk), .RN(n599), .Q(\rec[0][1][7] ), .QN(n656) );
  DFFRXL \rec_reg[0][1][6]  ( .D(n212), .CK(clk), .RN(n599), .Q(\rec[0][1][6] ), .QN(n655) );
  DFFRXL \rec_reg[0][1][5]  ( .D(n211), .CK(clk), .RN(n599), .Q(\rec[0][1][5] ), .QN(n654) );
  DFFRXL \rec_reg[0][1][4]  ( .D(n210), .CK(clk), .RN(n599), .Q(\rec[0][1][4] ), .QN(n653) );
  DFFRXL \rec_reg[0][1][3]  ( .D(n209), .CK(clk), .RN(n599), .Q(\rec[0][1][3] ), .QN(n652) );
  DFFRXL \rec_reg[0][1][2]  ( .D(n208), .CK(clk), .RN(n599), .Q(\rec[0][1][2] ), .QN(n651) );
  DFFRXL \rec_reg[0][1][1]  ( .D(n207), .CK(clk), .RN(n599), .Q(\rec[0][1][1] ), .QN(n650) );
  DFFRXL \rec_reg[0][1][0]  ( .D(n216), .CK(clk), .RN(n599), .Q(\rec[0][1][0] ), .QN(n659) );
  DFFRXL \rec_reg[0][0][9]  ( .D(n205), .CK(clk), .RN(n599), .Q(\rec[0][0][9] ), .QN(n648) );
  DFFRXL \rec_reg[0][0][8]  ( .D(n204), .CK(clk), .RN(n600), .Q(\rec[0][0][8] ), .QN(n647) );
  DFFRXL \rec_reg[0][0][7]  ( .D(n203), .CK(clk), .RN(n600), .Q(\rec[0][0][7] ), .QN(n646) );
  DFFRXL \rec_reg[0][0][6]  ( .D(n202), .CK(clk), .RN(n600), .Q(\rec[0][0][6] ), .QN(n645) );
  DFFRXL \rec_reg[0][0][5]  ( .D(n201), .CK(clk), .RN(n600), .Q(\rec[0][0][5] ), .QN(n644) );
  DFFRXL \rec_reg[0][0][4]  ( .D(n200), .CK(clk), .RN(n600), .Q(\rec[0][0][4] ), .QN(n643) );
  DFFRXL \rec_reg[0][0][3]  ( .D(n199), .CK(clk), .RN(n600), .Q(\rec[0][0][3] ), .QN(n642) );
  DFFRXL \rec_reg[0][0][2]  ( .D(n198), .CK(clk), .RN(n600), .Q(\rec[0][0][2] ), .QN(n641) );
  DFFRXL \rec_reg[0][0][1]  ( .D(n197), .CK(clk), .RN(n600), .Q(\rec[0][0][1] ), .QN(n640) );
  DFFRXL \rec_reg[0][0][0]  ( .D(n206), .CK(clk), .RN(n599), .Q(\rec[0][0][0] ), .QN(n649) );
  DFFRXL \right_times_reg[1]  ( .D(n191), .CK(clk), .RN(n525), .Q(
        right_times[1]), .QN(n663) );
  DFFRXL \right_times_reg[2]  ( .D(n193), .CK(clk), .RN(n524), .Q(
        right_times[2]), .QN(n664) );
  DFFRX1 \round_reg[2]  ( .D(n196), .CK(clk), .RN(n598), .Q(round[2]), .QN(
        n660) );
  DFFRX2 \count_reg[1]  ( .D(N268), .CK(clk), .RN(n525), .Q(n529), .QN(n189)
         );
  DFFRX1 \right_times_reg[0]  ( .D(n192), .CK(clk), .RN(n597), .Q(
        right_times[0]), .QN(n662) );
  DFFRX1 \round_reg[0]  ( .D(n195), .CK(clk), .RN(n524), .Q(round[0]), .QN(
        n580) );
  NOR2X4 U512 ( .A(n638), .B(n596), .Y(n517) );
  NOR2X4 U513 ( .A(n190), .B(n596), .Y(n518) );
  CLKAND2X3 U514 ( .A(n534), .B(n661), .Y(n519) );
  CLKAND2X3 U515 ( .A(n535), .B(n661), .Y(n520) );
  INVX12 U516 ( .A(n521), .Y(is_inside) );
  CLKINVX1 U517 ( .A(n613), .Y(n523) );
  INVX12 U518 ( .A(n523), .Y(n524) );
  INVX12 U519 ( .A(n523), .Y(n525) );
  BUFX12 U520 ( .A(n665), .Y(valid) );
  CLKBUFX3 U521 ( .A(n69), .Y(n592) );
  NAND2BX1 U522 ( .AN(n62), .B(n90), .Y(n99) );
  NAND2X1 U523 ( .A(n518), .B(n90), .Y(n97) );
  NAND2X1 U524 ( .A(n90), .B(n94), .Y(n93) );
  NAND3X1 U525 ( .A(n586), .B(n596), .C(n90), .Y(n91) );
  CLKBUFX3 U526 ( .A(n22), .Y(n593) );
  NAND3X1 U527 ( .A(n189), .B(n638), .C(n596), .Y(n527) );
  NOR2X2 U528 ( .A(n190), .B(n189), .Y(n94) );
  NOR2X2 U529 ( .A(n190), .B(n189), .Y(n591) );
  NAND2BX1 U530 ( .AN(n638), .B(n529), .Y(n528) );
  CLKINVX1 U531 ( .A(Y[0]), .Y(n633) );
  CLKINVX1 U532 ( .A(Y[9]), .Y(n624) );
  CLKINVX1 U533 ( .A(Y[8]), .Y(n625) );
  CLKINVX1 U534 ( .A(Y[7]), .Y(n626) );
  CLKINVX1 U535 ( .A(Y[6]), .Y(n627) );
  CLKINVX1 U536 ( .A(Y[5]), .Y(n628) );
  CLKINVX1 U537 ( .A(Y[4]), .Y(n629) );
  CLKINVX1 U538 ( .A(Y[3]), .Y(n630) );
  CLKINVX1 U539 ( .A(Y[2]), .Y(n631) );
  CLKINVX1 U540 ( .A(Y[1]), .Y(n632) );
  CLKINVX1 U541 ( .A(X[0]), .Y(n623) );
  CLKINVX1 U542 ( .A(X[9]), .Y(n614) );
  CLKINVX1 U543 ( .A(X[8]), .Y(n615) );
  CLKINVX1 U544 ( .A(X[7]), .Y(n616) );
  CLKINVX1 U545 ( .A(X[6]), .Y(n617) );
  CLKINVX1 U546 ( .A(X[5]), .Y(n618) );
  CLKINVX1 U547 ( .A(X[4]), .Y(n619) );
  CLKINVX1 U548 ( .A(X[3]), .Y(n620) );
  CLKINVX1 U549 ( .A(X[2]), .Y(n621) );
  CLKINVX1 U550 ( .A(X[1]), .Y(n622) );
  NAND3X1 U551 ( .A(n90), .B(n189), .C(n517), .Y(n95) );
  CLKINVX1 U552 ( .A(reset), .Y(n613) );
  CLKBUFX3 U553 ( .A(n635), .Y(n594) );
  CLKINVX1 U554 ( .A(n592), .Y(n635) );
  CLKBUFX3 U555 ( .A(n97), .Y(n603) );
  CLKBUFX3 U556 ( .A(n99), .Y(n601) );
  CLKBUFX3 U557 ( .A(n97), .Y(n604) );
  CLKBUFX3 U558 ( .A(n99), .Y(n602) );
  CLKBUFX3 U559 ( .A(n613), .Y(n598) );
  CLKBUFX3 U560 ( .A(n597), .Y(n599) );
  CLKBUFX3 U561 ( .A(n597), .Y(n600) );
  CLKINVX1 U562 ( .A(n49), .Y(n612) );
  NAND2X1 U563 ( .A(n588), .B(n90), .Y(n69) );
  CLKBUFX3 U564 ( .A(n93), .Y(n607) );
  CLKBUFX3 U565 ( .A(n91), .Y(n609) );
  CLKBUFX3 U566 ( .A(n93), .Y(n608) );
  CLKBUFX3 U567 ( .A(n91), .Y(n610) );
  CLKBUFX3 U568 ( .A(n636), .Y(n595) );
  CLKINVX1 U569 ( .A(n593), .Y(n636) );
  OAI21X1 U570 ( .A0(n61), .A1(n63), .B0(n19), .Y(n49) );
  OAI21X1 U571 ( .A0(n61), .A1(n62), .B0(n612), .Y(n58) );
  NAND3X1 U572 ( .A(n62), .B(n17), .C(N207), .Y(n63) );
  OAI211X1 U573 ( .A0(n583), .A1(n640), .B0(n126), .C0(n127), .Y(N157) );
  OAI211X1 U574 ( .A0(n584), .A1(n650), .B0(n106), .C0(n107), .Y(N189) );
  AOI31X1 U575 ( .A0(n19), .A1(n62), .A2(n63), .B0(n90), .Y(n101) );
  NOR2X1 U576 ( .A(n101), .B(n638), .Y(N267) );
  CLKBUFX3 U577 ( .A(n576), .Y(n581) );
  NOR2X1 U578 ( .A(n580), .B(n660), .Y(n576) );
  INVX3 U579 ( .A(n528), .Y(n585) );
  INVX3 U580 ( .A(n528), .Y(n586) );
  CLKINVX1 U581 ( .A(n527), .Y(n587) );
  CLKINVX1 U582 ( .A(n527), .Y(n588) );
  CLKINVX1 U583 ( .A(n527), .Y(n590) );
  CLKINVX1 U584 ( .A(n527), .Y(n589) );
  INVX3 U585 ( .A(n530), .Y(n583) );
  INVX3 U586 ( .A(n530), .Y(n584) );
  OAI22XL U587 ( .A0(n594), .A1(n659), .B0(n633), .B1(n592), .Y(n216) );
  OAI22XL U588 ( .A0(n594), .A1(n658), .B0(n624), .B1(n592), .Y(n215) );
  OAI22XL U589 ( .A0(n594), .A1(n657), .B0(n625), .B1(n592), .Y(n214) );
  OAI22XL U590 ( .A0(n594), .A1(n656), .B0(n626), .B1(n592), .Y(n213) );
  OAI22XL U591 ( .A0(n594), .A1(n655), .B0(n627), .B1(n592), .Y(n212) );
  OAI22XL U592 ( .A0(n594), .A1(n654), .B0(n628), .B1(n592), .Y(n211) );
  OAI22XL U593 ( .A0(n594), .A1(n653), .B0(n629), .B1(n592), .Y(n210) );
  OAI22XL U594 ( .A0(n594), .A1(n652), .B0(n630), .B1(n592), .Y(n209) );
  OAI22XL U595 ( .A0(n594), .A1(n651), .B0(n631), .B1(n592), .Y(n208) );
  OAI22XL U596 ( .A0(n594), .A1(n650), .B0(n632), .B1(n592), .Y(n207) );
  OAI22XL U597 ( .A0(n594), .A1(n649), .B0(n623), .B1(n592), .Y(n206) );
  OAI22XL U598 ( .A0(n594), .A1(n648), .B0(n614), .B1(n592), .Y(n205) );
  OAI22XL U599 ( .A0(n594), .A1(n647), .B0(n615), .B1(n592), .Y(n204) );
  OAI22XL U600 ( .A0(n594), .A1(n646), .B0(n616), .B1(n592), .Y(n203) );
  OAI22XL U601 ( .A0(n594), .A1(n645), .B0(n617), .B1(n592), .Y(n202) );
  OAI22XL U602 ( .A0(n594), .A1(n644), .B0(n618), .B1(n592), .Y(n201) );
  OAI22XL U603 ( .A0(n594), .A1(n643), .B0(n619), .B1(n592), .Y(n200) );
  OAI22XL U604 ( .A0(n594), .A1(n642), .B0(n620), .B1(n592), .Y(n199) );
  OAI22XL U605 ( .A0(n594), .A1(n641), .B0(n621), .B1(n592), .Y(n198) );
  OAI22XL U606 ( .A0(n594), .A1(n640), .B0(n622), .B1(n592), .Y(n197) );
  NOR2BX2 U607 ( .AN(n21), .B(n20), .Y(n90) );
  CLKINVX1 U608 ( .A(n19), .Y(n637) );
  NAND2BX1 U609 ( .AN(n596), .B(n585), .Y(n62) );
  NOR2X1 U610 ( .A(n639), .B(n596), .Y(n20) );
  CLKINVX1 U611 ( .A(n94), .Y(n639) );
  CLKBUFX3 U612 ( .A(n95), .Y(n605) );
  CLKBUFX3 U613 ( .A(n95), .Y(n606) );
  OAI21XL U614 ( .A0(n637), .A1(n17), .B0(n18), .Y(ns[1]) );
  NAND2BX1 U615 ( .AN(n583), .B(n21), .Y(n22) );
  AO22X1 U616 ( .A0(n17), .A1(n19), .B0(n20), .B1(n21), .Y(ns[0]) );
  CLKINVX1 U617 ( .A(n18), .Y(n634) );
  CLKBUFX3 U618 ( .A(n525), .Y(n597) );
  OAI32X1 U619 ( .A0(n637), .A1(round[0]), .A2(n611), .B0(n580), .B1(n58), .Y(
        n195) );
  CLKINVX1 U620 ( .A(n58), .Y(n611) );
  OAI32X1 U621 ( .A0(n637), .A1(right_times[0]), .A2(n612), .B0(n662), .B1(n49), .Y(n192) );
  OAI32X1 U622 ( .A0(n55), .A1(round[2]), .A2(n661), .B0(n59), .B1(n660), .Y(
        n196) );
  OA21XL U623 ( .A0(round[1]), .A1(n637), .B0(n53), .Y(n59) );
  OAI32X1 U624 ( .A0(n663), .A1(right_times[2]), .A2(n45), .B0(n51), .B1(n664), 
        .Y(n193) );
  AOI2BB1X1 U625 ( .A0N(n637), .A1N(right_times[1]), .B0(n46), .Y(n51) );
  CLKAND2X3 U626 ( .A(n534), .B(round[1]), .Y(n577) );
  CLKAND2X3 U627 ( .A(n535), .B(round[1]), .Y(n575) );
  OAI211X1 U628 ( .A0(n584), .A1(n642), .B0(n130), .C0(n131), .Y(N155) );
  AOI222XL U629 ( .A0(\rec[3][0][3] ), .A1(n591), .B0(\rec[4][0][3] ), .B1(
        n517), .C0(\rec[5][0][3] ), .C1(n518), .Y(n131) );
  OAI211X1 U630 ( .A0(n583), .A1(n652), .B0(n110), .C0(n111), .Y(N187) );
  AOI222XL U631 ( .A0(\rec[3][1][3] ), .A1(n591), .B0(\rec[4][1][3] ), .B1(
        n517), .C0(\rec[5][1][3] ), .C1(n518), .Y(n111) );
  OAI211X1 U632 ( .A0(n583), .A1(n643), .B0(n132), .C0(n133), .Y(N154) );
  AOI222XL U633 ( .A0(\rec[3][0][4] ), .A1(n94), .B0(\rec[4][0][4] ), .B1(n517), .C0(\rec[5][0][4] ), .C1(n518), .Y(n133) );
  OAI211X1 U634 ( .A0(n584), .A1(n653), .B0(n112), .C0(n113), .Y(N186) );
  AOI222XL U635 ( .A0(\rec[3][1][4] ), .A1(n94), .B0(\rec[4][1][4] ), .B1(n517), .C0(\rec[5][1][4] ), .C1(n518), .Y(n113) );
  OAI211X1 U636 ( .A0(n584), .A1(n654), .B0(n114), .C0(n115), .Y(N185) );
  AOI222XL U637 ( .A0(\rec[3][1][5] ), .A1(n591), .B0(\rec[4][1][5] ), .B1(
        n517), .C0(\rec[5][1][5] ), .C1(n518), .Y(n115) );
  OAI21XL U638 ( .A0(right_times[0]), .A1(n637), .B0(n49), .Y(n46) );
  OAI22XL U639 ( .A0(n53), .A1(n661), .B0(round[1]), .B1(n55), .Y(n194) );
  NAND3X1 U640 ( .A(n19), .B(n49), .C(right_times[0]), .Y(n45) );
  NAND3X1 U641 ( .A(n19), .B(n58), .C(round[0]), .Y(n55) );
  OA21XL U642 ( .A0(round[0]), .A1(n637), .B0(n58), .Y(n53) );
  OAI211X1 U643 ( .A0(n584), .A1(n641), .B0(n128), .C0(n129), .Y(N156) );
  AOI222XL U644 ( .A0(\rec[3][0][2] ), .A1(n94), .B0(\rec[4][0][2] ), .B1(n517), .C0(\rec[5][0][2] ), .C1(n518), .Y(n129) );
  OAI211X1 U645 ( .A0(n583), .A1(n651), .B0(n108), .C0(n109), .Y(N188) );
  AOI222XL U646 ( .A0(\rec[3][1][2] ), .A1(n94), .B0(\rec[4][1][2] ), .B1(n517), .C0(\rec[5][1][2] ), .C1(n518), .Y(n109) );
  OAI211X1 U647 ( .A0(n584), .A1(n659), .B0(n104), .C0(n105), .Y(N190) );
  AOI222XL U648 ( .A0(\rec[3][1][0] ), .A1(n591), .B0(\rec[4][1][0] ), .B1(
        n517), .C0(\rec[5][1][0] ), .C1(n518), .Y(n105) );
  AOI22X1 U649 ( .A0(\rec[2][1][0] ), .A1(n586), .B0(n587), .B1(\rec[1][1][0] ), .Y(n104) );
  AOI222XL U650 ( .A0(\rec[3][0][1] ), .A1(n591), .B0(\rec[4][0][1] ), .B1(
        n517), .C0(\rec[5][0][1] ), .C1(n518), .Y(n127) );
  AOI222XL U651 ( .A0(\rec[3][1][1] ), .A1(n591), .B0(\rec[4][1][1] ), .B1(
        n517), .C0(\rec[5][1][1] ), .C1(n518), .Y(n107) );
  NOR2X2 U652 ( .A(n660), .B(round[0]), .Y(n574) );
  NOR2X2 U653 ( .A(n660), .B(round[0]), .Y(n582) );
  AOI211X1 U654 ( .A0(n596), .A1(n639), .B0(n101), .C0(n20), .Y(N269) );
  OAI211X1 U655 ( .A0(n584), .A1(n645), .B0(n136), .C0(n137), .Y(N152) );
  AOI222XL U656 ( .A0(\rec[3][0][6] ), .A1(n94), .B0(\rec[4][0][6] ), .B1(n517), .C0(\rec[5][0][6] ), .C1(n518), .Y(n137) );
  OAI211X1 U657 ( .A0(n583), .A1(n655), .B0(n116), .C0(n117), .Y(N184) );
  AOI222XL U658 ( .A0(\rec[3][1][6] ), .A1(n94), .B0(\rec[4][1][6] ), .B1(n517), .C0(\rec[5][1][6] ), .C1(n518), .Y(n117) );
  OAI211X1 U659 ( .A0(n583), .A1(n656), .B0(n118), .C0(n119), .Y(N183) );
  AOI222XL U660 ( .A0(\rec[3][1][7] ), .A1(n591), .B0(\rec[4][1][7] ), .B1(
        n517), .C0(\rec[5][1][7] ), .C1(n518), .Y(n119) );
  OAI211X1 U661 ( .A0(n583), .A1(n644), .B0(n134), .C0(n135), .Y(N153) );
  AOI222XL U662 ( .A0(\rec[3][0][5] ), .A1(n591), .B0(\rec[4][0][5] ), .B1(
        n517), .C0(\rec[5][0][5] ), .C1(n518), .Y(n135) );
  OAI211X1 U663 ( .A0(n584), .A1(n657), .B0(n120), .C0(n121), .Y(N182) );
  AOI222XL U664 ( .A0(\rec[3][1][8] ), .A1(n94), .B0(\rec[4][1][8] ), .B1(n517), .C0(\rec[5][1][8] ), .C1(n518), .Y(n121) );
  OAI211X1 U665 ( .A0(n584), .A1(n646), .B0(n138), .C0(n139), .Y(N151) );
  AOI222XL U666 ( .A0(\rec[3][0][7] ), .A1(n591), .B0(\rec[4][0][7] ), .B1(
        n517), .C0(\rec[5][0][7] ), .C1(n518), .Y(n139) );
  OAI211X1 U667 ( .A0(n583), .A1(n647), .B0(n140), .C0(n141), .Y(N150) );
  AOI222XL U668 ( .A0(\rec[3][0][8] ), .A1(n94), .B0(\rec[4][0][8] ), .B1(n517), .C0(\rec[5][0][8] ), .C1(n518), .Y(n141) );
  OAI211X1 U669 ( .A0(n583), .A1(n649), .B0(n124), .C0(n125), .Y(N158) );
  AOI222XL U670 ( .A0(\rec[3][0][0] ), .A1(n94), .B0(\rec[4][0][0] ), .B1(n517), .C0(\rec[5][0][0] ), .C1(n518), .Y(n125) );
  AOI22X1 U671 ( .A0(\rec[2][0][0] ), .A1(n585), .B0(n588), .B1(\rec[1][0][0] ), .Y(n124) );
  AOI22X1 U672 ( .A0(\rec[2][0][1] ), .A1(n585), .B0(n589), .B1(\rec[1][0][1] ), .Y(n126) );
  AOI22X1 U673 ( .A0(\rec[2][1][1] ), .A1(n586), .B0(n589), .B1(\rec[1][1][1] ), .Y(n106) );
  AOI22X1 U674 ( .A0(\rec[2][1][2] ), .A1(n585), .B0(n590), .B1(\rec[1][1][2] ), .Y(n108) );
  NOR2X1 U675 ( .A(n101), .B(n102), .Y(N268) );
  AOI21X1 U676 ( .A0(n638), .A1(n189), .B0(n585), .Y(n102) );
  OAI2BB2XL U677 ( .B0(right_times[1]), .B1(n45), .A0N(n46), .A1N(
        right_times[1]), .Y(n191) );
  CLKBUFX3 U678 ( .A(n188), .Y(n596) );
  OAI211X1 U679 ( .A0(n584), .A1(n658), .B0(n122), .C0(n123), .Y(N181) );
  AOI222XL U680 ( .A0(\rec[3][1][9] ), .A1(n591), .B0(\rec[4][1][9] ), .B1(
        n517), .C0(\rec[5][1][9] ), .C1(n518), .Y(n123) );
  AOI22X1 U681 ( .A0(\rec[2][0][2] ), .A1(n586), .B0(n590), .B1(\rec[1][0][2] ), .Y(n128) );
  AOI22X1 U682 ( .A0(\rec[2][0][3] ), .A1(n586), .B0(n590), .B1(\rec[1][0][3] ), .Y(n130) );
  AOI22X1 U683 ( .A0(\rec[2][1][3] ), .A1(n585), .B0(n587), .B1(\rec[1][1][3] ), .Y(n110) );
  AOI22X1 U684 ( .A0(\rec[2][0][4] ), .A1(n585), .B0(n587), .B1(\rec[1][0][4] ), .Y(n132) );
  AOI22X1 U685 ( .A0(\rec[2][1][4] ), .A1(n586), .B0(n588), .B1(\rec[1][1][4] ), .Y(n112) );
  AOI22X1 U686 ( .A0(\rec[2][1][5] ), .A1(n586), .B0(n588), .B1(\rec[1][1][5] ), .Y(n114) );
  AOI22X1 U687 ( .A0(\rec[2][0][5] ), .A1(n585), .B0(n588), .B1(\rec[1][0][5] ), .Y(n134) );
  AND3X2 U688 ( .A(n189), .B(n190), .C(n596), .Y(n530) );
  OAI211X1 U689 ( .A0(n583), .A1(n648), .B0(n142), .C0(n143), .Y(N149) );
  AOI222XL U690 ( .A0(\rec[3][0][9] ), .A1(n591), .B0(\rec[4][0][9] ), .B1(
        n517), .C0(\rec[5][0][9] ), .C1(n518), .Y(n143) );
  OAI22XL U691 ( .A0(n593), .A1(n632), .B0(n595), .B1(n166), .Y(n167) );
  OAI22XL U692 ( .A0(n593), .A1(n631), .B0(n595), .B1(n165), .Y(n168) );
  OAI22XL U693 ( .A0(n593), .A1(n630), .B0(n595), .B1(n164), .Y(n169) );
  OAI22XL U694 ( .A0(n593), .A1(n629), .B0(n595), .B1(n163), .Y(n170) );
  OAI22XL U695 ( .A0(n593), .A1(n628), .B0(n595), .B1(n162), .Y(n171) );
  OAI22XL U696 ( .A0(n593), .A1(n627), .B0(n595), .B1(n161), .Y(n172) );
  OAI22XL U697 ( .A0(n593), .A1(n626), .B0(n595), .B1(n160), .Y(n173) );
  OAI22XL U698 ( .A0(n593), .A1(n625), .B0(n595), .B1(n159), .Y(n174) );
  OAI22XL U699 ( .A0(n593), .A1(n624), .B0(n595), .B1(n158), .Y(n175) );
  OAI22XL U700 ( .A0(n593), .A1(n623), .B0(n595), .B1(n157), .Y(n176) );
  OAI22XL U701 ( .A0(n593), .A1(n622), .B0(n595), .B1(n156), .Y(n177) );
  OAI22XL U702 ( .A0(n593), .A1(n621), .B0(n595), .B1(n155), .Y(n178) );
  OAI22XL U703 ( .A0(n593), .A1(n620), .B0(n595), .B1(n154), .Y(n179) );
  OAI22XL U704 ( .A0(n593), .A1(n619), .B0(n595), .B1(n153), .Y(n180) );
  OAI22XL U705 ( .A0(n593), .A1(n618), .B0(n595), .B1(n152), .Y(n181) );
  OAI22XL U706 ( .A0(n593), .A1(n617), .B0(n595), .B1(n151), .Y(n182) );
  OAI22XL U707 ( .A0(n593), .A1(n616), .B0(n595), .B1(n150), .Y(n183) );
  OAI22XL U708 ( .A0(n593), .A1(n615), .B0(n595), .B1(n149), .Y(n184) );
  OAI22XL U709 ( .A0(n593), .A1(n614), .B0(n595), .B1(n148), .Y(n185) );
  OAI22XL U710 ( .A0(n593), .A1(n633), .B0(n595), .B1(n147), .Y(n186) );
  AOI22X1 U711 ( .A0(\rec[2][0][6] ), .A1(n586), .B0(n587), .B1(\rec[1][0][6] ), .Y(n136) );
  AOI22X1 U712 ( .A0(\rec[2][1][6] ), .A1(n585), .B0(n589), .B1(\rec[1][1][6] ), .Y(n116) );
  AOI22X1 U713 ( .A0(\rec[2][1][7] ), .A1(n585), .B0(n590), .B1(\rec[1][1][7] ), .Y(n118) );
  AOI22X1 U714 ( .A0(\rec[2][0][7] ), .A1(n586), .B0(n589), .B1(\rec[1][0][7] ), .Y(n138) );
  OAI2BB2XL U715 ( .B0(n633), .B1(n602), .A0N(n601), .A1N(\rec[5][1][0] ), .Y(
        n316) );
  OAI2BB2XL U716 ( .B0(n624), .B1(n602), .A0N(n601), .A1N(\rec[5][1][9] ), .Y(
        n315) );
  OAI2BB2XL U717 ( .B0(n625), .B1(n602), .A0N(n601), .A1N(\rec[5][1][8] ), .Y(
        n314) );
  OAI2BB2XL U718 ( .B0(n626), .B1(n601), .A0N(n601), .A1N(\rec[5][1][7] ), .Y(
        n313) );
  OAI2BB2XL U719 ( .B0(n627), .B1(n601), .A0N(n601), .A1N(\rec[5][1][6] ), .Y(
        n312) );
  OAI2BB2XL U720 ( .B0(n628), .B1(n601), .A0N(n601), .A1N(\rec[5][1][5] ), .Y(
        n311) );
  OAI2BB2XL U721 ( .B0(n629), .B1(n601), .A0N(n602), .A1N(\rec[5][1][4] ), .Y(
        n310) );
  OAI2BB2XL U722 ( .B0(n630), .B1(n601), .A0N(n602), .A1N(\rec[5][1][3] ), .Y(
        n309) );
  OAI2BB2XL U723 ( .B0(n631), .B1(n601), .A0N(n602), .A1N(\rec[5][1][2] ), .Y(
        n308) );
  OAI2BB2XL U724 ( .B0(n632), .B1(n602), .A0N(n602), .A1N(\rec[5][1][1] ), .Y(
        n307) );
  OAI2BB2XL U725 ( .B0(n623), .B1(n601), .A0N(n602), .A1N(\rec[5][0][0] ), .Y(
        n306) );
  OAI2BB2XL U726 ( .B0(n614), .B1(n601), .A0N(n602), .A1N(\rec[5][0][9] ), .Y(
        n305) );
  OAI2BB2XL U727 ( .B0(n615), .B1(n601), .A0N(n602), .A1N(\rec[5][0][8] ), .Y(
        n304) );
  OAI2BB2XL U728 ( .B0(n616), .B1(n601), .A0N(n602), .A1N(\rec[5][0][7] ), .Y(
        n303) );
  OAI2BB2XL U729 ( .B0(n617), .B1(n602), .A0N(n602), .A1N(\rec[5][0][6] ), .Y(
        n302) );
  OAI2BB2XL U730 ( .B0(n618), .B1(n601), .A0N(n602), .A1N(\rec[5][0][5] ), .Y(
        n301) );
  OAI2BB2XL U731 ( .B0(n619), .B1(n99), .A0N(n602), .A1N(\rec[5][0][4] ), .Y(
        n300) );
  OAI2BB2XL U732 ( .B0(n620), .B1(n99), .A0N(n602), .A1N(\rec[5][0][3] ), .Y(
        n299) );
  OAI2BB2XL U733 ( .B0(n621), .B1(n99), .A0N(n601), .A1N(\rec[5][0][2] ), .Y(
        n298) );
  OAI2BB2XL U734 ( .B0(n622), .B1(n99), .A0N(n602), .A1N(\rec[5][0][1] ), .Y(
        n297) );
  OAI2BB2XL U735 ( .B0(n633), .B1(n604), .A0N(n603), .A1N(\rec[4][1][0] ), .Y(
        n296) );
  OAI2BB2XL U736 ( .B0(n624), .B1(n604), .A0N(n603), .A1N(\rec[4][1][9] ), .Y(
        n295) );
  OAI2BB2XL U737 ( .B0(n625), .B1(n604), .A0N(n603), .A1N(\rec[4][1][8] ), .Y(
        n294) );
  OAI2BB2XL U738 ( .B0(n626), .B1(n603), .A0N(n603), .A1N(\rec[4][1][7] ), .Y(
        n293) );
  OAI2BB2XL U739 ( .B0(n627), .B1(n603), .A0N(n603), .A1N(\rec[4][1][6] ), .Y(
        n292) );
  OAI2BB2XL U740 ( .B0(n628), .B1(n603), .A0N(n603), .A1N(\rec[4][1][5] ), .Y(
        n291) );
  OAI2BB2XL U741 ( .B0(n629), .B1(n603), .A0N(n604), .A1N(\rec[4][1][4] ), .Y(
        n290) );
  OAI2BB2XL U742 ( .B0(n630), .B1(n603), .A0N(n604), .A1N(\rec[4][1][3] ), .Y(
        n289) );
  OAI2BB2XL U743 ( .B0(n631), .B1(n603), .A0N(n604), .A1N(\rec[4][1][2] ), .Y(
        n288) );
  OAI2BB2XL U744 ( .B0(n632), .B1(n604), .A0N(n604), .A1N(\rec[4][1][1] ), .Y(
        n287) );
  OAI2BB2XL U745 ( .B0(n623), .B1(n603), .A0N(n604), .A1N(\rec[4][0][0] ), .Y(
        n286) );
  OAI2BB2XL U746 ( .B0(n614), .B1(n603), .A0N(n604), .A1N(\rec[4][0][9] ), .Y(
        n285) );
  OAI2BB2XL U747 ( .B0(n615), .B1(n603), .A0N(n604), .A1N(\rec[4][0][8] ), .Y(
        n284) );
  OAI2BB2XL U748 ( .B0(n616), .B1(n603), .A0N(n604), .A1N(\rec[4][0][7] ), .Y(
        n283) );
  OAI2BB2XL U749 ( .B0(n617), .B1(n604), .A0N(n604), .A1N(\rec[4][0][6] ), .Y(
        n282) );
  OAI2BB2XL U750 ( .B0(n618), .B1(n603), .A0N(n604), .A1N(\rec[4][0][5] ), .Y(
        n281) );
  OAI2BB2XL U751 ( .B0(n619), .B1(n97), .A0N(n604), .A1N(\rec[4][0][4] ), .Y(
        n280) );
  OAI2BB2XL U752 ( .B0(n620), .B1(n97), .A0N(n604), .A1N(\rec[4][0][3] ), .Y(
        n279) );
  OAI2BB2XL U753 ( .B0(n621), .B1(n97), .A0N(n603), .A1N(\rec[4][0][2] ), .Y(
        n278) );
  OAI2BB2XL U754 ( .B0(n622), .B1(n97), .A0N(n604), .A1N(\rec[4][0][1] ), .Y(
        n277) );
  OAI2BB2XL U755 ( .B0(n633), .B1(n606), .A0N(n605), .A1N(\rec[3][1][0] ), .Y(
        n276) );
  OAI2BB2XL U756 ( .B0(n624), .B1(n606), .A0N(n605), .A1N(\rec[3][1][9] ), .Y(
        n275) );
  OAI2BB2XL U757 ( .B0(n625), .B1(n606), .A0N(n605), .A1N(\rec[3][1][8] ), .Y(
        n274) );
  OAI2BB2XL U758 ( .B0(n626), .B1(n605), .A0N(n605), .A1N(\rec[3][1][7] ), .Y(
        n273) );
  OAI2BB2XL U759 ( .B0(n627), .B1(n605), .A0N(n605), .A1N(\rec[3][1][6] ), .Y(
        n272) );
  OAI2BB2XL U760 ( .B0(n628), .B1(n605), .A0N(n605), .A1N(\rec[3][1][5] ), .Y(
        n271) );
  OAI2BB2XL U761 ( .B0(n629), .B1(n605), .A0N(n606), .A1N(\rec[3][1][4] ), .Y(
        n270) );
  OAI2BB2XL U762 ( .B0(n630), .B1(n605), .A0N(n606), .A1N(\rec[3][1][3] ), .Y(
        n269) );
  OAI2BB2XL U763 ( .B0(n631), .B1(n605), .A0N(n606), .A1N(\rec[3][1][2] ), .Y(
        n268) );
  OAI2BB2XL U764 ( .B0(n632), .B1(n606), .A0N(n606), .A1N(\rec[3][1][1] ), .Y(
        n267) );
  OAI2BB2XL U765 ( .B0(n623), .B1(n605), .A0N(n606), .A1N(\rec[3][0][0] ), .Y(
        n266) );
  OAI2BB2XL U766 ( .B0(n614), .B1(n605), .A0N(n606), .A1N(\rec[3][0][9] ), .Y(
        n265) );
  OAI2BB2XL U767 ( .B0(n615), .B1(n605), .A0N(n606), .A1N(\rec[3][0][8] ), .Y(
        n264) );
  OAI2BB2XL U768 ( .B0(n616), .B1(n605), .A0N(n606), .A1N(\rec[3][0][7] ), .Y(
        n263) );
  OAI2BB2XL U769 ( .B0(n617), .B1(n606), .A0N(n606), .A1N(\rec[3][0][6] ), .Y(
        n262) );
  OAI2BB2XL U770 ( .B0(n618), .B1(n605), .A0N(n606), .A1N(\rec[3][0][5] ), .Y(
        n261) );
  OAI2BB2XL U771 ( .B0(n619), .B1(n95), .A0N(n606), .A1N(\rec[3][0][4] ), .Y(
        n260) );
  OAI2BB2XL U772 ( .B0(n620), .B1(n95), .A0N(n606), .A1N(\rec[3][0][3] ), .Y(
        n259) );
  OAI2BB2XL U773 ( .B0(n621), .B1(n95), .A0N(n605), .A1N(\rec[3][0][2] ), .Y(
        n258) );
  OAI2BB2XL U774 ( .B0(n622), .B1(n95), .A0N(n606), .A1N(\rec[3][0][1] ), .Y(
        n257) );
  OAI2BB2XL U775 ( .B0(n633), .B1(n610), .A0N(n609), .A1N(\rec[1][1][0] ), .Y(
        n236) );
  OAI2BB2XL U776 ( .B0(n624), .B1(n610), .A0N(n609), .A1N(\rec[1][1][9] ), .Y(
        n235) );
  OAI2BB2XL U777 ( .B0(n625), .B1(n610), .A0N(n609), .A1N(\rec[1][1][8] ), .Y(
        n234) );
  OAI2BB2XL U778 ( .B0(n626), .B1(n609), .A0N(n609), .A1N(\rec[1][1][7] ), .Y(
        n233) );
  OAI2BB2XL U779 ( .B0(n627), .B1(n609), .A0N(n609), .A1N(\rec[1][1][6] ), .Y(
        n232) );
  OAI2BB2XL U780 ( .B0(n628), .B1(n609), .A0N(n609), .A1N(\rec[1][1][5] ), .Y(
        n231) );
  OAI2BB2XL U781 ( .B0(n629), .B1(n609), .A0N(n610), .A1N(\rec[1][1][4] ), .Y(
        n230) );
  OAI2BB2XL U782 ( .B0(n630), .B1(n609), .A0N(n610), .A1N(\rec[1][1][3] ), .Y(
        n229) );
  OAI2BB2XL U783 ( .B0(n631), .B1(n609), .A0N(n610), .A1N(\rec[1][1][2] ), .Y(
        n228) );
  OAI2BB2XL U784 ( .B0(n632), .B1(n610), .A0N(n610), .A1N(\rec[1][1][1] ), .Y(
        n227) );
  OAI2BB2XL U785 ( .B0(n623), .B1(n609), .A0N(n610), .A1N(\rec[1][0][0] ), .Y(
        n226) );
  OAI2BB2XL U786 ( .B0(n614), .B1(n609), .A0N(n610), .A1N(\rec[1][0][9] ), .Y(
        n225) );
  OAI2BB2XL U787 ( .B0(n615), .B1(n609), .A0N(n610), .A1N(\rec[1][0][8] ), .Y(
        n224) );
  OAI2BB2XL U788 ( .B0(n616), .B1(n609), .A0N(n610), .A1N(\rec[1][0][7] ), .Y(
        n223) );
  OAI2BB2XL U789 ( .B0(n617), .B1(n610), .A0N(n610), .A1N(\rec[1][0][6] ), .Y(
        n222) );
  OAI2BB2XL U790 ( .B0(n618), .B1(n609), .A0N(n610), .A1N(\rec[1][0][5] ), .Y(
        n221) );
  OAI2BB2XL U791 ( .B0(n619), .B1(n91), .A0N(n610), .A1N(\rec[1][0][4] ), .Y(
        n220) );
  OAI2BB2XL U792 ( .B0(n620), .B1(n91), .A0N(n610), .A1N(\rec[1][0][3] ), .Y(
        n219) );
  OAI2BB2XL U793 ( .B0(n621), .B1(n91), .A0N(n609), .A1N(\rec[1][0][2] ), .Y(
        n218) );
  OAI2BB2XL U794 ( .B0(n622), .B1(n91), .A0N(n610), .A1N(\rec[1][0][1] ), .Y(
        n217) );
  OAI2BB2XL U795 ( .B0(n633), .B1(n608), .A0N(n607), .A1N(\rec[2][1][0] ), .Y(
        n256) );
  OAI2BB2XL U796 ( .B0(n624), .B1(n608), .A0N(n607), .A1N(\rec[2][1][9] ), .Y(
        n255) );
  OAI2BB2XL U797 ( .B0(n625), .B1(n608), .A0N(n607), .A1N(\rec[2][1][8] ), .Y(
        n254) );
  OAI2BB2XL U798 ( .B0(n626), .B1(n607), .A0N(n607), .A1N(\rec[2][1][7] ), .Y(
        n253) );
  OAI2BB2XL U799 ( .B0(n627), .B1(n607), .A0N(n607), .A1N(\rec[2][1][6] ), .Y(
        n252) );
  OAI2BB2XL U800 ( .B0(n628), .B1(n607), .A0N(n607), .A1N(\rec[2][1][5] ), .Y(
        n251) );
  OAI2BB2XL U801 ( .B0(n629), .B1(n607), .A0N(n608), .A1N(\rec[2][1][4] ), .Y(
        n250) );
  OAI2BB2XL U802 ( .B0(n630), .B1(n607), .A0N(n608), .A1N(\rec[2][1][3] ), .Y(
        n249) );
  OAI2BB2XL U803 ( .B0(n631), .B1(n607), .A0N(n608), .A1N(\rec[2][1][2] ), .Y(
        n248) );
  OAI2BB2XL U804 ( .B0(n632), .B1(n608), .A0N(n608), .A1N(\rec[2][1][1] ), .Y(
        n247) );
  OAI2BB2XL U805 ( .B0(n623), .B1(n607), .A0N(n608), .A1N(\rec[2][0][0] ), .Y(
        n246) );
  OAI2BB2XL U806 ( .B0(n614), .B1(n607), .A0N(n608), .A1N(\rec[2][0][9] ), .Y(
        n245) );
  OAI2BB2XL U807 ( .B0(n615), .B1(n607), .A0N(n608), .A1N(\rec[2][0][8] ), .Y(
        n244) );
  OAI2BB2XL U808 ( .B0(n616), .B1(n607), .A0N(n608), .A1N(\rec[2][0][7] ), .Y(
        n243) );
  OAI2BB2XL U809 ( .B0(n617), .B1(n608), .A0N(n608), .A1N(\rec[2][0][6] ), .Y(
        n242) );
  OAI2BB2XL U810 ( .B0(n618), .B1(n607), .A0N(n608), .A1N(\rec[2][0][5] ), .Y(
        n241) );
  OAI2BB2XL U811 ( .B0(n619), .B1(n93), .A0N(n608), .A1N(\rec[2][0][4] ), .Y(
        n240) );
  OAI2BB2XL U812 ( .B0(n620), .B1(n93), .A0N(n608), .A1N(\rec[2][0][3] ), .Y(
        n239) );
  OAI2BB2XL U813 ( .B0(n621), .B1(n93), .A0N(n607), .A1N(\rec[2][0][2] ), .Y(
        n238) );
  OAI2BB2XL U814 ( .B0(n622), .B1(n93), .A0N(n608), .A1N(\rec[2][0][1] ), .Y(
        n237) );
  AOI22X1 U815 ( .A0(\rec[2][1][8] ), .A1(n586), .B0(n589), .B1(\rec[1][1][8] ), .Y(n120) );
  AOI22X1 U816 ( .A0(\rec[2][0][8] ), .A1(n585), .B0(n590), .B1(\rec[1][0][8] ), .Y(n140) );
  AOI22X1 U817 ( .A0(\rec[2][1][9] ), .A1(n586), .B0(n587), .B1(\rec[1][1][9] ), .Y(n122) );
  AOI22X1 U818 ( .A0(\rec[2][0][9] ), .A1(n585), .B0(n587), .B1(\rec[1][0][9] ), .Y(n142) );
  NOR2X2 U819 ( .A(n145), .B(n146), .Y(n19) );
  NAND3X1 U820 ( .A(round[1]), .B(n580), .C(round[2]), .Y(n17) );
  NOR2BX1 U821 ( .AN(n146), .B(n145), .Y(n21) );
  NOR3X1 U822 ( .A(n531), .B(n532), .C(n533), .Y(n61) );
  XOR2X1 U823 ( .A(n660), .B(n596), .Y(n531) );
  XOR2X1 U824 ( .A(n661), .B(n189), .Y(n532) );
  XOR2X1 U825 ( .A(n580), .B(n190), .Y(n533) );
  NOR4X1 U826 ( .A(right_times[0]), .B(n17), .C(n663), .D(n664), .Y(N294) );
  NAND3X1 U827 ( .A(n146), .B(n144), .C(n145), .Y(n18) );
  NOR2X1 U828 ( .A(n580), .B(round[2]), .Y(n535) );
  AOI222XL U829 ( .A0(\rec[5][1][0] ), .A1(n581), .B0(\rec[3][1][0] ), .B1(
        n575), .C0(\rec[4][1][0] ), .C1(n582), .Y(n537) );
  NOR2X1 U830 ( .A(round[2]), .B(round[0]), .Y(n534) );
  AOI222XL U831 ( .A0(\rec[2][1][0] ), .A1(n577), .B0(\rec[0][1][0] ), .B1(
        n519), .C0(\rec[1][1][0] ), .C1(n520), .Y(n536) );
  NAND2X1 U832 ( .A(n537), .B(n536), .Y(N206) );
  AOI222XL U833 ( .A0(\rec[5][1][1] ), .A1(n581), .B0(\rec[3][1][1] ), .B1(
        n575), .C0(\rec[4][1][1] ), .C1(n574), .Y(n539) );
  AOI222XL U834 ( .A0(\rec[2][1][1] ), .A1(n577), .B0(\rec[0][1][1] ), .B1(
        n519), .C0(\rec[1][1][1] ), .C1(n520), .Y(n538) );
  NAND2X1 U835 ( .A(n539), .B(n538), .Y(N205) );
  AOI222XL U836 ( .A0(\rec[5][1][2] ), .A1(n581), .B0(\rec[3][1][2] ), .B1(
        n575), .C0(\rec[4][1][2] ), .C1(n582), .Y(n541) );
  AOI222XL U837 ( .A0(\rec[2][1][2] ), .A1(n577), .B0(\rec[0][1][2] ), .B1(
        n519), .C0(\rec[1][1][2] ), .C1(n520), .Y(n540) );
  NAND2X1 U838 ( .A(n541), .B(n540), .Y(N204) );
  AOI222XL U839 ( .A0(\rec[5][1][3] ), .A1(n581), .B0(\rec[3][1][3] ), .B1(
        n575), .C0(\rec[4][1][3] ), .C1(n574), .Y(n543) );
  AOI222XL U840 ( .A0(\rec[2][1][3] ), .A1(n577), .B0(\rec[0][1][3] ), .B1(
        n519), .C0(\rec[1][1][3] ), .C1(n520), .Y(n542) );
  NAND2X1 U841 ( .A(n543), .B(n542), .Y(N203) );
  AOI222XL U842 ( .A0(\rec[5][1][4] ), .A1(n581), .B0(\rec[3][1][4] ), .B1(
        n575), .C0(\rec[4][1][4] ), .C1(n582), .Y(n545) );
  AOI222XL U843 ( .A0(\rec[2][1][4] ), .A1(n577), .B0(\rec[0][1][4] ), .B1(
        n519), .C0(\rec[1][1][4] ), .C1(n520), .Y(n544) );
  NAND2X1 U844 ( .A(n545), .B(n544), .Y(N202) );
  AOI222XL U845 ( .A0(\rec[5][1][5] ), .A1(n581), .B0(\rec[3][1][5] ), .B1(
        n575), .C0(\rec[4][1][5] ), .C1(n574), .Y(n547) );
  AOI222XL U846 ( .A0(\rec[2][1][5] ), .A1(n577), .B0(\rec[0][1][5] ), .B1(
        n519), .C0(\rec[1][1][5] ), .C1(n520), .Y(n546) );
  NAND2X1 U847 ( .A(n547), .B(n546), .Y(N201) );
  AOI222XL U848 ( .A0(\rec[5][1][6] ), .A1(n581), .B0(\rec[3][1][6] ), .B1(
        n575), .C0(\rec[4][1][6] ), .C1(n582), .Y(n549) );
  AOI222XL U849 ( .A0(\rec[2][1][6] ), .A1(n577), .B0(\rec[0][1][6] ), .B1(
        n519), .C0(\rec[1][1][6] ), .C1(n520), .Y(n548) );
  NAND2X1 U850 ( .A(n549), .B(n548), .Y(N200) );
  AOI222XL U851 ( .A0(\rec[5][1][7] ), .A1(n581), .B0(\rec[3][1][7] ), .B1(
        n575), .C0(\rec[4][1][7] ), .C1(n574), .Y(n551) );
  AOI222XL U852 ( .A0(\rec[2][1][7] ), .A1(n577), .B0(\rec[0][1][7] ), .B1(
        n519), .C0(\rec[1][1][7] ), .C1(n520), .Y(n550) );
  NAND2X1 U853 ( .A(n551), .B(n550), .Y(N199) );
  AOI222XL U854 ( .A0(\rec[5][1][8] ), .A1(n581), .B0(\rec[3][1][8] ), .B1(
        n575), .C0(\rec[4][1][8] ), .C1(n582), .Y(n553) );
  AOI222XL U855 ( .A0(\rec[2][1][8] ), .A1(n577), .B0(\rec[0][1][8] ), .B1(
        n519), .C0(\rec[1][1][8] ), .C1(n520), .Y(n552) );
  NAND2X1 U856 ( .A(n553), .B(n552), .Y(N198) );
  AOI222XL U857 ( .A0(\rec[5][1][9] ), .A1(n581), .B0(\rec[3][1][9] ), .B1(
        n575), .C0(\rec[4][1][9] ), .C1(n574), .Y(n555) );
  AOI222XL U858 ( .A0(\rec[2][1][9] ), .A1(n577), .B0(\rec[0][1][9] ), .B1(
        n519), .C0(\rec[1][1][9] ), .C1(n520), .Y(n554) );
  NAND2X1 U859 ( .A(n555), .B(n554), .Y(N197) );
  AOI222XL U860 ( .A0(\rec[5][0][0] ), .A1(n581), .B0(\rec[3][0][0] ), .B1(
        n575), .C0(\rec[4][0][0] ), .C1(n582), .Y(n557) );
  AOI222XL U861 ( .A0(\rec[2][0][0] ), .A1(n577), .B0(\rec[0][0][0] ), .B1(
        n519), .C0(\rec[1][0][0] ), .C1(n520), .Y(n556) );
  NAND2X1 U862 ( .A(n557), .B(n556), .Y(N174) );
  AOI222XL U863 ( .A0(\rec[5][0][1] ), .A1(n581), .B0(\rec[3][0][1] ), .B1(
        n575), .C0(\rec[4][0][1] ), .C1(n574), .Y(n559) );
  AOI222XL U864 ( .A0(\rec[2][0][1] ), .A1(n577), .B0(\rec[0][0][1] ), .B1(
        n519), .C0(\rec[1][0][1] ), .C1(n520), .Y(n558) );
  NAND2X1 U865 ( .A(n559), .B(n558), .Y(N173) );
  AOI222XL U866 ( .A0(\rec[5][0][2] ), .A1(n581), .B0(\rec[3][0][2] ), .B1(
        n575), .C0(\rec[4][0][2] ), .C1(n582), .Y(n561) );
  AOI222XL U867 ( .A0(\rec[2][0][2] ), .A1(n577), .B0(\rec[0][0][2] ), .B1(
        n519), .C0(\rec[1][0][2] ), .C1(n520), .Y(n560) );
  NAND2X1 U868 ( .A(n561), .B(n560), .Y(N172) );
  AOI222XL U869 ( .A0(\rec[5][0][3] ), .A1(n581), .B0(\rec[3][0][3] ), .B1(
        n575), .C0(\rec[4][0][3] ), .C1(n574), .Y(n563) );
  AOI222XL U870 ( .A0(\rec[2][0][3] ), .A1(n577), .B0(\rec[0][0][3] ), .B1(
        n519), .C0(\rec[1][0][3] ), .C1(n520), .Y(n562) );
  NAND2X1 U871 ( .A(n563), .B(n562), .Y(N171) );
  AOI222XL U872 ( .A0(\rec[5][0][4] ), .A1(n581), .B0(\rec[3][0][4] ), .B1(
        n575), .C0(\rec[4][0][4] ), .C1(n582), .Y(n565) );
  AOI222XL U873 ( .A0(\rec[2][0][4] ), .A1(n577), .B0(\rec[0][0][4] ), .B1(
        n519), .C0(\rec[1][0][4] ), .C1(n520), .Y(n564) );
  NAND2X1 U874 ( .A(n565), .B(n564), .Y(N170) );
  AOI222XL U875 ( .A0(\rec[5][0][5] ), .A1(n581), .B0(\rec[3][0][5] ), .B1(
        n575), .C0(\rec[4][0][5] ), .C1(n574), .Y(n567) );
  AOI222XL U876 ( .A0(\rec[2][0][5] ), .A1(n577), .B0(\rec[0][0][5] ), .B1(
        n519), .C0(\rec[1][0][5] ), .C1(n520), .Y(n566) );
  NAND2X1 U877 ( .A(n567), .B(n566), .Y(N169) );
  AOI222XL U878 ( .A0(\rec[5][0][6] ), .A1(n581), .B0(\rec[3][0][6] ), .B1(
        n575), .C0(\rec[4][0][6] ), .C1(n582), .Y(n569) );
  AOI222XL U879 ( .A0(\rec[2][0][6] ), .A1(n577), .B0(\rec[0][0][6] ), .B1(
        n519), .C0(\rec[1][0][6] ), .C1(n520), .Y(n568) );
  NAND2X1 U880 ( .A(n569), .B(n568), .Y(N168) );
  AOI222XL U881 ( .A0(\rec[5][0][7] ), .A1(n581), .B0(\rec[3][0][7] ), .B1(
        n575), .C0(\rec[4][0][7] ), .C1(n574), .Y(n571) );
  AOI222XL U882 ( .A0(\rec[2][0][7] ), .A1(n577), .B0(\rec[0][0][7] ), .B1(
        n519), .C0(\rec[1][0][7] ), .C1(n520), .Y(n570) );
  NAND2X1 U883 ( .A(n571), .B(n570), .Y(N167) );
  AOI222XL U884 ( .A0(\rec[5][0][8] ), .A1(n581), .B0(\rec[3][0][8] ), .B1(
        n575), .C0(\rec[4][0][8] ), .C1(n582), .Y(n573) );
  AOI222XL U885 ( .A0(\rec[2][0][8] ), .A1(n577), .B0(\rec[0][0][8] ), .B1(
        n519), .C0(\rec[1][0][8] ), .C1(n520), .Y(n572) );
  NAND2X1 U886 ( .A(n573), .B(n572), .Y(N166) );
  AOI222XL U887 ( .A0(\rec[5][0][9] ), .A1(n581), .B0(\rec[3][0][9] ), .B1(
        n575), .C0(\rec[4][0][9] ), .C1(n574), .Y(n579) );
  AOI222XL U888 ( .A0(\rec[2][0][9] ), .A1(n577), .B0(\rec[0][0][9] ), .B1(
        n519), .C0(\rec[1][0][9] ), .C1(n520), .Y(n578) );
  NAND2X1 U889 ( .A(n579), .B(n578), .Y(N165) );
endmodule

