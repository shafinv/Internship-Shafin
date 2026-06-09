`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 09:13:24
// Design Name: 
// Module Name: bcd_adder_tb
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


module bcd_adder_tb(

    );
    reg [3:0]a_tb;
    reg [3:0]b_tb;
    reg cin_tb;
    wire [3:0]s_tb;
    wire cout_tb;
    
    bcd_adder dut(a_tb,b_tb,cin_tb,s_tb,cout_tb);
    initial
    begin
    {a_tb,b_tb,cin_tb}=0;
    end
    initial
    begin
     a_tb=4'd3;
    b_tb=4'd4;
    cin_tb=1'b0;
    #1;
    a_tb=4'd5;
    b_tb=4'd4;
    cin_tb=1'b0;
    #1;
    a_tb=4'd6;
    b_tb=4'd7;
    cin_tb=1'b0;
    #1;
    a_tb=4'd9;
    b_tb=4'd9;
    cin_tb=1'b1;
    #1;
    $monitor("the value of a_tb is %b the value of b_tb is %b the value of cin_tb is %b the value of s_tb is %b the value of cout_tb is %b",a_tb,b_tb,cin_tb,s_tb,cout_tb);
    end
endmodule
