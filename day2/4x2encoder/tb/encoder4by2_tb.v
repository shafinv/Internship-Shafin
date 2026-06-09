`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 10:50:01
// Design Name: 
// Module Name: encoder4by1_tb
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


module encoder4by2_tb(

    );
    reg [3:0]d_tb;
    wire [1:0]b_tb;
    encoder4by2 dut(d_tb,b_tb);
    initial
    begin
    d_tb=4'b0001;
    #5;
    d_tb=4'b0010;
    #5;
    d_tb=4'b0100;
    #5;
    d_tb=4'b1000;
    $monitor("the value of d_tb is %b the value of b_tb is %b", d_tb,b_tb);
    end
endmodule
