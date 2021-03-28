module pll(
	input  clk12,
	output clk26
	);

// Input 12Mhz -> output 26 Mhz
SB_PLL40_PAD #(
.FEEDBACK_PATH("SIMPLE"),
.PLLOUT_SELECT("GENCLK"),
.DIVR(4'b0000),		// DIVR =  0
.DIVF(7'b1000100),	// DIVF = 68
.DIVQ(3'b101),		// DIVQ =  5
.FILTER_RANGE(3'b001)	// FILTER_RANGE = 1
) SB_PLL40_CORE_inst (
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .PACKAGEPIN(clk12),
    .PLLOUTCORE(clk26)
);
endmodule