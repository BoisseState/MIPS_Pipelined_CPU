`timescale 1ns / 1ps

module PCReg(clk, switch, PCplus4, PC);
input clk, switch;
input [31:0] PCplus4;
output reg [31:0] PC;

initial 
begin
    PC = 32'd100;
end

always @(posedge clk)
begin
    if(switch == 1)
        PC = PCplus4;
    else
        PC = 32'd100;     
end
endmodule
