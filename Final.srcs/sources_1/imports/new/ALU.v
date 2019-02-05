`timescale 1ns / 1ps

module ALU(clk, ealuc, eqa, b, r);
input clk;
input [3:0] ealuc;
input [31:0] eqa, b;
output reg [31:0] r;

always @(eqa or b or ealuc)
begin
    case(ealuc)
        4'b0010: r = eqa + b;      //add
        4'b0110: r = eqa - b;      //subtract
        4'b0001: r = (eqa | b);    //or
        4'b1111: r = (eqa^b);      //xor
        4'b0000: r = (eqa & b);    //and     
endcase
end
endmodule
