/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Fri Dec  9 15:57:01 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_2 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;
  assign SUM[8] = carry[8];

  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2XL U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
endmodule


module JAM_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [9:1] carry;
  assign SUM[8] = carry[8];

  ADDFHX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  NAND3X1 U1 ( .A(n6), .B(n7), .C(n8), .Y(carry[5]) );
  XOR3X1 U2 ( .A(A[4]), .B(B[4]), .C(carry[4]), .Y(SUM[4]) );
  AND2X2 U3 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2 U4 ( .A(B[7]), .B(A[7]), .Y(n2) );
  CLKXOR2X8 U5 ( .A(carry[7]), .B(n2), .Y(SUM[7]) );
  NAND2X1 U6 ( .A(B[7]), .B(carry[7]), .Y(n3) );
  NAND2X1 U7 ( .A(A[7]), .B(carry[7]), .Y(n4) );
  NAND2X1 U8 ( .A(A[7]), .B(B[7]), .Y(n5) );
  NAND3X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(carry[8]) );
  NAND2X1 U10 ( .A(carry[4]), .B(A[4]), .Y(n6) );
  NAND2X1 U11 ( .A(B[4]), .B(A[4]), .Y(n7) );
  NAND2X1 U12 ( .A(B[4]), .B(carry[4]), .Y(n8) );
  XOR2X1 U13 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7;
  wire   [9:1] carry;
  assign SUM[9] = carry[9];

  ADDFHX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  NAND3X1 U1 ( .A(n2), .B(n3), .C(n4), .Y(carry[3]) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR3X1 U3 ( .A(B[2]), .B(carry[2]), .C(A[2]), .Y(SUM[2]) );
  XOR3X1 U4 ( .A(B[6]), .B(A[6]), .C(carry[6]), .Y(SUM[6]) );
  AND2X2 U5 ( .A(B[0]), .B(A[0]), .Y(n1) );
  NAND2X1 U6 ( .A(A[2]), .B(B[2]), .Y(n2) );
  NAND2X1 U7 ( .A(carry[2]), .B(B[2]), .Y(n3) );
  NAND2X1 U8 ( .A(carry[2]), .B(A[2]), .Y(n4) );
  NAND2X1 U9 ( .A(carry[6]), .B(B[6]), .Y(n5) );
  NAND2XL U10 ( .A(A[6]), .B(B[6]), .Y(n6) );
  NAND2X1 U11 ( .A(A[6]), .B(carry[6]), .Y(n7) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n7), .Y(carry[7]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51,
         N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, n1317, n1318, n1319,
         n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329,
         n1330, n1331, n1332, n1333, n1334, n1335, n1336, \cost_data[0][0][6] ,
         \cost_data[0][0][5] , \cost_data[0][0][4] , \cost_data[0][0][3] ,
         \cost_data[0][0][2] , \cost_data[0][0][1] , \cost_data[0][0][0] ,
         \cost_data[0][1][6] , \cost_data[0][1][5] , \cost_data[0][1][4] ,
         \cost_data[0][1][3] , \cost_data[0][1][2] , \cost_data[0][1][1] ,
         \cost_data[0][1][0] , \cost_data[0][2][6] , \cost_data[0][2][5] ,
         \cost_data[0][2][4] , \cost_data[0][2][3] , \cost_data[0][2][2] ,
         \cost_data[0][2][1] , \cost_data[0][2][0] , \cost_data[0][3][6] ,
         \cost_data[0][3][5] , \cost_data[0][3][4] , \cost_data[0][3][3] ,
         \cost_data[0][3][2] , \cost_data[0][3][1] , \cost_data[0][3][0] ,
         \cost_data[0][4][6] , \cost_data[0][4][5] , \cost_data[0][4][4] ,
         \cost_data[0][4][3] , \cost_data[0][4][2] , \cost_data[0][4][1] ,
         \cost_data[0][4][0] , \cost_data[0][5][6] , \cost_data[0][5][5] ,
         \cost_data[0][5][4] , \cost_data[0][5][3] , \cost_data[0][5][2] ,
         \cost_data[0][5][1] , \cost_data[0][5][0] , \cost_data[0][6][6] ,
         \cost_data[0][6][5] , \cost_data[0][6][4] , \cost_data[0][6][3] ,
         \cost_data[0][6][2] , \cost_data[0][6][1] , \cost_data[0][6][0] ,
         \cost_data[0][7][6] , \cost_data[0][7][5] , \cost_data[0][7][4] ,
         \cost_data[0][7][3] , \cost_data[0][7][2] , \cost_data[0][7][1] ,
         \cost_data[0][7][0] , \cost_data[1][0][6] , \cost_data[1][0][5] ,
         \cost_data[1][0][4] , \cost_data[1][0][3] , \cost_data[1][0][2] ,
         \cost_data[1][0][1] , \cost_data[1][0][0] , \cost_data[1][1][6] ,
         \cost_data[1][1][5] , \cost_data[1][1][4] , \cost_data[1][1][3] ,
         \cost_data[1][1][2] , \cost_data[1][1][1] , \cost_data[1][1][0] ,
         \cost_data[1][2][6] , \cost_data[1][2][5] , \cost_data[1][2][4] ,
         \cost_data[1][2][3] , \cost_data[1][2][2] , \cost_data[1][2][1] ,
         \cost_data[1][2][0] , \cost_data[1][3][6] , \cost_data[1][3][5] ,
         \cost_data[1][3][4] , \cost_data[1][3][3] , \cost_data[1][3][2] ,
         \cost_data[1][3][1] , \cost_data[1][3][0] , \cost_data[1][4][6] ,
         \cost_data[1][4][5] , \cost_data[1][4][4] , \cost_data[1][4][3] ,
         \cost_data[1][4][2] , \cost_data[1][4][1] , \cost_data[1][4][0] ,
         \cost_data[1][5][6] , \cost_data[1][5][5] , \cost_data[1][5][4] ,
         \cost_data[1][5][3] , \cost_data[1][5][2] , \cost_data[1][5][1] ,
         \cost_data[1][5][0] , \cost_data[1][6][6] , \cost_data[1][6][5] ,
         \cost_data[1][6][4] , \cost_data[1][6][3] , \cost_data[1][6][2] ,
         \cost_data[1][6][1] , \cost_data[1][6][0] , \cost_data[1][7][6] ,
         \cost_data[1][7][5] , \cost_data[1][7][4] , \cost_data[1][7][3] ,
         \cost_data[1][7][2] , \cost_data[1][7][1] , \cost_data[1][7][0] ,
         \cost_data[2][0][6] , \cost_data[2][0][5] , \cost_data[2][0][4] ,
         \cost_data[2][0][3] , \cost_data[2][0][2] , \cost_data[2][0][1] ,
         \cost_data[2][0][0] , \cost_data[2][1][6] , \cost_data[2][1][5] ,
         \cost_data[2][1][4] , \cost_data[2][1][3] , \cost_data[2][1][2] ,
         \cost_data[2][1][1] , \cost_data[2][1][0] , \cost_data[2][2][6] ,
         \cost_data[2][2][5] , \cost_data[2][2][4] , \cost_data[2][2][3] ,
         \cost_data[2][2][2] , \cost_data[2][2][1] , \cost_data[2][2][0] ,
         \cost_data[2][3][6] , \cost_data[2][3][5] , \cost_data[2][3][4] ,
         \cost_data[2][3][3] , \cost_data[2][3][2] , \cost_data[2][3][1] ,
         \cost_data[2][3][0] , \cost_data[2][4][6] , \cost_data[2][4][5] ,
         \cost_data[2][4][4] , \cost_data[2][4][3] , \cost_data[2][4][2] ,
         \cost_data[2][4][1] , \cost_data[2][4][0] , \cost_data[2][5][6] ,
         \cost_data[2][5][5] , \cost_data[2][5][4] , \cost_data[2][5][3] ,
         \cost_data[2][5][2] , \cost_data[2][5][1] , \cost_data[2][5][0] ,
         \cost_data[2][6][6] , \cost_data[2][6][5] , \cost_data[2][6][4] ,
         \cost_data[2][6][3] , \cost_data[2][6][2] , \cost_data[2][6][1] ,
         \cost_data[2][6][0] , \cost_data[2][7][6] , \cost_data[2][7][5] ,
         \cost_data[2][7][4] , \cost_data[2][7][3] , \cost_data[2][7][2] ,
         \cost_data[2][7][1] , \cost_data[2][7][0] , \cost_data[3][0][6] ,
         \cost_data[3][0][5] , \cost_data[3][0][4] , \cost_data[3][0][3] ,
         \cost_data[3][0][2] , \cost_data[3][0][1] , \cost_data[3][0][0] ,
         \cost_data[3][1][6] , \cost_data[3][1][5] , \cost_data[3][1][4] ,
         \cost_data[3][1][3] , \cost_data[3][1][2] , \cost_data[3][1][1] ,
         \cost_data[3][1][0] , \cost_data[3][2][6] , \cost_data[3][2][5] ,
         \cost_data[3][2][4] , \cost_data[3][2][3] , \cost_data[3][2][2] ,
         \cost_data[3][2][1] , \cost_data[3][2][0] , \cost_data[3][3][6] ,
         \cost_data[3][3][5] , \cost_data[3][3][4] , \cost_data[3][3][3] ,
         \cost_data[3][3][2] , \cost_data[3][3][1] , \cost_data[3][3][0] ,
         \cost_data[3][4][6] , \cost_data[3][4][5] , \cost_data[3][4][4] ,
         \cost_data[3][4][3] , \cost_data[3][4][2] , \cost_data[3][4][1] ,
         \cost_data[3][4][0] , \cost_data[3][5][6] , \cost_data[3][5][5] ,
         \cost_data[3][5][4] , \cost_data[3][5][3] , \cost_data[3][5][2] ,
         \cost_data[3][5][1] , \cost_data[3][5][0] , \cost_data[3][6][6] ,
         \cost_data[3][6][5] , \cost_data[3][6][4] , \cost_data[3][6][3] ,
         \cost_data[3][6][2] , \cost_data[3][6][1] , \cost_data[3][6][0] ,
         \cost_data[3][7][6] , \cost_data[3][7][5] , \cost_data[3][7][4] ,
         \cost_data[3][7][3] , \cost_data[3][7][2] , \cost_data[3][7][1] ,
         \cost_data[3][7][0] , \cost_data[4][0][6] , \cost_data[4][0][5] ,
         \cost_data[4][0][4] , \cost_data[4][0][3] , \cost_data[4][0][2] ,
         \cost_data[4][0][1] , \cost_data[4][0][0] , \cost_data[4][1][6] ,
         \cost_data[4][1][5] , \cost_data[4][1][4] , \cost_data[4][1][3] ,
         \cost_data[4][1][2] , \cost_data[4][1][1] , \cost_data[4][1][0] ,
         \cost_data[4][2][6] , \cost_data[4][2][5] , \cost_data[4][2][4] ,
         \cost_data[4][2][3] , \cost_data[4][2][2] , \cost_data[4][2][1] ,
         \cost_data[4][2][0] , \cost_data[4][3][6] , \cost_data[4][3][5] ,
         \cost_data[4][3][4] , \cost_data[4][3][3] , \cost_data[4][3][2] ,
         \cost_data[4][3][1] , \cost_data[4][3][0] , \cost_data[4][4][6] ,
         \cost_data[4][4][5] , \cost_data[4][4][4] , \cost_data[4][4][3] ,
         \cost_data[4][4][2] , \cost_data[4][4][1] , \cost_data[4][4][0] ,
         \cost_data[4][5][6] , \cost_data[4][5][5] , \cost_data[4][5][4] ,
         \cost_data[4][5][3] , \cost_data[4][5][2] , \cost_data[4][5][1] ,
         \cost_data[4][5][0] , \cost_data[4][6][6] , \cost_data[4][6][5] ,
         \cost_data[4][6][4] , \cost_data[4][6][3] , \cost_data[4][6][2] ,
         \cost_data[4][6][1] , \cost_data[4][6][0] , \cost_data[4][7][6] ,
         \cost_data[4][7][5] , \cost_data[4][7][4] , \cost_data[4][7][3] ,
         \cost_data[4][7][2] , \cost_data[4][7][1] , \cost_data[4][7][0] ,
         \cost_data[5][0][6] , \cost_data[5][0][5] , \cost_data[5][0][4] ,
         \cost_data[5][0][3] , \cost_data[5][0][2] , \cost_data[5][0][1] ,
         \cost_data[5][0][0] , \cost_data[5][1][6] , \cost_data[5][1][5] ,
         \cost_data[5][1][4] , \cost_data[5][1][3] , \cost_data[5][1][2] ,
         \cost_data[5][1][1] , \cost_data[5][1][0] , \cost_data[5][2][6] ,
         \cost_data[5][2][5] , \cost_data[5][2][4] , \cost_data[5][2][3] ,
         \cost_data[5][2][2] , \cost_data[5][2][1] , \cost_data[5][2][0] ,
         \cost_data[5][3][6] , \cost_data[5][3][5] , \cost_data[5][3][4] ,
         \cost_data[5][3][3] , \cost_data[5][3][2] , \cost_data[5][3][1] ,
         \cost_data[5][3][0] , \cost_data[5][4][6] , \cost_data[5][4][5] ,
         \cost_data[5][4][4] , \cost_data[5][4][3] , \cost_data[5][4][2] ,
         \cost_data[5][4][1] , \cost_data[5][4][0] , \cost_data[5][5][6] ,
         \cost_data[5][5][5] , \cost_data[5][5][4] , \cost_data[5][5][3] ,
         \cost_data[5][5][2] , \cost_data[5][5][1] , \cost_data[5][5][0] ,
         \cost_data[5][6][6] , \cost_data[5][6][5] , \cost_data[5][6][4] ,
         \cost_data[5][6][3] , \cost_data[5][6][2] , \cost_data[5][6][1] ,
         \cost_data[5][6][0] , \cost_data[5][7][6] , \cost_data[5][7][5] ,
         \cost_data[5][7][4] , \cost_data[5][7][3] , \cost_data[5][7][2] ,
         \cost_data[5][7][1] , \cost_data[5][7][0] , \cost_data[6][0][6] ,
         \cost_data[6][0][5] , \cost_data[6][0][4] , \cost_data[6][0][3] ,
         \cost_data[6][0][2] , \cost_data[6][0][1] , \cost_data[6][0][0] ,
         \cost_data[6][1][6] , \cost_data[6][1][5] , \cost_data[6][1][4] ,
         \cost_data[6][1][3] , \cost_data[6][1][2] , \cost_data[6][1][1] ,
         \cost_data[6][1][0] , \cost_data[6][2][6] , \cost_data[6][2][5] ,
         \cost_data[6][2][4] , \cost_data[6][2][3] , \cost_data[6][2][2] ,
         \cost_data[6][2][1] , \cost_data[6][2][0] , \cost_data[6][3][6] ,
         \cost_data[6][3][5] , \cost_data[6][3][4] , \cost_data[6][3][3] ,
         \cost_data[6][3][2] , \cost_data[6][3][1] , \cost_data[6][3][0] ,
         \cost_data[6][4][6] , \cost_data[6][4][5] , \cost_data[6][4][4] ,
         \cost_data[6][4][3] , \cost_data[6][4][2] , \cost_data[6][4][1] ,
         \cost_data[6][4][0] , \cost_data[6][5][6] , \cost_data[6][5][5] ,
         \cost_data[6][5][4] , \cost_data[6][5][3] , \cost_data[6][5][2] ,
         \cost_data[6][5][1] , \cost_data[6][5][0] , \cost_data[6][6][6] ,
         \cost_data[6][6][5] , \cost_data[6][6][4] , \cost_data[6][6][3] ,
         \cost_data[6][6][2] , \cost_data[6][6][1] , \cost_data[6][6][0] ,
         \cost_data[6][7][6] , \cost_data[6][7][5] , \cost_data[6][7][4] ,
         \cost_data[6][7][3] , \cost_data[6][7][2] , \cost_data[6][7][1] ,
         \cost_data[6][7][0] , \cost_data[7][0][6] , \cost_data[7][0][5] ,
         \cost_data[7][0][4] , \cost_data[7][0][3] , \cost_data[7][0][2] ,
         \cost_data[7][0][1] , \cost_data[7][0][0] , \cost_data[7][1][6] ,
         \cost_data[7][1][5] , \cost_data[7][1][4] , \cost_data[7][1][3] ,
         \cost_data[7][1][2] , \cost_data[7][1][1] , \cost_data[7][1][0] ,
         \cost_data[7][2][6] , \cost_data[7][2][5] , \cost_data[7][2][4] ,
         \cost_data[7][2][3] , \cost_data[7][2][2] , \cost_data[7][2][1] ,
         \cost_data[7][2][0] , \cost_data[7][3][6] , \cost_data[7][3][5] ,
         \cost_data[7][3][4] , \cost_data[7][3][3] , \cost_data[7][3][2] ,
         \cost_data[7][3][1] , \cost_data[7][3][0] , \cost_data[7][4][6] ,
         \cost_data[7][4][5] , \cost_data[7][4][4] , \cost_data[7][4][3] ,
         \cost_data[7][4][2] , \cost_data[7][4][1] , \cost_data[7][4][0] ,
         \cost_data[7][5][6] , \cost_data[7][5][5] , \cost_data[7][5][4] ,
         \cost_data[7][5][3] , \cost_data[7][5][2] , \cost_data[7][5][1] ,
         \cost_data[7][5][0] , \cost_data[7][6][6] , \cost_data[7][6][5] ,
         \cost_data[7][6][4] , \cost_data[7][6][3] , \cost_data[7][6][2] ,
         \cost_data[7][6][1] , \cost_data[7][6][0] , \cost_data[7][7][6] ,
         \cost_data[7][7][5] , \cost_data[7][7][4] , \cost_data[7][7][3] ,
         \cost_data[7][7][2] , \cost_data[7][7][1] , \cost_data[7][7][0] , N62,
         N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76,
         N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90,
         N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N502, N503, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n209, n210, n211,
         n214, n215, n216, n217, n218, n220, n223, n224, n225, n226, n229,
         n233, n236, n239, n241, n244, n247, n248, n250, n252, n256, n257,
         n258, n261, n262, n263, n264, n265, n267, n268, n270, n271, n273,
         n274, n275, n276, n278, n280, n283, n284, n286, n288, n291, n293,
         n294, n297, n300, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n317, n322, n323, n324, n325,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n349, n350, n351, n353,
         n354, n356, n357, n358, n359, n360, n361, n363, n365, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n400, n401, n403, n405, n408, n409, n410, n412, n414,
         n416, n417, n418, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n440, n441, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n457, n458, n459, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n507, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n546, n548,
         n549, n550, n551, n552, n553, n554, n555, n557, n558, n559, n560,
         n562, n563, n564, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n767, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, N172, N171,
         N170, N169, N168, N167, N166, N165, N163, N162, N161, N160, N159,
         N158, N157, N156, N155, N152, N151, N150, N149, N148, N147, N146,
         N145, N142, N141, N140, N139, N138, N137, N136, N135, N133, N132,
         N131, N130, N129, N128, N127, N126, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n817, n818, n820, n831, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236,
         n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246,
         n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1305, n1306, n1307,
         n1308, n1309, n1310, n1311, n1312, n1313;
  wire   [9:0] TotalCost;
  wire   [1:0] state;
  wire   [9:1] \add_4_root_add_0_root_add_18_7/carry ;
  wire   [8:1] \add_3_root_add_0_root_add_18_7/carry ;
  wire   [9:1] \add_5_root_add_0_root_add_18_7/carry ;
  wire   [9:1] \add_6_root_add_0_root_add_18_7/carry ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  OAI211X2 U544 ( .A0(N52), .A1(n1273), .B0(n663), .C0(n664), .Y(n403) );
  JAM_DW01_add_2 add_2_root_add_0_root_add_18_7 ( .A({1'b0, 1'b0, N133, N132, 
        N131, N130, N129, N128, N127, N126}), .B({1'b0, 1'b0, N172, N171, N170, 
        N169, N168, N167, N166, N165}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED__0, n1313, n1312, n1311, n1310, n1309, n1308, 
        n1307, n1306, n1305}) );
  JAM_DW01_add_1 add_1_root_add_0_root_add_18_7 ( .A({1'b0, 1'b0, N152, N151, 
        N150, N149, N148, N147, N146, N145}), .B({1'b0, 1'b0, N142, N141, N140, 
        N139, N138, N137, N136, N135}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED__1, N163, N162, N161, N160, N159, N158, N157, 
        N156, N155}) );
  JAM_DW01_add_0 add_0_root_add_0_root_add_18_7 ( .A({1'b0, n1313, n1312, 
        n1311, n1310, n1309, n1308, n1307, n1306, n1305}), .B({1'b0, N163, 
        N162, N161, N160, N159, N158, N157, N156, N155}), .CI(1'b0), .SUM(
        TotalCost) );
  EDFFX1 \cost_data_reg[3][5][6]  ( .D(Cost[6]), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][6] ) );
  EDFFX1 \cost_data_reg[4][4][6]  ( .D(Cost[6]), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][6] ) );
  EDFFX1 \cost_data_reg[4][5][6]  ( .D(Cost[6]), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][6] ) );
  EDFFX1 \cost_data_reg[5][5][6]  ( .D(n1192), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][6] ) );
  EDFFX1 \cost_data_reg[6][5][6]  ( .D(n1191), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][6] ) );
  EDFFX1 \cost_data_reg[3][7][6]  ( .D(Cost[6]), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][6] ) );
  EDFFX1 \cost_data_reg[4][7][6]  ( .D(Cost[6]), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][6] ) );
  EDFFX1 \cost_data_reg[5][7][6]  ( .D(n1191), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][6] ) );
  EDFFX1 \cost_data_reg[6][7][6]  ( .D(n1191), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][6] ) );
  EDFFX1 \cost_data_reg[0][0][6]  ( .D(Cost[6]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][6] ) );
  EDFFX1 \cost_data_reg[0][0][5]  ( .D(Cost[5]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][5] ) );
  EDFFX1 \cost_data_reg[0][1][6]  ( .D(Cost[6]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][6] ) );
  EDFFX1 \cost_data_reg[0][1][5]  ( .D(Cost[5]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][5] ) );
  EDFFX1 \cost_data_reg[1][0][6]  ( .D(n1192), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][6] ) );
  EDFFX1 \cost_data_reg[1][0][5]  ( .D(Cost[5]), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][5] ) );
  EDFFX1 \cost_data_reg[1][1][6]  ( .D(n1191), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][6] ) );
  EDFFX1 \cost_data_reg[1][1][5]  ( .D(Cost[5]), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][5] ) );
  EDFFX1 \cost_data_reg[2][0][6]  ( .D(n1192), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][6] ) );
  EDFFX1 \cost_data_reg[2][0][5]  ( .D(n1190), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][5] ) );
  EDFFX1 \cost_data_reg[2][1][6]  ( .D(n1192), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][6] ) );
  EDFFX1 \cost_data_reg[2][1][5]  ( .D(n1189), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][5] ) );
  EDFFX1 \cost_data_reg[3][0][6]  ( .D(n1192), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][6] ) );
  EDFFX1 \cost_data_reg[3][0][5]  ( .D(n1190), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][5] ) );
  EDFFX1 \cost_data_reg[3][0][4]  ( .D(Cost[4]), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][4] ) );
  EDFFX1 \cost_data_reg[3][1][6]  ( .D(n1192), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][6] ) );
  EDFFX1 \cost_data_reg[3][1][5]  ( .D(n1190), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][5] ) );
  EDFFX1 \cost_data_reg[3][1][4]  ( .D(Cost[4]), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][4] ) );
  EDFFX1 \cost_data_reg[4][0][6]  ( .D(Cost[6]), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][6] ) );
  EDFFX1 \cost_data_reg[4][0][5]  ( .D(n1190), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][5] ) );
  EDFFX1 \cost_data_reg[4][0][4]  ( .D(n1188), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][4] ) );
  EDFFX1 \cost_data_reg[4][1][6]  ( .D(Cost[6]), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][6] ) );
  EDFFX1 \cost_data_reg[4][1][5]  ( .D(n1189), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][5] ) );
  EDFFX1 \cost_data_reg[4][1][4]  ( .D(n1187), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][4] ) );
  EDFFX1 \cost_data_reg[5][0][6]  ( .D(n1192), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][6] ) );
  EDFFX1 \cost_data_reg[5][0][5]  ( .D(n1190), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][5] ) );
  EDFFX1 \cost_data_reg[5][0][4]  ( .D(n1188), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][4] ) );
  EDFFX1 \cost_data_reg[5][1][6]  ( .D(n1192), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][6] ) );
  EDFFX1 \cost_data_reg[5][1][5]  ( .D(n1190), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][5] ) );
  EDFFX1 \cost_data_reg[5][1][4]  ( .D(n1188), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][4] ) );
  EDFFX1 \cost_data_reg[6][0][6]  ( .D(n1191), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][6] ) );
  EDFFX1 \cost_data_reg[6][0][5]  ( .D(n1190), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][5] ) );
  EDFFX1 \cost_data_reg[6][0][4]  ( .D(n1188), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][4] ) );
  EDFFX1 \cost_data_reg[6][1][6]  ( .D(n1191), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][6] ) );
  EDFFX1 \cost_data_reg[6][1][5]  ( .D(n1190), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][5] ) );
  EDFFX1 \cost_data_reg[6][1][4]  ( .D(n1188), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][4] ) );
  EDFFX1 \cost_data_reg[7][0][6]  ( .D(n1191), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][6] ) );
  EDFFX1 \cost_data_reg[7][0][5]  ( .D(n1189), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][5] ) );
  EDFFX1 \cost_data_reg[7][1][6]  ( .D(n1191), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][6] ) );
  EDFFX1 \cost_data_reg[7][1][5]  ( .D(n1189), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][5] ) );
  EDFFX1 \cost_data_reg[0][2][6]  ( .D(Cost[6]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][6] ) );
  EDFFX1 \cost_data_reg[0][2][5]  ( .D(Cost[5]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][5] ) );
  EDFFX1 \cost_data_reg[0][3][6]  ( .D(Cost[6]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][6] ) );
  EDFFX1 \cost_data_reg[0][3][5]  ( .D(Cost[5]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][5] ) );
  EDFFX1 \cost_data_reg[1][2][6]  ( .D(n1192), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][6] ) );
  EDFFX1 \cost_data_reg[1][2][5]  ( .D(Cost[5]), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][5] ) );
  EDFFX1 \cost_data_reg[1][3][6]  ( .D(n1191), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][6] ) );
  EDFFX1 \cost_data_reg[1][3][5]  ( .D(Cost[5]), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][5] ) );
  EDFFX1 \cost_data_reg[2][2][6]  ( .D(n1192), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][6] ) );
  EDFFX1 \cost_data_reg[2][2][5]  ( .D(n1189), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][5] ) );
  EDFFX1 \cost_data_reg[2][3][6]  ( .D(n1192), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][6] ) );
  EDFFX1 \cost_data_reg[2][3][5]  ( .D(n1189), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][5] ) );
  EDFFX1 \cost_data_reg[3][2][6]  ( .D(n1192), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][6] ) );
  EDFFX1 \cost_data_reg[3][2][5]  ( .D(n1190), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][5] ) );
  EDFFX1 \cost_data_reg[3][2][4]  ( .D(Cost[4]), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][4] ) );
  EDFFX1 \cost_data_reg[3][3][6]  ( .D(n1192), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][6] ) );
  EDFFX1 \cost_data_reg[3][3][5]  ( .D(n1189), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][5] ) );
  EDFFX1 \cost_data_reg[3][3][4]  ( .D(Cost[4]), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][4] ) );
  EDFFX1 \cost_data_reg[4][2][6]  ( .D(Cost[6]), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][6] ) );
  EDFFX1 \cost_data_reg[4][2][5]  ( .D(n1190), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][5] ) );
  EDFFX1 \cost_data_reg[4][2][4]  ( .D(n1188), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][4] ) );
  EDFFX1 \cost_data_reg[4][3][6]  ( .D(Cost[6]), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][6] ) );
  EDFFX1 \cost_data_reg[4][3][5]  ( .D(n1189), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][5] ) );
  EDFFX1 \cost_data_reg[4][3][4]  ( .D(n1188), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][4] ) );
  EDFFX1 \cost_data_reg[5][2][6]  ( .D(n1192), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][6] ) );
  EDFFX1 \cost_data_reg[5][2][5]  ( .D(n1190), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][5] ) );
  EDFFX1 \cost_data_reg[5][2][4]  ( .D(n1188), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][4] ) );
  EDFFX1 \cost_data_reg[5][3][6]  ( .D(n1191), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][6] ) );
  EDFFX1 \cost_data_reg[5][3][5]  ( .D(n1190), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][5] ) );
  EDFFX1 \cost_data_reg[5][3][4]  ( .D(n1188), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][4] ) );
  EDFFX1 \cost_data_reg[6][2][6]  ( .D(Cost[6]), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][6] ) );
  EDFFX1 \cost_data_reg[6][2][5]  ( .D(n1190), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][5] ) );
  EDFFX1 \cost_data_reg[6][2][4]  ( .D(n1188), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][4] ) );
  EDFFX1 \cost_data_reg[6][3][6]  ( .D(n1192), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][6] ) );
  EDFFX1 \cost_data_reg[6][3][5]  ( .D(n1190), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][5] ) );
  EDFFX1 \cost_data_reg[6][3][4]  ( .D(n1188), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][4] ) );
  EDFFX1 \cost_data_reg[7][2][6]  ( .D(n1191), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][6] ) );
  EDFFX1 \cost_data_reg[7][2][5]  ( .D(n1189), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][5] ) );
  EDFFX1 \cost_data_reg[7][3][6]  ( .D(n1191), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][6] ) );
  EDFFX1 \cost_data_reg[7][3][5]  ( .D(n1189), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][5] ) );
  EDFFX1 \cost_data_reg[0][4][6]  ( .D(n1192), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][6] ) );
  EDFFX1 \cost_data_reg[0][4][5]  ( .D(Cost[5]), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][5] ) );
  EDFFX1 \cost_data_reg[0][5][6]  ( .D(n1191), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][6] ) );
  EDFFX1 \cost_data_reg[0][5][5]  ( .D(Cost[5]), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][5] ) );
  EDFFX1 \cost_data_reg[0][5][4]  ( .D(n1188), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][4] ) );
  EDFFX1 \cost_data_reg[1][4][6]  ( .D(n1192), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][6] ) );
  EDFFX1 \cost_data_reg[1][4][5]  ( .D(Cost[5]), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][5] ) );
  EDFFX1 \cost_data_reg[1][5][6]  ( .D(n1191), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][6] ) );
  EDFFX1 \cost_data_reg[1][5][5]  ( .D(Cost[5]), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][5] ) );
  EDFFX1 \cost_data_reg[2][4][6]  ( .D(n1192), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][6] ) );
  EDFFX1 \cost_data_reg[2][4][5]  ( .D(Cost[5]), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][5] ) );
  EDFFX1 \cost_data_reg[2][5][6]  ( .D(n1192), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][6] ) );
  EDFFX1 \cost_data_reg[2][5][5]  ( .D(n1190), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][5] ) );
  EDFFX1 \cost_data_reg[2][5][4]  ( .D(Cost[4]), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][4] ) );
  EDFFX1 \cost_data_reg[3][4][6]  ( .D(Cost[6]), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][6] ) );
  EDFFX1 \cost_data_reg[3][4][5]  ( .D(n1190), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][5] ) );
  EDFFX1 \cost_data_reg[3][4][4]  ( .D(n1187), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][4] ) );
  EDFFX1 \cost_data_reg[3][4][3]  ( .D(Cost[3]), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][3] ) );
  EDFFX1 \cost_data_reg[3][5][5]  ( .D(n1189), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][5] ) );
  EDFFX1 \cost_data_reg[3][5][4]  ( .D(n1187), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][4] ) );
  EDFFX1 \cost_data_reg[3][5][3]  ( .D(Cost[3]), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][3] ) );
  EDFFX1 \cost_data_reg[4][4][5]  ( .D(n1190), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][5] ) );
  EDFFX1 \cost_data_reg[4][4][4]  ( .D(n1188), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][4] ) );
  EDFFX1 \cost_data_reg[4][4][3]  ( .D(Cost[3]), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][3] ) );
  EDFFX1 \cost_data_reg[4][5][5]  ( .D(n1189), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][5] ) );
  EDFFX1 \cost_data_reg[4][5][4]  ( .D(n1187), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][4] ) );
  EDFFX1 \cost_data_reg[4][5][3]  ( .D(Cost[3]), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][3] ) );
  EDFFX1 \cost_data_reg[5][4][6]  ( .D(n1191), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][6] ) );
  EDFFX1 \cost_data_reg[5][4][5]  ( .D(n1190), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][5] ) );
  EDFFX1 \cost_data_reg[5][4][4]  ( .D(n1188), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][4] ) );
  EDFFX1 \cost_data_reg[5][4][3]  ( .D(n1186), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][3] ) );
  EDFFX1 \cost_data_reg[5][5][5]  ( .D(n1190), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][5] ) );
  EDFFX1 \cost_data_reg[5][5][4]  ( .D(n1188), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][4] ) );
  EDFFX1 \cost_data_reg[5][5][3]  ( .D(n1185), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][3] ) );
  EDFFX1 \cost_data_reg[6][4][6]  ( .D(n1191), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][6] ) );
  EDFFX1 \cost_data_reg[6][4][5]  ( .D(n1189), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][5] ) );
  EDFFX1 \cost_data_reg[6][4][4]  ( .D(n1187), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][4] ) );
  EDFFX1 \cost_data_reg[6][4][3]  ( .D(n1185), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][3] ) );
  EDFFX1 \cost_data_reg[6][5][5]  ( .D(n1189), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][5] ) );
  EDFFX1 \cost_data_reg[6][5][4]  ( .D(n1187), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][4] ) );
  EDFFX1 \cost_data_reg[6][5][3]  ( .D(n1185), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][3] ) );
  EDFFX1 \cost_data_reg[7][4][6]  ( .D(n1191), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][6] ) );
  EDFFX1 \cost_data_reg[7][4][5]  ( .D(n1189), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][5] ) );
  EDFFX1 \cost_data_reg[7][5][6]  ( .D(n1191), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][6] ) );
  EDFFX1 \cost_data_reg[7][5][5]  ( .D(n1189), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][5] ) );
  EDFFX1 \cost_data_reg[7][5][4]  ( .D(n1187), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][4] ) );
  EDFFX1 \cost_data_reg[0][6][6]  ( .D(n1192), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][6] ) );
  EDFFX1 \cost_data_reg[0][6][5]  ( .D(Cost[5]), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][5] ) );
  EDFFX1 \cost_data_reg[0][7][6]  ( .D(n1191), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][6] ) );
  EDFFX1 \cost_data_reg[0][7][5]  ( .D(Cost[5]), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][5] ) );
  EDFFX1 \cost_data_reg[0][7][4]  ( .D(n1187), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][4] ) );
  EDFFX1 \cost_data_reg[1][6][6]  ( .D(n1192), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][6] ) );
  EDFFX1 \cost_data_reg[1][6][5]  ( .D(Cost[5]), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][5] ) );
  EDFFX1 \cost_data_reg[1][7][6]  ( .D(n1191), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][6] ) );
  EDFFX1 \cost_data_reg[1][7][5]  ( .D(Cost[5]), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][5] ) );
  EDFFX1 \cost_data_reg[2][6][6]  ( .D(n1192), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][6] ) );
  EDFFX1 \cost_data_reg[2][6][5]  ( .D(n1189), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][5] ) );
  EDFFX1 \cost_data_reg[2][7][6]  ( .D(n1192), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][6] ) );
  EDFFX1 \cost_data_reg[2][7][5]  ( .D(Cost[5]), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][5] ) );
  EDFFX1 \cost_data_reg[2][7][4]  ( .D(Cost[4]), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][4] ) );
  EDFFX1 \cost_data_reg[3][6][6]  ( .D(Cost[6]), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][6] ) );
  EDFFX1 \cost_data_reg[3][6][5]  ( .D(n1190), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][5] ) );
  EDFFX1 \cost_data_reg[3][6][4]  ( .D(Cost[4]), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][4] ) );
  EDFFX1 \cost_data_reg[3][6][3]  ( .D(Cost[3]), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][3] ) );
  EDFFX1 \cost_data_reg[3][7][5]  ( .D(n1189), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][5] ) );
  EDFFX1 \cost_data_reg[3][7][4]  ( .D(n1188), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][4] ) );
  EDFFX1 \cost_data_reg[3][7][3]  ( .D(Cost[3]), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][3] ) );
  EDFFX1 \cost_data_reg[4][6][6]  ( .D(Cost[6]), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][6] ) );
  EDFFX1 \cost_data_reg[4][6][5]  ( .D(n1190), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][5] ) );
  EDFFX1 \cost_data_reg[4][6][4]  ( .D(n1187), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][4] ) );
  EDFFX1 \cost_data_reg[4][6][3]  ( .D(Cost[3]), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][3] ) );
  EDFFX1 \cost_data_reg[4][7][5]  ( .D(n1189), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][5] ) );
  EDFFX1 \cost_data_reg[4][7][4]  ( .D(Cost[4]), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][4] ) );
  EDFFX1 \cost_data_reg[4][7][3]  ( .D(Cost[3]), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][3] ) );
  EDFFX1 \cost_data_reg[5][6][6]  ( .D(Cost[6]), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][6] ) );
  EDFFX1 \cost_data_reg[5][6][5]  ( .D(n1190), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][5] ) );
  EDFFX1 \cost_data_reg[5][6][4]  ( .D(n1188), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][4] ) );
  EDFFX1 \cost_data_reg[5][6][3]  ( .D(n1186), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][3] ) );
  EDFFX1 \cost_data_reg[5][7][5]  ( .D(n1190), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][5] ) );
  EDFFX1 \cost_data_reg[5][7][4]  ( .D(n1188), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][4] ) );
  EDFFX1 \cost_data_reg[5][7][3]  ( .D(n1186), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][3] ) );
  EDFFX1 \cost_data_reg[6][6][6]  ( .D(n1191), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][6] ) );
  EDFFX1 \cost_data_reg[6][6][5]  ( .D(n1189), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][5] ) );
  EDFFX1 \cost_data_reg[6][6][4]  ( .D(n1187), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][4] ) );
  EDFFX1 \cost_data_reg[6][6][3]  ( .D(n1185), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][3] ) );
  EDFFX1 \cost_data_reg[6][7][5]  ( .D(n1189), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][5] ) );
  EDFFX1 \cost_data_reg[6][7][4]  ( .D(n1187), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][4] ) );
  EDFFX1 \cost_data_reg[6][7][3]  ( .D(n1185), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][3] ) );
  EDFFX1 \cost_data_reg[7][6][6]  ( .D(n1191), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][6] ) );
  EDFFX1 \cost_data_reg[7][6][5]  ( .D(n1189), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][5] ) );
  EDFFX1 \cost_data_reg[7][7][6]  ( .D(n1191), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][6] ) );
  EDFFX1 \cost_data_reg[7][7][5]  ( .D(n1189), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][5] ) );
  EDFFX1 \cost_data_reg[0][0][4]  ( .D(Cost[4]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][4] ) );
  EDFFX1 \cost_data_reg[0][0][3]  ( .D(Cost[3]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][3] ) );
  EDFFX1 \cost_data_reg[0][0][2]  ( .D(Cost[2]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][2] ) );
  EDFFX1 \cost_data_reg[0][0][0]  ( .D(Cost[0]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][0] ) );
  EDFFX1 \cost_data_reg[0][1][4]  ( .D(Cost[4]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][4] ) );
  EDFFX1 \cost_data_reg[0][1][3]  ( .D(Cost[3]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][3] ) );
  EDFFX1 \cost_data_reg[0][1][2]  ( .D(Cost[2]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][2] ) );
  EDFFX1 \cost_data_reg[0][1][1]  ( .D(Cost[1]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][1] ) );
  EDFFX1 \cost_data_reg[0][1][0]  ( .D(Cost[0]), .E(n754), .CK(CLK), .Q(
        \cost_data[0][1][0] ) );
  EDFFX1 \cost_data_reg[1][0][4]  ( .D(n1188), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][4] ) );
  EDFFX1 \cost_data_reg[1][0][3]  ( .D(n1186), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][3] ) );
  EDFFX1 \cost_data_reg[1][0][2]  ( .D(Cost[2]), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][2] ) );
  EDFFX1 \cost_data_reg[1][1][4]  ( .D(n1187), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][4] ) );
  EDFFX1 \cost_data_reg[1][1][3]  ( .D(n1185), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][3] ) );
  EDFFX1 \cost_data_reg[1][1][2]  ( .D(Cost[2]), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][2] ) );
  EDFFX1 \cost_data_reg[1][1][1]  ( .D(Cost[1]), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][1] ) );
  EDFFX1 \cost_data_reg[1][1][0]  ( .D(Cost[0]), .E(n746), .CK(CLK), .Q(
        \cost_data[1][1][0] ) );
  EDFFX1 \cost_data_reg[2][0][4]  ( .D(Cost[4]), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][4] ) );
  EDFFX1 \cost_data_reg[2][0][3]  ( .D(n1186), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][3] ) );
  EDFFX1 \cost_data_reg[2][0][2]  ( .D(n1184), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][2] ) );
  EDFFX1 \cost_data_reg[2][1][4]  ( .D(Cost[4]), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][4] ) );
  EDFFX1 \cost_data_reg[2][1][3]  ( .D(n1186), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][3] ) );
  EDFFX1 \cost_data_reg[2][1][2]  ( .D(n1183), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][2] ) );
  EDFFX1 \cost_data_reg[2][1][1]  ( .D(n1182), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][1] ) );
  EDFFX1 \cost_data_reg[2][1][0]  ( .D(n1180), .E(n738), .CK(CLK), .Q(
        \cost_data[2][1][0] ) );
  EDFFX1 \cost_data_reg[3][0][3]  ( .D(n1186), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][3] ) );
  EDFFX1 \cost_data_reg[3][0][2]  ( .D(n1184), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][2] ) );
  EDFFX1 \cost_data_reg[3][0][1]  ( .D(n1181), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][1] ) );
  EDFFX1 \cost_data_reg[3][1][3]  ( .D(n1186), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][3] ) );
  EDFFX1 \cost_data_reg[3][1][2]  ( .D(n1184), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][2] ) );
  EDFFX1 \cost_data_reg[3][1][1]  ( .D(n1182), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][1] ) );
  EDFFX1 \cost_data_reg[3][1][0]  ( .D(n1179), .E(n730), .CK(CLK), .Q(
        \cost_data[3][1][0] ) );
  EDFFX1 \cost_data_reg[4][0][3]  ( .D(Cost[3]), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][3] ) );
  EDFFX1 \cost_data_reg[4][0][2]  ( .D(n1184), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][2] ) );
  EDFFX1 \cost_data_reg[4][0][1]  ( .D(n1182), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][1] ) );
  EDFFX1 \cost_data_reg[4][1][3]  ( .D(Cost[3]), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][3] ) );
  EDFFX1 \cost_data_reg[4][1][2]  ( .D(n1183), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][2] ) );
  EDFFX1 \cost_data_reg[4][1][1]  ( .D(n1181), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][1] ) );
  EDFFX1 \cost_data_reg[4][1][0]  ( .D(n1180), .E(n722), .CK(CLK), .Q(
        \cost_data[4][1][0] ) );
  EDFFX1 \cost_data_reg[5][0][3]  ( .D(n1185), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][3] ) );
  EDFFX1 \cost_data_reg[5][0][2]  ( .D(n1184), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][2] ) );
  EDFFX1 \cost_data_reg[5][0][1]  ( .D(n1182), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][1] ) );
  EDFFX1 \cost_data_reg[5][1][3]  ( .D(n1185), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][3] ) );
  EDFFX1 \cost_data_reg[5][1][2]  ( .D(n1184), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][2] ) );
  EDFFX1 \cost_data_reg[5][1][1]  ( .D(n1182), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][1] ) );
  EDFFX1 \cost_data_reg[5][1][0]  ( .D(n1180), .E(n714), .CK(CLK), .Q(
        \cost_data[5][1][0] ) );
  EDFFX1 \cost_data_reg[6][0][3]  ( .D(n1186), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][3] ) );
  EDFFX1 \cost_data_reg[6][0][2]  ( .D(n1184), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][2] ) );
  EDFFX1 \cost_data_reg[6][0][1]  ( .D(n1182), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][1] ) );
  EDFFX1 \cost_data_reg[6][0][0]  ( .D(n1180), .E(n707), .CK(CLK), .Q(
        \cost_data[6][0][0] ) );
  EDFFX1 \cost_data_reg[6][1][3]  ( .D(n1185), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][3] ) );
  EDFFX1 \cost_data_reg[6][1][2]  ( .D(n1184), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][2] ) );
  EDFFX1 \cost_data_reg[6][1][1]  ( .D(n1182), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][1] ) );
  EDFFX1 \cost_data_reg[6][1][0]  ( .D(n1180), .E(n706), .CK(CLK), .Q(
        \cost_data[6][1][0] ) );
  EDFFX1 \cost_data_reg[7][0][4]  ( .D(n1187), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][4] ) );
  EDFFX1 \cost_data_reg[7][0][3]  ( .D(n1185), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][3] ) );
  EDFFX1 \cost_data_reg[7][0][2]  ( .D(n1183), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][2] ) );
  EDFFX1 \cost_data_reg[7][1][4]  ( .D(n1187), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][4] ) );
  EDFFX1 \cost_data_reg[7][1][3]  ( .D(n1185), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][3] ) );
  EDFFX1 \cost_data_reg[7][1][2]  ( .D(n1183), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][2] ) );
  EDFFX1 \cost_data_reg[7][1][1]  ( .D(n1181), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][1] ) );
  EDFFX1 \cost_data_reg[7][1][0]  ( .D(n1179), .E(n698), .CK(CLK), .Q(
        \cost_data[7][1][0] ) );
  EDFFX1 \cost_data_reg[0][2][4]  ( .D(Cost[4]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][4] ) );
  EDFFX1 \cost_data_reg[0][2][3]  ( .D(Cost[3]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][3] ) );
  EDFFX1 \cost_data_reg[0][2][2]  ( .D(Cost[2]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][2] ) );
  EDFFX1 \cost_data_reg[0][2][1]  ( .D(Cost[1]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][1] ) );
  EDFFX1 \cost_data_reg[0][2][0]  ( .D(Cost[0]), .E(n753), .CK(CLK), .Q(
        \cost_data[0][2][0] ) );
  EDFFX1 \cost_data_reg[0][3][4]  ( .D(Cost[4]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][4] ) );
  EDFFX1 \cost_data_reg[0][3][3]  ( .D(Cost[3]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][3] ) );
  EDFFX1 \cost_data_reg[0][3][2]  ( .D(Cost[2]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][2] ) );
  EDFFX1 \cost_data_reg[0][3][1]  ( .D(Cost[1]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][1] ) );
  EDFFX1 \cost_data_reg[0][3][0]  ( .D(Cost[0]), .E(n752), .CK(CLK), .Q(
        \cost_data[0][3][0] ) );
  EDFFX1 \cost_data_reg[1][2][4]  ( .D(n1188), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][4] ) );
  EDFFX1 \cost_data_reg[1][2][3]  ( .D(n1186), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][3] ) );
  EDFFX1 \cost_data_reg[1][2][2]  ( .D(Cost[2]), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][2] ) );
  EDFFX1 \cost_data_reg[1][3][4]  ( .D(n1187), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][4] ) );
  EDFFX1 \cost_data_reg[1][3][3]  ( .D(n1185), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][3] ) );
  EDFFX1 \cost_data_reg[1][3][2]  ( .D(Cost[2]), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][2] ) );
  EDFFX1 \cost_data_reg[1][3][1]  ( .D(Cost[1]), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][1] ) );
  EDFFX1 \cost_data_reg[1][3][0]  ( .D(Cost[0]), .E(n744), .CK(CLK), .Q(
        \cost_data[1][3][0] ) );
  EDFFX1 \cost_data_reg[2][2][4]  ( .D(Cost[4]), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][4] ) );
  EDFFX1 \cost_data_reg[2][2][3]  ( .D(n1186), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][3] ) );
  EDFFX1 \cost_data_reg[2][2][2]  ( .D(n1183), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][2] ) );
  EDFFX1 \cost_data_reg[2][2][0]  ( .D(n1180), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][0] ) );
  EDFFX1 \cost_data_reg[2][3][4]  ( .D(Cost[4]), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][4] ) );
  EDFFX1 \cost_data_reg[2][3][3]  ( .D(n1186), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][3] ) );
  EDFFX1 \cost_data_reg[2][3][2]  ( .D(n1183), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][2] ) );
  EDFFX1 \cost_data_reg[2][3][1]  ( .D(n1182), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][1] ) );
  EDFFX1 \cost_data_reg[2][3][0]  ( .D(n1180), .E(n736), .CK(CLK), .Q(
        \cost_data[2][3][0] ) );
  EDFFX1 \cost_data_reg[3][2][3]  ( .D(n1186), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][3] ) );
  EDFFX1 \cost_data_reg[3][2][2]  ( .D(n1184), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][2] ) );
  EDFFX1 \cost_data_reg[3][2][1]  ( .D(n1181), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][1] ) );
  EDFFX1 \cost_data_reg[3][3][3]  ( .D(n1186), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][3] ) );
  EDFFX1 \cost_data_reg[3][3][2]  ( .D(n1183), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][2] ) );
  EDFFX1 \cost_data_reg[3][3][1]  ( .D(n1181), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][1] ) );
  EDFFX1 \cost_data_reg[3][3][0]  ( .D(n1179), .E(n728), .CK(CLK), .Q(
        \cost_data[3][3][0] ) );
  EDFFX1 \cost_data_reg[4][2][3]  ( .D(Cost[3]), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][3] ) );
  EDFFX1 \cost_data_reg[4][2][2]  ( .D(n1184), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][2] ) );
  EDFFX1 \cost_data_reg[4][2][1]  ( .D(n1182), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][1] ) );
  EDFFX1 \cost_data_reg[4][3][3]  ( .D(Cost[3]), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][3] ) );
  EDFFX1 \cost_data_reg[4][3][2]  ( .D(n1183), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][2] ) );
  EDFFX1 \cost_data_reg[4][3][1]  ( .D(n1181), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][1] ) );
  EDFFX1 \cost_data_reg[4][3][0]  ( .D(n1179), .E(n720), .CK(CLK), .Q(
        \cost_data[4][3][0] ) );
  EDFFX1 \cost_data_reg[5][2][3]  ( .D(Cost[3]), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][3] ) );
  EDFFX1 \cost_data_reg[5][2][2]  ( .D(n1184), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][2] ) );
  EDFFX1 \cost_data_reg[5][2][1]  ( .D(n1182), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][1] ) );
  EDFFX1 \cost_data_reg[5][3][3]  ( .D(n1186), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][3] ) );
  EDFFX1 \cost_data_reg[5][3][2]  ( .D(n1184), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][2] ) );
  EDFFX1 \cost_data_reg[5][3][1]  ( .D(n1182), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][1] ) );
  EDFFX1 \cost_data_reg[5][3][0]  ( .D(n1180), .E(n712), .CK(CLK), .Q(
        \cost_data[5][3][0] ) );
  EDFFX1 \cost_data_reg[6][2][3]  ( .D(n1185), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][3] ) );
  EDFFX1 \cost_data_reg[6][2][2]  ( .D(n1184), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][2] ) );
  EDFFX1 \cost_data_reg[6][2][1]  ( .D(n1182), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][1] ) );
  EDFFX1 \cost_data_reg[6][2][0]  ( .D(n1180), .E(n705), .CK(CLK), .Q(
        \cost_data[6][2][0] ) );
  EDFFX1 \cost_data_reg[6][3][3]  ( .D(Cost[3]), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][3] ) );
  EDFFX1 \cost_data_reg[6][3][2]  ( .D(n1184), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][2] ) );
  EDFFX1 \cost_data_reg[6][3][1]  ( .D(n1182), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][1] ) );
  EDFFX1 \cost_data_reg[6][3][0]  ( .D(n1180), .E(n704), .CK(CLK), .Q(
        \cost_data[6][3][0] ) );
  EDFFX1 \cost_data_reg[7][2][4]  ( .D(n1187), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][4] ) );
  EDFFX1 \cost_data_reg[7][2][3]  ( .D(n1185), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][3] ) );
  EDFFX1 \cost_data_reg[7][2][2]  ( .D(n1183), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][2] ) );
  EDFFX1 \cost_data_reg[7][2][0]  ( .D(n1179), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][0] ) );
  EDFFX1 \cost_data_reg[7][3][4]  ( .D(n1187), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][4] ) );
  EDFFX1 \cost_data_reg[7][3][3]  ( .D(n1185), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][3] ) );
  EDFFX1 \cost_data_reg[7][3][2]  ( .D(n1183), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][2] ) );
  EDFFX1 \cost_data_reg[7][3][1]  ( .D(n1181), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][1] ) );
  EDFFX1 \cost_data_reg[7][3][0]  ( .D(n1179), .E(n696), .CK(CLK), .Q(
        \cost_data[7][3][0] ) );
  EDFFX1 \cost_data_reg[0][4][4]  ( .D(n1188), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][4] ) );
  EDFFX1 \cost_data_reg[0][4][3]  ( .D(n1186), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][3] ) );
  EDFFX1 \cost_data_reg[0][4][2]  ( .D(Cost[2]), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][2] ) );
  EDFFX1 \cost_data_reg[0][4][1]  ( .D(Cost[1]), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][1] ) );
  EDFFX1 \cost_data_reg[0][4][0]  ( .D(Cost[0]), .E(n751), .CK(CLK), .Q(
        \cost_data[0][4][0] ) );
  EDFFX1 \cost_data_reg[0][5][3]  ( .D(n1185), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][3] ) );
  EDFFX1 \cost_data_reg[0][5][2]  ( .D(Cost[2]), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][2] ) );
  EDFFX1 \cost_data_reg[0][5][1]  ( .D(Cost[1]), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][1] ) );
  EDFFX1 \cost_data_reg[0][5][0]  ( .D(Cost[0]), .E(n750), .CK(CLK), .Q(
        \cost_data[0][5][0] ) );
  EDFFX1 \cost_data_reg[1][4][4]  ( .D(n1187), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][4] ) );
  EDFFX1 \cost_data_reg[1][4][3]  ( .D(n1186), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][3] ) );
  EDFFX1 \cost_data_reg[1][4][2]  ( .D(Cost[2]), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][2] ) );
  EDFFX1 \cost_data_reg[1][4][1]  ( .D(Cost[1]), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][1] ) );
  EDFFX1 \cost_data_reg[1][4][0]  ( .D(Cost[0]), .E(n743), .CK(CLK), .Q(
        \cost_data[1][4][0] ) );
  EDFFX1 \cost_data_reg[1][5][4]  ( .D(n1188), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][4] ) );
  EDFFX1 \cost_data_reg[1][5][3]  ( .D(n1185), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][3] ) );
  EDFFX1 \cost_data_reg[1][5][2]  ( .D(Cost[2]), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][2] ) );
  EDFFX1 \cost_data_reg[1][5][1]  ( .D(Cost[1]), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][1] ) );
  EDFFX1 \cost_data_reg[1][5][0]  ( .D(Cost[0]), .E(n742), .CK(CLK), .Q(
        \cost_data[1][5][0] ) );
  EDFFX1 \cost_data_reg[2][4][4]  ( .D(Cost[4]), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][4] ) );
  EDFFX1 \cost_data_reg[2][4][3]  ( .D(n1186), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][3] ) );
  EDFFX1 \cost_data_reg[2][4][2]  ( .D(Cost[2]), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][2] ) );
  EDFFX1 \cost_data_reg[2][4][1]  ( .D(n1182), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][1] ) );
  EDFFX1 \cost_data_reg[2][4][0]  ( .D(n1179), .E(n735), .CK(CLK), .Q(
        \cost_data[2][4][0] ) );
  EDFFX1 \cost_data_reg[2][5][3]  ( .D(n1186), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][3] ) );
  EDFFX1 \cost_data_reg[2][5][2]  ( .D(n1184), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][2] ) );
  EDFFX1 \cost_data_reg[2][5][1]  ( .D(n1181), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][1] ) );
  EDFFX1 \cost_data_reg[2][5][0]  ( .D(n1180), .E(n734), .CK(CLK), .Q(
        \cost_data[2][5][0] ) );
  EDFFX1 \cost_data_reg[3][4][2]  ( .D(n1184), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][2] ) );
  EDFFX1 \cost_data_reg[3][4][1]  ( .D(n1182), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][1] ) );
  EDFFX1 \cost_data_reg[3][4][0]  ( .D(n1180), .E(n727), .CK(CLK), .Q(
        \cost_data[3][4][0] ) );
  EDFFX1 \cost_data_reg[3][5][2]  ( .D(n1183), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][2] ) );
  EDFFX1 \cost_data_reg[3][5][1]  ( .D(n1181), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][1] ) );
  EDFFX1 \cost_data_reg[3][5][0]  ( .D(n1179), .E(n726), .CK(CLK), .Q(
        \cost_data[3][5][0] ) );
  EDFFX1 \cost_data_reg[4][4][2]  ( .D(n1184), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][2] ) );
  EDFFX1 \cost_data_reg[4][4][1]  ( .D(n1182), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][1] ) );
  EDFFX1 \cost_data_reg[4][4][0]  ( .D(n1180), .E(n719), .CK(CLK), .Q(
        \cost_data[4][4][0] ) );
  EDFFX1 \cost_data_reg[4][5][2]  ( .D(n1183), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][2] ) );
  EDFFX1 \cost_data_reg[4][5][1]  ( .D(n1181), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][1] ) );
  EDFFX1 \cost_data_reg[4][5][0]  ( .D(n1179), .E(n718), .CK(CLK), .Q(
        \cost_data[4][5][0] ) );
  EDFFX1 \cost_data_reg[5][4][2]  ( .D(n1184), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][2] ) );
  EDFFX1 \cost_data_reg[5][4][1]  ( .D(n1182), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][1] ) );
  EDFFX1 \cost_data_reg[5][4][0]  ( .D(n1180), .E(n711), .CK(CLK), .Q(
        \cost_data[5][4][0] ) );
  EDFFX1 \cost_data_reg[5][5][2]  ( .D(n1184), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][2] ) );
  EDFFX1 \cost_data_reg[5][5][1]  ( .D(n1182), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][1] ) );
  EDFFX1 \cost_data_reg[5][5][0]  ( .D(n1180), .E(n710), .CK(CLK), .Q(
        \cost_data[5][5][0] ) );
  EDFFX1 \cost_data_reg[6][4][2]  ( .D(n1183), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][2] ) );
  EDFFX1 \cost_data_reg[6][4][1]  ( .D(n1181), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][1] ) );
  EDFFX1 \cost_data_reg[6][4][0]  ( .D(n1179), .E(n703), .CK(CLK), .Q(
        \cost_data[6][4][0] ) );
  EDFFX1 \cost_data_reg[6][5][2]  ( .D(n1183), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][2] ) );
  EDFFX1 \cost_data_reg[6][5][1]  ( .D(n1181), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][1] ) );
  EDFFX1 \cost_data_reg[6][5][0]  ( .D(n1179), .E(n702), .CK(CLK), .Q(
        \cost_data[6][5][0] ) );
  EDFFX1 \cost_data_reg[7][4][4]  ( .D(n1187), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][4] ) );
  EDFFX1 \cost_data_reg[7][4][3]  ( .D(n1185), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][3] ) );
  EDFFX1 \cost_data_reg[7][4][2]  ( .D(n1183), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][2] ) );
  EDFFX1 \cost_data_reg[7][4][1]  ( .D(n1181), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][1] ) );
  EDFFX1 \cost_data_reg[7][4][0]  ( .D(n1179), .E(n695), .CK(CLK), .Q(
        \cost_data[7][4][0] ) );
  EDFFX1 \cost_data_reg[7][5][3]  ( .D(n1185), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][3] ) );
  EDFFX1 \cost_data_reg[7][5][2]  ( .D(n1183), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][2] ) );
  EDFFX1 \cost_data_reg[7][5][1]  ( .D(n1181), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][1] ) );
  EDFFX1 \cost_data_reg[7][5][0]  ( .D(n1179), .E(n694), .CK(CLK), .Q(
        \cost_data[7][5][0] ) );
  EDFFX1 \cost_data_reg[0][6][4]  ( .D(n1187), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][4] ) );
  EDFFX1 \cost_data_reg[0][6][3]  ( .D(n1186), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][3] ) );
  EDFFX1 \cost_data_reg[0][6][2]  ( .D(Cost[2]), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][2] ) );
  EDFFX1 \cost_data_reg[0][6][1]  ( .D(Cost[1]), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][1] ) );
  EDFFX1 \cost_data_reg[0][6][0]  ( .D(Cost[0]), .E(n749), .CK(CLK), .Q(
        \cost_data[0][6][0] ) );
  EDFFX1 \cost_data_reg[0][7][3]  ( .D(n1185), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][3] ) );
  EDFFX1 \cost_data_reg[0][7][2]  ( .D(Cost[2]), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][2] ) );
  EDFFX1 \cost_data_reg[0][7][1]  ( .D(Cost[1]), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][1] ) );
  EDFFX1 \cost_data_reg[0][7][0]  ( .D(Cost[0]), .E(n748), .CK(CLK), .Q(
        \cost_data[0][7][0] ) );
  EDFFX1 \cost_data_reg[1][6][4]  ( .D(n1188), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][4] ) );
  EDFFX1 \cost_data_reg[1][6][3]  ( .D(n1186), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][3] ) );
  EDFFX1 \cost_data_reg[1][6][2]  ( .D(Cost[2]), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][2] ) );
  EDFFX1 \cost_data_reg[1][6][1]  ( .D(Cost[1]), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][1] ) );
  EDFFX1 \cost_data_reg[1][6][0]  ( .D(Cost[0]), .E(n741), .CK(CLK), .Q(
        \cost_data[1][6][0] ) );
  EDFFX1 \cost_data_reg[1][7][4]  ( .D(n1187), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][4] ) );
  EDFFX1 \cost_data_reg[1][7][3]  ( .D(n1185), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][3] ) );
  EDFFX1 \cost_data_reg[1][7][2]  ( .D(Cost[2]), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][2] ) );
  EDFFX1 \cost_data_reg[1][7][1]  ( .D(Cost[1]), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][1] ) );
  EDFFX1 \cost_data_reg[1][7][0]  ( .D(Cost[0]), .E(n740), .CK(CLK), .Q(
        \cost_data[1][7][0] ) );
  EDFFX1 \cost_data_reg[2][6][4]  ( .D(Cost[4]), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][4] ) );
  EDFFX1 \cost_data_reg[2][6][3]  ( .D(n1186), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][3] ) );
  EDFFX1 \cost_data_reg[2][6][2]  ( .D(n1183), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][2] ) );
  EDFFX1 \cost_data_reg[2][6][1]  ( .D(Cost[1]), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][1] ) );
  EDFFX1 \cost_data_reg[2][6][0]  ( .D(n1179), .E(n733), .CK(CLK), .Q(
        \cost_data[2][6][0] ) );
  EDFFX1 \cost_data_reg[2][7][3]  ( .D(n1186), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][3] ) );
  EDFFX1 \cost_data_reg[2][7][2]  ( .D(Cost[2]), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][2] ) );
  EDFFX1 \cost_data_reg[2][7][1]  ( .D(n1182), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][1] ) );
  EDFFX1 \cost_data_reg[2][7][0]  ( .D(Cost[0]), .E(n732), .CK(CLK), .Q(
        \cost_data[2][7][0] ) );
  EDFFX1 \cost_data_reg[3][6][2]  ( .D(n1184), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][2] ) );
  EDFFX1 \cost_data_reg[3][6][1]  ( .D(n1182), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][1] ) );
  EDFFX1 \cost_data_reg[3][6][0]  ( .D(n1180), .E(n725), .CK(CLK), .Q(
        \cost_data[3][6][0] ) );
  EDFFX1 \cost_data_reg[3][7][2]  ( .D(n1183), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][2] ) );
  EDFFX1 \cost_data_reg[3][7][1]  ( .D(n1181), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][1] ) );
  EDFFX1 \cost_data_reg[3][7][0]  ( .D(n1179), .E(n724), .CK(CLK), .Q(
        \cost_data[3][7][0] ) );
  EDFFX1 \cost_data_reg[4][6][2]  ( .D(n1184), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][2] ) );
  EDFFX1 \cost_data_reg[4][6][1]  ( .D(n1182), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][1] ) );
  EDFFX1 \cost_data_reg[4][6][0]  ( .D(n1180), .E(n717), .CK(CLK), .Q(
        \cost_data[4][6][0] ) );
  EDFFX1 \cost_data_reg[4][7][2]  ( .D(n1183), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][2] ) );
  EDFFX1 \cost_data_reg[4][7][1]  ( .D(n1181), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][1] ) );
  EDFFX1 \cost_data_reg[4][7][0]  ( .D(n1179), .E(n716), .CK(CLK), .Q(
        \cost_data[4][7][0] ) );
  EDFFX1 \cost_data_reg[5][6][2]  ( .D(n1184), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][2] ) );
  EDFFX1 \cost_data_reg[5][6][1]  ( .D(n1182), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][1] ) );
  EDFFX1 \cost_data_reg[5][6][0]  ( .D(n1180), .E(n709), .CK(CLK), .Q(
        \cost_data[5][6][0] ) );
  EDFFX1 \cost_data_reg[5][7][2]  ( .D(n1184), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][2] ) );
  EDFFX1 \cost_data_reg[5][7][1]  ( .D(n1182), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][1] ) );
  EDFFX1 \cost_data_reg[5][7][0]  ( .D(n1180), .E(n708), .CK(CLK), .Q(
        \cost_data[5][7][0] ) );
  EDFFX1 \cost_data_reg[6][6][2]  ( .D(n1183), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][2] ) );
  EDFFX1 \cost_data_reg[6][6][1]  ( .D(n1181), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][1] ) );
  EDFFX1 \cost_data_reg[6][6][0]  ( .D(n1179), .E(n701), .CK(CLK), .Q(
        \cost_data[6][6][0] ) );
  EDFFX1 \cost_data_reg[6][7][2]  ( .D(n1183), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][2] ) );
  EDFFX1 \cost_data_reg[6][7][1]  ( .D(n1181), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][1] ) );
  EDFFX1 \cost_data_reg[6][7][0]  ( .D(n1179), .E(n700), .CK(CLK), .Q(
        \cost_data[6][7][0] ) );
  EDFFX1 \cost_data_reg[7][6][4]  ( .D(n1187), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][4] ) );
  EDFFX1 \cost_data_reg[7][6][3]  ( .D(n1185), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][3] ) );
  EDFFX1 \cost_data_reg[7][6][2]  ( .D(n1183), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][2] ) );
  EDFFX1 \cost_data_reg[7][6][1]  ( .D(n1181), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][1] ) );
  EDFFX1 \cost_data_reg[7][6][0]  ( .D(n1179), .E(n693), .CK(CLK), .Q(
        \cost_data[7][6][0] ) );
  EDFFX1 \cost_data_reg[7][7][4]  ( .D(n1187), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][4] ) );
  EDFFX1 \cost_data_reg[7][7][3]  ( .D(n1185), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][3] ) );
  EDFFX1 \cost_data_reg[7][7][2]  ( .D(n1183), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][2] ) );
  EDFFX1 \cost_data_reg[7][7][1]  ( .D(n1181), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][1] ) );
  EDFFX1 \cost_data_reg[7][7][0]  ( .D(n1179), .E(n692), .CK(CLK), .Q(
        \cost_data[7][7][0] ) );
  EDFFX1 \cost_data_reg[0][0][1]  ( .D(Cost[1]), .E(n755), .CK(CLK), .Q(
        \cost_data[0][0][1] ) );
  EDFFX1 \cost_data_reg[1][0][1]  ( .D(Cost[1]), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][1] ) );
  EDFFX1 \cost_data_reg[1][0][0]  ( .D(Cost[0]), .E(n747), .CK(CLK), .Q(
        \cost_data[1][0][0] ) );
  EDFFX1 \cost_data_reg[2][0][1]  ( .D(n1181), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][1] ) );
  EDFFX1 \cost_data_reg[2][0][0]  ( .D(n1180), .E(n739), .CK(CLK), .Q(
        \cost_data[2][0][0] ) );
  EDFFX1 \cost_data_reg[3][0][0]  ( .D(n1179), .E(n731), .CK(CLK), .Q(
        \cost_data[3][0][0] ) );
  EDFFX1 \cost_data_reg[4][0][0]  ( .D(n1180), .E(n723), .CK(CLK), .Q(
        \cost_data[4][0][0] ) );
  EDFFX1 \cost_data_reg[5][0][0]  ( .D(n1180), .E(n715), .CK(CLK), .Q(
        \cost_data[5][0][0] ) );
  EDFFX1 \cost_data_reg[7][0][1]  ( .D(n1181), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][1] ) );
  EDFFX1 \cost_data_reg[7][0][0]  ( .D(n1179), .E(n699), .CK(CLK), .Q(
        \cost_data[7][0][0] ) );
  EDFFX1 \cost_data_reg[1][2][1]  ( .D(Cost[1]), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][1] ) );
  EDFFX1 \cost_data_reg[1][2][0]  ( .D(Cost[0]), .E(n745), .CK(CLK), .Q(
        \cost_data[1][2][0] ) );
  EDFFX1 \cost_data_reg[2][2][1]  ( .D(Cost[1]), .E(n737), .CK(CLK), .Q(
        \cost_data[2][2][1] ) );
  EDFFX1 \cost_data_reg[3][2][0]  ( .D(Cost[0]), .E(n729), .CK(CLK), .Q(
        \cost_data[3][2][0] ) );
  EDFFX1 \cost_data_reg[4][2][0]  ( .D(n1179), .E(n721), .CK(CLK), .Q(
        \cost_data[4][2][0] ) );
  EDFFX1 \cost_data_reg[5][2][0]  ( .D(n1180), .E(n713), .CK(CLK), .Q(
        \cost_data[5][2][0] ) );
  EDFFX1 \cost_data_reg[7][2][1]  ( .D(n1181), .E(n697), .CK(CLK), .Q(
        \cost_data[7][2][1] ) );
  DFFQX4 \job_reg[1][2]  ( .D(n777), .CK(CLK), .Q(N43) );
  DFFQX4 \job_reg[1][0]  ( .D(n775), .CK(CLK), .Q(N41) );
  DFFQX4 \job_reg[5][0]  ( .D(n791), .CK(CLK), .Q(N53) );
  DFFHQX4 \job_reg[2][1]  ( .D(n780), .CK(CLK), .Q(N45) );
  DFFHQX8 \job_reg[5][1]  ( .D(n789), .CK(CLK), .Q(N54) );
  DFFQX2 \job_reg[3][0]  ( .D(n783), .CK(CLK), .Q(N47) );
  DFFQX2 \job_reg[7][0]  ( .D(n804), .CK(CLK), .Q(N59) );
  DFFQX2 \J_reg[0]  ( .D(n798), .CK(CLK), .Q(n1322) );
  DFFQXL \MatchCount_reg[2]  ( .D(n772), .CK(CLK), .Q(n1324) );
  DFFQXL \MatchCount_reg[0]  ( .D(n774), .CK(CLK), .Q(n1326) );
  DFFQXL \MatchCount_reg[1]  ( .D(n773), .CK(CLK), .Q(n1325) );
  DFFQXL \MatchCount_reg[3]  ( .D(n771), .CK(CLK), .Q(n1323) );
  DFFNSRX1 Valid_reg ( .D(n691), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n689) );
  DFFX1 \state_reg[1]  ( .D(n767), .CK(CLK), .Q(state[1]), .QN(n1281) );
  DFFX1 \state_reg[0]  ( .D(n802), .CK(CLK), .Q(state[0]), .QN(n1292) );
  DFFX1 \W_reg[2]  ( .D(n799), .CK(CLK), .Q(n1317), .QN(n1291) );
  DFFX1 \MinCost_reg[0]  ( .D(n811), .CK(CLK), .Q(n1336) );
  DFFX1 \MinCost_reg[3]  ( .D(n815), .CK(CLK), .Q(n1333), .QN(n1221) );
  DFFX1 \MinCost_reg[1]  ( .D(n814), .CK(CLK), .Q(n1335), .QN(n1223) );
  DFFX1 \MinCost_reg[9]  ( .D(n812), .CK(CLK), .Q(n1327), .QN(n1218) );
  MXI2X1 \job_reg[6][0]/U4  ( .A(N56), .B(n756), .S0(n770), .Y(n817) );
  NOR2BX1 \job_reg[6][0]/U2  ( .AN(n1194), .B(n817), .Y(n818) );
  DFFX1 \J_reg[1]  ( .D(n797), .CK(CLK), .Q(n1321), .QN(n1284) );
  DFFQX2 \job_reg[6][0]  ( .D(n818), .CK(CLK), .Q(N56) );
  DFFX2 \W_reg[0]  ( .D(n800), .CK(CLK), .Q(n1319), .QN(n1289) );
  DFFX2 \J_reg[2]  ( .D(n796), .CK(CLK), .Q(n1320), .QN(n1286) );
  DFFX2 \W_reg[1]  ( .D(n801), .CK(CLK), .Q(n1318), .QN(n1290) );
  DFFQX1 \MinCost_reg[8]  ( .D(n810), .CK(CLK), .Q(n1328) );
  DFFQX2 \job_reg[2][0]  ( .D(n781), .CK(CLK), .Q(N44) );
  DFFQX2 \job_reg[7][1]  ( .D(n795), .CK(CLK), .Q(N60) );
  DFFHQX4 \job_reg[2][2]  ( .D(n782), .CK(CLK), .Q(N46) );
  DFFQX2 \job_reg[0][1]  ( .D(n779), .CK(CLK), .Q(N39) );
  DFFQX4 \job_reg[4][1]  ( .D(n786), .CK(CLK), .Q(N51) );
  DFFQX4 \job_reg[1][1]  ( .D(n776), .CK(CLK), .Q(N42) );
  DFFQX4 \job_reg[5][2]  ( .D(n790), .CK(CLK), .Q(N55) );
  DFFQX4 \job_reg[0][0]  ( .D(n778), .CK(CLK), .Q(N38) );
  DFFQX4 \job_reg[4][0]  ( .D(n788), .CK(CLK), .Q(N50) );
  DFFQX1 \MinCost_reg[5]  ( .D(n813), .CK(CLK), .Q(n1331) );
  DFFQX1 \job_reg[3][2]  ( .D(n785), .CK(CLK), .Q(N49) );
  DFFHQX4 \job_reg[3][1]  ( .D(n784), .CK(CLK), .Q(N48) );
  DFFHQX4 \job_reg[4][2]  ( .D(n787), .CK(CLK), .Q(N52) );
  DFFQX1 \MinCost_reg[4]  ( .D(n1231), .CK(CLK), .Q(n1332) );
  DFFQX2 \job_reg[6][1]  ( .D(n793), .CK(CLK), .Q(N57) );
  DFFQX4 \job_reg[0][2]  ( .D(n803), .CK(CLK), .Q(N40) );
  DFFQX1 \MinCost_reg[7]  ( .D(n1229), .CK(CLK), .Q(n1329) );
  DFFQX1 \MinCost_reg[6]  ( .D(n1230), .CK(CLK), .Q(n1330) );
  DFFQX1 \MinCost_reg[2]  ( .D(n1232), .CK(CLK), .Q(n1334) );
  DFFQX4 \job_reg[6][2]  ( .D(n792), .CK(CLK), .Q(N58) );
  DFFQX4 \job_reg[7][2]  ( .D(n794), .CK(CLK), .Q(N61) );
  OAI2BB1X4 U616 ( .A0N(MatchCount[3]), .A1N(n257), .B0(n258), .Y(n771) );
  AOI221X2 U617 ( .A0(\cost_data[5][4][0] ), .A1(n1095), .B0(
        \cost_data[5][6][0] ), .B1(n844), .C0(n1068), .Y(n1069) );
  AOI221X2 U618 ( .A0(\cost_data[5][5][0] ), .A1(n1095), .B0(
        \cost_data[5][7][0] ), .B1(n844), .C0(n1067), .Y(n1070) );
  AOI221X4 U619 ( .A0(\cost_data[5][4][1] ), .A1(n1095), .B0(
        \cost_data[5][6][1] ), .B1(n844), .C0(n1072), .Y(n1073) );
  AOI221X4 U620 ( .A0(\cost_data[5][5][1] ), .A1(n1095), .B0(
        \cost_data[5][7][1] ), .B1(n844), .C0(n1071), .Y(n1074) );
  INVX20 U621 ( .A(n1175), .Y(n1233) );
  BUFX12 U622 ( .A(n244), .Y(n1175) );
  AOI221X2 U623 ( .A0(\cost_data[0][5][1] ), .A1(n917), .B0(
        \cost_data[0][7][1] ), .B1(n918), .C0(n886), .Y(n889) );
  AOI221X2 U624 ( .A0(\cost_data[0][4][1] ), .A1(n917), .B0(
        \cost_data[0][6][1] ), .B1(n918), .C0(n887), .Y(n888) );
  AOI221X2 U625 ( .A0(\cost_data[0][5][2] ), .A1(n917), .B0(
        \cost_data[0][7][2] ), .B1(n918), .C0(n890), .Y(n893) );
  AOI221X2 U626 ( .A0(\cost_data[0][4][2] ), .A1(n917), .B0(
        \cost_data[0][6][2] ), .B1(n918), .C0(n891), .Y(n892) );
  AOI221X1 U627 ( .A0(\cost_data[0][4][0] ), .A1(n917), .B0(
        \cost_data[0][6][0] ), .B1(n918), .C0(n883), .Y(n884) );
  BUFX4 U628 ( .A(n911), .Y(n917) );
  NOR2X8 U629 ( .A(n915), .B(n845), .Y(n908) );
  INVX3 U630 ( .A(N39), .Y(n915) );
  CLKBUFX2 U631 ( .A(N40), .Y(n845) );
  NOR2X8 U632 ( .A(n1296), .B(N43), .Y(n945) );
  NOR2X2 U633 ( .A(n806), .B(n1296), .Y(n947) );
  OAI221X4 U634 ( .A0(N38), .A1(n951), .B0(n1177), .B1(n1296), .C0(n674), .Y(
        n673) );
  NOR2XL U635 ( .A(n1296), .B(N48), .Y(n574) );
  INVX16 U636 ( .A(N42), .Y(n1296) );
  ADDFHX2 U637 ( .A(N107), .B(N79), .CI(
        \add_6_root_add_0_root_add_18_7/carry [3]), .CO(
        \add_6_root_add_0_root_add_18_7/carry [4]), .S(N148) );
  AOI221X2 U638 ( .A0(\cost_data[0][5][0] ), .A1(n917), .B0(
        \cost_data[0][7][0] ), .B1(n918), .C0(n882), .Y(n885) );
  BUFX4 U639 ( .A(n910), .Y(n918) );
  AO22X2 U640 ( .A0(\cost_data[2][2][3] ), .A1(n991), .B0(\cost_data[2][0][3] ), .B1(n992), .Y(n968) );
  INVX8 U641 ( .A(N43), .Y(n805) );
  INVXL U642 ( .A(N43), .Y(n806) );
  CLKINVX2 U643 ( .A(N43), .Y(n952) );
  ADDFHX2 U644 ( .A(N101), .B(N73), .CI(
        \add_3_root_add_0_root_add_18_7/carry [2]), .CO(
        \add_3_root_add_0_root_add_18_7/carry [3]), .S(N128) );
  OAI22X2 U645 ( .A0(n951), .A1(n930), .B0(N41), .B1(n929), .Y(N73) );
  ADDFHX2 U646 ( .A(N104), .B(N76), .CI(
        \add_6_root_add_0_root_add_18_7/carry [6]), .CO(N152), .S(N151) );
  AOI221X4 U647 ( .A0(\cost_data[6][4][1] ), .A1(n1130), .B0(
        \cost_data[6][6][1] ), .B1(n1136), .C0(n1106), .Y(n1107) );
  XOR2X4 U648 ( .A(N117), .B(N89), .Y(N165) );
  AND2X4 U649 ( .A(N89), .B(N117), .Y(
        \add_4_root_add_0_root_add_18_7/carry [1]) );
  OAI22X2 U650 ( .A0(n1025), .A1(n996), .B0(N47), .B1(n995), .Y(N89) );
  OR2X8 U651 ( .A(N50), .B(n1037), .Y(n843) );
  AOI221X2 U652 ( .A0(\cost_data[4][4][1] ), .A1(n1060), .B0(
        \cost_data[4][6][1] ), .B1(n1064), .C0(n1036), .Y(n1037) );
  OR2X8 U653 ( .A(n1277), .B(n1038), .Y(n842) );
  AOI221X2 U654 ( .A0(\cost_data[4][5][1] ), .A1(n1060), .B0(
        \cost_data[4][7][1] ), .B1(n1064), .C0(n1035), .Y(n1038) );
  CLKAND2X4 U655 ( .A(N96), .B(N68), .Y(
        \add_5_root_add_0_root_add_18_7/carry [1]) );
  OAI22X2 U656 ( .A0(n1277), .A1(n1034), .B0(N50), .B1(n1033), .Y(N96) );
  AOI221X4 U657 ( .A0(\cost_data[6][5][1] ), .A1(n1130), .B0(
        \cost_data[6][7][1] ), .B1(n1136), .C0(n1105), .Y(n1108) );
  BUFX12 U658 ( .A(n1129), .Y(n1136) );
  INVX6 U659 ( .A(n1166), .Y(n807) );
  CLKINVX12 U660 ( .A(n807), .Y(n808) );
  NOR2X2 U661 ( .A(n1261), .B(N60), .Y(n1166) );
  AO22X2 U662 ( .A0(\cost_data[2][3][1] ), .A1(n991), .B0(\cost_data[2][1][1] ), .B1(n992), .Y(n959) );
  BUFX8 U663 ( .A(n980), .Y(n992) );
  INVX4 U664 ( .A(N48), .Y(n809) );
  INVX6 U665 ( .A(N48), .Y(n1278) );
  NOR2X2 U666 ( .A(n1280), .B(n1063), .Y(n1059) );
  NAND2XL U667 ( .A(N55), .B(n1280), .Y(n680) );
  OAI211X4 U668 ( .A0(N55), .A1(n1280), .B0(n678), .C0(n679), .Y(n416) );
  INVX16 U669 ( .A(N52), .Y(n1280) );
  BUFX4 U670 ( .A(n948), .Y(n953) );
  NOR2X1 U671 ( .A(n1300), .B(n962), .Y(n856) );
  AOI221XL U672 ( .A0(\cost_data[7][4][2] ), .A1(n808), .B0(
        \cost_data[7][6][2] ), .B1(n1165), .C0(n1146), .Y(n1147) );
  AOI221XL U673 ( .A0(\cost_data[7][5][2] ), .A1(n808), .B0(
        \cost_data[7][7][2] ), .B1(n1165), .C0(n1145), .Y(n1148) );
  BUFX8 U674 ( .A(N49), .Y(n1178) );
  CLKINVX1 U675 ( .A(n1325), .Y(n1302) );
  CLKINVX1 U676 ( .A(n1324), .Y(n1303) );
  AO22X1 U677 ( .A0(\cost_data[7][3][0] ), .A1(n1170), .B0(
        \cost_data[7][1][0] ), .B1(n820), .Y(n1137) );
  AOI221X1 U678 ( .A0(\cost_data[7][4][1] ), .A1(n808), .B0(
        \cost_data[7][6][1] ), .B1(n1165), .C0(n1142), .Y(n1143) );
  AOI221X1 U679 ( .A0(\cost_data[3][4][1] ), .A1(n1027), .B0(
        \cost_data[3][6][1] ), .B1(n1028), .C0(n998), .Y(n999) );
  AOI221X1 U680 ( .A0(\cost_data[3][5][1] ), .A1(n1027), .B0(
        \cost_data[3][7][1] ), .B1(n1028), .C0(n997), .Y(n1000) );
  AOI221X1 U681 ( .A0(\cost_data[1][4][1] ), .A1(n953), .B0(
        \cost_data[1][6][1] ), .B1(n954), .C0(n924), .Y(n925) );
  AO22X1 U682 ( .A0(\cost_data[1][2][1] ), .A1(n945), .B0(\cost_data[1][0][1] ), .B1(n944), .Y(n924) );
  OAI22X1 U683 ( .A0(n1257), .A1(n1140), .B0(N59), .B1(n1139), .Y(N117) );
  AOI221X1 U684 ( .A0(\cost_data[7][4][0] ), .A1(n808), .B0(
        \cost_data[7][6][0] ), .B1(n1165), .C0(n1138), .Y(n1139) );
  AOI221X1 U685 ( .A0(\cost_data[7][5][0] ), .A1(n808), .B0(
        \cost_data[7][7][0] ), .B1(n1165), .C0(n1137), .Y(n1140) );
  AO22X1 U686 ( .A0(\cost_data[7][2][0] ), .A1(n1170), .B0(
        \cost_data[7][0][0] ), .B1(n820), .Y(n1138) );
  OAI22X2 U687 ( .A0(n951), .A1(n922), .B0(N41), .B1(n921), .Y(N75) );
  AO22X1 U688 ( .A0(\cost_data[1][2][0] ), .A1(n945), .B0(\cost_data[1][0][0] ), .B1(n944), .Y(n920) );
  AOI221XL U689 ( .A0(\cost_data[1][4][2] ), .A1(n953), .B0(
        \cost_data[1][6][2] ), .B1(n954), .C0(n928), .Y(n929) );
  AOI221XL U690 ( .A0(\cost_data[5][5][2] ), .A1(n1095), .B0(
        \cost_data[5][7][2] ), .B1(n844), .C0(n1075), .Y(n1078) );
  CLKBUFX6 U691 ( .A(n984), .Y(n989) );
  BUFX4 U692 ( .A(n983), .Y(n990) );
  BUFX4 U693 ( .A(n1056), .Y(n1066) );
  BUFX4 U694 ( .A(n1057), .Y(n1065) );
  NOR2X4 U695 ( .A(N39), .B(N40), .Y(n907) );
  CLKAND2X3 U696 ( .A(N55), .B(N54), .Y(n844) );
  ADDFHX1 U697 ( .A(N95), .B(N67), .CI(
        \add_5_root_add_0_root_add_18_7/carry [1]), .CO(
        \add_5_root_add_0_root_add_18_7/carry [2]), .S(N136) );
  NAND2X1 U698 ( .A(n848), .B(n849), .Y(N67) );
  NAND2X1 U699 ( .A(n842), .B(n843), .Y(N95) );
  XOR2X1 U700 ( .A(N68), .B(N96), .Y(N135) );
  ADDFHX2 U701 ( .A(N108), .B(N80), .CI(
        \add_6_root_add_0_root_add_18_7/carry [2]), .CO(
        \add_6_root_add_0_root_add_18_7/carry [3]), .S(N147) );
  OAI22XL U702 ( .A0(n1025), .A1(n1004), .B0(N47), .B1(n1003), .Y(N87) );
  AOI221XL U703 ( .A0(\cost_data[3][5][2] ), .A1(n1027), .B0(
        \cost_data[3][7][2] ), .B1(n1028), .C0(n1001), .Y(n1004) );
  ADDFX2 U704 ( .A(N84), .B(N112), .CI(
        \add_4_root_add_0_root_add_18_7/carry [5]), .CO(
        \add_4_root_add_0_root_add_18_7/carry [6]), .S(N170) );
  OAI22XL U705 ( .A0(N43), .A1(n1280), .B0(n629), .B1(n573), .Y(n625) );
  NOR3BXL U706 ( .AN(n1205), .B(n1199), .C(n1206), .Y(n1197) );
  OR2X1 U707 ( .A(n1208), .B(n1207), .Y(n863) );
  NAND2BX1 U708 ( .AN(n1206), .B(n1205), .Y(n1207) );
  OR2X1 U709 ( .A(TotalCost[7]), .B(n1219), .Y(n865) );
  OR2X1 U710 ( .A(TotalCost[6]), .B(n1220), .Y(n864) );
  INVX3 U711 ( .A(TotalCost[8]), .Y(n1227) );
  OAI21X2 U712 ( .A0(n1178), .A1(n1261), .B0(n649), .Y(n401) );
  OAI211X1 U713 ( .A0(n1178), .A1(n1298), .B0(n666), .C0(n667), .Y(n339) );
  OA21XL U714 ( .A0(n1195), .A1(n1322), .B0(n558), .Y(n557) );
  CLKINVX1 U715 ( .A(n1326), .Y(n1301) );
  NAND2X2 U716 ( .A(n220), .B(n1283), .Y(n199) );
  OR4X1 U717 ( .A(MatchCount[3]), .B(n1303), .C(n1302), .D(n261), .Y(n258) );
  INVX6 U718 ( .A(N57), .Y(n1134) );
  NOR2X1 U719 ( .A(n1098), .B(N55), .Y(n1093) );
  INVX4 U720 ( .A(n1176), .Y(n987) );
  BUFX8 U721 ( .A(N45), .Y(n1176) );
  INVX4 U722 ( .A(N40), .Y(n916) );
  OR3X2 U723 ( .A(n874), .B(n875), .C(n1195), .Y(n810) );
  INVX3 U724 ( .A(N41), .Y(n951) );
  OR3X2 U725 ( .A(n854), .B(n855), .C(RST), .Y(n811) );
  INVX3 U726 ( .A(N47), .Y(n1025) );
  INVX3 U727 ( .A(N60), .Y(n1169) );
  CLKBUFX3 U728 ( .A(N57), .Y(n860) );
  INVX3 U729 ( .A(N53), .Y(n1099) );
  INVX3 U730 ( .A(N59), .Y(n1257) );
  INVX3 U731 ( .A(N44), .Y(n1300) );
  OR3X2 U732 ( .A(n852), .B(n853), .C(n1195), .Y(n812) );
  OR3X2 U733 ( .A(n871), .B(n872), .C(n1195), .Y(n813) );
  OR3X2 U734 ( .A(n858), .B(n859), .C(n1195), .Y(n814) );
  OR3X2 U735 ( .A(n861), .B(n862), .C(n1195), .Y(n815) );
  INVX4 U736 ( .A(N58), .Y(n1133) );
  INVX3 U737 ( .A(N56), .Y(n1135) );
  INVX4 U738 ( .A(N54), .Y(n1098) );
  INVX3 U739 ( .A(N38), .Y(n914) );
  OAI22X1 U740 ( .A0(n914), .A1(n897), .B0(N38), .B1(n896), .Y(N65) );
  XOR2X1 U741 ( .A(N75), .B(N103), .Y(N126) );
  INVX12 U742 ( .A(n689), .Y(Valid) );
  OA21X1 U744 ( .A0(n1325), .A1(n262), .B0(n264), .Y(n263) );
  OA21X1 U745 ( .A0(n1326), .A1(n262), .B0(n265), .Y(n264) );
  ADDFX2 U746 ( .A(N87), .B(N115), .CI(
        \add_4_root_add_0_root_add_18_7/carry [2]), .CO(
        \add_4_root_add_0_root_add_18_7/carry [3]), .S(N167) );
  NOR2X4 U747 ( .A(n1280), .B(N51), .Y(n1060) );
  NOR2X1 U748 ( .A(N48), .B(n1178), .Y(n1018) );
  AOI221X2 U749 ( .A0(\cost_data[5][4][2] ), .A1(n1095), .B0(
        \cost_data[5][6][2] ), .B1(n844), .C0(n1076), .Y(n1077) );
  BUFX4 U750 ( .A(n1059), .Y(n1064) );
  NOR2X1 U751 ( .A(n988), .B(n987), .Y(n983) );
  AOI221X1 U752 ( .A0(\cost_data[7][5][1] ), .A1(n808), .B0(
        \cost_data[7][7][1] ), .B1(n1165), .C0(n1141), .Y(n1144) );
  NOR2X1 U753 ( .A(n1226), .B(n1331), .Y(n1206) );
  BUFX20 U754 ( .A(n1162), .Y(n820) );
  NOR2X2 U755 ( .A(N60), .B(N61), .Y(n1162) );
  NOR2XL U756 ( .A(N45), .B(N46), .Y(n980) );
  OAI22X1 U757 ( .A0(n1099), .A1(n1078), .B0(N53), .B1(n1077), .Y(N101) );
  AO22X2 U758 ( .A0(\cost_data[1][3][0] ), .A1(n945), .B0(\cost_data[1][1][0] ), .B1(n944), .Y(n919) );
  AO22X4 U759 ( .A0(\cost_data[1][2][2] ), .A1(n945), .B0(\cost_data[1][0][2] ), .B1(n944), .Y(n928) );
  AO22X4 U760 ( .A0(\cost_data[1][3][2] ), .A1(n945), .B0(\cost_data[1][1][2] ), .B1(n944), .Y(n927) );
  AOI221X2 U761 ( .A0(\cost_data[3][5][0] ), .A1(n1027), .B0(
        \cost_data[3][7][0] ), .B1(n1028), .C0(n993), .Y(n996) );
  AOI221X2 U762 ( .A0(\cost_data[3][4][0] ), .A1(n1027), .B0(
        \cost_data[3][6][0] ), .B1(n1028), .C0(n994), .Y(n995) );
  AOI221XL U763 ( .A0(\cost_data[3][4][2] ), .A1(n1027), .B0(
        \cost_data[3][6][2] ), .B1(n1028), .C0(n1002), .Y(n1003) );
  BUFX4 U764 ( .A(n1022), .Y(n1027) );
  BUFX12 U765 ( .A(n1021), .Y(n1028) );
  BUFX6 U766 ( .A(n981), .Y(n991) );
  NOR2XL U767 ( .A(n987), .B(N46), .Y(n981) );
  BUFX6 U768 ( .A(n1018), .Y(n1030) );
  NOR2X1 U769 ( .A(n1169), .B(N61), .Y(n1163) );
  OAI22X4 U770 ( .A0(n1099), .A1(n1074), .B0(N53), .B1(n1073), .Y(N102) );
  ADDFHX4 U771 ( .A(N93), .B(N65), .CI(
        \add_5_root_add_0_root_add_18_7/carry [3]), .CO(
        \add_5_root_add_0_root_add_18_7/carry [4]), .S(N138) );
  CLKAND2X12 U772 ( .A(N103), .B(N75), .Y(
        \add_3_root_add_0_root_add_18_7/carry [1]) );
  OAI22X4 U773 ( .A0(n951), .A1(n926), .B0(N41), .B1(n925), .Y(N74) );
  OAI22X4 U774 ( .A0(n1099), .A1(n1070), .B0(N53), .B1(n1069), .Y(N103) );
  OAI22X1 U775 ( .A0(n1025), .A1(n1000), .B0(N47), .B1(n999), .Y(N88) );
  NOR2X2 U776 ( .A(n1215), .B(n1214), .Y(n1204) );
  NOR2BX1 U777 ( .AN(TotalCost[3]), .B(n1333), .Y(n1215) );
  NOR4X6 U778 ( .A(n1217), .B(n1216), .C(n1215), .D(n1214), .Y(N503) );
  NOR2X2 U779 ( .A(n1225), .B(MinCost[4]), .Y(n1214) );
  OAI22X4 U780 ( .A0(TotalCost[9]), .A1(n1218), .B0(n1228), .B1(n1211), .Y(
        N502) );
  AOI32X4 U781 ( .A0(n1210), .A1(n876), .A2(n1209), .B0(n831), .B1(n1227), .Y(
        n1211) );
  INVX12 U782 ( .A(n1286), .Y(J[2]) );
  BUFX12 U783 ( .A(n1331), .Y(MinCost[5]) );
  INVX12 U784 ( .A(n1291), .Y(W[2]) );
  INVX12 U785 ( .A(n1284), .Y(J[1]) );
  INVX12 U786 ( .A(n1218), .Y(MinCost[9]) );
  BUFX16 U787 ( .A(n1336), .Y(MinCost[0]) );
  NOR2BXL U788 ( .AN(MinCost[0]), .B(TotalCost[0]), .Y(n1201) );
  INVX12 U789 ( .A(n1223), .Y(MinCost[1]) );
  AO21XL U790 ( .A0(n1224), .A1(n1201), .B0(n1335), .Y(n1200) );
  INVX12 U791 ( .A(n1221), .Y(MinCost[3]) );
  BUFX16 U792 ( .A(n1332), .Y(MinCost[4]) );
  BUFX12 U793 ( .A(n1328), .Y(MinCost[8]) );
  CLKBUFX3 U794 ( .A(n1328), .Y(n831) );
  BUFX16 U795 ( .A(n1334), .Y(MinCost[2]) );
  BUFX16 U796 ( .A(n1330), .Y(MinCost[6]) );
  BUFX16 U797 ( .A(n1329), .Y(MinCost[7]) );
  BUFX16 U798 ( .A(n1323), .Y(MatchCount[3]) );
  INVX12 U799 ( .A(n1302), .Y(MatchCount[1]) );
  INVX12 U800 ( .A(n1301), .Y(MatchCount[0]) );
  INVX12 U801 ( .A(n1303), .Y(MatchCount[2]) );
  OAI21XL U802 ( .A0(n1324), .A1(n262), .B0(n263), .Y(n257) );
  INVX12 U803 ( .A(n1289), .Y(W[0]) );
  INVX12 U804 ( .A(n1290), .Y(W[1]) );
  INVX12 U805 ( .A(n1283), .Y(J[0]) );
  NAND2X2 U806 ( .A(n220), .B(n1322), .Y(n198) );
  NOR2XL U807 ( .A(N51), .B(N52), .Y(n1056) );
  AO22XL U808 ( .A0(\cost_data[4][3][6] ), .A1(n1065), .B0(
        \cost_data[4][1][6] ), .B1(n1066), .Y(n1055) );
  AO22XL U809 ( .A0(\cost_data[4][2][6] ), .A1(n1065), .B0(
        \cost_data[4][0][6] ), .B1(n1066), .Y(n1058) );
  AO22XL U810 ( .A0(\cost_data[4][2][5] ), .A1(n1065), .B0(
        \cost_data[4][0][5] ), .B1(n1066), .Y(n1052) );
  AO22XL U811 ( .A0(\cost_data[4][3][5] ), .A1(n1065), .B0(
        \cost_data[4][1][5] ), .B1(n1066), .Y(n1051) );
  AO22XL U812 ( .A0(\cost_data[4][2][4] ), .A1(n1065), .B0(
        \cost_data[4][0][4] ), .B1(n1066), .Y(n1048) );
  AO22XL U813 ( .A0(\cost_data[4][3][4] ), .A1(n1065), .B0(
        \cost_data[4][1][4] ), .B1(n1066), .Y(n1047) );
  AOI221X2 U814 ( .A0(\cost_data[1][5][0] ), .A1(n953), .B0(
        \cost_data[1][7][0] ), .B1(n954), .C0(n919), .Y(n922) );
  AOI221X2 U815 ( .A0(\cost_data[1][4][0] ), .A1(n953), .B0(
        \cost_data[1][6][0] ), .B1(n954), .C0(n920), .Y(n921) );
  AOI221X2 U816 ( .A0(\cost_data[1][5][1] ), .A1(n953), .B0(
        \cost_data[1][7][1] ), .B1(n954), .C0(n923), .Y(n926) );
  AOI221X2 U817 ( .A0(\cost_data[1][5][2] ), .A1(n953), .B0(
        \cost_data[1][7][2] ), .B1(n954), .C0(n927), .Y(n930) );
  BUFX6 U818 ( .A(n1093), .Y(n1100) );
  ADDFHX2 U819 ( .A(N106), .B(N78), .CI(
        \add_6_root_add_0_root_add_18_7/carry [4]), .CO(
        \add_6_root_add_0_root_add_18_7/carry [5]), .S(N149) );
  ADDFHX2 U820 ( .A(N92), .B(N64), .CI(
        \add_5_root_add_0_root_add_18_7/carry [4]), .CO(
        \add_5_root_add_0_root_add_18_7/carry [5]), .S(N139) );
  OR2X2 U821 ( .A(n1300), .B(n966), .Y(n846) );
  OR2X2 U822 ( .A(N44), .B(n965), .Y(n847) );
  NAND2X2 U823 ( .A(n846), .B(n847), .Y(N80) );
  OR2X6 U824 ( .A(n1261), .B(n1169), .Y(n873) );
  ADDFHX2 U825 ( .A(N109), .B(N81), .CI(
        \add_6_root_add_0_root_add_18_7/carry [1]), .CO(
        \add_6_root_add_0_root_add_18_7/carry [2]), .S(N146) );
  AOI221X1 U826 ( .A0(\cost_data[2][5][1] ), .A1(n989), .B0(
        \cost_data[2][7][1] ), .B1(n990), .C0(n959), .Y(n962) );
  NOR3X2 U827 ( .A(n850), .B(n851), .C(n960), .Y(n961) );
  AND2X1 U828 ( .A(\cost_data[2][4][1] ), .B(n989), .Y(n850) );
  AND2XL U829 ( .A(\cost_data[2][6][1] ), .B(n990), .Y(n851) );
  NOR2X1 U830 ( .A(N44), .B(n961), .Y(n857) );
  OR2X1 U831 ( .A(n914), .B(n889), .Y(n848) );
  OR2X1 U832 ( .A(N38), .B(n888), .Y(n849) );
  CLKAND2X6 U833 ( .A(N110), .B(N82), .Y(
        \add_6_root_add_0_root_add_18_7/carry [1]) );
  OR2X4 U834 ( .A(n856), .B(n857), .Y(N81) );
  AND2X2 U835 ( .A(TotalCost[9]), .B(n1233), .Y(n852) );
  AND2XL U836 ( .A(n1327), .B(n1175), .Y(n853) );
  AND2XL U837 ( .A(TotalCost[0]), .B(n1233), .Y(n854) );
  AND2XL U838 ( .A(MinCost[0]), .B(n1175), .Y(n855) );
  AO22XL U839 ( .A0(\cost_data[7][3][1] ), .A1(n1170), .B0(
        \cost_data[7][1][1] ), .B1(n820), .Y(n1141) );
  AO22XL U840 ( .A0(\cost_data[7][2][1] ), .A1(n1170), .B0(
        \cost_data[7][0][1] ), .B1(n820), .Y(n1142) );
  AO22XL U841 ( .A0(\cost_data[7][3][2] ), .A1(n1170), .B0(
        \cost_data[7][1][2] ), .B1(n820), .Y(n1145) );
  AO22XL U842 ( .A0(\cost_data[7][2][2] ), .A1(n1170), .B0(
        \cost_data[7][0][2] ), .B1(n820), .Y(n1146) );
  NAND2X4 U843 ( .A(n869), .B(n870), .Y(N110) );
  AND2XL U844 ( .A(TotalCost[1]), .B(n1233), .Y(n858) );
  AND2XL U845 ( .A(MinCost[1]), .B(n1175), .Y(n859) );
  OAI22X1 U846 ( .A0(n1135), .A1(n1108), .B0(N56), .B1(n1107), .Y(N109) );
  INVX3 U847 ( .A(TotalCost[5]), .Y(n1226) );
  INVX6 U848 ( .A(n873), .Y(n1165) );
  OR2X2 U849 ( .A(N56), .B(n1103), .Y(n870) );
  OR2X2 U850 ( .A(n1135), .B(n1104), .Y(n869) );
  AOI221X2 U851 ( .A0(\cost_data[2][4][0] ), .A1(n989), .B0(
        \cost_data[2][6][0] ), .B1(n990), .C0(n956), .Y(n957) );
  ADDFX2 U852 ( .A(N94), .B(N66), .CI(
        \add_5_root_add_0_root_add_18_7/carry [2]), .CO(
        \add_5_root_add_0_root_add_18_7/carry [3]), .S(N137) );
  AND2XL U853 ( .A(TotalCost[3]), .B(n1233), .Y(n861) );
  AND2XL U854 ( .A(MinCost[3]), .B(n1175), .Y(n862) );
  BUFX12 U855 ( .A(n1163), .Y(n1170) );
  INVX1 U856 ( .A(n307), .Y(n1235) );
  NAND2XL U857 ( .A(n308), .B(n582), .Y(n311) );
  AND2XL U858 ( .A(n330), .B(n307), .Y(n309) );
  AND2X1 U859 ( .A(n353), .B(n1194), .Y(n331) );
  NAND3BX4 U860 ( .AN(N502), .B(n1213), .C(n1212), .Y(n1216) );
  BUFX12 U861 ( .A(n947), .Y(n954) );
  INVX3 U862 ( .A(n1213), .Y(n1228) );
  OR2X2 U863 ( .A(N44), .B(n957), .Y(n878) );
  AND2XL U864 ( .A(\cost_data[2][5][0] ), .B(n989), .Y(n879) );
  AND2XL U865 ( .A(\cost_data[2][7][0] ), .B(n990), .Y(n880) );
  NOR3X2 U866 ( .A(n879), .B(n880), .C(n955), .Y(n958) );
  OR2XL U867 ( .A(n1227), .B(n831), .Y(n876) );
  NAND3X2 U868 ( .A(n863), .B(n864), .C(n865), .Y(n1209) );
  AND2XL U869 ( .A(n1331), .B(n1226), .Y(n866) );
  AND2XL U870 ( .A(MinCost[4]), .B(n1225), .Y(n867) );
  AND2X2 U871 ( .A(n1204), .B(n1203), .Y(n868) );
  NOR3X1 U872 ( .A(n866), .B(n867), .C(n868), .Y(n1208) );
  NAND2XL U873 ( .A(n1194), .B(n443), .Y(n417) );
  NOR2BXL U874 ( .AN(n241), .B(n507), .Y(n510) );
  AOI211XL U875 ( .A0(N51), .A1(n1260), .B0(n1257), .C0(N50), .Y(n658) );
  NOR2XL U876 ( .A(n1227), .B(n831), .Y(n1199) );
  AOI221X1 U877 ( .A0(\cost_data[4][4][0] ), .A1(n1060), .B0(
        \cost_data[4][6][0] ), .B1(n1064), .C0(n1032), .Y(n1033) );
  AOI221X1 U878 ( .A0(\cost_data[4][5][0] ), .A1(n1060), .B0(
        \cost_data[4][7][0] ), .B1(n1064), .C0(n1031), .Y(n1034) );
  AO22XL U879 ( .A0(\cost_data[0][2][0] ), .A1(n908), .B0(\cost_data[0][0][0] ), .B1(n907), .Y(n883) );
  CMPR32X2 U880 ( .A(N86), .B(N114), .C(
        \add_4_root_add_0_root_add_18_7/carry [3]), .CO(
        \add_4_root_add_0_root_add_18_7/carry [4]), .S(N168) );
  ADDFX2 U881 ( .A(N100), .B(N72), .CI(
        \add_3_root_add_0_root_add_18_7/carry [3]), .CO(
        \add_3_root_add_0_root_add_18_7/carry [4]), .S(N129) );
  NOR2X4 U882 ( .A(N42), .B(N43), .Y(n944) );
  NOR2X4 U883 ( .A(N54), .B(N55), .Y(n1092) );
  CLKBUFX2 U884 ( .A(RST), .Y(n1195) );
  AND2XL U885 ( .A(TotalCost[5]), .B(n1233), .Y(n871) );
  AND2XL U886 ( .A(MinCost[5]), .B(n1175), .Y(n872) );
  OA21X4 U887 ( .A0(n268), .A1(n1233), .B0(n1194), .Y(n265) );
  NOR2X4 U888 ( .A(n1282), .B(n262), .Y(n268) );
  OA21XL U889 ( .A0(n405), .A1(n1271), .B0(n1263), .Y(n378) );
  OAI31XL U890 ( .A0(n1271), .A1(n1268), .A2(n440), .B0(n441), .Y(n433) );
  NOR2XL U891 ( .A(n988), .B(N45), .Y(n984) );
  BUFX8 U892 ( .A(n1019), .Y(n1029) );
  NAND2XL U893 ( .A(N502), .B(n770), .Y(n244) );
  NOR2X1 U894 ( .A(n1235), .B(RST), .Y(n308) );
  NOR2X1 U895 ( .A(n194), .B(n1291), .Y(n204) );
  OAI22XL U896 ( .A0(n546), .A1(n1298), .B0(n1244), .B1(n952), .Y(n542) );
  OAI22XL U897 ( .A0(n229), .A1(n1098), .B0(n1250), .B1(n987), .Y(n519) );
  CLKINVX3 U898 ( .A(N46), .Y(n1298) );
  CLKINVX1 U899 ( .A(n403), .Y(n1272) );
  CLKINVX1 U900 ( .A(n339), .Y(n1276) );
  NOR2BX1 U901 ( .AN(n618), .B(n608), .Y(n302) );
  OAI222XL U902 ( .A0(n428), .A1(n1098), .B0(n429), .B1(n1134), .C0(n987), 
        .C1(n430), .Y(n421) );
  NOR2BX1 U903 ( .AN(n614), .B(n611), .Y(n447) );
  NOR3BX1 U904 ( .AN(n606), .B(n605), .C(n625), .Y(n369) );
  NAND2X1 U905 ( .A(n1241), .B(n632), .Y(n278) );
  OAI22XL U906 ( .A0(n1280), .A1(n382), .B0(n916), .B1(n383), .Y(n395) );
  OAI22XL U907 ( .A0(n378), .A1(n1098), .B0(n379), .B1(n1260), .Y(n392) );
  NAND2X1 U908 ( .A(n618), .B(n609), .Y(n317) );
  CLKINVX1 U909 ( .A(n1172), .Y(n1252) );
  CLKINVX1 U910 ( .A(n360), .Y(n1241) );
  OAI21X1 U911 ( .A0(N52), .A1(n1261), .B0(n657), .Y(n450) );
  OAI22XL U912 ( .A0(n429), .A1(n1133), .B0(n424), .B1(n1261), .Y(n436) );
  NAND2X1 U913 ( .A(n610), .B(n611), .Y(n315) );
  CLKINVX1 U914 ( .A(n451), .Y(n1269) );
  OA21XL U915 ( .A0(n454), .A1(n1267), .B0(n1248), .Y(n429) );
  NAND3X2 U916 ( .A(n1284), .B(n1286), .C(n1283), .Y(n203) );
  OAI222XL U917 ( .A0(n1296), .A1(n1254), .B0(n1134), .B1(n1256), .C0(n1253), 
        .C1(n1260), .Y(n323) );
  XOR2X1 U918 ( .A(N82), .B(N110), .Y(N145) );
  OAI22X1 U919 ( .A0(n914), .A1(n885), .B0(N38), .B1(n884), .Y(N68) );
  CMPR32X2 U920 ( .A(N105), .B(N77), .C(
        \add_6_root_add_0_root_add_18_7/carry [5]), .CO(
        \add_6_root_add_0_root_add_18_7/carry [6]), .S(N150) );
  CMPR32X2 U921 ( .A(N90), .B(N62), .C(
        \add_5_root_add_0_root_add_18_7/carry [6]), .CO(N142), .S(N141) );
  OAI32XL U922 ( .A0(n1302), .A1(n1324), .A2(n261), .B0(n263), .B1(n1303), .Y(
        n772) );
  CMPR32X2 U923 ( .A(N98), .B(N70), .C(
        \add_3_root_add_0_root_add_18_7/carry [5]), .CO(
        \add_3_root_add_0_root_add_18_7/carry [6]), .S(N131) );
  CMPR32X2 U924 ( .A(N83), .B(N111), .C(
        \add_4_root_add_0_root_add_18_7/carry [6]), .CO(N172), .S(N171) );
  CMPR32X2 U925 ( .A(N97), .B(N69), .C(
        \add_3_root_add_0_root_add_18_7/carry [6]), .CO(N133), .S(N132) );
  ADDFHX2 U926 ( .A(N88), .B(N116), .CI(
        \add_4_root_add_0_root_add_18_7/carry [1]), .CO(
        \add_4_root_add_0_root_add_18_7/carry [2]), .S(N166) );
  OAI22X1 U927 ( .A0(n1257), .A1(n1144), .B0(N59), .B1(n1143), .Y(N116) );
  ADDFHX2 U928 ( .A(N102), .B(N74), .CI(
        \add_3_root_add_0_root_add_18_7/carry [1]), .CO(
        \add_3_root_add_0_root_add_18_7/carry [2]), .S(N127) );
  NOR2BXL U929 ( .AN(TotalCost[0]), .B(MinCost[0]), .Y(n1196) );
  AOI211XL U930 ( .A0(n302), .A1(N43), .B0(n583), .C0(n584), .Y(n580) );
  NAND3X2 U931 ( .A(n1318), .B(n1289), .C(n204), .Y(n207) );
  NAND3X2 U932 ( .A(n1318), .B(n1289), .C(n215), .Y(n216) );
  NAND3XL U933 ( .A(n671), .B(n987), .C(N42), .Y(n669) );
  NAND2XL U934 ( .A(N46), .B(n952), .Y(n671) );
  NOR2X1 U935 ( .A(n194), .B(n1317), .Y(n215) );
  OAI211XL U936 ( .A0(N43), .A1(n916), .B0(n672), .C0(n673), .Y(n587) );
  NAND3XL U937 ( .A(n674), .B(n1296), .C(n1177), .Y(n672) );
  NAND2XL U938 ( .A(N43), .B(n916), .Y(n674) );
  AOI211XL U939 ( .A0(n860), .A1(n335), .B0(n336), .C0(n337), .Y(n332) );
  AOI211XL U940 ( .A0(n273), .A1(N38), .B0(n274), .C0(RST), .Y(n270) );
  NAND2XL U941 ( .A(N52), .B(n1273), .Y(n665) );
  NAND3XL U942 ( .A(n665), .B(n1297), .C(N48), .Y(n663) );
  NAND2XL U943 ( .A(n1178), .B(n1298), .Y(n668) );
  NAND3XL U944 ( .A(n668), .B(n1278), .C(n1176), .Y(n666) );
  CLKBUFX2 U945 ( .A(N39), .Y(n1177) );
  AO22XL U946 ( .A0(N54), .A1(n1237), .B0(n461), .B1(n1194), .Y(n789) );
  OAI32XL U947 ( .A0(n576), .A1(n1135), .A2(N50), .B0(N51), .B1(n1134), .Y(
        n656) );
  OAI21XL U948 ( .A0(n845), .A1(n1280), .B0(n683), .Y(n614) );
  NOR2XL U949 ( .A(n1177), .B(n1297), .Y(n685) );
  AOI211XL U950 ( .A0(n1177), .A1(n1297), .B0(n1277), .C0(N38), .Y(n684) );
  OAI21XL U951 ( .A0(n845), .A1(n1273), .B0(n619), .Y(n609) );
  NOR2XL U952 ( .A(n1177), .B(n1278), .Y(n621) );
  AOI211XL U953 ( .A0(n1177), .A1(n1278), .B0(n1025), .C0(N38), .Y(n620) );
  AOI2BB2XL U954 ( .B0(n916), .B1(N58), .A0N(n612), .A1N(n570), .Y(n610) );
  OAI211XL U955 ( .A0(n860), .A1(n1299), .B0(n914), .C0(N56), .Y(n613) );
  OAI21XL U956 ( .A0(n845), .A1(n1279), .B0(n615), .Y(n611) );
  NOR2XL U957 ( .A(n1177), .B(n1098), .Y(n617) );
  AOI211XL U958 ( .A0(n1177), .A1(n1098), .B0(n1099), .C0(N38), .Y(n616) );
  CLKINVX3 U959 ( .A(N60), .Y(n1260) );
  OAI21XL U960 ( .A0(n845), .A1(n1298), .B0(n681), .Y(n608) );
  OAI32XL U961 ( .A0(n1300), .A1(N38), .A2(n577), .B0(n1177), .B1(n987), .Y(
        n682) );
  OAI21X1 U962 ( .A0(n845), .A1(n1261), .B0(n686), .Y(n504) );
  NOR2XL U963 ( .A(n1177), .B(n1260), .Y(n688) );
  AOI211XL U964 ( .A0(n1177), .A1(n1260), .B0(n1257), .C0(N38), .Y(n687) );
  OAI21XL U965 ( .A0(N43), .A1(n1279), .B0(n639), .Y(n631) );
  NOR2XL U966 ( .A(N42), .B(n1098), .Y(n641) );
  AOI211XL U967 ( .A0(N42), .A1(n1098), .B0(n1099), .C0(N41), .Y(n640) );
  OAI33XL U968 ( .A0(n1297), .A1(n1176), .A2(n623), .B0(n624), .B1(N44), .B2(
        n623), .Y(n622) );
  NOR2XL U969 ( .A(n1298), .B(N52), .Y(n623) );
  NOR2XL U970 ( .A(n1297), .B(n860), .Y(n576) );
  OAI222XL U971 ( .A0(n428), .A1(n1099), .B0(n1135), .B1(n429), .C0(n1300), 
        .C1(n430), .Y(n444) );
  NOR2XL U972 ( .A(n916), .B(N58), .Y(n570) );
  OAI211XL U973 ( .A0(N61), .A1(n1133), .B0(n660), .C0(n661), .Y(n530) );
  NAND3XL U974 ( .A(n662), .B(n1260), .C(n860), .Y(n660) );
  OAI211XL U975 ( .A0(N51), .A1(n1296), .B0(n951), .C0(N50), .Y(n630) );
  OA21XL U976 ( .A0(N43), .A1(n1273), .B0(n626), .Y(n605) );
  OAI32XL U977 ( .A0(n1025), .A1(N41), .A2(n574), .B0(N42), .B1(n1278), .Y(
        n627) );
  AOI211XL U978 ( .A0(N48), .A1(n1260), .B0(n1257), .C0(N47), .Y(n650) );
  NOR2XL U979 ( .A(N48), .B(n1260), .Y(n651) );
  OAI211XL U980 ( .A0(N54), .A1(n1278), .B0(n1025), .C0(N53), .Y(n645) );
  OAI211XL U981 ( .A0(N60), .A1(n987), .B0(n1300), .C0(N59), .Y(n600) );
  OAI21X1 U982 ( .A0(N46), .A1(n1133), .B0(n596), .Y(n363) );
  NOR2XL U983 ( .A(n1176), .B(n1134), .Y(n598) );
  AOI211XL U984 ( .A0(n1176), .A1(n1134), .B0(n1135), .C0(N44), .Y(n597) );
  OAI21XL U985 ( .A0(N43), .A1(n1133), .B0(n636), .Y(n632) );
  NOR2XL U986 ( .A(N42), .B(n1134), .Y(n638) );
  AOI211XL U987 ( .A0(N42), .A1(n1134), .B0(n1135), .C0(N41), .Y(n637) );
  OAI21X1 U988 ( .A0(N55), .A1(n1261), .B0(n653), .Y(n491) );
  OAI32XL U989 ( .A0(n1257), .A1(N53), .A2(n575), .B0(N54), .B1(n1260), .Y(
        n654) );
  OAI21XL U990 ( .A0(N46), .A1(n1279), .B0(n601), .Y(n595) );
  NOR2XL U991 ( .A(n1176), .B(n1098), .Y(n603) );
  AOI211XL U992 ( .A0(n1176), .A1(n1098), .B0(n1099), .C0(N44), .Y(n602) );
  NOR2X1 U993 ( .A(n1292), .B(state[1]), .Y(n770) );
  NOR2XL U994 ( .A(n1098), .B(N60), .Y(n575) );
  OAI21XL U995 ( .A0(n1178), .A1(n1133), .B0(n646), .Y(n643) );
  NOR2XL U996 ( .A(N48), .B(n1134), .Y(n648) );
  AOI211XL U997 ( .A0(N48), .A1(n1134), .B0(n1135), .C0(N47), .Y(n647) );
  NAND3X2 U998 ( .A(n1321), .B(n1283), .C(n1320), .Y(n197) );
  NAND3X2 U999 ( .A(n1283), .B(n1286), .C(n1321), .Y(n201) );
  NAND3X2 U1000 ( .A(n1284), .B(n1286), .C(n1322), .Y(n202) );
  OAI222XL U1001 ( .A0(n951), .A1(n1254), .B0(n1135), .B1(n1256), .C0(n1253), 
        .C1(n1257), .Y(n312) );
  NOR3XL U1002 ( .A(N53), .B(n1135), .C(N59), .Y(n578) );
  AND2XL U1003 ( .A(TotalCost[8]), .B(n1233), .Y(n874) );
  AND2XL U1004 ( .A(n831), .B(n1175), .Y(n875) );
  OR2X4 U1005 ( .A(n1300), .B(n958), .Y(n877) );
  NAND2X2 U1006 ( .A(n877), .B(n878), .Y(N82) );
  CLKINVX1 U1007 ( .A(TotalCost[4]), .Y(n1225) );
  CLKINVX1 U1008 ( .A(n417), .Y(n1238) );
  CLKINVX1 U1009 ( .A(n467), .Y(n1237) );
  CLKINVX1 U1010 ( .A(n358), .Y(n1275) );
  CLKINVX1 U1011 ( .A(n607), .Y(n1251) );
  NAND2X1 U1012 ( .A(n1242), .B(n1265), .Y(n471) );
  NAND2X1 U1013 ( .A(n1262), .B(n414), .Y(n383) );
  CLKINVX1 U1014 ( .A(n334), .Y(n1274) );
  CLKINVX1 U1015 ( .A(n414), .Y(n1271) );
  CLKINVX1 U1016 ( .A(n492), .Y(n1248) );
  NOR2X1 U1017 ( .A(n1026), .B(n1278), .Y(n1021) );
  NOR2X2 U1018 ( .A(n199), .B(n214), .Y(n727) );
  NOR2X2 U1019 ( .A(n199), .B(n217), .Y(n743) );
  NOR2X2 U1020 ( .A(n203), .B(n214), .Y(n731) );
  NOR2X2 U1021 ( .A(n203), .B(n217), .Y(n747) );
  OAI21X1 U1022 ( .A0(n1276), .A1(n353), .B0(n1193), .Y(n307) );
  CLKINVX1 U1023 ( .A(n308), .Y(n1234) );
  OA21XL U1024 ( .A0(n306), .A1(n1234), .B0(n307), .Y(n284) );
  OAI21XL U1025 ( .A0(n1294), .A1(n1295), .B0(n308), .Y(n330) );
  NAND2X2 U1026 ( .A(n204), .B(n205), .Y(n196) );
  NOR2X2 U1027 ( .A(n199), .B(n209), .Y(n711) );
  NOR2X2 U1028 ( .A(n199), .B(n211), .Y(n719) );
  NOR2X2 U1029 ( .A(n199), .B(n218), .Y(n751) );
  NOR2X2 U1030 ( .A(n203), .B(n209), .Y(n715) );
  NOR2X2 U1031 ( .A(n203), .B(n211), .Y(n723) );
  NOR2X2 U1032 ( .A(n203), .B(n218), .Y(n755) );
  NOR2X2 U1033 ( .A(n196), .B(n199), .Y(n695) );
  NOR2X2 U1034 ( .A(n196), .B(n203), .Y(n699) );
  OAI221XL U1035 ( .A0(n1299), .A1(n344), .B0(n1296), .B1(n345), .C0(n1194), 
        .Y(n336) );
  NOR2BX1 U1036 ( .AN(n517), .B(n507), .Y(n539) );
  OAI21X1 U1037 ( .A0(n507), .A1(n1252), .B0(n1193), .Y(n467) );
  AOI21X1 U1038 ( .A0(n1193), .A1(n433), .B0(n1238), .Y(n420) );
  AOI21X1 U1039 ( .A0(n1193), .A1(n334), .B0(n331), .Y(n347) );
  NAND2X1 U1040 ( .A(n564), .B(n1194), .Y(n560) );
  CLKINVX1 U1041 ( .A(n256), .Y(n1236) );
  NAND2X1 U1042 ( .A(n559), .B(n1194), .Y(n558) );
  NAND2X1 U1043 ( .A(n558), .B(n1194), .Y(n555) );
  CLKINVX1 U1044 ( .A(n372), .Y(n1239) );
  OA21XL U1045 ( .A0(n1272), .A1(n1274), .B0(n1239), .Y(n373) );
  AND2X2 U1046 ( .A(n462), .B(n467), .Y(n476) );
  OAI21XL U1047 ( .A0(n1273), .A1(n427), .B0(n1193), .Y(n434) );
  OAI21XL U1048 ( .A0(n1299), .A1(n535), .B0(n1194), .Y(n551) );
  OAI21XL U1049 ( .A0(n914), .A1(n535), .B0(n1193), .Y(n589) );
  OAI21XL U1050 ( .A0(n1299), .A1(n233), .B0(n1193), .Y(n518) );
  OAI21XL U1051 ( .A0(n1296), .A1(n384), .B0(n1193), .Y(n389) );
  CLKINVX1 U1052 ( .A(n416), .Y(n1268) );
  NOR2X1 U1053 ( .A(n1275), .B(n1272), .Y(n414) );
  NAND2X1 U1054 ( .A(n302), .B(n607), .Y(n535) );
  NAND2X1 U1055 ( .A(n607), .B(n303), .Y(n233) );
  OAI22XL U1056 ( .A0(n546), .A1(n987), .B0(n1244), .B1(n1296), .Y(n553) );
  OAI22XL U1057 ( .A0(n229), .A1(n1279), .B0(n1250), .B1(n1298), .Y(n512) );
  NOR2X1 U1058 ( .A(n410), .B(n1268), .Y(n452) );
  NOR2X1 U1059 ( .A(n495), .B(n1252), .Y(n607) );
  NOR2X1 U1060 ( .A(n483), .B(n1252), .Y(n594) );
  CLKINVX1 U1061 ( .A(n501), .Y(n1265) );
  NOR2X1 U1062 ( .A(n1293), .B(n1276), .Y(n358) );
  CLKINVX1 U1063 ( .A(n531), .Y(n1250) );
  OAI211X1 U1064 ( .A0(n532), .A1(n1251), .B0(n534), .C0(n535), .Y(n531) );
  CLKINVX1 U1065 ( .A(n526), .Y(n1247) );
  OAI211X1 U1066 ( .A0(n516), .A1(n1248), .B0(n527), .C0(n528), .Y(n526) );
  CLKINVX1 U1067 ( .A(n604), .Y(n1244) );
  OAI211X1 U1068 ( .A0(n532), .A1(n1251), .B0(n233), .C0(n525), .Y(n604) );
  CLKINVX1 U1069 ( .A(n522), .Y(n1240) );
  OAI211X1 U1070 ( .A0(n523), .A1(n1263), .B0(n524), .C0(n525), .Y(n522) );
  CLKINVX1 U1071 ( .A(n582), .Y(n1293) );
  NAND2X1 U1072 ( .A(n343), .B(n594), .Y(n534) );
  NOR3X1 U1073 ( .A(n365), .B(n1255), .C(n305), .Y(n440) );
  NAND2X1 U1074 ( .A(n1256), .B(n315), .Y(n305) );
  NAND2X1 U1075 ( .A(n317), .B(n1266), .Y(n304) );
  AOI2BB2X1 U1076 ( .B0(n450), .B1(n494), .A0N(n500), .A1N(n501), .Y(n473) );
  NOR2X1 U1077 ( .A(n370), .B(n412), .Y(n500) );
  NOR2X1 U1078 ( .A(n306), .B(n1276), .Y(n334) );
  NOR2X1 U1079 ( .A(n450), .B(n1264), .Y(n492) );
  NAND3X1 U1080 ( .A(n1270), .B(n1254), .C(n1253), .Y(n365) );
  OAI21X1 U1081 ( .A0(n300), .A1(n1293), .B0(n1241), .Y(n275) );
  NOR4X1 U1082 ( .A(n302), .B(n303), .C(n304), .D(n305), .Y(n300) );
  CLKINVX1 U1083 ( .A(n459), .Y(n1242) );
  OAI22XL U1084 ( .A0(n378), .A1(n1279), .B0(n379), .B1(n1261), .Y(n397) );
  OAI22XL U1085 ( .A0(n469), .A1(n1273), .B0(n1298), .B1(n470), .Y(n478) );
  OAI22XL U1086 ( .A0(n1298), .A1(n430), .B0(n428), .B1(n1279), .Y(n437) );
  NAND2BX1 U1087 ( .AN(n283), .B(n278), .Y(n370) );
  NAND2BX1 U1088 ( .AN(n483), .B(n342), .Y(n470) );
  OAI2BB1X1 U1089 ( .A0N(n881), .A1N(n359), .B0(n1259), .Y(n340) );
  OR4X1 U1090 ( .A(n369), .B(n1242), .C(n1245), .D(n370), .Y(n881) );
  NAND2X1 U1091 ( .A(n283), .B(n452), .Y(n426) );
  CLKINVX1 U1092 ( .A(n502), .Y(n1245) );
  NAND2X1 U1093 ( .A(n447), .B(n414), .Y(n425) );
  OA22X1 U1094 ( .A0(n498), .A1(n1246), .B0(n503), .B1(n495), .Y(n469) );
  NOR3X1 U1095 ( .A(n365), .B(n447), .C(n305), .Y(n503) );
  NAND2BX1 U1096 ( .AN(n495), .B(n1255), .Y(n474) );
  CLKINVX1 U1097 ( .A(n369), .Y(n1243) );
  OAI22XL U1098 ( .A0(n987), .A1(n470), .B0(n1296), .B1(n471), .Y(n465) );
  CLKINVX1 U1099 ( .A(n303), .Y(n1270) );
  OA21XL U1100 ( .A0(n409), .A1(n410), .B0(n1246), .Y(n380) );
  NOR3X1 U1101 ( .A(n412), .B(n283), .C(n1242), .Y(n409) );
  OA21XL U1102 ( .A0(n652), .A1(n516), .B0(n529), .Y(n548) );
  NOR2X1 U1103 ( .A(n492), .B(n450), .Y(n652) );
  NOR3X1 U1104 ( .A(n365), .B(n357), .C(n304), .Y(n405) );
  CLKINVX1 U1105 ( .A(n447), .Y(n1266) );
  NAND3X1 U1106 ( .A(n502), .B(n1243), .C(n1241), .Y(n412) );
  CLKINVX1 U1107 ( .A(n302), .Y(n1254) );
  NAND2X1 U1108 ( .A(n357), .B(n358), .Y(n344) );
  CLKINVX1 U1109 ( .A(n357), .Y(n1256) );
  CLKINVX1 U1110 ( .A(n505), .Y(n1246) );
  CLKINVX1 U1111 ( .A(n499), .Y(n1263) );
  CLKINVX1 U1112 ( .A(n317), .Y(n1255) );
  OA21XL U1113 ( .A0(n492), .A1(n516), .B0(n517), .Y(n241) );
  OR2X1 U1114 ( .A(n410), .B(n278), .Y(n384) );
  AND3X2 U1115 ( .A(n524), .B(n236), .C(n527), .Y(n546) );
  NAND2X1 U1116 ( .A(n1269), .B(n1272), .Y(n382) );
  NOR2X1 U1117 ( .A(n1293), .B(n1253), .Y(n273) );
  CLKINVX1 U1118 ( .A(n315), .Y(n1262) );
  CLKINVX1 U1119 ( .A(n306), .Y(n1295) );
  NAND2BX2 U1120 ( .AN(N502), .B(N503), .Y(n262) );
  CLKINVX1 U1121 ( .A(n1178), .Y(n1026) );
  CLKINVX1 U1122 ( .A(N46), .Y(n988) );
  CLKINVX1 U1123 ( .A(N51), .Y(n1063) );
  NOR2X1 U1124 ( .A(n809), .B(n1178), .Y(n1019) );
  NOR2X1 U1125 ( .A(n916), .B(N39), .Y(n911) );
  NOR2X1 U1126 ( .A(n805), .B(N42), .Y(n948) );
  NOR2X1 U1127 ( .A(n1026), .B(N48), .Y(n1022) );
  NOR2X1 U1128 ( .A(n1133), .B(n1134), .Y(n1129) );
  NOR2X1 U1129 ( .A(n916), .B(n915), .Y(n910) );
  NOR2X1 U1130 ( .A(n1063), .B(N52), .Y(n1057) );
  NAND2X2 U1131 ( .A(n215), .B(n210), .Y(n217) );
  NAND2X2 U1132 ( .A(n215), .B(n205), .Y(n214) );
  NOR2X2 U1133 ( .A(n197), .B(n207), .Y(n701) );
  NOR2X2 U1134 ( .A(n197), .B(n214), .Y(n725) );
  NOR2X2 U1135 ( .A(n197), .B(n216), .Y(n733) );
  NOR2X2 U1136 ( .A(n197), .B(n217), .Y(n741) );
  NOR2X2 U1137 ( .A(n770), .B(RST), .Y(n507) );
  NOR2X2 U1138 ( .A(n198), .B(n207), .Y(n702) );
  NOR2X2 U1139 ( .A(n198), .B(n214), .Y(n726) );
  NOR2X2 U1140 ( .A(n198), .B(n216), .Y(n734) );
  NOR2X2 U1141 ( .A(n198), .B(n217), .Y(n742) );
  NOR2X2 U1142 ( .A(n1173), .B(n207), .Y(n700) );
  NOR2X2 U1143 ( .A(n199), .B(n207), .Y(n703) );
  NOR2X2 U1144 ( .A(n1174), .B(n207), .Y(n704) );
  NOR2X2 U1145 ( .A(n201), .B(n207), .Y(n705) );
  NOR2X2 U1146 ( .A(n202), .B(n207), .Y(n706) );
  NOR2X2 U1147 ( .A(n203), .B(n207), .Y(n707) );
  NOR2X2 U1148 ( .A(n1173), .B(n216), .Y(n732) );
  NOR2X2 U1149 ( .A(n199), .B(n216), .Y(n735) );
  NOR2X2 U1150 ( .A(n1174), .B(n216), .Y(n736) );
  NOR2X2 U1151 ( .A(n201), .B(n216), .Y(n737) );
  NOR2X2 U1152 ( .A(n202), .B(n216), .Y(n738) );
  NOR2X2 U1153 ( .A(n203), .B(n216), .Y(n739) );
  NOR2X2 U1154 ( .A(n201), .B(n214), .Y(n729) );
  NOR2X2 U1155 ( .A(n201), .B(n217), .Y(n745) );
  NOR2X2 U1156 ( .A(n202), .B(n214), .Y(n730) );
  NOR2X2 U1157 ( .A(n202), .B(n217), .Y(n746) );
  NOR2X2 U1158 ( .A(n1173), .B(n214), .Y(n724) );
  NOR2X2 U1159 ( .A(n1174), .B(n214), .Y(n728) );
  NOR2X2 U1160 ( .A(n1173), .B(n217), .Y(n740) );
  NOR2X2 U1161 ( .A(n1174), .B(n217), .Y(n744) );
  NAND3BX1 U1162 ( .AN(n443), .B(n403), .C(n416), .Y(n353) );
  OAI22XL U1163 ( .A0(n309), .A1(n1299), .B0(n322), .B1(n311), .Y(n779) );
  NOR3X1 U1164 ( .A(n323), .B(n324), .C(n325), .Y(n322) );
  OAI22XL U1165 ( .A0(n1098), .A1(n315), .B0(n1297), .B1(n1266), .Y(n325) );
  OAI22XL U1166 ( .A0(n1278), .A1(n317), .B0(n987), .B1(n1270), .Y(n324) );
  OAI22XL U1167 ( .A0(n309), .A1(n914), .B0(n310), .B1(n311), .Y(n778) );
  NOR3X1 U1168 ( .A(n312), .B(n313), .C(n314), .Y(n310) );
  OAI22XL U1169 ( .A0(n1099), .A1(n315), .B0(n1277), .B1(n1266), .Y(n314) );
  OAI22XL U1170 ( .A0(n1025), .A1(n317), .B0(n1300), .B1(n1270), .Y(n313) );
  NAND3BX1 U1171 ( .AN(n507), .B(n1172), .C(n1171), .Y(n443) );
  OR2X1 U1172 ( .A(n559), .B(n1195), .Y(n194) );
  OAI31X1 U1173 ( .A0(n567), .A1(n568), .A2(n569), .B0(n566), .Y(n256) );
  NAND4X1 U1174 ( .A(n574), .B(n575), .C(n576), .D(n577), .Y(n568) );
  NAND4X1 U1175 ( .A(n570), .B(n571), .C(n572), .D(n573), .Y(n569) );
  NAND4X1 U1176 ( .A(n951), .B(n1025), .C(n578), .D(n579), .Y(n567) );
  NAND2X2 U1177 ( .A(n210), .B(n204), .Y(n209) );
  NAND3X2 U1178 ( .A(n1289), .B(n1290), .C(n204), .Y(n211) );
  NAND3X2 U1179 ( .A(n1289), .B(n1290), .C(n215), .Y(n218) );
  OAI21X1 U1180 ( .A0(n1195), .A1(n416), .B0(n417), .Y(n372) );
  NOR2X2 U1181 ( .A(n197), .B(n209), .Y(n709) );
  NOR2X2 U1182 ( .A(n197), .B(n211), .Y(n717) );
  NOR2X2 U1183 ( .A(n197), .B(n218), .Y(n749) );
  NOR2X2 U1184 ( .A(n198), .B(n209), .Y(n710) );
  NOR2X2 U1185 ( .A(n198), .B(n211), .Y(n718) );
  NOR2X2 U1186 ( .A(n198), .B(n218), .Y(n750) );
  NOR2X2 U1187 ( .A(n196), .B(n197), .Y(n693) );
  NOR2X2 U1188 ( .A(n201), .B(n209), .Y(n713) );
  NOR2X2 U1189 ( .A(n201), .B(n211), .Y(n721) );
  NOR2X2 U1190 ( .A(n201), .B(n218), .Y(n753) );
  NOR2X2 U1191 ( .A(n202), .B(n209), .Y(n714) );
  NOR2X2 U1192 ( .A(n202), .B(n211), .Y(n722) );
  NOR2X2 U1193 ( .A(n202), .B(n218), .Y(n754) );
  NOR2X2 U1194 ( .A(n196), .B(n198), .Y(n694) );
  NOR2X2 U1195 ( .A(n196), .B(n201), .Y(n697) );
  NOR2X2 U1196 ( .A(n196), .B(n202), .Y(n698) );
  OAI222XL U1197 ( .A0(n1174), .A1(n555), .B0(RST), .B1(n1285), .C0(n557), 
        .C1(n1286), .Y(n796) );
  CLKINVX1 U1198 ( .A(n220), .Y(n1285) );
  NOR2X2 U1199 ( .A(n1173), .B(n209), .Y(n708) );
  NOR2X2 U1200 ( .A(n1174), .B(n209), .Y(n712) );
  NOR2X2 U1201 ( .A(n1173), .B(n211), .Y(n716) );
  NOR2X2 U1202 ( .A(n1174), .B(n211), .Y(n720) );
  NOR2X2 U1203 ( .A(n1173), .B(n218), .Y(n748) );
  NOR2X2 U1204 ( .A(n1174), .B(n218), .Y(n752) );
  NOR2X2 U1205 ( .A(n194), .B(n195), .Y(n692) );
  NOR2X2 U1206 ( .A(n196), .B(n1174), .Y(n696) );
  OAI32X1 U1207 ( .A0(n372), .A1(RST), .A2(n393), .B0(n1239), .B1(n1273), .Y(
        n785) );
  NOR4X1 U1208 ( .A(n394), .B(n395), .C(n396), .D(n397), .Y(n393) );
  OAI22XL U1209 ( .A0(n952), .A1(n384), .B0(n1273), .B1(n1274), .Y(n394) );
  OAI22XL U1210 ( .A0(n380), .A1(n1133), .B0(n1298), .B1(n381), .Y(n396) );
  OAI32X1 U1211 ( .A0(n418), .A1(RST), .A2(n1238), .B0(n420), .B1(n1297), .Y(
        n786) );
  NOR3X1 U1212 ( .A(n421), .B(n422), .C(n423), .Y(n418) );
  OAI22XL U1213 ( .A0(n1296), .A1(n426), .B0(n1278), .B1(n427), .Y(n422) );
  OAI22XL U1214 ( .A0(n424), .A1(n1260), .B0(n1299), .B1(n425), .Y(n423) );
  OAI32X1 U1215 ( .A0(n438), .A1(RST), .A2(n1238), .B0(n420), .B1(n1277), .Y(
        n788) );
  NOR3X1 U1216 ( .A(n444), .B(n445), .C(n446), .Y(n438) );
  OAI22XL U1217 ( .A0(n951), .A1(n426), .B0(n1025), .B1(n427), .Y(n445) );
  OAI22XL U1218 ( .A0(n424), .A1(n1257), .B0(n914), .B1(n425), .Y(n446) );
  OAI32X1 U1219 ( .A0(n1282), .A1(RST), .A2(n1236), .B0(n1281), .B1(n256), .Y(
        n767) );
  OAI21X1 U1220 ( .A0(n1173), .A1(n559), .B0(n566), .Y(n564) );
  OAI22XL U1221 ( .A0(n563), .A1(n1290), .B0(n1287), .B1(n560), .Y(n801) );
  CLKINVX1 U1222 ( .A(n210), .Y(n1287) );
  OAI22XL U1223 ( .A0(n507), .A1(n515), .B0(n510), .B1(n1134), .Y(n793) );
  NOR4X1 U1224 ( .A(n518), .B(n519), .C(n520), .D(n521), .Y(n515) );
  OAI22XL U1225 ( .A0(n239), .A1(n1260), .B0(n1247), .B1(n1297), .Y(n520) );
  OAI22XL U1226 ( .A0(n1296), .A1(n236), .B0(n1240), .B1(n1278), .Y(n521) );
  OAI22XL U1227 ( .A0(n507), .A1(n550), .B0(n539), .B1(n1260), .Y(n795) );
  NOR4X1 U1228 ( .A(n551), .B(n552), .C(n553), .D(n554), .Y(n550) );
  OAI22XL U1229 ( .A0(n548), .A1(n1098), .B0(n549), .B1(n1297), .Y(n552) );
  OAI22XL U1230 ( .A0(n544), .A1(n1134), .B0(n1249), .B1(n1278), .Y(n554) );
  OAI22XL U1231 ( .A0(n1292), .A1(n256), .B0(n1236), .B1(n194), .Y(n802) );
  OAI22XL U1232 ( .A0(n385), .A1(n372), .B0(n373), .B1(n1278), .Y(n784) );
  NOR4X1 U1233 ( .A(n389), .B(n390), .C(n391), .D(n392), .Y(n385) );
  OAI22XL U1234 ( .A0(n380), .A1(n1134), .B0(n987), .B1(n381), .Y(n391) );
  OAI22XL U1235 ( .A0(n1297), .A1(n382), .B0(n1299), .B1(n383), .Y(n390) );
  OAI22XL U1236 ( .A0(n507), .A1(n509), .B0(n510), .B1(n1133), .Y(n792) );
  NOR4X1 U1237 ( .A(n511), .B(n512), .C(n513), .D(n514), .Y(n509) );
  OAI22XL U1238 ( .A0(n239), .A1(n1261), .B0(n1247), .B1(n1280), .Y(n513) );
  OAI22XL U1239 ( .A0(n952), .A1(n236), .B0(n1240), .B1(n1273), .Y(n514) );
  OAI22XL U1240 ( .A0(n507), .A1(n538), .B0(n539), .B1(n1261), .Y(n794) );
  NOR4X1 U1241 ( .A(n540), .B(n541), .C(n542), .D(n543), .Y(n538) );
  OAI22XL U1242 ( .A0(n548), .A1(n1279), .B0(n549), .B1(n1280), .Y(n541) );
  OAI22XL U1243 ( .A0(n544), .A1(n1133), .B0(n1249), .B1(n1273), .Y(n543) );
  OAI22XL U1244 ( .A0(n1238), .A1(n431), .B0(n432), .B1(n1280), .Y(n787) );
  NOR4X1 U1245 ( .A(n434), .B(n435), .C(n436), .D(n437), .Y(n431) );
  NOR2X1 U1246 ( .A(n1238), .B(n433), .Y(n432) );
  OAI22XL U1247 ( .A0(n916), .A1(n425), .B0(n952), .B1(n426), .Y(n435) );
  OAI22XL U1248 ( .A0(n1237), .A1(n475), .B0(n476), .B1(n1279), .Y(n790) );
  NOR4X1 U1249 ( .A(n477), .B(n478), .C(n479), .D(n480), .Y(n475) );
  OAI22XL U1250 ( .A0(n473), .A1(n1280), .B0(n468), .B1(n1133), .Y(n479) );
  OAI22XL U1251 ( .A0(n916), .A1(n474), .B0(n472), .B1(n1261), .Y(n480) );
  OA21XL U1252 ( .A0(n559), .A1(n195), .B0(n1194), .Y(n566) );
  INVX3 U1253 ( .A(n1195), .Y(n1193) );
  INVX3 U1254 ( .A(RST), .Y(n1194) );
  OAI21XL U1255 ( .A0(n916), .A1(n535), .B0(n1193), .Y(n540) );
  OAI21XL U1256 ( .A0(n916), .A1(n233), .B0(n1193), .Y(n511) );
  OAI21XL U1257 ( .A0(n951), .A1(n384), .B0(n1193), .Y(n374) );
  OAI21XL U1258 ( .A0(n951), .A1(n471), .B0(n1193), .Y(n486) );
  OAI21XL U1259 ( .A0(n952), .A1(n471), .B0(n1193), .Y(n477) );
  NAND3X1 U1260 ( .A(n680), .B(n1098), .C(N51), .Y(n678) );
  OAI221XL U1261 ( .A0(N50), .A1(n1099), .B0(N51), .B1(n1098), .C0(n680), .Y(
        n679) );
  NAND3X1 U1262 ( .A(n416), .B(n1171), .C(n414), .Y(n495) );
  AOI2BB2X1 U1263 ( .B0(n491), .B1(n536), .A0N(n537), .A1N(n523), .Y(n229) );
  NOR3X1 U1264 ( .A(n401), .B(n1269), .C(n505), .Y(n537) );
  NOR2X1 U1265 ( .A(n1290), .B(n1289), .Y(n205) );
  NOR2X1 U1266 ( .A(n403), .B(n1268), .Y(n449) );
  NAND2X1 U1267 ( .A(n359), .B(n403), .Y(n410) );
  NOR3X1 U1268 ( .A(n1272), .B(n1268), .C(n339), .Y(n453) );
  CLKINVX1 U1269 ( .A(n588), .Y(n1294) );
  OAI22XL U1270 ( .A0(n546), .A1(n1300), .B0(n1244), .B1(n951), .Y(n591) );
  NOR2X1 U1271 ( .A(n588), .B(n1276), .Y(n359) );
  OAI22XL U1272 ( .A0(n1250), .A1(n1300), .B0(n233), .B1(n914), .Y(n225) );
  NAND2BX1 U1273 ( .AN(n498), .B(n1172), .Y(n523) );
  OAI21XL U1274 ( .A0(n342), .A1(n363), .B0(n594), .Y(n528) );
  NAND2X1 U1275 ( .A(n341), .B(n594), .Y(n527) );
  NAND2X1 U1276 ( .A(n453), .B(n1171), .Y(n483) );
  NOR2X1 U1277 ( .A(n587), .B(n1294), .Y(n582) );
  NAND2X1 U1278 ( .A(n449), .B(n1171), .Y(n498) );
  NAND2X1 U1279 ( .A(n452), .B(n1171), .Y(n501) );
  NAND3X1 U1280 ( .A(n628), .B(n1172), .C(n1265), .Y(n524) );
  NAND3BX1 U1281 ( .AN(n370), .B(n1241), .C(n459), .Y(n628) );
  NAND3X1 U1282 ( .A(n1245), .B(n1172), .C(n1265), .Y(n525) );
  NOR3BX2 U1283 ( .AN(n595), .B(n408), .C(n363), .Y(n342) );
  NOR2BX2 U1284 ( .AN(n631), .B(n632), .Y(n283) );
  NOR2X2 U1285 ( .A(n595), .B(n341), .Y(n343) );
  NOR2BX1 U1286 ( .AN(n1171), .B(n416), .Y(n494) );
  NOR2BX1 U1287 ( .AN(n643), .B(n401), .Y(n505) );
  AOI21X1 U1288 ( .A0(n448), .A1(n449), .B0(n450), .Y(n424) );
  NAND3X1 U1289 ( .A(n1246), .B(n1263), .C(n451), .Y(n448) );
  NOR2BX1 U1290 ( .AN(n608), .B(n609), .Y(n303) );
  OAI22XL U1291 ( .A0(n658), .A1(n659), .B0(N61), .B1(n1280), .Y(n657) );
  NOR2X1 U1292 ( .A(N51), .B(n1260), .Y(n659) );
  NOR2BX1 U1293 ( .AN(n400), .B(n401), .Y(n379) );
  OAI211X1 U1294 ( .A0(n342), .A1(n1258), .B0(n403), .C0(n1276), .Y(n400) );
  AOI2BB2X1 U1295 ( .B0(n457), .B1(n452), .A0N(n416), .A1N(n458), .Y(n428) );
  NAND3BX1 U1296 ( .AN(n412), .B(n278), .C(n459), .Y(n457) );
  NAND3XL U1297 ( .A(n403), .B(n416), .C(n334), .Y(n441) );
  OAI2BB2X1 U1298 ( .B0(n361), .B1(n1275), .A0N(n363), .A1N(n1259), .Y(n335)
         );
  NOR3X1 U1299 ( .A(n365), .B(n1262), .C(n304), .Y(n361) );
  NOR2X1 U1300 ( .A(n643), .B(n1269), .Y(n499) );
  OAI22XL U1301 ( .A0(n378), .A1(n1099), .B0(n379), .B1(n1257), .Y(n377) );
  OAI22XL U1302 ( .A0(n469), .A1(n1025), .B0(n1300), .B1(n470), .Y(n487) );
  CLKINVX1 U1303 ( .A(n408), .Y(n1259) );
  NOR2X1 U1304 ( .A(n504), .B(n610), .Y(n357) );
  NAND2X1 U1305 ( .A(n449), .B(n401), .Y(n427) );
  NAND3X1 U1306 ( .A(n1265), .B(n1172), .C(n369), .Y(n236) );
  NAND2X1 U1307 ( .A(n587), .B(n588), .Y(n306) );
  CLKINVX1 U1308 ( .A(n504), .Y(n1253) );
  NAND2X1 U1309 ( .A(n494), .B(n1172), .Y(n516) );
  OA22X1 U1310 ( .A0(n1171), .A1(n491), .B0(n497), .B1(n498), .Y(n468) );
  NOR3X1 U1311 ( .A(n401), .B(n499), .C(n1269), .Y(n497) );
  OA22X1 U1312 ( .A0(n642), .A1(n523), .B0(n516), .B1(n458), .Y(n549) );
  NOR3X1 U1313 ( .A(n401), .B(n499), .C(n505), .Y(n642) );
  NAND2X1 U1314 ( .A(n606), .B(n625), .Y(n459) );
  OAI22XL U1315 ( .A0(n468), .A1(n1134), .B0(n469), .B1(n1278), .Y(n466) );
  NOR2X1 U1316 ( .A(n360), .B(n631), .Y(n606) );
  NAND3X1 U1317 ( .A(n453), .B(n363), .C(n1259), .Y(n430) );
  NOR3X1 U1318 ( .A(n304), .B(n504), .C(n305), .Y(n532) );
  NAND2X1 U1319 ( .A(n359), .B(n360), .Y(n345) );
  NOR2X1 U1320 ( .A(n952), .B(N52), .Y(n573) );
  NOR2X1 U1321 ( .A(n1298), .B(N61), .Y(n572) );
  NOR2X1 U1322 ( .A(n1171), .B(n1252), .Y(n536) );
  CLKINVX1 U1323 ( .A(n593), .Y(n1249) );
  OAI211X1 U1324 ( .A0(n523), .A1(n451), .B0(n534), .C0(n528), .Y(n593) );
  NAND2X1 U1325 ( .A(n605), .B(n606), .Y(n502) );
  NOR2X1 U1326 ( .A(n504), .B(n614), .Y(n618) );
  NOR4X1 U1327 ( .A(n343), .B(n342), .C(n341), .D(n408), .Y(n454) );
  CLKINVX1 U1328 ( .A(n453), .Y(n1267) );
  NOR2X1 U1329 ( .A(n1299), .B(n1176), .Y(n577) );
  NAND2X1 U1330 ( .A(N61), .B(n1133), .Y(n662) );
  NOR2BX1 U1331 ( .AN(n490), .B(n491), .Y(n472) );
  OAI21XL U1332 ( .A0(n492), .A1(n1264), .B0(n494), .Y(n490) );
  CLKINVX1 U1333 ( .A(n458), .Y(n1264) );
  CLKINVX1 U1334 ( .A(n485), .Y(n1258) );
  AOI211X1 U1335 ( .A0(n363), .A1(n1259), .B0(n341), .C0(n343), .Y(n485) );
  NAND2BX1 U1336 ( .AN(n491), .B(n536), .Y(n529) );
  OA21XL U1337 ( .A0(n482), .A1(n483), .B0(n484), .Y(n462) );
  NOR2X1 U1338 ( .A(n408), .B(n1258), .Y(n482) );
  NAND2BX1 U1339 ( .AN(n484), .B(n1172), .Y(n517) );
  NAND2BX1 U1340 ( .AN(n441), .B(n1171), .Y(n484) );
  INVX3 U1341 ( .A(n1178), .Y(n1273) );
  AND2X2 U1342 ( .A(n529), .B(n1172), .Y(n239) );
  INVX3 U1343 ( .A(N51), .Y(n1297) );
  INVX3 U1344 ( .A(N61), .Y(n1261) );
  INVX3 U1345 ( .A(N50), .Y(n1277) );
  INVX3 U1346 ( .A(n1177), .Y(n1299) );
  NAND2X1 U1347 ( .A(n408), .B(n403), .Y(n381) );
  OAI211X1 U1348 ( .A0(n1298), .A1(n1270), .B0(n1261), .C0(n585), .Y(n583) );
  AOI2BB2X1 U1349 ( .B0(n447), .B1(N52), .A0N(n317), .A1N(n1273), .Y(n585) );
  NAND2X1 U1350 ( .A(n1292), .B(n1281), .Y(n559) );
  NOR2X1 U1351 ( .A(n491), .B(n1252), .Y(n544) );
  NOR4X1 U1352 ( .A(n1300), .B(n1277), .C(n914), .D(n1282), .Y(n579) );
  CLKINVX1 U1353 ( .A(n770), .Y(n1282) );
  NOR2X1 U1354 ( .A(n1273), .B(N55), .Y(n571) );
  INVX3 U1355 ( .A(N55), .Y(n1279) );
  NAND3BXL U1356 ( .AN(n262), .B(n265), .C(n1326), .Y(n261) );
  OAI22XL U1357 ( .A0(n264), .A1(n1302), .B0(n1325), .B1(n261), .Y(n773) );
  NOR2X4 U1358 ( .A(n1133), .B(n860), .Y(n1130) );
  NOR2X4 U1359 ( .A(n1279), .B(N54), .Y(n1095) );
  NOR2X4 U1360 ( .A(N57), .B(N58), .Y(n1126) );
  NOR2X4 U1361 ( .A(n1134), .B(N58), .Y(n1127) );
  CLKINVX1 U1362 ( .A(TotalCost[1]), .Y(n1224) );
  OAI21XL U1363 ( .A0(n265), .A1(n1301), .B0(n267), .Y(n774) );
  ADDFXL U1364 ( .A(N85), .B(N113), .CI(
        \add_4_root_add_0_root_add_18_7/carry [4]), .CO(
        \add_4_root_add_0_root_add_18_7/carry [5]), .S(N169) );
  ADDFXL U1365 ( .A(N99), .B(N71), .CI(
        \add_3_root_add_0_root_add_18_7/carry [4]), .CO(
        \add_3_root_add_0_root_add_18_7/carry [5]), .S(N130) );
  ADDFXL U1366 ( .A(N91), .B(N63), .CI(
        \add_5_root_add_0_root_add_18_7/carry [5]), .CO(
        \add_5_root_add_0_root_add_18_7/carry [6]), .S(N140) );
  CLKINVX1 U1367 ( .A(n250), .Y(n1231) );
  AOI221XL U1368 ( .A0(TotalCost[4]), .A1(n1233), .B0(MinCost[4]), .B1(n1175), 
        .C0(n1195), .Y(n250) );
  CLKINVX1 U1369 ( .A(n247), .Y(n1229) );
  AOI221XL U1370 ( .A0(TotalCost[7]), .A1(n1233), .B0(MinCost[7]), .B1(n1175), 
        .C0(RST), .Y(n247) );
  CLKINVX1 U1371 ( .A(n248), .Y(n1230) );
  AOI221XL U1372 ( .A0(TotalCost[6]), .A1(n1233), .B0(MinCost[6]), .B1(n1175), 
        .C0(n1195), .Y(n248) );
  CLKINVX1 U1373 ( .A(n252), .Y(n1232) );
  AOI221XL U1374 ( .A0(TotalCost[2]), .A1(n1233), .B0(MinCost[2]), .B1(n1175), 
        .C0(n1195), .Y(n252) );
  INVXL U1375 ( .A(MinCost[2]), .Y(n1222) );
  OAI22XL U1376 ( .A0(n284), .A1(n952), .B0(n293), .B1(n1234), .Y(n777) );
  AOI222XL U1377 ( .A0(N61), .A1(n275), .B0(n273), .B1(n845), .C0(n1294), .C1(
        n294), .Y(n293) );
  OAI221XL U1378 ( .A0(n1133), .A1(n278), .B0(n1273), .B1(n1243), .C0(n297), 
        .Y(n294) );
  AOI222XL U1379 ( .A0(n283), .A1(N55), .B0(n1245), .B1(N46), .C0(n1242), .C1(
        N52), .Y(n297) );
  OAI22XL U1380 ( .A0(n284), .A1(n1296), .B0(n286), .B1(n1234), .Y(n776) );
  AOI222XL U1381 ( .A0(N60), .A1(n275), .B0(n273), .B1(n1177), .C0(n1294), 
        .C1(n288), .Y(n286) );
  OAI221XL U1382 ( .A0(n1134), .A1(n278), .B0(n1278), .B1(n1243), .C0(n291), 
        .Y(n288) );
  AOI222XL U1383 ( .A0(n283), .A1(N54), .B0(n1245), .B1(n1176), .C0(n1242), 
        .C1(N51), .Y(n291) );
  OAI22XL U1384 ( .A0(n580), .A1(n311), .B0(n581), .B1(n916), .Y(n803) );
  NOR2X1 U1385 ( .A(n308), .B(n1235), .Y(n581) );
  OAI22XL U1386 ( .A0(n1133), .A1(n1256), .B0(n1279), .B1(n315), .Y(n584) );
  OAI32XL U1387 ( .A0(n555), .A1(n1321), .A2(n1283), .B0(n557), .B1(n1284), 
        .Y(n797) );
  OAI32XL U1388 ( .A0(n560), .A1(n1317), .A2(n1288), .B0(n562), .B1(n1291), 
        .Y(n799) );
  CLKINVX1 U1389 ( .A(n205), .Y(n1288) );
  OA21XL U1390 ( .A0(n1318), .A1(RST), .B0(n563), .Y(n562) );
  OAI22XL U1391 ( .A0(n1283), .A1(n558), .B0(n1322), .B1(n555), .Y(n798) );
  OAI22XL U1392 ( .A0(n1289), .A1(n564), .B0(n1319), .B1(n560), .Y(n800) );
  INVXL U1393 ( .A(MinCost[6]), .Y(n1220) );
  INVXL U1394 ( .A(MinCost[7]), .Y(n1219) );
  OAI32X1 U1395 ( .A0(n346), .A1(RST), .A2(n331), .B0(n347), .B1(n1300), .Y(
        n781) );
  AOI221XL U1396 ( .A0(N59), .A1(n340), .B0(n335), .B1(N56), .C0(n349), .Y(
        n346) );
  OAI222XL U1397 ( .A0(n951), .A1(n345), .B0(n914), .B1(n344), .C0(n350), .C1(
        n339), .Y(n349) );
  AOI222XL U1398 ( .A0(n341), .A1(N47), .B0(n342), .B1(N53), .C0(n343), .C1(
        N50), .Y(n350) );
  OAI32X1 U1399 ( .A0(n351), .A1(RST), .A2(n331), .B0(n347), .B1(n1298), .Y(
        n782) );
  AOI221XL U1400 ( .A0(N61), .A1(n340), .B0(N58), .B1(n335), .C0(n354), .Y(
        n351) );
  OAI222XL U1401 ( .A0(n952), .A1(n345), .B0(n916), .B1(n344), .C0(n356), .C1(
        n339), .Y(n354) );
  AOI222XL U1402 ( .A0(n341), .A1(n1178), .B0(n342), .B1(N55), .C0(n343), .C1(
        N52), .Y(n356) );
  OAI22XL U1403 ( .A0(n1237), .A1(n481), .B0(n476), .B1(n1099), .Y(n791) );
  NOR4X1 U1404 ( .A(n486), .B(n487), .C(n488), .D(n489), .Y(n481) );
  OAI22XL U1405 ( .A0(n473), .A1(n1277), .B0(n1135), .B1(n468), .Y(n488) );
  OAI22XL U1406 ( .A0(n914), .A1(n474), .B0(n472), .B1(n1257), .Y(n489) );
  OAI22XL U1407 ( .A0(n507), .A1(n586), .B0(n539), .B1(n1257), .Y(n804) );
  NOR4X1 U1408 ( .A(n589), .B(n590), .C(n591), .D(n592), .Y(n586) );
  OAI22XL U1409 ( .A0(n548), .A1(n1099), .B0(n549), .B1(n1277), .Y(n590) );
  OAI22XL U1410 ( .A0(n1135), .A1(n544), .B0(n1249), .B1(n1025), .Y(n592) );
  OAI22XL U1411 ( .A0(n371), .A1(n372), .B0(n373), .B1(n1025), .Y(n783) );
  NOR4X1 U1412 ( .A(n374), .B(n375), .C(n376), .D(n377), .Y(n371) );
  OAI22XL U1413 ( .A0(n1135), .A1(n380), .B0(n1300), .B1(n381), .Y(n376) );
  OAI22XL U1414 ( .A0(n1277), .A1(n382), .B0(n914), .B1(n383), .Y(n375) );
  OAI22XL U1415 ( .A0(n331), .A1(n332), .B0(n333), .B1(n987), .Y(n780) );
  NOR2X1 U1416 ( .A(n331), .B(n334), .Y(n333) );
  OAI2BB2XL U1417 ( .B0(n338), .B1(n339), .A0N(n340), .A1N(N60), .Y(n337) );
  OA21XL U1418 ( .A0(n1319), .A1(n1195), .B0(n564), .Y(n563) );
  OAI21XL U1419 ( .A0(n1235), .A1(n270), .B0(n271), .Y(n775) );
  OAI21XL U1420 ( .A0(n1235), .A1(n1295), .B0(N41), .Y(n271) );
  AO22X1 U1421 ( .A0(n275), .A1(N59), .B0(n276), .B1(n1294), .Y(n274) );
  OAI21XL U1422 ( .A0(n462), .A1(n1098), .B0(n463), .Y(n461) );
  OAI31XL U1423 ( .A0(n464), .A1(n465), .A2(n466), .B0(n467), .Y(n463) );
  OAI222XL U1424 ( .A0(n472), .A1(n1260), .B0(n473), .B1(n1297), .C0(n1299), 
        .C1(n474), .Y(n464) );
  OAI22XL U1425 ( .A0(state[0]), .A1(n1281), .B0(n689), .B1(n1292), .Y(n691)
         );
  CLKBUFX3 U1426 ( .A(Cost[0]), .Y(n1179) );
  CLKBUFX3 U1427 ( .A(Cost[1]), .Y(n1181) );
  CLKBUFX3 U1428 ( .A(Cost[2]), .Y(n1183) );
  CLKBUFX3 U1429 ( .A(Cost[3]), .Y(n1185) );
  CLKBUFX3 U1430 ( .A(Cost[4]), .Y(n1187) );
  CLKBUFX3 U1431 ( .A(Cost[5]), .Y(n1189) );
  CLKBUFX3 U1432 ( .A(Cost[6]), .Y(n1191) );
  CLKBUFX3 U1433 ( .A(Cost[0]), .Y(n1180) );
  CLKBUFX3 U1434 ( .A(Cost[1]), .Y(n1182) );
  CLKBUFX3 U1435 ( .A(Cost[2]), .Y(n1184) );
  CLKBUFX3 U1436 ( .A(Cost[4]), .Y(n1188) );
  CLKBUFX3 U1437 ( .A(Cost[5]), .Y(n1190) );
  CLKBUFX3 U1438 ( .A(Cost[3]), .Y(n1186) );
  CLKBUFX3 U1439 ( .A(Cost[6]), .Y(n1192) );
  OAI221XL U1440 ( .A0(N44), .A1(n1025), .B0(n1176), .B1(n1278), .C0(n668), 
        .Y(n667) );
  CLKINVX2 U1441 ( .A(n1322), .Y(n1283) );
  OAI211X1 U1442 ( .A0(N46), .A1(n952), .B0(n669), .C0(n670), .Y(n588) );
  OAI221XL U1443 ( .A0(N41), .A1(n1300), .B0(N42), .B1(n987), .C0(n671), .Y(
        n670) );
  NOR2X1 U1444 ( .A(n1286), .B(n1321), .Y(n220) );
  NOR2X1 U1445 ( .A(n1289), .B(n1318), .Y(n210) );
  NAND3BXL U1446 ( .AN(n1173), .B(n205), .C(n1317), .Y(n195) );
  CLKBUFX3 U1447 ( .A(n206), .Y(n1173) );
  NAND3XL U1448 ( .A(n1321), .B(n1322), .C(n1320), .Y(n206) );
  OR4X1 U1449 ( .A(n223), .B(n224), .C(n225), .D(n226), .Y(n756) );
  OAI22XL U1450 ( .A0(n239), .A1(n1257), .B0(n1135), .B1(n241), .Y(n223) );
  OAI22XL U1451 ( .A0(n951), .A1(n236), .B0(n1240), .B1(n1025), .Y(n224) );
  OAI22XL U1452 ( .A0(n1247), .A1(n1277), .B0(n229), .B1(n1099), .Y(n226) );
  OAI221XL U1453 ( .A0(N47), .A1(n1277), .B0(N48), .B1(n1297), .C0(n665), .Y(
        n664) );
  OAI22XL U1454 ( .A0(n650), .A1(n651), .B0(N61), .B1(n1273), .Y(n649) );
  AOI21X2 U1455 ( .A0(N52), .A1(n1298), .B0(n622), .Y(n341) );
  OAI21XL U1456 ( .A0(N51), .A1(n987), .B0(N50), .Y(n624) );
  OAI22X2 U1457 ( .A0(N46), .A1(n1261), .B0(n599), .B1(n572), .Y(n408) );
  OA21XL U1458 ( .A0(n1176), .A1(n1260), .B0(n600), .Y(n599) );
  AOI222XL U1459 ( .A0(n341), .A1(N48), .B0(n342), .B1(N54), .C0(n343), .C1(
        N51), .Y(n338) );
  OAI22X1 U1460 ( .A0(n1178), .A1(n1279), .B0(n644), .B1(n571), .Y(n451) );
  OA21XL U1461 ( .A0(N48), .A1(n1098), .B0(n645), .Y(n644) );
  OAI21X1 U1462 ( .A0(N43), .A1(n1261), .B0(n633), .Y(n360) );
  OAI22XL U1463 ( .A0(n634), .A1(n635), .B0(N61), .B1(n952), .Y(n633) );
  NOR2X1 U1464 ( .A(N42), .B(n1260), .Y(n635) );
  AOI211X1 U1465 ( .A0(N42), .A1(n1260), .B0(n1257), .C0(N41), .Y(n634) );
  OAI22XL U1466 ( .A0(n597), .A1(n598), .B0(N58), .B1(n1298), .Y(n596) );
  OAI22XL U1467 ( .A0(n640), .A1(n641), .B0(N55), .B1(n952), .Y(n639) );
  OAI22XL U1468 ( .A0(n687), .A1(n688), .B0(N61), .B1(n916), .Y(n686) );
  OA21XL U1469 ( .A0(N42), .A1(n1297), .B0(n630), .Y(n629) );
  OAI221XL U1470 ( .A0(n278), .A1(n1135), .B0(n1243), .B1(n1025), .C0(n280), 
        .Y(n276) );
  AOI222XL U1471 ( .A0(N50), .A1(n1242), .B0(N44), .B1(n1245), .C0(N53), .C1(
        n283), .Y(n280) );
  OAI21X1 U1472 ( .A0(N52), .A1(n1133), .B0(n655), .Y(n458) );
  OAI21XL U1473 ( .A0(N58), .A1(n1280), .B0(n656), .Y(n655) );
  OA21XL U1474 ( .A0(n1177), .A1(n1134), .B0(n613), .Y(n612) );
  OAI22XL U1475 ( .A0(n616), .A1(n617), .B0(N55), .B1(n916), .Y(n615) );
  OAI22XL U1476 ( .A0(n620), .A1(n621), .B0(n1178), .B1(n916), .Y(n619) );
  OAI22XL U1477 ( .A0(n684), .A1(n685), .B0(N52), .B1(n916), .Y(n683) );
  OAI22XL U1478 ( .A0(N54), .A1(n1134), .B0(n1135), .B1(N53), .Y(n677) );
  OAI21XL U1479 ( .A0(N46), .A1(n916), .B0(n682), .Y(n681) );
  OAI22XL U1480 ( .A0(n637), .A1(n638), .B0(N58), .B1(n952), .Y(n636) );
  OAI22XL U1481 ( .A0(n602), .A1(n603), .B0(N55), .B1(n1298), .Y(n601) );
  OAI22XL U1482 ( .A0(n647), .A1(n648), .B0(N58), .B1(n1273), .Y(n646) );
  OAI21XL U1483 ( .A0(n1178), .A1(n952), .B0(n627), .Y(n626) );
  CLKBUFX3 U1484 ( .A(n200), .Y(n1174) );
  NAND3XL U1485 ( .A(n1322), .B(n1286), .C(n1321), .Y(n200) );
  CLKBUFX3 U1486 ( .A(n530), .Y(n1172) );
  OAI221XL U1487 ( .A0(n860), .A1(n1260), .B0(n1257), .B1(N56), .C0(n662), .Y(
        n661) );
  CLKBUFX3 U1488 ( .A(n496), .Y(n1171) );
  OAI21XL U1489 ( .A0(N58), .A1(n1279), .B0(n675), .Y(n496) );
  OAI21XL U1490 ( .A0(N55), .A1(n1133), .B0(n676), .Y(n675) );
  OAI21XL U1491 ( .A0(n860), .A1(n1098), .B0(n677), .Y(n676) );
  OAI21XL U1492 ( .A0(N61), .A1(n1279), .B0(n654), .Y(n653) );
  AO22X1 U1493 ( .A0(\cost_data[0][3][0] ), .A1(n908), .B0(
        \cost_data[0][1][0] ), .B1(n907), .Y(n882) );
  AO22X1 U1494 ( .A0(\cost_data[0][3][1] ), .A1(n908), .B0(
        \cost_data[0][1][1] ), .B1(n907), .Y(n886) );
  AO22X1 U1495 ( .A0(\cost_data[0][2][1] ), .A1(n908), .B0(
        \cost_data[0][0][1] ), .B1(n907), .Y(n887) );
  AO22X1 U1496 ( .A0(\cost_data[0][3][2] ), .A1(n908), .B0(
        \cost_data[0][1][2] ), .B1(n907), .Y(n890) );
  AO22X1 U1497 ( .A0(\cost_data[0][2][2] ), .A1(n908), .B0(
        \cost_data[0][0][2] ), .B1(n907), .Y(n891) );
  OAI22XL U1498 ( .A0(n914), .A1(n893), .B0(N38), .B1(n892), .Y(N66) );
  AO22X1 U1499 ( .A0(\cost_data[0][3][3] ), .A1(n908), .B0(
        \cost_data[0][1][3] ), .B1(n907), .Y(n894) );
  AOI221XL U1500 ( .A0(\cost_data[0][5][3] ), .A1(n917), .B0(
        \cost_data[0][7][3] ), .B1(n918), .C0(n894), .Y(n897) );
  AO22X1 U1501 ( .A0(\cost_data[0][2][3] ), .A1(n908), .B0(
        \cost_data[0][0][3] ), .B1(n907), .Y(n895) );
  AOI221XL U1502 ( .A0(\cost_data[0][4][3] ), .A1(n917), .B0(
        \cost_data[0][6][3] ), .B1(n918), .C0(n895), .Y(n896) );
  AO22X1 U1503 ( .A0(\cost_data[0][3][4] ), .A1(n908), .B0(
        \cost_data[0][1][4] ), .B1(n907), .Y(n898) );
  AOI221XL U1504 ( .A0(\cost_data[0][5][4] ), .A1(n917), .B0(
        \cost_data[0][7][4] ), .B1(n918), .C0(n898), .Y(n901) );
  AO22X1 U1505 ( .A0(\cost_data[0][2][4] ), .A1(n908), .B0(
        \cost_data[0][0][4] ), .B1(n907), .Y(n899) );
  AOI221XL U1506 ( .A0(\cost_data[0][4][4] ), .A1(n917), .B0(
        \cost_data[0][6][4] ), .B1(n918), .C0(n899), .Y(n900) );
  OAI22XL U1507 ( .A0(n914), .A1(n901), .B0(N38), .B1(n900), .Y(N64) );
  AO22X1 U1508 ( .A0(\cost_data[0][3][5] ), .A1(n908), .B0(
        \cost_data[0][1][5] ), .B1(n907), .Y(n902) );
  AOI221XL U1509 ( .A0(\cost_data[0][5][5] ), .A1(n917), .B0(
        \cost_data[0][7][5] ), .B1(n918), .C0(n902), .Y(n905) );
  AO22X1 U1510 ( .A0(\cost_data[0][2][5] ), .A1(n908), .B0(
        \cost_data[0][0][5] ), .B1(n907), .Y(n903) );
  AOI221XL U1511 ( .A0(\cost_data[0][4][5] ), .A1(n917), .B0(
        \cost_data[0][6][5] ), .B1(n918), .C0(n903), .Y(n904) );
  OAI22XL U1512 ( .A0(n914), .A1(n905), .B0(N38), .B1(n904), .Y(N63) );
  AO22X1 U1513 ( .A0(\cost_data[0][3][6] ), .A1(n908), .B0(
        \cost_data[0][1][6] ), .B1(n907), .Y(n906) );
  AOI221XL U1514 ( .A0(\cost_data[0][5][6] ), .A1(n917), .B0(
        \cost_data[0][7][6] ), .B1(n918), .C0(n906), .Y(n913) );
  AO22X1 U1515 ( .A0(\cost_data[0][2][6] ), .A1(n908), .B0(
        \cost_data[0][0][6] ), .B1(n907), .Y(n909) );
  AOI221XL U1516 ( .A0(\cost_data[0][4][6] ), .A1(n917), .B0(
        \cost_data[0][6][6] ), .B1(n918), .C0(n909), .Y(n912) );
  OAI22XL U1517 ( .A0(n913), .A1(n914), .B0(N38), .B1(n912), .Y(N62) );
  AO22X1 U1518 ( .A0(\cost_data[1][3][1] ), .A1(n945), .B0(
        \cost_data[1][1][1] ), .B1(n944), .Y(n923) );
  AO22X1 U1519 ( .A0(\cost_data[1][3][3] ), .A1(n945), .B0(
        \cost_data[1][1][3] ), .B1(n944), .Y(n931) );
  AOI221XL U1520 ( .A0(\cost_data[1][5][3] ), .A1(n953), .B0(
        \cost_data[1][7][3] ), .B1(n954), .C0(n931), .Y(n934) );
  AO22X1 U1521 ( .A0(\cost_data[1][2][3] ), .A1(n945), .B0(
        \cost_data[1][0][3] ), .B1(n944), .Y(n932) );
  AOI221XL U1522 ( .A0(\cost_data[1][4][3] ), .A1(n953), .B0(
        \cost_data[1][6][3] ), .B1(n954), .C0(n932), .Y(n933) );
  OAI22XL U1523 ( .A0(n951), .A1(n934), .B0(N41), .B1(n933), .Y(N72) );
  AO22X1 U1524 ( .A0(\cost_data[1][3][4] ), .A1(n945), .B0(
        \cost_data[1][1][4] ), .B1(n944), .Y(n935) );
  AOI221XL U1525 ( .A0(\cost_data[1][5][4] ), .A1(n953), .B0(
        \cost_data[1][7][4] ), .B1(n954), .C0(n935), .Y(n938) );
  AO22X1 U1526 ( .A0(\cost_data[1][2][4] ), .A1(n945), .B0(
        \cost_data[1][0][4] ), .B1(n944), .Y(n936) );
  AOI221XL U1527 ( .A0(\cost_data[1][4][4] ), .A1(n953), .B0(
        \cost_data[1][6][4] ), .B1(n954), .C0(n936), .Y(n937) );
  OAI22XL U1528 ( .A0(n951), .A1(n938), .B0(N41), .B1(n937), .Y(N71) );
  AO22X1 U1529 ( .A0(\cost_data[1][3][5] ), .A1(n945), .B0(
        \cost_data[1][1][5] ), .B1(n944), .Y(n939) );
  AOI221XL U1530 ( .A0(\cost_data[1][5][5] ), .A1(n953), .B0(
        \cost_data[1][7][5] ), .B1(n954), .C0(n939), .Y(n942) );
  AO22X1 U1531 ( .A0(\cost_data[1][2][5] ), .A1(n945), .B0(
        \cost_data[1][0][5] ), .B1(n944), .Y(n940) );
  AOI221XL U1532 ( .A0(\cost_data[1][4][5] ), .A1(n953), .B0(
        \cost_data[1][6][5] ), .B1(n954), .C0(n940), .Y(n941) );
  OAI22XL U1533 ( .A0(n951), .A1(n942), .B0(N41), .B1(n941), .Y(N70) );
  AO22X1 U1534 ( .A0(\cost_data[1][3][6] ), .A1(n945), .B0(
        \cost_data[1][1][6] ), .B1(n944), .Y(n943) );
  AOI221XL U1535 ( .A0(\cost_data[1][5][6] ), .A1(n953), .B0(
        \cost_data[1][7][6] ), .B1(n954), .C0(n943), .Y(n950) );
  AO22X1 U1536 ( .A0(\cost_data[1][2][6] ), .A1(n945), .B0(
        \cost_data[1][0][6] ), .B1(n944), .Y(n946) );
  AOI221XL U1537 ( .A0(\cost_data[1][4][6] ), .A1(n953), .B0(
        \cost_data[1][6][6] ), .B1(n954), .C0(n946), .Y(n949) );
  OAI22XL U1538 ( .A0(n950), .A1(n951), .B0(N41), .B1(n949), .Y(N69) );
  AO22X1 U1539 ( .A0(\cost_data[2][3][0] ), .A1(n991), .B0(
        \cost_data[2][1][0] ), .B1(n992), .Y(n955) );
  AO22X1 U1540 ( .A0(\cost_data[2][2][0] ), .A1(n991), .B0(
        \cost_data[2][0][0] ), .B1(n992), .Y(n956) );
  AO22X1 U1541 ( .A0(\cost_data[2][2][1] ), .A1(n991), .B0(
        \cost_data[2][0][1] ), .B1(n992), .Y(n960) );
  AO22X1 U1542 ( .A0(\cost_data[2][3][2] ), .A1(n991), .B0(
        \cost_data[2][1][2] ), .B1(n992), .Y(n963) );
  AOI221XL U1543 ( .A0(\cost_data[2][5][2] ), .A1(n989), .B0(
        \cost_data[2][7][2] ), .B1(n990), .C0(n963), .Y(n966) );
  AO22X1 U1544 ( .A0(\cost_data[2][2][2] ), .A1(n991), .B0(
        \cost_data[2][0][2] ), .B1(n992), .Y(n964) );
  AOI221XL U1545 ( .A0(\cost_data[2][4][2] ), .A1(n989), .B0(
        \cost_data[2][6][2] ), .B1(n990), .C0(n964), .Y(n965) );
  AO22X1 U1546 ( .A0(\cost_data[2][3][3] ), .A1(n991), .B0(
        \cost_data[2][1][3] ), .B1(n992), .Y(n967) );
  AOI221XL U1547 ( .A0(\cost_data[2][5][3] ), .A1(n989), .B0(
        \cost_data[2][7][3] ), .B1(n990), .C0(n967), .Y(n970) );
  AOI221XL U1548 ( .A0(\cost_data[2][4][3] ), .A1(n989), .B0(
        \cost_data[2][6][3] ), .B1(n990), .C0(n968), .Y(n969) );
  OAI22XL U1549 ( .A0(n1300), .A1(n970), .B0(N44), .B1(n969), .Y(N79) );
  AO22X1 U1550 ( .A0(\cost_data[2][3][4] ), .A1(n991), .B0(
        \cost_data[2][1][4] ), .B1(n992), .Y(n971) );
  AOI221XL U1551 ( .A0(\cost_data[2][5][4] ), .A1(n989), .B0(
        \cost_data[2][7][4] ), .B1(n990), .C0(n971), .Y(n974) );
  AO22X1 U1552 ( .A0(\cost_data[2][2][4] ), .A1(n991), .B0(
        \cost_data[2][0][4] ), .B1(n992), .Y(n972) );
  AOI221XL U1553 ( .A0(\cost_data[2][4][4] ), .A1(n989), .B0(
        \cost_data[2][6][4] ), .B1(n990), .C0(n972), .Y(n973) );
  OAI22XL U1554 ( .A0(n1300), .A1(n974), .B0(N44), .B1(n973), .Y(N78) );
  AO22X1 U1555 ( .A0(\cost_data[2][3][5] ), .A1(n991), .B0(
        \cost_data[2][1][5] ), .B1(n992), .Y(n975) );
  AOI221XL U1556 ( .A0(\cost_data[2][5][5] ), .A1(n989), .B0(
        \cost_data[2][7][5] ), .B1(n990), .C0(n975), .Y(n978) );
  AO22X1 U1557 ( .A0(\cost_data[2][2][5] ), .A1(n991), .B0(
        \cost_data[2][0][5] ), .B1(n992), .Y(n976) );
  AOI221XL U1558 ( .A0(\cost_data[2][4][5] ), .A1(n989), .B0(
        \cost_data[2][6][5] ), .B1(n990), .C0(n976), .Y(n977) );
  OAI22XL U1559 ( .A0(n1300), .A1(n978), .B0(N44), .B1(n977), .Y(N77) );
  AO22X1 U1560 ( .A0(\cost_data[2][3][6] ), .A1(n991), .B0(
        \cost_data[2][1][6] ), .B1(n992), .Y(n979) );
  AOI221XL U1561 ( .A0(\cost_data[2][5][6] ), .A1(n989), .B0(
        \cost_data[2][7][6] ), .B1(n990), .C0(n979), .Y(n986) );
  AO22X1 U1562 ( .A0(\cost_data[2][2][6] ), .A1(n991), .B0(
        \cost_data[2][0][6] ), .B1(n992), .Y(n982) );
  AOI221XL U1563 ( .A0(\cost_data[2][4][6] ), .A1(n989), .B0(
        \cost_data[2][6][6] ), .B1(n990), .C0(n982), .Y(n985) );
  OAI22XL U1564 ( .A0(n986), .A1(n1300), .B0(N44), .B1(n985), .Y(N76) );
  AO22X1 U1565 ( .A0(\cost_data[3][3][0] ), .A1(n1029), .B0(
        \cost_data[3][1][0] ), .B1(n1030), .Y(n993) );
  AO22X1 U1566 ( .A0(\cost_data[3][2][0] ), .A1(n1029), .B0(
        \cost_data[3][0][0] ), .B1(n1030), .Y(n994) );
  AO22X1 U1567 ( .A0(\cost_data[3][3][1] ), .A1(n1029), .B0(
        \cost_data[3][1][1] ), .B1(n1030), .Y(n997) );
  AO22X1 U1568 ( .A0(\cost_data[3][2][1] ), .A1(n1029), .B0(
        \cost_data[3][0][1] ), .B1(n1030), .Y(n998) );
  AO22X1 U1569 ( .A0(\cost_data[3][3][2] ), .A1(n1029), .B0(
        \cost_data[3][1][2] ), .B1(n1030), .Y(n1001) );
  AO22X1 U1570 ( .A0(\cost_data[3][2][2] ), .A1(n1029), .B0(
        \cost_data[3][0][2] ), .B1(n1030), .Y(n1002) );
  AO22X1 U1571 ( .A0(\cost_data[3][3][3] ), .A1(n1029), .B0(
        \cost_data[3][1][3] ), .B1(n1030), .Y(n1005) );
  AOI221XL U1572 ( .A0(\cost_data[3][5][3] ), .A1(n1027), .B0(
        \cost_data[3][7][3] ), .B1(n1028), .C0(n1005), .Y(n1008) );
  AO22X1 U1573 ( .A0(\cost_data[3][2][3] ), .A1(n1029), .B0(
        \cost_data[3][0][3] ), .B1(n1030), .Y(n1006) );
  AOI221XL U1574 ( .A0(\cost_data[3][4][3] ), .A1(n1027), .B0(
        \cost_data[3][6][3] ), .B1(n1028), .C0(n1006), .Y(n1007) );
  OAI22XL U1575 ( .A0(n1025), .A1(n1008), .B0(N47), .B1(n1007), .Y(N86) );
  AO22X1 U1576 ( .A0(\cost_data[3][3][4] ), .A1(n1029), .B0(
        \cost_data[3][1][4] ), .B1(n1030), .Y(n1009) );
  AOI221XL U1577 ( .A0(\cost_data[3][5][4] ), .A1(n1027), .B0(
        \cost_data[3][7][4] ), .B1(n1028), .C0(n1009), .Y(n1012) );
  AO22X1 U1578 ( .A0(\cost_data[3][2][4] ), .A1(n1029), .B0(
        \cost_data[3][0][4] ), .B1(n1030), .Y(n1010) );
  AOI221XL U1579 ( .A0(\cost_data[3][4][4] ), .A1(n1027), .B0(
        \cost_data[3][6][4] ), .B1(n1028), .C0(n1010), .Y(n1011) );
  OAI22XL U1580 ( .A0(n1025), .A1(n1012), .B0(N47), .B1(n1011), .Y(N85) );
  AO22X1 U1581 ( .A0(\cost_data[3][3][5] ), .A1(n1029), .B0(
        \cost_data[3][1][5] ), .B1(n1030), .Y(n1013) );
  AOI221XL U1582 ( .A0(\cost_data[3][5][5] ), .A1(n1027), .B0(
        \cost_data[3][7][5] ), .B1(n1028), .C0(n1013), .Y(n1016) );
  AO22X1 U1583 ( .A0(\cost_data[3][2][5] ), .A1(n1029), .B0(
        \cost_data[3][0][5] ), .B1(n1030), .Y(n1014) );
  AOI221XL U1584 ( .A0(\cost_data[3][4][5] ), .A1(n1027), .B0(
        \cost_data[3][6][5] ), .B1(n1028), .C0(n1014), .Y(n1015) );
  OAI22XL U1585 ( .A0(n1025), .A1(n1016), .B0(N47), .B1(n1015), .Y(N84) );
  AO22X1 U1586 ( .A0(\cost_data[3][3][6] ), .A1(n1029), .B0(
        \cost_data[3][1][6] ), .B1(n1030), .Y(n1017) );
  AOI221XL U1587 ( .A0(\cost_data[3][5][6] ), .A1(n1027), .B0(
        \cost_data[3][7][6] ), .B1(n1028), .C0(n1017), .Y(n1024) );
  AO22X1 U1588 ( .A0(\cost_data[3][2][6] ), .A1(n1029), .B0(
        \cost_data[3][0][6] ), .B1(n1030), .Y(n1020) );
  AOI221XL U1589 ( .A0(\cost_data[3][4][6] ), .A1(n1027), .B0(
        \cost_data[3][6][6] ), .B1(n1028), .C0(n1020), .Y(n1023) );
  OAI22XL U1590 ( .A0(n1024), .A1(n1025), .B0(N47), .B1(n1023), .Y(N83) );
  AO22X1 U1591 ( .A0(\cost_data[4][3][0] ), .A1(n1065), .B0(
        \cost_data[4][1][0] ), .B1(n1066), .Y(n1031) );
  AO22X1 U1592 ( .A0(\cost_data[4][2][0] ), .A1(n1065), .B0(
        \cost_data[4][0][0] ), .B1(n1066), .Y(n1032) );
  AO22X1 U1593 ( .A0(\cost_data[4][3][1] ), .A1(n1065), .B0(
        \cost_data[4][1][1] ), .B1(n1066), .Y(n1035) );
  AO22X1 U1594 ( .A0(\cost_data[4][2][1] ), .A1(n1065), .B0(
        \cost_data[4][0][1] ), .B1(n1066), .Y(n1036) );
  AO22X1 U1595 ( .A0(\cost_data[4][3][2] ), .A1(n1065), .B0(
        \cost_data[4][1][2] ), .B1(n1066), .Y(n1039) );
  AOI221XL U1596 ( .A0(\cost_data[4][5][2] ), .A1(n1060), .B0(
        \cost_data[4][7][2] ), .B1(n1064), .C0(n1039), .Y(n1042) );
  AO22X1 U1597 ( .A0(\cost_data[4][2][2] ), .A1(n1065), .B0(
        \cost_data[4][0][2] ), .B1(n1066), .Y(n1040) );
  AOI221XL U1598 ( .A0(\cost_data[4][4][2] ), .A1(n1060), .B0(
        \cost_data[4][6][2] ), .B1(n1064), .C0(n1040), .Y(n1041) );
  OAI22XL U1599 ( .A0(n1277), .A1(n1042), .B0(N50), .B1(n1041), .Y(N94) );
  AO22X1 U1600 ( .A0(\cost_data[4][3][3] ), .A1(n1065), .B0(
        \cost_data[4][1][3] ), .B1(n1066), .Y(n1043) );
  AOI221XL U1601 ( .A0(\cost_data[4][5][3] ), .A1(n1060), .B0(
        \cost_data[4][7][3] ), .B1(n1064), .C0(n1043), .Y(n1046) );
  AO22X1 U1602 ( .A0(\cost_data[4][2][3] ), .A1(n1065), .B0(
        \cost_data[4][0][3] ), .B1(n1066), .Y(n1044) );
  AOI221XL U1603 ( .A0(\cost_data[4][4][3] ), .A1(n1060), .B0(
        \cost_data[4][6][3] ), .B1(n1064), .C0(n1044), .Y(n1045) );
  OAI22XL U1604 ( .A0(n1277), .A1(n1046), .B0(N50), .B1(n1045), .Y(N93) );
  AOI221XL U1605 ( .A0(\cost_data[4][5][4] ), .A1(n1060), .B0(
        \cost_data[4][7][4] ), .B1(n1064), .C0(n1047), .Y(n1050) );
  AOI221XL U1606 ( .A0(\cost_data[4][4][4] ), .A1(n1060), .B0(
        \cost_data[4][6][4] ), .B1(n1064), .C0(n1048), .Y(n1049) );
  OAI22XL U1607 ( .A0(n1277), .A1(n1050), .B0(N50), .B1(n1049), .Y(N92) );
  AOI221XL U1608 ( .A0(\cost_data[4][5][5] ), .A1(n1060), .B0(
        \cost_data[4][7][5] ), .B1(n1064), .C0(n1051), .Y(n1054) );
  AOI221XL U1609 ( .A0(\cost_data[4][4][5] ), .A1(n1060), .B0(
        \cost_data[4][6][5] ), .B1(n1064), .C0(n1052), .Y(n1053) );
  OAI22XL U1610 ( .A0(n1277), .A1(n1054), .B0(N50), .B1(n1053), .Y(N91) );
  AOI221XL U1611 ( .A0(\cost_data[4][5][6] ), .A1(n1060), .B0(
        \cost_data[4][7][6] ), .B1(n1064), .C0(n1055), .Y(n1062) );
  AOI221XL U1612 ( .A0(\cost_data[4][4][6] ), .A1(n1060), .B0(
        \cost_data[4][6][6] ), .B1(n1064), .C0(n1058), .Y(n1061) );
  OAI22XL U1613 ( .A0(n1062), .A1(n1277), .B0(N50), .B1(n1061), .Y(N90) );
  AO22X1 U1614 ( .A0(\cost_data[5][3][0] ), .A1(n1100), .B0(
        \cost_data[5][1][0] ), .B1(n1092), .Y(n1067) );
  AO22X1 U1615 ( .A0(\cost_data[5][2][0] ), .A1(n1100), .B0(
        \cost_data[5][0][0] ), .B1(n1092), .Y(n1068) );
  AO22X1 U1616 ( .A0(\cost_data[5][3][1] ), .A1(n1100), .B0(
        \cost_data[5][1][1] ), .B1(n1092), .Y(n1071) );
  AO22X1 U1617 ( .A0(\cost_data[5][2][1] ), .A1(n1100), .B0(
        \cost_data[5][0][1] ), .B1(n1092), .Y(n1072) );
  AO22X1 U1618 ( .A0(\cost_data[5][3][2] ), .A1(n1100), .B0(
        \cost_data[5][1][2] ), .B1(n1092), .Y(n1075) );
  AO22X1 U1619 ( .A0(\cost_data[5][2][2] ), .A1(n1100), .B0(
        \cost_data[5][0][2] ), .B1(n1092), .Y(n1076) );
  AO22X1 U1620 ( .A0(\cost_data[5][3][3] ), .A1(n1100), .B0(
        \cost_data[5][1][3] ), .B1(n1092), .Y(n1079) );
  AOI221XL U1621 ( .A0(\cost_data[5][5][3] ), .A1(n1095), .B0(
        \cost_data[5][7][3] ), .B1(n844), .C0(n1079), .Y(n1082) );
  AO22X1 U1622 ( .A0(\cost_data[5][2][3] ), .A1(n1100), .B0(
        \cost_data[5][0][3] ), .B1(n1092), .Y(n1080) );
  AOI221XL U1623 ( .A0(\cost_data[5][4][3] ), .A1(n1095), .B0(
        \cost_data[5][6][3] ), .B1(n844), .C0(n1080), .Y(n1081) );
  OAI22XL U1624 ( .A0(n1099), .A1(n1082), .B0(N53), .B1(n1081), .Y(N100) );
  AO22X1 U1625 ( .A0(\cost_data[5][3][4] ), .A1(n1100), .B0(
        \cost_data[5][1][4] ), .B1(n1092), .Y(n1083) );
  AOI221XL U1626 ( .A0(\cost_data[5][5][4] ), .A1(n1095), .B0(
        \cost_data[5][7][4] ), .B1(n844), .C0(n1083), .Y(n1086) );
  AO22X1 U1627 ( .A0(\cost_data[5][2][4] ), .A1(n1100), .B0(
        \cost_data[5][0][4] ), .B1(n1092), .Y(n1084) );
  AOI221XL U1628 ( .A0(\cost_data[5][4][4] ), .A1(n1095), .B0(
        \cost_data[5][6][4] ), .B1(n844), .C0(n1084), .Y(n1085) );
  OAI22XL U1629 ( .A0(n1099), .A1(n1086), .B0(N53), .B1(n1085), .Y(N99) );
  AO22X1 U1630 ( .A0(\cost_data[5][3][5] ), .A1(n1100), .B0(
        \cost_data[5][1][5] ), .B1(n1092), .Y(n1087) );
  AOI221XL U1631 ( .A0(\cost_data[5][5][5] ), .A1(n1095), .B0(
        \cost_data[5][7][5] ), .B1(n844), .C0(n1087), .Y(n1090) );
  AO22X1 U1632 ( .A0(\cost_data[5][2][5] ), .A1(n1100), .B0(
        \cost_data[5][0][5] ), .B1(n1092), .Y(n1088) );
  AOI221XL U1633 ( .A0(\cost_data[5][4][5] ), .A1(n1095), .B0(
        \cost_data[5][6][5] ), .B1(n844), .C0(n1088), .Y(n1089) );
  OAI22XL U1634 ( .A0(n1099), .A1(n1090), .B0(N53), .B1(n1089), .Y(N98) );
  AO22X1 U1635 ( .A0(\cost_data[5][3][6] ), .A1(n1100), .B0(
        \cost_data[5][1][6] ), .B1(n1092), .Y(n1091) );
  AOI221XL U1636 ( .A0(\cost_data[5][5][6] ), .A1(n1095), .B0(
        \cost_data[5][7][6] ), .B1(n844), .C0(n1091), .Y(n1097) );
  AO22X1 U1637 ( .A0(\cost_data[5][2][6] ), .A1(n1100), .B0(
        \cost_data[5][0][6] ), .B1(n1092), .Y(n1094) );
  AOI221XL U1638 ( .A0(\cost_data[5][4][6] ), .A1(n1095), .B0(
        \cost_data[5][6][6] ), .B1(n844), .C0(n1094), .Y(n1096) );
  OAI22XL U1639 ( .A0(n1097), .A1(n1099), .B0(N53), .B1(n1096), .Y(N97) );
  AO22X1 U1640 ( .A0(\cost_data[6][3][0] ), .A1(n1127), .B0(
        \cost_data[6][1][0] ), .B1(n1126), .Y(n1101) );
  AOI221XL U1641 ( .A0(\cost_data[6][5][0] ), .A1(n1130), .B0(
        \cost_data[6][7][0] ), .B1(n1136), .C0(n1101), .Y(n1104) );
  AO22X1 U1642 ( .A0(\cost_data[6][2][0] ), .A1(n1127), .B0(
        \cost_data[6][0][0] ), .B1(n1126), .Y(n1102) );
  AOI221XL U1643 ( .A0(\cost_data[6][4][0] ), .A1(n1130), .B0(
        \cost_data[6][6][0] ), .B1(n1136), .C0(n1102), .Y(n1103) );
  AO22X1 U1644 ( .A0(\cost_data[6][3][1] ), .A1(n1127), .B0(
        \cost_data[6][1][1] ), .B1(n1126), .Y(n1105) );
  AO22X1 U1645 ( .A0(\cost_data[6][2][1] ), .A1(n1127), .B0(
        \cost_data[6][0][1] ), .B1(n1126), .Y(n1106) );
  AO22X1 U1646 ( .A0(\cost_data[6][3][2] ), .A1(n1127), .B0(
        \cost_data[6][1][2] ), .B1(n1126), .Y(n1109) );
  AOI221XL U1647 ( .A0(\cost_data[6][5][2] ), .A1(n1130), .B0(
        \cost_data[6][7][2] ), .B1(n1136), .C0(n1109), .Y(n1112) );
  AO22X1 U1648 ( .A0(\cost_data[6][2][2] ), .A1(n1127), .B0(
        \cost_data[6][0][2] ), .B1(n1126), .Y(n1110) );
  AOI221XL U1649 ( .A0(\cost_data[6][4][2] ), .A1(n1130), .B0(
        \cost_data[6][6][2] ), .B1(n1136), .C0(n1110), .Y(n1111) );
  OAI22XL U1650 ( .A0(n1135), .A1(n1112), .B0(N56), .B1(n1111), .Y(N108) );
  AO22X1 U1651 ( .A0(\cost_data[6][3][3] ), .A1(n1127), .B0(
        \cost_data[6][1][3] ), .B1(n1126), .Y(n1113) );
  AOI221XL U1652 ( .A0(\cost_data[6][5][3] ), .A1(n1130), .B0(
        \cost_data[6][7][3] ), .B1(n1136), .C0(n1113), .Y(n1116) );
  AO22X1 U1653 ( .A0(\cost_data[6][2][3] ), .A1(n1127), .B0(
        \cost_data[6][0][3] ), .B1(n1126), .Y(n1114) );
  AOI221XL U1654 ( .A0(\cost_data[6][4][3] ), .A1(n1130), .B0(
        \cost_data[6][6][3] ), .B1(n1136), .C0(n1114), .Y(n1115) );
  OAI22XL U1655 ( .A0(n1135), .A1(n1116), .B0(N56), .B1(n1115), .Y(N107) );
  AO22X1 U1656 ( .A0(\cost_data[6][3][4] ), .A1(n1127), .B0(
        \cost_data[6][1][4] ), .B1(n1126), .Y(n1117) );
  AOI221XL U1657 ( .A0(\cost_data[6][5][4] ), .A1(n1130), .B0(
        \cost_data[6][7][4] ), .B1(n1136), .C0(n1117), .Y(n1120) );
  AO22X1 U1658 ( .A0(\cost_data[6][2][4] ), .A1(n1127), .B0(
        \cost_data[6][0][4] ), .B1(n1126), .Y(n1118) );
  AOI221XL U1659 ( .A0(\cost_data[6][4][4] ), .A1(n1130), .B0(
        \cost_data[6][6][4] ), .B1(n1136), .C0(n1118), .Y(n1119) );
  OAI22XL U1660 ( .A0(n1135), .A1(n1120), .B0(N56), .B1(n1119), .Y(N106) );
  AO22X1 U1661 ( .A0(\cost_data[6][3][5] ), .A1(n1127), .B0(
        \cost_data[6][1][5] ), .B1(n1126), .Y(n1121) );
  AOI221XL U1662 ( .A0(\cost_data[6][5][5] ), .A1(n1130), .B0(
        \cost_data[6][7][5] ), .B1(n1136), .C0(n1121), .Y(n1124) );
  AO22X1 U1663 ( .A0(\cost_data[6][2][5] ), .A1(n1127), .B0(
        \cost_data[6][0][5] ), .B1(n1126), .Y(n1122) );
  AOI221XL U1664 ( .A0(\cost_data[6][4][5] ), .A1(n1130), .B0(
        \cost_data[6][6][5] ), .B1(n1136), .C0(n1122), .Y(n1123) );
  OAI22XL U1665 ( .A0(n1135), .A1(n1124), .B0(N56), .B1(n1123), .Y(N105) );
  AO22X1 U1666 ( .A0(\cost_data[6][3][6] ), .A1(n1127), .B0(
        \cost_data[6][1][6] ), .B1(n1126), .Y(n1125) );
  AOI221XL U1667 ( .A0(\cost_data[6][5][6] ), .A1(n1130), .B0(
        \cost_data[6][7][6] ), .B1(n1136), .C0(n1125), .Y(n1132) );
  AO22X1 U1668 ( .A0(\cost_data[6][2][6] ), .A1(n1127), .B0(
        \cost_data[6][0][6] ), .B1(n1126), .Y(n1128) );
  AOI221XL U1669 ( .A0(\cost_data[6][4][6] ), .A1(n1130), .B0(
        \cost_data[6][6][6] ), .B1(n1136), .C0(n1128), .Y(n1131) );
  OAI22XL U1670 ( .A0(n1132), .A1(n1135), .B0(N56), .B1(n1131), .Y(N104) );
  OAI22XL U1671 ( .A0(n1257), .A1(n1148), .B0(N59), .B1(n1147), .Y(N115) );
  AO22X1 U1672 ( .A0(\cost_data[7][3][3] ), .A1(n1170), .B0(
        \cost_data[7][1][3] ), .B1(n820), .Y(n1149) );
  AOI221XL U1673 ( .A0(\cost_data[7][5][3] ), .A1(n808), .B0(
        \cost_data[7][7][3] ), .B1(n1165), .C0(n1149), .Y(n1152) );
  AO22X1 U1674 ( .A0(\cost_data[7][2][3] ), .A1(n1170), .B0(
        \cost_data[7][0][3] ), .B1(n820), .Y(n1150) );
  AOI221XL U1675 ( .A0(\cost_data[7][4][3] ), .A1(n808), .B0(
        \cost_data[7][6][3] ), .B1(n1165), .C0(n1150), .Y(n1151) );
  OAI22XL U1676 ( .A0(n1257), .A1(n1152), .B0(N59), .B1(n1151), .Y(N114) );
  AO22X1 U1677 ( .A0(\cost_data[7][3][4] ), .A1(n1170), .B0(
        \cost_data[7][1][4] ), .B1(n820), .Y(n1153) );
  AOI221XL U1678 ( .A0(\cost_data[7][5][4] ), .A1(n808), .B0(
        \cost_data[7][7][4] ), .B1(n1165), .C0(n1153), .Y(n1156) );
  AO22X1 U1679 ( .A0(\cost_data[7][2][4] ), .A1(n1170), .B0(
        \cost_data[7][0][4] ), .B1(n820), .Y(n1154) );
  AOI221XL U1680 ( .A0(\cost_data[7][4][4] ), .A1(n808), .B0(
        \cost_data[7][6][4] ), .B1(n1165), .C0(n1154), .Y(n1155) );
  OAI22XL U1681 ( .A0(n1257), .A1(n1156), .B0(N59), .B1(n1155), .Y(N113) );
  AO22X1 U1682 ( .A0(\cost_data[7][3][5] ), .A1(n1170), .B0(
        \cost_data[7][1][5] ), .B1(n820), .Y(n1157) );
  AOI221XL U1683 ( .A0(\cost_data[7][5][5] ), .A1(n808), .B0(
        \cost_data[7][7][5] ), .B1(n1165), .C0(n1157), .Y(n1160) );
  AO22X1 U1684 ( .A0(\cost_data[7][2][5] ), .A1(n1170), .B0(
        \cost_data[7][0][5] ), .B1(n820), .Y(n1158) );
  AOI221XL U1685 ( .A0(\cost_data[7][4][5] ), .A1(n808), .B0(
        \cost_data[7][6][5] ), .B1(n1165), .C0(n1158), .Y(n1159) );
  OAI22XL U1686 ( .A0(n1257), .A1(n1160), .B0(N59), .B1(n1159), .Y(N112) );
  AO22X1 U1687 ( .A0(\cost_data[7][3][6] ), .A1(n1170), .B0(
        \cost_data[7][1][6] ), .B1(n820), .Y(n1161) );
  AOI221XL U1688 ( .A0(\cost_data[7][5][6] ), .A1(n808), .B0(
        \cost_data[7][7][6] ), .B1(n1165), .C0(n1161), .Y(n1168) );
  AO22X1 U1689 ( .A0(\cost_data[7][2][6] ), .A1(n1170), .B0(
        \cost_data[7][0][6] ), .B1(n820), .Y(n1164) );
  AOI221XL U1690 ( .A0(\cost_data[7][4][6] ), .A1(n808), .B0(
        \cost_data[7][6][6] ), .B1(n1165), .C0(n1164), .Y(n1167) );
  OAI22XL U1691 ( .A0(n1168), .A1(n1257), .B0(N59), .B1(n1167), .Y(N111) );
  OAI21XL U1692 ( .A0(N502), .A1(n1301), .B0(n265), .Y(n267) );
  OAI22XL U1693 ( .A0(TotalCost[1]), .A1(n1196), .B0(n1196), .B1(n1223), .Y(
        n1198) );
  NAND2X1 U1694 ( .A(TotalCost[7]), .B(n1219), .Y(n1210) );
  NAND2X1 U1695 ( .A(TotalCost[6]), .B(n1220), .Y(n1205) );
  NAND3X1 U1696 ( .A(n1198), .B(n1210), .C(n1197), .Y(n1217) );
  NAND2X1 U1697 ( .A(TotalCost[9]), .B(n1218), .Y(n1213) );
  NAND2X1 U1698 ( .A(TotalCost[2]), .B(n1222), .Y(n1212) );
  OAI211X1 U1699 ( .A0(n1201), .A1(n1224), .B0(n1200), .C0(n1212), .Y(n1202)
         );
  OAI221XL U1700 ( .A0(TotalCost[2]), .A1(n1222), .B0(TotalCost[3]), .B1(n1221), .C0(n1202), .Y(n1203) );
endmodule

