`timescale 1ns / 1ps



module DataMem(di, a, we, do);
input we;
input [31:0] di, a;
output reg [31:0] do;
reg [31:0] dMem [31:0];
initial
begin
     dMem[0] <= 32'h0;
     dMem[1] <= 32'hA00000AA;
     dMem[2] <= 32'h10000011;
     dMem[3] <= 32'h20000022;
     dMem[4] <= 32'h30000033;
     dMem[5] <= 32'h40000044;
     dMem[6] <= 32'h50000055;
     dMem[7] <= 32'h60000066;
     dMem[8] <= 32'h70000077;
     dMem[9] <= 32'h80000088;
     dMem[10] <= 32'h90000099;
end

always @(we or a or di)
begin
    if(we)
        dMem[a] = di;
    else
        do = dMem[a/4];
end
endmodule
