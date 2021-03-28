`timescale 1ns / 1ps
`default_nettype none

module rom (
    input wire clk,
    input wire ce,
    input wire [12:0] a,
    output reg [7:0] dout
);

   reg [7:0] mem[0:8192];
   initial begin
      $readmemh ("mem/zx81.hex", mem);
   end

   always @(posedge clk) begin
     dout <= mem[a];
   end
endmodule


module ram32k (
  input wire clk,
  input wire ce,
  input wire [14:0] a,
  input wire [7:0] din,
  output wire [7:0] dout,
  input wire we
);

wire [15:0] data_out;
wire [15:0] data_in;

SB_SPRAM256KA spram(
  .ADDRESS(a),
  .DATAIN(data_in),
  .DATAOUT(data_out),
  .MASKWREN(4'b1111),
  .WREN(we),
  .CHIPSELECT(ce),
  .CLOCK(clk),
  .STANDBY(1'b0),
  .SLEEP(1'b0),
  .POWEROFF(1'b1)
);

assign data_in[7:0] = din;
assign data_in[15:8] = 8'b1;
assign dout = data_out[7:0];

endmodule

