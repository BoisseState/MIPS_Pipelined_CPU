`timescale 1ns / 1ps


module REGFile(rs, rt, d, wn, we, clk, qa, qb);
input [31:0] d;
input [4:0] rs, rt, wn;
input we, clk;
output [31:0] qa, qb;
integer i;
reg [31:0] mainReg [1:31];

initial 
begin
     mainReg[0] = 32'h0;
     mainReg[1] = 32'hA00000AA;
     mainReg[2] = 32'h10000011;
     mainReg[3] = 32'h20000022;
     mainReg[4] = 32'h30000033;
     mainReg[5] = 32'h40000044;
     mainReg[6] = 32'h50000055;
     mainReg[7] = 32'h60000066;
     mainReg[8] = 32'h70000077;
     mainReg[9] = 32'h80000088;
     mainReg[10] = 32'h90000099;
end
assign qa = (rs == 0) ? 0 : mainReg[rs];
assign qb = (rt == 0) ? 0 : mainReg[rt];    

always @(posedge clk)
begin
    if((wn != 0) && we)
    begin
       mainReg[wn] <= d;
    end      
end
endmodule
