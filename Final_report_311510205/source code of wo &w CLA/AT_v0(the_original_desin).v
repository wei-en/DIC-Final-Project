//////////////////////////// sub module 1-bit Full Adder /////////////////////////////////////////

module FA( A, B, Cin, S, Cout );
input A, B, Cin;
output S, Cout;

assign S  = (A ^ B) ^ Cin;
assign Cout = (A & B) | (B & Cin) | (Cin & A);
endmodule

//////////////////////////// Main Module Adder Tree ///////////////////////////////////////////////
module AT(
        //input
    A,
    out_data

);

input   [127:0] A;
output reg [7:0]   out_data;

// layer one 
wire [63:0]S_l1_1b, Cout_l1_2b;
// layer two
wire [31:0]S_l2_1b, S_l2_2b, Cout_l2_3b;
wire [31:0]Cout_l2_2b;
// layer three
wire [15:0]S_l3_1b, S_l3_2b, S_l3_3b, Cout_l3_4b;
wire [15:0]Cout_l3_2b, Cout_l3_3b;
// layer four
wire [7:0]S_l4_1b, S_l4_2b, S_l4_3b, S_l4_4b, Cout_l4_5b;
wire [7:0]Cout_l4_2b, Cout_l4_3b, Cout_l4_4b;
// layer five 
wire [3:0]S_l5_1b, S_l5_2b, S_l5_3b, S_l5_4b, S_l5_5b, Cout_l5_6b;
wire [3:0]Cout_l5_2b, Cout_l5_3b, Cout_l5_4b, Cout_l5_5b;
// layer six 
wire [1:0]S_l6_1b, S_l6_2b, S_l6_3b, S_l6_4b, S_l6_5b, S_l6_6b, Cout_l6_7b;
wire [1:0]Cout_l6_2b, Cout_l6_3b, Cout_l6_4b, Cout_l6_5b, Cout_l6_6b; 
// layer seven
wire [7:0]out;
wire Cout_l7_2b, Cout_l7_3b, Cout_l7_4b, Cout_l7_5b, Cout_l7_6b, Cout_l7_7b;

