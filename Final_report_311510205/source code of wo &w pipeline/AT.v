module AT(
        clk,
        rst_n,

        in_valid,
        A,
        
        out_valid,
        out_data
        
);
// ===============================================================
// Input & Output Declaration
// ===============================================================
input clk,rst_n;
input	 [127:0]A;
input in_valid;
output	reg [7:0]out_data;
output  reg out_valid;

reg [7:0]count2;

reg	 [127:0]As;
reg [7:0]ans;
reg [7:0]SA,SB,SC,SD;

reg count;


wire [63:0]A1;
wire [63:0]B,C,D;

assign A1=A[31:0];
assign B=A[63:32];
assign C=A[95:64];
assign D=A[127:96];
// ===============================================================
// Input & Output Declaration
// ===============================================================
genvar i;
generate
for ( i=0 ;i<64 ;i=i+1 ) begin:s2
reg [1:0]s2bit;
always @(posedge clk, negedge rst_n) begin
	if (!rst_n) begin
		s2bit<=0;
	end
	else begin
	if(in_valid)begin
	   s2bit<=A[i]+A[127-i];   
	end
	else begin
           s2bit<=s2bit;
	end	
        end
end
end
endgenerate
generate
for ( i=0 ;i<32 ;i=i+1 ) begin:s3
reg [2:0]s3bit;
always @(posedge clk, negedge rst_n) begin
	if (!rst_n) begin
		s3bit<=0;
	end
	else begin
	if(count2==1)begin
	   s3bit<= s2[i].s2bit+ s2[63-i].s2bit;   
	end
	else begin
           s3bit<=s3bit;
	end	
        end
end
end
endgenerate
generate
for ( i=0 ;i<16 ;i=i+1 ) begin:s4
reg [3:0]s4bit;
always @(posedge clk, negedge rst_n) begin
	if (!rst_n) begin
		s4bit<=0;
	end
	else begin
	if(count2==2)begin
	   s4bit<= s3[i].s3bit+ s3[31-i].s3bit;   
	end
	else begin
           s4bit<=s4bit;
	end	
        end
end
end
endgenerate
generate
for ( i=0 ;i<8 ;i=i+1 ) begin:s5
reg [4:0]s5bit;
always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
		s5bit<=0;
	end
	else begin
        if(count2==3)begin
	   s5bit<= s4[i].s4bit+ s4[15-i].s4bit;  
	end
	else begin
           s5bit<=s5bit;
        end 
        end
           
end
end
endgenerate
generate
for ( i=0 ;i<4 ;i=i+1 ) begin:s6
reg [5:0]s6bit;
always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
		s6bit<=0;
	end
	else begin
        if(count2==4)begin
	   s6bit<= s5[i].s5bit+ s5[7-i].s5bit;  
	end
	else begin
           s6bit<=s6bit;
        end   
        end
end     
end
endgenerate
generate
for ( i=0 ;i<2 ;i=i+1 ) begin:s7
reg [6:0]s7bit;
always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
		s7bit<=0;
	end
	else begin
        if(count2==5)begin
	   s7bit<= s6[i].s6bit+ s6[3-i].s6bit; 
	end
	else begin
           s7bit<=s7bit;
        end   
        end
end
end
endgenerate
// always @(posedge clk, negedge rst_n) begin
// 	if (!rst_n) begin
// 		ans<=0;
// 	end
// 	else begin
// 		if(count2==6)begin
// 			//ans<=s8[0].s8bit +s8[1].s8bit;
//                           ans<=s7[0].s7bit+ s7[1].s7bit;      
// 		end
// 		else begin
// 			ans<=ans;
// 		end	
// 	end
// end
// ===============================================================
// 
// ===============================================================
always @(posedge clk, negedge rst_n) begin
	if (!rst_n) begin
	        count2<=0;
	end
	else begin
                if (in_valid)count2<=count2+1;
                else if (count2>0 && count2<7)count2<=count2+1;
	        else count2<=0;
	end
