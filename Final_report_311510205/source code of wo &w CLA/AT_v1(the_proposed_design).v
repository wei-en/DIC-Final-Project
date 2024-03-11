module AT(
        //input
    A,
    out_data

);
input   [127:0] A;
output reg [7:0]   out_data;
wire [1:0] l1 [0:42];
wire [2:0] l2 [0:21];
wire [3:0] l3 [0:10];
wire [4:0] l4 [0:5];
wire [5:0] l5 [0:2];
wire [6:0] l6;
genvar i;

// Level 1
generate
        for(i=0;i<42;i=i+1)begin
                assign l1[i]=A[3*i]+A[3*i+1]+A[3*i+2];
        end
endgenerate
assign l1[42] = A[126]+A[127];

generate
        for(i=0;i<21;i=i+1)begin
                assign l2[i]=l1[2*i]+l1[2*i+1];
        end
endgenerate
assign l2 [21] = l1[42];
generate
        for(i=0;i<11;i=i+1)begin
                // assign l3[i]=l2[2*i]+l2[2*i+1];
                CLA_3bit C_3bit(.S(l3[i][2:0]),.Cout(l3[i][3]),.A(l2[2*i]),.B(l2[2*i+1]));
        end
endgenerate
generate
        for(i=0;i<5;i=i+1)begin
                CLA_4bit C0(.S(l4[i][3:0]),.Cout(l4[i][4]),.A(l3[2*i]),.B(l3[2*i+1]));
                // assign l4[i]=l3[2*i]+l3[2*i+1];
        end
endgenerate
assign l4[5] = l3[10];

generate
        for(i=0;i<3;i=i+1)begin
                // assign l5[i]=l4[2*i]+l4[2*i+1];
                CLA_5bit C1(.S(l5[i][4:0]),.Cout(l5[i][5]),.A(l4[2*i]),.B(l4[2*i+1]));
        end
endgenerate
// assign l6 = l5[0]+l5[1];
CLA_6bit C2(.S(l6[5:0]),.Cout(l6[6]),.A(l5[0]),.B(l5[1]));
wire [7:0] l7;
CLA_7bit C3(.S(l7[6:0]),.Cout(l7[7]),.A(l6),.B({1'b0,l5[2]}));
always @(*) begin
        // out_data = l6+l5[2];
        out_data = l7;
        
end
endmodule

module CLA_3bit(output [2:0] S, output Cout, input [2:0] A,input [2:0] B);
  wire [2:0] G,P,C;

  assign G = A & B; //Generate
  assign P = A ^ B; //Propagate
  assign C[0] = 0;
  assign C[1] = G[0] | (P[0]&C[0]);
  assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
  assign Cout = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0]);
  assign S = P ^ C;
  // assign PG = P[3] & P[2] & P[1] & P[0];
  // assign GG = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule

module CLA_4bit(output [3:0] S, output Cout, input [3:0] A,input [3:0] B);
  wire [3:0] G,P,C;

  assign G = A & B; //Generate
  assign P = A ^ B; //Propagate
  assign C[0] = 0;
  assign C[1] = G[0] | (P[0]&C[0]);
  assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
  assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0]);
  assign Cout = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) 
             |(P[3]&P[2]&P[1]&P[0]&C[0]);
  assign S = P ^ C;
  // assign PG = P[3] & P[2] & P[1] & P[0];
  // assign GG = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule
module CLA_5bit(output [4:0] S, output Cout, input [4:0] A,input [4:0] B);
  wire [4:0] G,P,C;

  assign G = A & B; //Generate
  assign P = A ^ B; //Propagate
  assign C[0] = 0;
  assign C[1] = G[0] | (P[0]&C[0]);
  assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
  assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0]);
  assign C[4] = G[3]| (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&C[0]);

  assign Cout = G[4]|(P[4]&G[3]) | (P[4]&P[3]&G[2]) | (P[4]&P[3]&P[2]&G[1]) | (P[4]&P[3]&P[2]&P[1]&G[0]) 
             |(P[4]&P[3]&P[2]&P[1]&P[0]&C[0]);
  assign S = P ^ C;
  // assign PG = P[3] & P[2] & P[1] & P[0];
  // assign GG = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule
module CLA_6bit(output [5:0] S, output Cout, input [5:0] A,input [5:0] B);
  wire [5:0] G,P,C;

  assign G = A & B; //Generate
  assign P = A ^ B; //Propagate
  assign C[0] = 0;
  assign C[1] = G[0] | (P[0]&C[0]);
  assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
  assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0]);
  assign C[4] = G[3]| (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&C[0]);
  assign C[5] = G[4]|(P[4]&G[3]) | (P[4]&P[3]&G[2]) | (P[4]&P[3]&P[2]&G[1]) | (P[4]&P[3]&P[2]&P[1]&G[0]) 
             |(P[4]&P[3]&P[2]&P[1]&P[0]&C[0]);
  assign Cout = G[5]|(P[5]&G[4])|(P[5]&P[4]&G[3]) | (P[5]&P[4]&P[3]&G[2]) | (P[5]&P[4]&P[3]&P[2]&G[1]) | (P[5]&P[4]&P[3]&P[2]&P[1]&G[0]) 
             |(P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&C[0]);
  assign S = P ^ C;
  // assign PG = P[3] & P[2] & P[1] & P[0];
  // assign GG = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule
module CLA_7bit(output [6:0] S, output Cout, input [6:0] A,input [6:0] B);
  wire [6:0] G,P,C;

  assign G = A & B; //Generate
  assign P = A ^ B; //Propagate
  assign C[0] = 0;
  assign C[1] = G[0] | (P[0]&C[0]);
  assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
  assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0]);
  assign C[4] = G[3]| (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&C[0]);
  assign C[5] = G[4]|(P[4]&G[3]) | (P[4]&P[3]&G[2]) | (P[4]&P[3]&P[2]&G[1]) | (P[4]&P[3]&P[2]&P[1]&G[0]) 
             |(P[4]&P[3]&P[2]&P[1]&P[0]&C[0]);
  assign C[6] = G[5]|(P[5]&G[4])|(P[5]&P[4]&G[3]) | (P[5]&P[4]&P[3]&G[2]) | (P[5]&P[4]&P[3]&P[2]&G[1]) | (P[5]&P[4]&P[3]&P[2]&P[1]&G[0]) 
             |(P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&C[0]);
  assign Cout = G[6]| (P[6]&G[5])|(P[6]&P[5]&G[4])|(P[5]&P[4]&G[3]) | (P[6]&P[5]&P[4]&P[3]&G[2]) | (P[6]&P[5]&P[4]&P[3]&P[2]&G[1]) | (P[6]&P[5]&P[4]&P[3]&P[2]&P[1]&G[0]) 
             |(P[6]&P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&C[0]);
  assign S = P ^ C;
  // assign PG = P[3] & P[2] & P[1] & P[0];
  // assign GG = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule