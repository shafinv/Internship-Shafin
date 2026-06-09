`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 10:37:35
// Design Name: 
// Module Name: encoder4by2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module encoder4by2(input [3:0]d,output reg [1:0]b);
always@(*)
begin
if(d[0])
b=2'b00;
else if(d[1])
b=2'b01;
else if(d[2])
b=2'b10;
else if(d[3])
b=2'b11;
else
b=2'b00;
end
endmodule
