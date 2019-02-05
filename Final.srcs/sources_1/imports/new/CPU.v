`timescale 1ns / 1ps

module CPU(clk, switch, out);
input wire clk, switch;
output reg out;

wire [31:0] inst_out, inst_in;
wire [31:0] PC;
wire [31:0] PCplus4;
 
wire wreg, m2reg, wmem, aluimm;
wire [3:0] aluc;
wire [4:0] rn;
wire [31:0] d, qa, qb, e;

wire [5:0] op;
assign op = inst_out[31:26];
wire [4:0] rs;
assign rs = inst_out[25:21];
wire [4:0] rt;
assign rt = inst_out[20:16];
wire [4:0] rd;
assign rd = inst_out[15:11];
wire [5:0] func;
assign func = inst_out[5:0];
wire [15:0] imm;
assign imm = inst_out[15:0];
wire regrt;

wire ewreg, em2reg, ewmem, ealuimm;
wire [3:0] ealuc;
wire [4:0] ern;
wire [31:0] eqa, eqb, ee, b, r;

wire mwreg, mm2reg, mwmem;
wire [4:0] mrn;
wire [31:0] mqb, mr;
wire [31:0] do;

wire wwreg, wm2reg;
wire [4:0] wrn;
wire [31:0] wdo, wr;

//IF 
PCReg mainpc(clk, switch, PCplus4, PC);
IncrPC incr(PC, PCplus4);
instructionMemory instMem(PC, inst_in);
IF_ID ifid(clk, inst_in, inst_out);

//ID 
REGFile RF(rs, rt, d, wrn, wwreg, clk, qa, qb);
CntrlUnit cu(op, func, wreg, m2reg, wmem, aluc, aluimm, regrt);
assign rn = (regrt) ? rt:rd;
signExt se(imm, e);
ID_EXE idexe(clk, wreg, m2reg, wmem, aluc, aluimm, rn, qa, qb, e, ewreg, em2reg, ewmem, ealuc, ealuimm, ern, eqa, eqb, ee);

//EXE
assign b = (ealuimm) ? ee : eqb;
ALU alu1(clk, ealuc, eqa, b, r);
//MEM
EXE_MEM exemem(clk, ewreg, em2reg, ewmem, ern, eqb, r, mwreg, mm2reg, mwmem, mrn, mqb, mr);
DataMem datamem1(mqb, mr, mwmem, do);
//WB
MEM_WB memwb(clk, mwreg, mm2reg, mrn, mr, do, wwreg, wm2reg, wrn, wr, wdo);
assign d = (wm2reg) ? wdo : wr; //wr comes from ALU. wdo comes from data memory

initial begin
    out = 1'b0;
end

always @(posedge clk)
begin
if (PC == 32'd132)
    begin
        out = 1'b1;
    end
else if(switch == 0)
    begin
        out = 1'b0;
    end
end



endmodule


