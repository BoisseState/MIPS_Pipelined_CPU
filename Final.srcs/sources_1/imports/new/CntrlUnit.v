`timescale 1ns / 1ps

module CntrlUnit(op, func, wreg, m2reg, wmem, aluc, aluimm, regrt);
input [5:0] op, func;
output reg wreg, m2reg, wmem, aluimm, regrt;
output reg [3:0] aluc;

initial
begin 
    m2reg = 1'b0;   //decides whether the value comes from the alu or the data memory. memtoreg
    wmem = 1'b0;    //allows we to data memory. memwrite
    aluc = 4'b0000; //alucontrol unit
    aluimm = 1'b0; //alusrc. decides whther second operand comes from register or the sign extended number. always zero for this
    wreg = 1'b0;   //allows we to reg file. regwrite
    regrt=1'b0;   //decides whether rd or rt is the destination. always rd for r type. same as regdst
end

always @(func)
begin
    if(op == 6'b000000) begin
    m2reg = 1'b0;
    wmem = 1'b0;
    aluimm = 1'b0;
    wreg = 1'b1;
    regrt=1'b0;
    case(func)
        6'b100000: aluc = 4'b0010;  //add
        6'b100010: aluc = 4'b0110;  //subtract
        6'b100101: aluc = 4'b0001;  //or
        6'b100110: aluc = 4'b1111;  //xor
        6'b100100: aluc = 4'b0000;  //and        
    endcase        
    end
    else                //lw
    begin
        m2reg = 1'b1;
        wmem = 1'b0;
        aluc = 4'b0010;
        aluimm = 1'b1;
        wreg = 1'b1;
        regrt=1'b1;
    end
end
endmodule
