`timescale 1ns / 1ps


module instructionMemory(PC, inst);

input [31:0] PC;
output reg [31:0] inst;

always @(PC)
begin
case(PC)
      100: inst = 32'h00221820; //add $3 $1 $2
      104: inst = 32'h00221820; //stall
      108: inst = 32'h00221820; //stall
      112: inst = 32'h00221820; //stall
      116: inst = 32'h01232022; //sub $4 $9 $3
      120: inst = 32'h00692825; //or $5 $3 $9
      124: inst = 32'h00693026; //xor $6 $3 $9
      128: inst = 32'h00693824; //and $7 $3 $9
endcase
end
endmodule
