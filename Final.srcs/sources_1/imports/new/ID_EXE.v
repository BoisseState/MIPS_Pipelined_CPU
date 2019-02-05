`timescale 1ns / 1ps

module ID_EXE(clk, wreg, m2reg, wmem, aluc, aluimm, rn, qa, qb, e, ewreg, em2reg, ewmem, ealuc, ealuimm, ern, eqa, eqb, ee);
input clk, wreg, m2reg, wmem, aluimm;
input [3:0] aluc;
input [4:0] rn;
input [31:0] qa, qb, e;
output reg ewreg, em2reg, ewmem, ealuimm;
output reg [3:0] ealuc;
output reg [4:0] ern;
output reg [31:0] eqa, eqb, ee;

always @(posedge clk)
begin
    ewreg = wreg;
    em2reg = m2reg;
    ewmem = wmem;
    ealuimm = aluimm;
    ealuc = aluc;
    ern = rn;
    eqa = qa;
    eqb = qb;
    ee = e;
end
endmodule
