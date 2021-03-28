`timescale 1ns / 1ps

module top(
    input CLK,
    // TV out
    output tvout,
    // Keyboard
    input ps_data,
    input ps_clk
);

wire ear = 1'b0;

reg clk13 = 1'b0;
wire clk26;

wire [10:0] ps2_key;

pll pll(
    .clk12(CLK),
    .clk26(clk26)
);

// Clock divider
always @(posedge clk26) 
    clk13 <= !clk13;

ps2 ps2(
    .clk(clk13),
    .ps2_clk(ps_clk),
    .ps2_data(ps_data),
    .ps2_key(ps2_key)
);

fpga_zx81 zx81(
    .clk_sys(clk13),
    .ear(ear),
    .v_out(tvout),
    .ps2_key(ps2_key)
);



endmodule