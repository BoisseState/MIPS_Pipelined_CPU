`timescale 1ns / 1ps

module IncrPC(PC, PCplus4);

input [31:0] PC;
output reg [31:0] PCplus4;

always @(PC)
begin 
    PCplus4 = PC + 32'd4;
end
endmodule
