`timescale 1ns / 1ps

module Testbench();
reg clk;
wire out;
reg switch;

CPU main(clk, switch, out);

initial 
begin
    clk = 1'b0;
    switch = 1'b1;
    #110 switch = 1'b0;
    #30 $finish;
end

always begin
    #5 clk <= ~clk;
end
endmodule
