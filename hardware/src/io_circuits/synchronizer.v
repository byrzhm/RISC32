`timescale 1ns/1ns

module synchronizer #(parameter WIDTH = 1) (
  input [WIDTH-1:0] async_signal,
  input clk,
  output [WIDTH-1:0] sync_signal
);

  wire [WIDTH-1:0] dff0_q;
  REGISTER #(.N(WIDTH)) dff0 (
    .q(dff0_q),
    .d(async_signal),
    .clk(clk)
  );

  REGISTER #(.N(WIDTH)) dff1 (
    .q(sync_signal),
    .d(dff0_q),
    .clk(clk)
  );
endmodule
