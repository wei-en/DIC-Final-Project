`timescale 1ns/1ps

`include "../00_TESTBED/PATTERN.v"
`ifdef RTL
	`include "AT.v"
`endif

`ifdef GATE
	`include "../02_SYN/Netlist/AT_SYN.v"
`endif





module TESTBED();
//input
wire			clk,rst_n;
wire [127:0]A;
wire			in_valid;
//output
wire out_valid;
wire [7:0] out_data;

	

PATTERN	u_PATTERN(
	.clk(clk),
	.rst_n(rst_n),
	.in_valid(in_valid),
	.A(A),

	.out_valid(out_valid),
	.out_data(out_data)
	);

`ifdef RTL
	AT	u_AT(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.A(A),
		
		.out_valid(out_valid),
		.out_data(out_data)
		
	);
`endif
`ifdef GATE
	AT	u_AT(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.A(A),
		
		.out_valid(out_valid),
		.out_data(out_data)
		
	);
`endif


initial begin
	`ifdef RTL
		$fsdbDumpfile("AT.fsdb");
		$fsdbDumpvars(0,"+mda");
		$fsdbDumpvars();
	`endif
	`ifdef GATE
		$sdf_annotate("AT_SYN.sdf",u_AT); 
		$fsdbDumpfile("AT_SYN.fsdb");
		$fsdbDumpvars(0,"+mda");
		$fsdbDumpvars();
	`endif
end
		
endmodule