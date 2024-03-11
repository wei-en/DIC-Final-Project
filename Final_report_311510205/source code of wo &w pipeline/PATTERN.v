
//==============================================
//==============================================					
//												
//	File Name		:	PATTERN.v					
//	Module Name		:	PATTERN						
//	Release version	:	v1.0				
//												
//==============================================
//==============================================
`define CYCLE_TIME 0.5

module PATTERN	(
    //input
    clk,
    rst_n,
    
    //output
    in_valid,
	A,

    out_valid,
	out_data
);

//------------------------------
//	I/O Ports
//------------------------------
input [7:0] out_data;
input out_valid;
output reg  [127:0]A ;
output reg	clk,rst_n,in_valid;
//------------------------------
//	Parameter & Integer
//------------------------------
integer PATNUM = 1000;
integer total_latency,latency;
integer patcount;
integer i;
//------------------------------
//	Register
//------------------------------
integer golden_out;
// edit seed here ================================================================================
integer SEED = 255;
//================================================================================================

//================================================================
// clock
//================================================================

real	CYCLE = `CYCLE_TIME;
initial	clk = 0;
always	#(CYCLE/2.0) clk = ~clk;


//------------------------------
//	Initial
//------------------------------
initial begin
	// A = 128'bx;
	// golden_out = 0;
   reset_tsk;
	repeat(20) @(negedge clk);
    total_latency=0;
	for(patcount = 0; patcount < PATNUM; patcount = patcount + 1)
	begin		
		gen_data;
		gen_golden;
        A = 128'bx;
        latency = 0;
		while(out_valid !== 1'b1)
		begin
			@(negedge clk);
			latency = latency + 1;
			if(latency>10000) begin
			    $display("--------------------------------------------------\n");
				$display("          PATNUM %d FAIL!\n                         ", patcount);
				$display("      Latency longer than 10000cycles !         \n");
				$display("--------------------------------------------------\n");
				$finish;
			end
		end
		total_latency = total_latency + latency;
		check_ans;
       
		repeat(3) @(negedge clk);
	end
	display_pass;
    
    repeat(3) @(negedge clk);
    $finish;
end
//////////////////////////////////////////////////
task reset_tsk; begin 
	rst_n = 'b1;
	in_valid = 1'b0;
    A = 128'bx;
	golden_out = 0;

	force clk = 0;
    #CYCLE; rst_n = 0; 
    #CYCLE; rst_n = 1;

  	if(out_valid !== 0 || out_data !== 0) begin
    	$display(" ");
        $display("==============================================================");
        $display(">>>>> \033[91mOutput Should Be 0 After Reset!\033[m" );
        $display("==============================================================");
        $display(" ");
        $finish;
    end

  	#CYCLE; release clk; 
end 
endtask

//////////////////////////////////////////////////

task gen_data; begin
    @(negedge clk);
    // repeat(SEED%6) @(negedge clk);
	in_valid = 1'b1;
	for (i=0;i<128;i=i+1) begin
        A[i] = $random(SEED) % 'd2;
		// if(i<patcount)  A[i] = $random(SEED) % 'd2;
		// else			A[i] = 0;
	end
    @(negedge clk);
    in_valid = 1'b0;
end endtask

task gen_golden; begin
    golden_out = 'd0;
    for (i=0;i<128;i=i+1) begin
        golden_out = golden_out+ A[i];
	end
    //golden_out = patcount;
end endtask

task check_ans; begin
    if(out_data !== golden_out)
    begin
        $display ("-------------------------------------------------------------------");
        $display ("                             FAIL!!                               ");
		$display ("                         PATTERN NO.%4d 	                    ", patcount);
        $display ("           answer should be : %d , your answer is : %d         ", golden_out, out_data);
        $display ("-------------------------------------------------------------------");
        // #(100);
        $finish ;
    end
    else 
        $display ("             Pass Pattern NO. %d          ", patcount);
end
endtask
task display_pass;
begin
        $display("\n");
        $display("\n");
        $display("        -----------------------------------");
        $display("        --  Congratulations !!           -- ");
        $display("        --  You have pass all pattern!!  -- ");
        $display("        -----------------------------------  ");
        $display("\n");
end
endtask
endmodule