end
// always @(posedge clk, negedge rst_n) begin
// 	if (!rst_n) begin
// 	        count<=0;
// 	end
// 	else begin
//                 if (in_valid)count<=count+1;
//                 //else if (count>0 && count<3)
// 	        else count<=0;
// 	end
// end

// always @(posedge clk, negedge rst_n) begin
// 	if (!rst_n) begin
// 		SA<=0;
// 	end
// 	else begin
// 		if(in_valid)begin
// 			SA<=A1[0]+A1[1]+A1[2]+A1[3]+A1[4]+A1[5]+A1[6]+A1[7]
// 				+A1[8]+A1[9]+A1[10]+A1[11]+A1[12]+A1[13]+A1[14]+A1[15]
// 				+A1[16]+A1[17]+A1[18]+A1[19]+A1[20]+A1[21]+A1[22]+A1[23]
// 				+A1[24]+A1[25]+A1[26]+A1[27]+A1[28]+A1[29]+A1[30]+A1[31];
                                
// 		end
// 		else begin
// 			SA<=SA;
// 		end	
// 	end
// end
// always @(posedge clk, negedge rst_n) begin
// 	if (!rst_n) begin
// 		SB<=0;
// 	end
// 	else begin
// 	        if(in_valid)begin
// 			SB<=B[0]+B[1]+B[2]+B[3]+B[4]+B[5]+B[6]+B[7]
// 				+B[8]+B[9]+B[10]+B[11]+B[12]+B[13]+B[14]+B[15]
// 				+B[16]+B[17]+B[18]+B[19]+B[20]+B[21]+B[22]+B[23]
// 				+B[24]+B[25]+B[26]+B[27]+B[28]+B[29]+B[30]+B[31];
// 		end
// 		else begin
// 			SB<=SB;
// 		end
// 	end
// end
// always @(posedge clk, negedge rst_n) begin
// 	if (!rst_n) begin
// 		SC<=0;
// 	end
// 	else begin
// 	        if(in_valid)begin
// 			SC<=C[0]+C[1]+C[2]+C[3]+C[4]+C[5]+C[6]+C[7]
// 				+C[8]+C[9]+C[10]+C[11]+C[12]+C[13]+C[14]+C[15]
// 				+C[16]+C[17]+C[18]+C[19]+C[20]+C[21]+C[22]+C[23]
// 				+C[24]+C[25]+C[26]+C[27]+C[28]+C[29]+C[30]+C[31];
// 		end
// 		else begin
// 			SC<=SC;
// 		end
// 	end
// end
// always @(posedge clk, negedge rst_n) begin
// 	if (!rst_n) begin
// 		SD<=0;
// 	end
// 	else begin
// 	        if(in_valid)begin
// 			SD<=D[0]+D[1]+D[2]+D[3]+D[4]+D[5]+D[6]+D[7]
// 				+D[8]+D[9]+D[10]+D[11]+D[12]+D[13]+D[14]+D[15]
// 				+D[16]+D[17]+D[18]+D[19]+D[20]+D[21]+D[22]+D[23]
// 				+D[24]+D[25]+D[26]+D[27]+D[28]+D[29]+D[30]+D[31];
// 		end
// 		else begin
// 			SD<=SD;
// 		end
// 	end
// end
always @(posedge clk, negedge rst_n) begin
	if (!rst_n) begin
		out_data<=0;
	end
	else begin
	        // if(count==1)begin
		// 	out_data<=SA+SB+SC+SD;
                //         //out_data<=ans;
	        // end
		// else begin
		// 	out_data<=0;
		// end
                if(count2==6)begin
			out_data<=s7[0].s7bit+ s7[1].s7bit;
                        //out_data<=ans;
	        end
		else begin
			out_data<=0;
		end
	end
end
always @(posedge clk, negedge rst_n) begin
	if (!rst_n) begin
		out_valid<=0;
	end
	else begin
		// if(count==1)begin
		// 	out_valid<=1;
		// end
		// else begin
		// 	out_valid<=0;
		// end
                if(count2==6)begin
			out_valid<=1;
		end
		else begin
			out_valid<=0;
		end
	end
end	
	
endmodule