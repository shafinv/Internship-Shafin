`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 16:00:46
// Design Name: 
// Module Name: ripple_carry_adder_tb
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


module ripple_carry_adder_tb(

    );
    reg [3:0]arca_tb;
    reg [3:0]brca_tb;
    reg cinrca_tb;
    wire [3:0]sumrca_tb;
    wire carryrca_tb;
    
    ripple_carry_adder dut(arca_tb,brca_tb,cinrca_tb,sumrca_tb,carryrca_tb);
    initial
    begin
    {arca_tb,brca_tb,cinrca_tb}=0;
    end
    initial
    begin
    arca_tb=4'b0000;
    brca_tb=4'b0000;
    cinrca_tb=1'b0;
    #1;
    arca_tb=4'b0001;
    brca_tb=4'b0000;
    cinrca_tb=1'b0;
    #1;
    arca_tb=4'b1111;
    brca_tb=4'b1111;
    cinrca_tb=1'b0;
    #1;
    arca_tb=4'b1111;
    brca_tb=4'b1111;
    cinrca_tb=1'b1;
    #1;
    $monitor("the value of arca_tb is %b the value of brca_tb is %b the value of cinrca_tb is %b the value of sumrca_tb is %b the value of carryrca_tb is %b",arca_tb,brca_tb,cinrca_tb,sumrca_tb,carryrca_tb);
    end
endmodule
