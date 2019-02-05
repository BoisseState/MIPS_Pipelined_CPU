`timescale 1ns / 1ps

module MEM_WB(clk, mwreg, mm2reg, mrn, mr, do, wwreg, wm2reg, wrn, wr, wdo);
input clk, mwreg, mm2reg;
input [4:0] mrn;
input [31:0] mr, do;
output reg wwreg, wm2reg;
output reg [4:0] wrn;
output reg [31:0] wr, wdo;

always @(posedge clk)
begin
    wwreg = mwreg;
    wm2reg = mm2reg;
    wrn = mrn;
    wr = mr;
    wdo = do;
end
endmodule
