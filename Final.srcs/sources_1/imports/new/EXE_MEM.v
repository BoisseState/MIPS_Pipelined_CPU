`timescale 1ns / 1ps


module EXE_MEM(clk, ewreg, em2reg, ewmem, ern, eqb, r, mwreg, mm2reg, mwmem, mrn, mqb, mr);
input clk, ewreg, em2reg, ewmem;
input [4:0] ern;
input [31:0] eqb, r;
output reg mwreg, mm2reg, mwmem;
output reg [4:0] mrn;
output reg [31:0] mqb, mr;

always @(posedge clk)
begin
    mwreg = ewreg;
    mm2reg = em2reg;
    mwmem = ewmem;
    mrn = ern;
    mqb = eqb;
    mr = r;
end
endmodule
