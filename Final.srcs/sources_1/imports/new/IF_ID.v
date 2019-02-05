`timescale 1ns / 1ps


module IF_ID(clk, inst_in, inst_out);
input clk;
input [31:0] inst_in;
output reg [31:0] inst_out;

always @(posedge clk)
begin
    inst_out = inst_in;
end
endmodule