////////////////////////////  First layer  //////////////////////////////////////////
FA fa_1b_00(.A(A[0]),   .B(A[1]),   .Cin(1'b0), .S(S_l1_1b[0]),  .Cout(Cout_l1_2b[0]));
FA fa_1b_01(.A(A[2]),   .B(A[3]),   .Cin(1'b0), .S(S_l1_1b[1]),  .Cout(Cout_l1_2b[1]));
FA fa_1b_02(.A(A[4]),   .B(A[5]),   .Cin(1'b0), .S(S_l1_1b[2]),  .Cout(Cout_l1_2b[2]));
FA fa_1b_03(.A(A[6]),   .B(A[7]),   .Cin(1'b0), .S(S_l1_1b[3]),  .Cout(Cout_l1_2b[3]));
FA fa_1b_04(.A(A[8]),   .B(A[9]),   .Cin(1'b0), .S(S_l1_1b[4]),  .Cout(Cout_l1_2b[4]));
FA fa_1b_05(.A(A[10]),  .B(A[11]),  .Cin(1'b0), .S(S_l1_1b[5]),  .Cout(Cout_l1_2b[5]));
FA fa_1b_06(.A(A[12]),  .B(A[13]),  .Cin(1'b0), .S(S_l1_1b[6]),  .Cout(Cout_l1_2b[6]));
FA fa_1b_07(.A(A[14]),  .B(A[15]),  .Cin(1'b0), .S(S_l1_1b[7]),  .Cout(Cout_l1_2b[7]));
FA fa_1b_08(.A(A[16]),  .B(A[17]),  .Cin(1'b0), .S(S_l1_1b[8]),  .Cout(Cout_l1_2b[8]));
FA fa_1b_09(.A(A[18]),  .B(A[19]),  .Cin(1'b0), .S(S_l1_1b[9]),  .Cout(Cout_l1_2b[9]));
FA fa_1b_10(.A(A[20]),  .B(A[21]),  .Cin(1'b0), .S(S_l1_1b[10]), .Cout(Cout_l1_2b[10]));
FA fa_1b_11(.A(A[22]),  .B(A[23]),  .Cin(1'b0), .S(S_l1_1b[11]), .Cout(Cout_l1_2b[11]));
FA fa_1b_12(.A(A[24]),  .B(A[25]),  .Cin(1'b0), .S(S_l1_1b[12]), .Cout(Cout_l1_2b[12]));
FA fa_1b_13(.A(A[26]),  .B(A[27]),  .Cin(1'b0), .S(S_l1_1b[13]), .Cout(Cout_l1_2b[13]));
FA fa_1b_14(.A(A[28]),  .B(A[29]),  .Cin(1'b0), .S(S_l1_1b[14]), .Cout(Cout_l1_2b[14]));
FA fa_1b_15(.A(A[30]),  .B(A[31]),  .Cin(1'b0), .S(S_l1_1b[15]), .Cout(Cout_l1_2b[15]));
FA fa_1b_16(.A(A[32]),  .B(A[33]),  .Cin(1'b0), .S(S_l1_1b[16]), .Cout(Cout_l1_2b[16]));
FA fa_1b_17(.A(A[34]),  .B(A[35]),  .Cin(1'b0), .S(S_l1_1b[17]), .Cout(Cout_l1_2b[17]));
FA fa_1b_18(.A(A[36]),  .B(A[37]),  .Cin(1'b0), .S(S_l1_1b[18]), .Cout(Cout_l1_2b[18]));
FA fa_1b_19(.A(A[38]),  .B(A[39]),  .Cin(1'b0), .S(S_l1_1b[19]), .Cout(Cout_l1_2b[19]));
FA fa_1b_20(.A(A[40]),  .B(A[41]),  .Cin(1'b0), .S(S_l1_1b[20]), .Cout(Cout_l1_2b[20]));
FA fa_1b_21(.A(A[42]),  .B(A[43]),  .Cin(1'b0), .S(S_l1_1b[21]), .Cout(Cout_l1_2b[21]));
FA fa_1b_22(.A(A[44]),  .B(A[45]),  .Cin(1'b0), .S(S_l1_1b[22]), .Cout(Cout_l1_2b[22]));
FA fa_1b_23(.A(A[46]),  .B(A[47]),  .Cin(1'b0), .S(S_l1_1b[23]), .Cout(Cout_l1_2b[23]));
FA fa_1b_24(.A(A[48]),  .B(A[49]),  .Cin(1'b0), .S(S_l1_1b[24]), .Cout(Cout_l1_2b[24]));
FA fa_1b_25(.A(A[50]),  .B(A[51]),  .Cin(1'b0), .S(S_l1_1b[25]), .Cout(Cout_l1_2b[25]));
FA fa_1b_26(.A(A[52]),  .B(A[53]),  .Cin(1'b0), .S(S_l1_1b[26]), .Cout(Cout_l1_2b[26]));
FA fa_1b_27(.A(A[54]),  .B(A[55]),  .Cin(1'b0), .S(S_l1_1b[27]), .Cout(Cout_l1_2b[27]));
FA fa_1b_28(.A(A[56]),  .B(A[57]),  .Cin(1'b0), .S(S_l1_1b[28]), .Cout(Cout_l1_2b[28]));
FA fa_1b_29(.A(A[58]),  .B(A[59]),  .Cin(1'b0), .S(S_l1_1b[29]), .Cout(Cout_l1_2b[29]));
FA fa_1b_30(.A(A[60]),  .B(A[61]),  .Cin(1'b0), .S(S_l1_1b[30]), .Cout(Cout_l1_2b[30]));
FA fa_1b_31(.A(A[62]),  .B(A[63]),  .Cin(1'b0), .S(S_l1_1b[31]), .Cout(Cout_l1_2b[31]));
FA fa_1b_32(.A(A[64]),  .B(A[65]),  .Cin(1'b0), .S(S_l1_1b[32]), .Cout(Cout_l1_2b[32]));
FA fa_1b_33(.A(A[66]),  .B(A[67]),  .Cin(1'b0), .S(S_l1_1b[33]), .Cout(Cout_l1_2b[33]));
FA fa_1b_34(.A(A[68]),  .B(A[69]),  .Cin(1'b0), .S(S_l1_1b[34]), .Cout(Cout_l1_2b[34]));
FA fa_1b_35(.A(A[70]),  .B(A[71]),  .Cin(1'b0), .S(S_l1_1b[35]), .Cout(Cout_l1_2b[35]));
FA fa_1b_36(.A(A[72]),  .B(A[73]),  .Cin(1'b0), .S(S_l1_1b[36]), .Cout(Cout_l1_2b[36]));
FA fa_1b_37(.A(A[74]),  .B(A[75]),  .Cin(1'b0), .S(S_l1_1b[37]), .Cout(Cout_l1_2b[37]));
FA fa_1b_38(.A(A[76]),  .B(A[77]),  .Cin(1'b0), .S(S_l1_1b[38]), .Cout(Cout_l1_2b[38]));
FA fa_1b_39(.A(A[78]),  .B(A[79]),  .Cin(1'b0), .S(S_l1_1b[39]), .Cout(Cout_l1_2b[39]));
FA fa_1b_40(.A(A[80]),  .B(A[81]),  .Cin(1'b0), .S(S_l1_1b[40]), .Cout(Cout_l1_2b[40]));
FA fa_1b_41(.A(A[82]),  .B(A[83]),  .Cin(1'b0), .S(S_l1_1b[41]), .Cout(Cout_l1_2b[41]));
FA fa_1b_42(.A(A[84]),  .B(A[85]),  .Cin(1'b0), .S(S_l1_1b[42]), .Cout(Cout_l1_2b[42]));
FA fa_1b_43(.A(A[86]),  .B(A[87]),  .Cin(1'b0), .S(S_l1_1b[43]), .Cout(Cout_l1_2b[43]));
FA fa_1b_44(.A(A[88]),  .B(A[89]),  .Cin(1'b0), .S(S_l1_1b[44]), .Cout(Cout_l1_2b[44]));
FA fa_1b_45(.A(A[90]),  .B(A[91]),  .Cin(1'b0), .S(S_l1_1b[45]), .Cout(Cout_l1_2b[45]));
FA fa_1b_46(.A(A[92]),  .B(A[93]),  .Cin(1'b0), .S(S_l1_1b[46]), .Cout(Cout_l1_2b[46]));
FA fa_1b_47(.A(A[94]),  .B(A[95]),  .Cin(1'b0), .S(S_l1_1b[47]), .Cout(Cout_l1_2b[47]));
FA fa_1b_48(.A(A[96]),  .B(A[97]),  .Cin(1'b0), .S(S_l1_1b[48]), .Cout(Cout_l1_2b[48]));
FA fa_1b_49(.A(A[98]),  .B(A[99]),  .Cin(1'b0), .S(S_l1_1b[49]), .Cout(Cout_l1_2b[49]));
FA fa_1b_50(.A(A[100]), .B(A[101]), .Cin(1'b0), .S(S_l1_1b[50]), .Cout(Cout_l1_2b[50]));
FA fa_1b_51(.A(A[102]), .B(A[103]), .Cin(1'b0), .S(S_l1_1b[51]), .Cout(Cout_l1_2b[51]));
FA fa_1b_52(.A(A[104]), .B(A[105]), .Cin(1'b0), .S(S_l1_1b[52]), .Cout(Cout_l1_2b[52]));
FA fa_1b_53(.A(A[106]), .B(A[107]), .Cin(1'b0), .S(S_l1_1b[53]), .Cout(Cout_l1_2b[53]));
FA fa_1b_54(.A(A[108]), .B(A[109]), .Cin(1'b0), .S(S_l1_1b[54]), .Cout(Cout_l1_2b[54]));
FA fa_1b_55(.A(A[110]), .B(A[111]), .Cin(1'b0), .S(S_l1_1b[55]), .Cout(Cout_l1_2b[55]));
FA fa_1b_56(.A(A[112]), .B(A[113]), .Cin(1'b0), .S(S_l1_1b[56]), .Cout(Cout_l1_2b[56]));
FA fa_1b_57(.A(A[114]), .B(A[115]), .Cin(1'b0), .S(S_l1_1b[57]), .Cout(Cout_l1_2b[57]));
FA fa_1b_58(.A(A[116]), .B(A[117]), .Cin(1'b0), .S(S_l1_1b[58]), .Cout(Cout_l1_2b[58]));
FA fa_1b_59(.A(A[118]), .B(A[119]), .Cin(1'b0), .S(S_l1_1b[59]), .Cout(Cout_l1_2b[59]));
FA fa_1b_60(.A(A[120]), .B(A[121]), .Cin(1'b0), .S(S_l1_1b[60]), .Cout(Cout_l1_2b[60]));
FA fa_1b_61(.A(A[122]), .B(A[123]), .Cin(1'b0), .S(S_l1_1b[61]), .Cout(Cout_l1_2b[61]));
FA fa_1b_62(.A(A[124]), .B(A[125]), .Cin(1'b0), .S(S_l1_1b[62]), .Cout(Cout_l1_2b[62]));
FA fa_1b_63(.A(A[126]), .B(A[127]), .Cin(1'b0), .S(S_l1_1b[63]), .Cout(Cout_l1_2b[63]));

////////////////////////////  Second layer  //////////////////////////////////////////
FA fa_l2_1b_00(.A(S_l1_1b[0]),  .B(S_l1_1b[1]),  .Cin(1'b0), .S(S_l2_1b[0]),  .Cout(Cout_l2_2b[0]));
FA fa_l2_1b_01(.A(S_l1_1b[2]),  .B(S_l1_1b[3]),  .Cin(1'b0), .S(S_l2_1b[1]),  .Cout(Cout_l2_2b[1]));
FA fa_l2_1b_02(.A(S_l1_1b[4]),  .B(S_l1_1b[5]),  .Cin(1'b0), .S(S_l2_1b[2]),  .Cout(Cout_l2_2b[2]));
FA fa_l2_1b_03(.A(S_l1_1b[6]),  .B(S_l1_1b[7]),  .Cin(1'b0), .S(S_l2_1b[3]),  .Cout(Cout_l2_2b[3]));
FA fa_l2_1b_04(.A(S_l1_1b[8]),  .B(S_l1_1b[9]),  .Cin(1'b0), .S(S_l2_1b[4]),  .Cout(Cout_l2_2b[4]));
FA fa_l2_1b_05(.A(S_l1_1b[10]), .B(S_l1_1b[11]), .Cin(1'b0), .S(S_l2_1b[5]),  .Cout(Cout_l2_2b[5]));
FA fa_l2_1b_06(.A(S_l1_1b[12]), .B(S_l1_1b[13]), .Cin(1'b0), .S(S_l2_1b[6]),  .Cout(Cout_l2_2b[6]));
FA fa_l2_1b_07(.A(S_l1_1b[14]), .B(S_l1_1b[15]), .Cin(1'b0), .S(S_l2_1b[7]),  .Cout(Cout_l2_2b[7]));
FA fa_l2_1b_08(.A(S_l1_1b[16]), .B(S_l1_1b[17]), .Cin(1'b0), .S(S_l2_1b[8]),  .Cout(Cout_l2_2b[8]));
FA fa_l2_1b_09(.A(S_l1_1b[18]), .B(S_l1_1b[19]), .Cin(1'b0), .S(S_l2_1b[9]),  .Cout(Cout_l2_2b[9]));
FA fa_l2_1b_10(.A(S_l1_1b[20]), .B(S_l1_1b[21]), .Cin(1'b0), .S(S_l2_1b[10]), .Cout(Cout_l2_2b[10]));
FA fa_l2_1b_11(.A(S_l1_1b[22]), .B(S_l1_1b[23]), .Cin(1'b0), .S(S_l2_1b[11]), .Cout(Cout_l2_2b[11]));
FA fa_l2_1b_12(.A(S_l1_1b[24]), .B(S_l1_1b[25]), .Cin(1'b0), .S(S_l2_1b[12]), .Cout(Cout_l2_2b[12]));
FA fa_l2_1b_13(.A(S_l1_1b[26]), .B(S_l1_1b[27]), .Cin(1'b0), .S(S_l2_1b[13]), .Cout(Cout_l2_2b[13]));
FA fa_l2_1b_14(.A(S_l1_1b[28]), .B(S_l1_1b[29]), .Cin(1'b0), .S(S_l2_1b[14]), .Cout(Cout_l2_2b[14]));
FA fa_l2_1b_15(.A(S_l1_1b[30]), .B(S_l1_1b[31]), .Cin(1'b0), .S(S_l2_1b[15]), .Cout(Cout_l2_2b[15]));
FA fa_l2_1b_16(.A(S_l1_1b[32]), .B(S_l1_1b[33]), .Cin(1'b0), .S(S_l2_1b[16]), .Cout(Cout_l2_2b[16]));
FA fa_l2_1b_17(.A(S_l1_1b[34]), .B(S_l1_1b[35]), .Cin(1'b0), .S(S_l2_1b[17]), .Cout(Cout_l2_2b[17]));
FA fa_l2_1b_18(.A(S_l1_1b[36]), .B(S_l1_1b[37]), .Cin(1'b0), .S(S_l2_1b[18]), .Cout(Cout_l2_2b[18]));
FA fa_l2_1b_19(.A(S_l1_1b[38]), .B(S_l1_1b[39]), .Cin(1'b0), .S(S_l2_1b[19]), .Cout(Cout_l2_2b[19]));
FA fa_l2_1b_20(.A(S_l1_1b[40]), .B(S_l1_1b[41]), .Cin(1'b0), .S(S_l2_1b[20]), .Cout(Cout_l2_2b[20]));
FA fa_l2_1b_21(.A(S_l1_1b[42]), .B(S_l1_1b[43]), .Cin(1'b0), .S(S_l2_1b[21]), .Cout(Cout_l2_2b[21]));
FA fa_l2_1b_22(.A(S_l1_1b[44]), .B(S_l1_1b[45]), .Cin(1'b0), .S(S_l2_1b[22]), .Cout(Cout_l2_2b[22]));
FA fa_l2_1b_23(.A(S_l1_1b[46]), .B(S_l1_1b[47]), .Cin(1'b0), .S(S_l2_1b[23]), .Cout(Cout_l2_2b[23]));
FA fa_l2_1b_24(.A(S_l1_1b[48]), .B(S_l1_1b[49]), .Cin(1'b0), .S(S_l2_1b[24]), .Cout(Cout_l2_2b[24]));
FA fa_l2_1b_25(.A(S_l1_1b[50]), .B(S_l1_1b[51]), .Cin(1'b0), .S(S_l2_1b[25]), .Cout(Cout_l2_2b[25]));
FA fa_l2_1b_26(.A(S_l1_1b[52]), .B(S_l1_1b[53]), .Cin(1'b0), .S(S_l2_1b[26]), .Cout(Cout_l2_2b[26]));
FA fa_l2_1b_27(.A(S_l1_1b[54]), .B(S_l1_1b[55]), .Cin(1'b0), .S(S_l2_1b[27]), .Cout(Cout_l2_2b[27]));
FA fa_l2_1b_28(.A(S_l1_1b[56]), .B(S_l1_1b[57]), .Cin(1'b0), .S(S_l2_1b[28]), .Cout(Cout_l2_2b[28]));
FA fa_l2_1b_29(.A(S_l1_1b[58]), .B(S_l1_1b[59]), .Cin(1'b0), .S(S_l2_1b[29]), .Cout(Cout_l2_2b[29]));
FA fa_l2_1b_30(.A(S_l1_1b[60]), .B(S_l1_1b[61]), .Cin(1'b0), .S(S_l2_1b[30]), .Cout(Cout_l2_2b[30]));
FA fa_l2_1b_31(.A(S_l1_1b[62]), .B(S_l1_1b[63]), .Cin(1'b0), .S(S_l2_1b[31]), .Cout(Cout_l2_2b[31]));

FA fa_l2_2b_00(.A(Cout_l1_2b[0]),  .B(Cout_l1_2b[1]),  .Cin(Cout_l2_2b[0]),  .S(S_l2_2b[0]),  .Cout(Cout_l2_3b[0]));
FA fa_l2_2b_01(.A(Cout_l1_2b[2]),  .B(Cout_l1_2b[3]),  .Cin(Cout_l2_2b[1]),  .S(S_l2_2b[1]),  .Cout(Cout_l2_3b[1]));
FA fa_l2_2b_02(.A(Cout_l1_2b[4]),  .B(Cout_l1_2b[5]),  .Cin(Cout_l2_2b[2]),  .S(S_l2_2b[2]),  .Cout(Cout_l2_3b[2]));
FA fa_l2_2b_03(.A(Cout_l1_2b[6]),  .B(Cout_l1_2b[7]),  .Cin(Cout_l2_2b[3]),  .S(S_l2_2b[3]),  .Cout(Cout_l2_3b[3]));
FA fa_l2_2b_04(.A(Cout_l1_2b[8]),  .B(Cout_l1_2b[9]),  .Cin(Cout_l2_2b[4]),  .S(S_l2_2b[4]),  .Cout(Cout_l2_3b[4]));
FA fa_l2_2b_05(.A(Cout_l1_2b[10]), .B(Cout_l1_2b[11]), .Cin(Cout_l2_2b[5]),  .S(S_l2_2b[5]),  .Cout(Cout_l2_3b[5]));
FA fa_l2_2b_06(.A(Cout_l1_2b[12]), .B(Cout_l1_2b[13]), .Cin(Cout_l2_2b[6]),  .S(S_l2_2b[6]),  .Cout(Cout_l2_3b[6]));
FA fa_l2_2b_07(.A(Cout_l1_2b[14]), .B(Cout_l1_2b[15]), .Cin(Cout_l2_2b[7]),  .S(S_l2_2b[7]),  .Cout(Cout_l2_3b[7]));
FA fa_l2_2b_08(.A(Cout_l1_2b[16]), .B(Cout_l1_2b[17]), .Cin(Cout_l2_2b[8]),  .S(S_l2_2b[8]),  .Cout(Cout_l2_3b[8]));
FA fa_l2_2b_09(.A(Cout_l1_2b[18]), .B(Cout_l1_2b[19]), .Cin(Cout_l2_2b[9]),  .S(S_l2_2b[9]),  .Cout(Cout_l2_3b[9]));
FA fa_l2_2b_10(.A(Cout_l1_2b[20]), .B(Cout_l1_2b[21]), .Cin(Cout_l2_2b[10]), .S(S_l2_2b[10]), .Cout(Cout_l2_3b[10]));
FA fa_l2_2b_11(.A(Cout_l1_2b[22]), .B(Cout_l1_2b[23]), .Cin(Cout_l2_2b[11]), .S(S_l2_2b[11]), .Cout(Cout_l2_3b[11]));
FA fa_l2_2b_12(.A(Cout_l1_2b[24]), .B(Cout_l1_2b[25]), .Cin(Cout_l2_2b[12]), .S(S_l2_2b[12]), .Cout(Cout_l2_3b[12]));
FA fa_l2_2b_13(.A(Cout_l1_2b[26]), .B(Cout_l1_2b[27]), .Cin(Cout_l2_2b[13]), .S(S_l2_2b[13]), .Cout(Cout_l2_3b[13]));
FA fa_l2_2b_14(.A(Cout_l1_2b[28]), .B(Cout_l1_2b[29]), .Cin(Cout_l2_2b[14]), .S(S_l2_2b[14]), .Cout(Cout_l2_3b[14]));
FA fa_l2_2b_15(.A(Cout_l1_2b[30]), .B(Cout_l1_2b[31]), .Cin(Cout_l2_2b[15]), .S(S_l2_2b[15]), .Cout(Cout_l2_3b[15]));
FA fa_l2_2b_16(.A(Cout_l1_2b[32]), .B(Cout_l1_2b[33]), .Cin(Cout_l2_2b[16]), .S(S_l2_2b[16]), .Cout(Cout_l2_3b[16]));
FA fa_l2_2b_17(.A(Cout_l1_2b[34]), .B(Cout_l1_2b[35]), .Cin(Cout_l2_2b[17]), .S(S_l2_2b[17]), .Cout(Cout_l2_3b[17]));
FA fa_l2_2b_18(.A(Cout_l1_2b[36]), .B(Cout_l1_2b[37]), .Cin(Cout_l2_2b[18]), .S(S_l2_2b[18]), .Cout(Cout_l2_3b[18]));
FA fa_l2_2b_19(.A(Cout_l1_2b[38]), .B(Cout_l1_2b[39]), .Cin(Cout_l2_2b[19]), .S(S_l2_2b[19]), .Cout(Cout_l2_3b[19]));
FA fa_l2_2b_20(.A(Cout_l1_2b[40]), .B(Cout_l1_2b[41]), .Cin(Cout_l2_2b[20]), .S(S_l2_2b[20]), .Cout(Cout_l2_3b[20]));
FA fa_l2_2b_21(.A(Cout_l1_2b[42]), .B(Cout_l1_2b[43]), .Cin(Cout_l2_2b[21]), .S(S_l2_2b[21]), .Cout(Cout_l2_3b[21]));
FA fa_l2_2b_22(.A(Cout_l1_2b[44]), .B(Cout_l1_2b[45]), .Cin(Cout_l2_2b[22]), .S(S_l2_2b[22]), .Cout(Cout_l2_3b[22]));
FA fa_l2_2b_23(.A(Cout_l1_2b[46]), .B(Cout_l1_2b[47]), .Cin(Cout_l2_2b[23]), .S(S_l2_2b[23]), .Cout(Cout_l2_3b[23]));
FA fa_l2_2b_24(.A(Cout_l1_2b[48]), .B(Cout_l1_2b[49]), .Cin(Cout_l2_2b[24]), .S(S_l2_2b[24]), .Cout(Cout_l2_3b[24]));
FA fa_l2_2b_25(.A(Cout_l1_2b[50]), .B(Cout_l1_2b[51]), .Cin(Cout_l2_2b[25]), .S(S_l2_2b[25]), .Cout(Cout_l2_3b[25]));
FA fa_l2_2b_26(.A(Cout_l1_2b[52]), .B(Cout_l1_2b[53]), .Cin(Cout_l2_2b[26]), .S(S_l2_2b[26]), .Cout(Cout_l2_3b[26]));
FA fa_l2_2b_27(.A(Cout_l1_2b[54]), .B(Cout_l1_2b[55]), .Cin(Cout_l2_2b[27]), .S(S_l2_2b[27]), .Cout(Cout_l2_3b[27]));
FA fa_l2_2b_28(.A(Cout_l1_2b[56]), .B(Cout_l1_2b[57]), .Cin(Cout_l2_2b[28]), .S(S_l2_2b[28]), .Cout(Cout_l2_3b[28]));
FA fa_l2_2b_29(.A(Cout_l1_2b[58]), .B(Cout_l1_2b[59]), .Cin(Cout_l2_2b[29]), .S(S_l2_2b[29]), .Cout(Cout_l2_3b[29]));
FA fa_l2_2b_30(.A(Cout_l1_2b[60]), .B(Cout_l1_2b[61]), .Cin(Cout_l2_2b[30]), .S(S_l2_2b[30]), .Cout(Cout_l2_3b[30]));
FA fa_l2_2b_31(.A(Cout_l1_2b[62]), .B(Cout_l1_2b[63]), .Cin(Cout_l2_2b[31]), .S(S_l2_2b[31]), .Cout(Cout_l2_3b[31]));

////////////////////////////  Third layer  //////////////////////////////////////////
FA fa_l3_1b_00(.A(S_l2_1b[0]),  .B(S_l2_1b[1]),  .Cin(1'b0), .S(S_l3_1b[0]),  .Cout(Cout_l3_2b[0]));
FA fa_l3_1b_01(.A(S_l2_1b[2]),  .B(S_l2_1b[3]),  .Cin(1'b0), .S(S_l3_1b[1]),  .Cout(Cout_l3_2b[1]));
FA fa_l3_1b_02(.A(S_l2_1b[4]),  .B(S_l2_1b[5]),  .Cin(1'b0), .S(S_l3_1b[2]),  .Cout(Cout_l3_2b[2]));
FA fa_l3_1b_03(.A(S_l2_1b[6]),  .B(S_l2_1b[7]),  .Cin(1'b0), .S(S_l3_1b[3]),  .Cout(Cout_l3_2b[3]));
FA fa_l3_1b_04(.A(S_l2_1b[8]),  .B(S_l2_1b[9]),  .Cin(1'b0), .S(S_l3_1b[4]),  .Cout(Cout_l3_2b[4]));
FA fa_l3_1b_05(.A(S_l2_1b[10]), .B(S_l2_1b[11]), .Cin(1'b0), .S(S_l3_1b[5]),  .Cout(Cout_l3_2b[5]));
FA fa_l3_1b_06(.A(S_l2_1b[12]), .B(S_l2_1b[13]), .Cin(1'b0), .S(S_l3_1b[6]),  .Cout(Cout_l3_2b[6]));
FA fa_l3_1b_07(.A(S_l2_1b[14]), .B(S_l2_1b[15]), .Cin(1'b0), .S(S_l3_1b[7]),  .Cout(Cout_l3_2b[7]));
FA fa_l3_1b_08(.A(S_l2_1b[16]), .B(S_l2_1b[17]), .Cin(1'b0), .S(S_l3_1b[8]),  .Cout(Cout_l3_2b[8]));
FA fa_l3_1b_09(.A(S_l2_1b[18]), .B(S_l2_1b[19]), .Cin(1'b0), .S(S_l3_1b[9]),  .Cout(Cout_l3_2b[9]));
FA fa_l3_1b_10(.A(S_l2_1b[20]), .B(S_l2_1b[21]), .Cin(1'b0), .S(S_l3_1b[10]), .Cout(Cout_l3_2b[10]));
FA fa_l3_1b_11(.A(S_l2_1b[22]), .B(S_l2_1b[23]), .Cin(1'b0), .S(S_l3_1b[11]), .Cout(Cout_l3_2b[11]));
FA fa_l3_1b_12(.A(S_l2_1b[24]), .B(S_l2_1b[25]), .Cin(1'b0), .S(S_l3_1b[12]), .Cout(Cout_l3_2b[12]));
FA fa_l3_1b_13(.A(S_l2_1b[26]), .B(S_l2_1b[27]), .Cin(1'b0), .S(S_l3_1b[13]), .Cout(Cout_l3_2b[13]));
FA fa_l3_1b_14(.A(S_l2_1b[28]), .B(S_l2_1b[29]), .Cin(1'b0), .S(S_l3_1b[14]), .Cout(Cout_l3_2b[14]));
FA fa_l3_1b_15(.A(S_l2_1b[30]), .B(S_l2_1b[31]), .Cin(1'b0), .S(S_l3_1b[15]), .Cout(Cout_l3_2b[15]));

FA fa_l3_2b_00(.A(S_l2_2b[0]),  .B(S_l2_2b[1]),  .Cin(Cout_l3_2b[0]),  .S(S_l3_2b[0]),  .Cout(Cout_l3_3b[0]));
FA fa_l3_2b_01(.A(S_l2_2b[2]),  .B(S_l2_2b[3]),  .Cin(Cout_l3_2b[1]),  .S(S_l3_2b[1]),  .Cout(Cout_l3_3b[1]));
FA fa_l3_2b_02(.A(S_l2_2b[4]),  .B(S_l2_2b[5]),  .Cin(Cout_l3_2b[2]),  .S(S_l3_2b[2]),  .Cout(Cout_l3_3b[2]));
FA fa_l3_2b_03(.A(S_l2_2b[6]),  .B(S_l2_2b[7]),  .Cin(Cout_l3_2b[3]),  .S(S_l3_2b[3]),  .Cout(Cout_l3_3b[3]));
FA fa_l3_2b_04(.A(S_l2_2b[8]),  .B(S_l2_2b[9]),  .Cin(Cout_l3_2b[4]),  .S(S_l3_2b[4]),  .Cout(Cout_l3_3b[4]));
FA fa_l3_2b_05(.A(S_l2_2b[10]), .B(S_l2_2b[11]), .Cin(Cout_l3_2b[5]),  .S(S_l3_2b[5]),  .Cout(Cout_l3_3b[5]));
FA fa_l3_2b_06(.A(S_l2_2b[12]), .B(S_l2_2b[13]), .Cin(Cout_l3_2b[6]),  .S(S_l3_2b[6]),  .Cout(Cout_l3_3b[6]));
FA fa_l3_2b_07(.A(S_l2_2b[14]), .B(S_l2_2b[15]), .Cin(Cout_l3_2b[7]),  .S(S_l3_2b[7]),  .Cout(Cout_l3_3b[7]));
FA fa_l3_2b_08(.A(S_l2_2b[16]), .B(S_l2_2b[17]), .Cin(Cout_l3_2b[8]),  .S(S_l3_2b[8]),  .Cout(Cout_l3_3b[8]));
FA fa_l3_2b_09(.A(S_l2_2b[18]), .B(S_l2_2b[19]), .Cin(Cout_l3_2b[9]),  .S(S_l3_2b[9]),  .Cout(Cout_l3_3b[9]));
FA fa_l3_2b_10(.A(S_l2_2b[20]), .B(S_l2_2b[21]), .Cin(Cout_l3_2b[10]), .S(S_l3_2b[10]), .Cout(Cout_l3_3b[10]));
FA fa_l3_2b_11(.A(S_l2_2b[22]), .B(S_l2_2b[23]), .Cin(Cout_l3_2b[11]), .S(S_l3_2b[11]), .Cout(Cout_l3_3b[11]));
FA fa_l3_2b_12(.A(S_l2_2b[24]), .B(S_l2_2b[25]), .Cin(Cout_l3_2b[12]), .S(S_l3_2b[12]), .Cout(Cout_l3_3b[12]));
FA fa_l3_2b_13(.A(S_l2_2b[26]), .B(S_l2_2b[27]), .Cin(Cout_l3_2b[13]), .S(S_l3_2b[13]), .Cout(Cout_l3_3b[13]));
FA fa_l3_2b_14(.A(S_l2_2b[28]), .B(S_l2_2b[29]), .Cin(Cout_l3_2b[14]), .S(S_l3_2b[14]), .Cout(Cout_l3_3b[14]));
FA fa_l3_2b_15(.A(S_l2_2b[30]), .B(S_l2_2b[31]), .Cin(Cout_l3_2b[15]), .S(S_l3_2b[15]), .Cout(Cout_l3_3b[15]));

FA fa_l3_3b_00(.A(Cout_l2_3b[0]),  .B(Cout_l2_3b[1]),  .Cin(Cout_l3_3b[0]),  .S(S_l3_3b[0]),  .Cout(Cout_l3_4b[0]));
FA fa_l3_3b_01(.A(Cout_l2_3b[2]),  .B(Cout_l2_3b[3]),  .Cin(Cout_l3_3b[1]),  .S(S_l3_3b[1]),  .Cout(Cout_l3_4b[1]));
FA fa_l3_3b_02(.A(Cout_l2_3b[4]),  .B(Cout_l2_3b[5]),  .Cin(Cout_l3_3b[2]),  .S(S_l3_3b[2]),  .Cout(Cout_l3_4b[2]));
FA fa_l3_3b_03(.A(Cout_l2_3b[6]),  .B(Cout_l2_3b[7]),  .Cin(Cout_l3_3b[3]),  .S(S_l3_3b[3]),  .Cout(Cout_l3_4b[3]));
FA fa_l3_3b_04(.A(Cout_l2_3b[8]),  .B(Cout_l2_3b[9]),  .Cin(Cout_l3_3b[4]),  .S(S_l3_3b[4]),  .Cout(Cout_l3_4b[4]));
FA fa_l3_3b_05(.A(Cout_l2_3b[10]), .B(Cout_l2_3b[11]), .Cin(Cout_l3_3b[5]),  .S(S_l3_3b[5]),  .Cout(Cout_l3_4b[5]));
FA fa_l3_3b_06(.A(Cout_l2_3b[12]), .B(Cout_l2_3b[13]), .Cin(Cout_l3_3b[6]),  .S(S_l3_3b[6]),  .Cout(Cout_l3_4b[6]));
FA fa_l3_3b_07(.A(Cout_l2_3b[14]), .B(Cout_l2_3b[15]), .Cin(Cout_l3_3b[7]),  .S(S_l3_3b[7]),  .Cout(Cout_l3_4b[7]));
FA fa_l3_3b_08(.A(Cout_l2_3b[16]), .B(Cout_l2_3b[17]), .Cin(Cout_l3_3b[8]),  .S(S_l3_3b[8]),  .Cout(Cout_l3_4b[8]));
FA fa_l3_3b_09(.A(Cout_l2_3b[18]), .B(Cout_l2_3b[19]), .Cin(Cout_l3_3b[9]),  .S(S_l3_3b[9]),  .Cout(Cout_l3_4b[9]));
FA fa_l3_3b_10(.A(Cout_l2_3b[20]), .B(Cout_l2_3b[21]), .Cin(Cout_l3_3b[10]), .S(S_l3_3b[10]), .Cout(Cout_l3_4b[10]));
FA fa_l3_3b_11(.A(Cout_l2_3b[22]), .B(Cout_l2_3b[23]), .Cin(Cout_l3_3b[11]), .S(S_l3_3b[11]), .Cout(Cout_l3_4b[11]));
FA fa_l3_3b_12(.A(Cout_l2_3b[24]), .B(Cout_l2_3b[25]), .Cin(Cout_l3_3b[12]), .S(S_l3_3b[12]), .Cout(Cout_l3_4b[12]));
FA fa_l3_3b_13(.A(Cout_l2_3b[26]), .B(Cout_l2_3b[27]), .Cin(Cout_l3_3b[13]), .S(S_l3_3b[13]), .Cout(Cout_l3_4b[13]));
FA fa_l3_3b_14(.A(Cout_l2_3b[28]), .B(Cout_l2_3b[29]), .Cin(Cout_l3_3b[14]), .S(S_l3_3b[14]), .Cout(Cout_l3_4b[14]));
FA fa_l3_3b_15(.A(Cout_l2_3b[30]), .B(Cout_l2_3b[31]), .Cin(Cout_l3_3b[15]), .S(S_l3_3b[15]), .Cout(Cout_l3_4b[15]));

////////////////////////////  Fourth layer  //////////////////////////////////////////
FA fa_l4_1b_00(.A(S_l3_1b[0]),  .B(S_l3_1b[1]),  .Cin(1'b0), .S(S_l4_1b[0]), .Cout(Cout_l4_2b[0]));
FA fa_l4_1b_01(.A(S_l3_1b[2]),  .B(S_l3_1b[3]),  .Cin(1'b0), .S(S_l4_1b[1]), .Cout(Cout_l4_2b[1]));
FA fa_l4_1b_02(.A(S_l3_1b[4]),  .B(S_l3_1b[5]),  .Cin(1'b0), .S(S_l4_1b[2]), .Cout(Cout_l4_2b[2]));
FA fa_l4_1b_03(.A(S_l3_1b[6]),  .B(S_l3_1b[7]),  .Cin(1'b0), .S(S_l4_1b[3]), .Cout(Cout_l4_2b[3]));
FA fa_l4_1b_04(.A(S_l3_1b[8]),  .B(S_l3_1b[9]),  .Cin(1'b0), .S(S_l4_1b[4]), .Cout(Cout_l4_2b[4]));
FA fa_l4_1b_05(.A(S_l3_1b[10]), .B(S_l3_1b[11]), .Cin(1'b0), .S(S_l4_1b[5]), .Cout(Cout_l4_2b[5]));
FA fa_l4_1b_06(.A(S_l3_1b[12]), .B(S_l3_1b[13]), .Cin(1'b0), .S(S_l4_1b[6]), .Cout(Cout_l4_2b[6]));
FA fa_l4_1b_07(.A(S_l3_1b[14]), .B(S_l3_1b[15]), .Cin(1'b0), .S(S_l4_1b[7]), .Cout(Cout_l4_2b[7]));

FA fa_l4_2b_00(.A(S_l3_2b[0]),  .B(S_l3_2b[1]),  .Cin(Cout_l4_2b[0]), .S(S_l4_2b[0]), .Cout(Cout_l4_3b[0]));
FA fa_l4_2b_01(.A(S_l3_2b[2]),  .B(S_l3_2b[3]),  .Cin(Cout_l4_2b[1]), .S(S_l4_2b[1]), .Cout(Cout_l4_3b[1]));
FA fa_l4_2b_02(.A(S_l3_2b[4]),  .B(S_l3_2b[5]),  .Cin(Cout_l4_2b[2]), .S(S_l4_2b[2]), .Cout(Cout_l4_3b[2]));
FA fa_l4_2b_03(.A(S_l3_2b[6]),  .B(S_l3_2b[7]),  .Cin(Cout_l4_2b[3]), .S(S_l4_2b[3]), .Cout(Cout_l4_3b[3]));
FA fa_l4_2b_04(.A(S_l3_2b[8]),  .B(S_l3_2b[9]),  .Cin(Cout_l4_2b[4]), .S(S_l4_2b[4]), .Cout(Cout_l4_3b[4]));
FA fa_l4_2b_05(.A(S_l3_2b[10]), .B(S_l3_2b[11]), .Cin(Cout_l4_2b[5]), .S(S_l4_2b[5]), .Cout(Cout_l4_3b[5]));
FA fa_l4_2b_06(.A(S_l3_2b[12]), .B(S_l3_2b[13]), .Cin(Cout_l4_2b[6]), .S(S_l4_2b[6]), .Cout(Cout_l4_3b[6]));
FA fa_l4_2b_07(.A(S_l3_2b[14]), .B(S_l3_2b[15]), .Cin(Cout_l4_2b[7]), .S(S_l4_2b[7]), .Cout(Cout_l4_3b[7]));

FA fa_l4_3b_00(.A(S_l3_3b[0]),  .B(S_l3_3b[1]),  .Cin(Cout_l4_3b[0]), .S(S_l4_3b[0]), .Cout(Cout_l4_4b[0]));
FA fa_l4_3b_01(.A(S_l3_3b[2]),  .B(S_l3_3b[3]),  .Cin(Cout_l4_3b[1]), .S(S_l4_3b[1]), .Cout(Cout_l4_4b[1]));
FA fa_l4_3b_02(.A(S_l3_3b[4]),  .B(S_l3_3b[5]),  .Cin(Cout_l4_3b[2]), .S(S_l4_3b[2]), .Cout(Cout_l4_4b[2]));
FA fa_l4_3b_03(.A(S_l3_3b[6]),  .B(S_l3_3b[7]),  .Cin(Cout_l4_3b[3]), .S(S_l4_3b[3]), .Cout(Cout_l4_4b[3]));
FA fa_l4_3b_04(.A(S_l3_3b[8]),  .B(S_l3_3b[9]),  .Cin(Cout_l4_3b[4]), .S(S_l4_3b[4]), .Cout(Cout_l4_4b[4]));
FA fa_l4_3b_05(.A(S_l3_3b[10]), .B(S_l3_3b[11]), .Cin(Cout_l4_3b[5]), .S(S_l4_3b[5]), .Cout(Cout_l4_4b[5]));
FA fa_l4_3b_06(.A(S_l3_3b[12]), .B(S_l3_3b[13]), .Cin(Cout_l4_3b[6]), .S(S_l4_3b[6]), .Cout(Cout_l4_4b[6]));
FA fa_l4_3b_07(.A(S_l3_3b[14]), .B(S_l3_3b[15]), .Cin(Cout_l4_3b[7]), .S(S_l4_3b[7]), .Cout(Cout_l4_4b[7]));

FA fa_l4_4b_00(.A(Cout_l3_4b[0]),  .B(Cout_l3_4b[1]),  .Cin(Cout_l4_4b[0]), .S(S_l4_4b[0]), .Cout(Cout_l4_5b[0]));
FA fa_l4_4b_01(.A(Cout_l3_4b[2]),  .B(Cout_l3_4b[3]),  .Cin(Cout_l4_4b[1]), .S(S_l4_4b[1]), .Cout(Cout_l4_5b[1]));
FA fa_l4_4b_02(.A(Cout_l3_4b[4]),  .B(Cout_l3_4b[5]),  .Cin(Cout_l4_4b[2]), .S(S_l4_4b[2]), .Cout(Cout_l4_5b[2]));
FA fa_l4_4b_03(.A(Cout_l3_4b[6]),  .B(Cout_l3_4b[7]),  .Cin(Cout_l4_4b[3]), .S(S_l4_4b[3]), .Cout(Cout_l4_5b[3]));
FA fa_l4_4b_04(.A(Cout_l3_4b[8]),  .B(Cout_l3_4b[9]),  .Cin(Cout_l4_4b[4]), .S(S_l4_4b[4]), .Cout(Cout_l4_5b[4]));
FA fa_l4_4b_05(.A(Cout_l3_4b[10]), .B(Cout_l3_4b[11]), .Cin(Cout_l4_4b[5]), .S(S_l4_4b[5]), .Cout(Cout_l4_5b[5]));
FA fa_l4_4b_06(.A(Cout_l3_4b[12]), .B(Cout_l3_4b[13]), .Cin(Cout_l4_4b[6]), .S(S_l4_4b[6]), .Cout(Cout_l4_5b[6]));
FA fa_l4_4b_07(.A(Cout_l3_4b[14]), .B(Cout_l3_4b[15]), .Cin(Cout_l4_4b[7]), .S(S_l4_4b[7]), .Cout(Cout_l4_5b[7]));

////////////////////////////  Fifth layer  //////////////////////////////////////////
FA fa_l5_1b_00(.A(S_l4_1b[0]),  .B(S_l4_1b[1]), .Cin(1'b0), .S(S_l5_1b[0]), .Cout(Cout_l5_2b[0]));
FA fa_l5_1b_01(.A(S_l4_1b[2]),  .B(S_l4_1b[3]), .Cin(1'b0), .S(S_l5_1b[1]), .Cout(Cout_l5_2b[1]));
FA fa_l5_1b_02(.A(S_l4_1b[4]),  .B(S_l4_1b[5]), .Cin(1'b0), .S(S_l5_1b[2]), .Cout(Cout_l5_2b[2]));
FA fa_l5_1b_03(.A(S_l4_1b[6]),  .B(S_l4_1b[7]), .Cin(1'b0), .S(S_l5_1b[3]), .Cout(Cout_l5_2b[3]));

FA fa_l5_2b_00(.A(S_l4_2b[0]),  .B(S_l4_2b[1]), .Cin(Cout_l5_2b[0]), .S(S_l5_2b[0]), .Cout(Cout_l5_3b[0]));
FA fa_l5_2b_01(.A(S_l4_2b[2]),  .B(S_l4_2b[3]), .Cin(Cout_l5_2b[1]), .S(S_l5_2b[1]), .Cout(Cout_l5_3b[1]));
FA fa_l5_2b_02(.A(S_l4_2b[4]),  .B(S_l4_2b[5]), .Cin(Cout_l5_2b[2]), .S(S_l5_2b[2]), .Cout(Cout_l5_3b[2]));
FA fa_l5_2b_03(.A(S_l4_2b[6]),  .B(S_l4_2b[7]), .Cin(Cout_l5_2b[3]), .S(S_l5_2b[3]), .Cout(Cout_l5_3b[3]));

FA fa_l5_3b_00(.A(S_l4_3b[0]),  .B(S_l4_3b[1]), .Cin(Cout_l5_3b[0]), .S(S_l5_3b[0]), .Cout(Cout_l5_4b[0]));
FA fa_l5_3b_01(.A(S_l4_3b[2]),  .B(S_l4_3b[3]), .Cin(Cout_l5_3b[1]), .S(S_l5_3b[1]), .Cout(Cout_l5_4b[1]));
FA fa_l5_3b_02(.A(S_l4_3b[4]),  .B(S_l4_3b[5]), .Cin(Cout_l5_3b[2]), .S(S_l5_3b[2]), .Cout(Cout_l5_4b[2]));
FA fa_l5_3b_03(.A(S_l4_3b[6]),  .B(S_l4_3b[7]), .Cin(Cout_l5_3b[3]), .S(S_l5_3b[3]), .Cout(Cout_l5_4b[3]));

FA fa_l5_4b_00(.A(S_l4_4b[0]),  .B(S_l4_4b[1]), .Cin(Cout_l5_4b[0]), .S(S_l5_4b[0]), .Cout(Cout_l5_5b[0]));
FA fa_l5_4b_01(.A(S_l4_4b[2]),  .B(S_l4_4b[3]), .Cin(Cout_l5_4b[1]), .S(S_l5_4b[1]), .Cout(Cout_l5_5b[1]));
FA fa_l5_4b_02(.A(S_l4_4b[4]),  .B(S_l4_4b[5]), .Cin(Cout_l5_4b[2]), .S(S_l5_4b[2]), .Cout(Cout_l5_5b[2]));
FA fa_l5_4b_03(.A(S_l4_4b[6]),  .B(S_l4_4b[7]), .Cin(Cout_l5_4b[3]), .S(S_l5_4b[3]), .Cout(Cout_l5_5b[3]));

FA fa_l5_5b_00(.A(Cout_l4_5b[0]),  .B(Cout_l4_5b[1]), .Cin(Cout_l5_5b[0]), .S(S_l5_5b[0]), .Cout(Cout_l5_6b[0]));
FA fa_l5_5b_01(.A(Cout_l4_5b[2]),  .B(Cout_l4_5b[3]), .Cin(Cout_l5_5b[1]), .S(S_l5_5b[1]), .Cout(Cout_l5_6b[1]));
FA fa_l5_5b_02(.A(Cout_l4_5b[4]),  .B(Cout_l4_5b[5]), .Cin(Cout_l5_5b[2]), .S(S_l5_5b[2]), .Cout(Cout_l5_6b[2]));
FA fa_l5_5b_03(.A(Cout_l4_5b[6]),  .B(Cout_l4_5b[7]), .Cin(Cout_l5_5b[3]), .S(S_l5_5b[3]), .Cout(Cout_l5_6b[3]));

////////////////////////////  Sixth layer  //////////////////////////////////////////
FA fa_l6_1b_00(.A(S_l5_1b[0]), .B(S_l5_1b[1]), .Cin(1'b0), .S(S_l6_1b[0]), .Cout(Cout_l6_2b[0]));
FA fa_l6_1b_01(.A(S_l5_1b[2]), .B(S_l5_1b[3]), .Cin(1'b0), .S(S_l6_1b[1]), .Cout(Cout_l6_2b[1]));

FA fa_l6_2b_00(.A(S_l5_2b[0]), .B(S_l5_2b[1]), .Cin(Cout_l5_2b[0]), .S(S_l6_2b[0]), .Cout(Cout_l6_3b[0]));
FA fa_l6_2b_01(.A(S_l5_2b[2]), .B(S_l5_2b[3]), .Cin(Cout_l5_2b[1]), .S(S_l6_2b[1]), .Cout(Cout_l6_3b[1]));

FA fa_l6_3b_00(.A(S_l5_3b[0]), .B(S_l5_3b[1]), .Cin(Cout_l5_3b[0]), .S(S_l6_3b[0]), .Cout(Cout_l6_4b[0]));
FA fa_l6_3b_01(.A(S_l5_3b[2]), .B(S_l5_3b[3]), .Cin(Cout_l5_3b[1]), .S(S_l6_3b[1]), .Cout(Cout_l6_4b[1]));

FA fa_l6_4b_00(.A(S_l5_4b[0]), .B(S_l5_4b[1]), .Cin(Cout_l5_4b[0]), .S(S_l6_4b[0]), .Cout(Cout_l6_5b[0]));
FA fa_l6_4b_01(.A(S_l5_4b[2]), .B(S_l5_4b[3]), .Cin(Cout_l5_4b[1]), .S(S_l6_4b[1]), .Cout(Cout_l6_5b[1]));

FA fa_l6_5b_00(.A(S_l5_5b[0]), .B(S_l5_5b[1]), .Cin(Cout_l5_5b[0]), .S(S_l6_5b[0]), .Cout(Cout_l6_6b[0]));
FA fa_l6_5b_01(.A(S_l5_5b[2]), .B(S_l5_5b[3]), .Cin(Cout_l5_5b[1]), .S(S_l6_5b[1]), .Cout(Cout_l6_6b[1]));

FA fa_l6_6b_00(.A(Cout_l5_6b[0]), .B(Cout_l5_6b[1]), .Cin(Cout_l6_6b[0]), .S(S_l6_6b[0]), .Cout(Cout_l6_7b[0]));
FA fa_l6_6b_01(.A(Cout_l5_6b[2]), .B(Cout_l5_6b[3]), .Cin(Cout_l6_6b[1]), .S(S_l6_6b[1]), .Cout(Cout_l6_7b[1]));
////////////////////////////  Senventh layer  //////////////////////////////////////////
FA fa_l7_1b_00(.A(S_l6_1b[0]), .B(S_l6_1b[1]), .Cin(1'b0), .S(out[0]), .Cout(Cout_l7_2b));
FA fa_l7_2b_00(.A(S_l6_2b[0]), .B(S_l6_2b[1]), .Cin(Cout_l7_2b), .S(out[1]), .Cout(Cout_l7_3b));
FA fa_l7_3b_00(.A(S_l6_3b[0]), .B(S_l6_3b[1]), .Cin(Cout_l7_3b), .S(out[2]), .Cout(Cout_l7_4b));
FA fa_l7_4b_00(.A(S_l6_4b[0]), .B(S_l6_4b[1]), .Cin(Cout_l7_4b), .S(out[3]), .Cout(Cout_l7_5b));
FA fa_l7_5b_00(.A(S_l6_5b[0]), .B(S_l6_5b[1]), .Cin(Cout_l7_5b), .S(out[4]), .Cout(Cout_l7_6b));
FA fa_l7_6b_00(.A(S_l6_6b[0]), .B(S_l6_6b[1]), .Cin(Cout_l7_6b), .S(out[5]), .Cout(Cout_l7_7b));
FA fa_l7_7b_00(.A(Cout_l6_7b[0]), .B(Cout_l6_7b[1]), .Cin(Cout_l7_7b), .S(out[6]), .Cout(out[7]));
////////////////////////////  Output Data  //////////////////////////////////////////


always @(*) begin
        out_data = out;
end
// always@(posedge clk or negedge rst_n) begin
//     if(!rst_n)
//         out_data <= 8'b0;
//     else 
//         // out_data <= {8'b0};
//         out_data <= out;
// end

endmodule


