`timescale 1ns / 1ps

module signExt(imm, out);
input [15:0] imm;
output reg [31:0] out;

always @(imm)
begin
    if(imm[15:0]== 1'b1)
        out = imm | 32'hFFFF0000;
    else
        out = imm & 32'h0000FFFF;
end
endmodule
