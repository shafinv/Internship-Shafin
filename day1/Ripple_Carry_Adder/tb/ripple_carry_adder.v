`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 15:34:25
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(input [3:0]a_rca,[3:0]b_rca,input cin_rca, output [3:0]sum_rca,output cout

    );
    wire w1,w2,w3;
    fulladder FA1(a_rca[0],b_rca[0],cin_rca,sum_rca[0],w1);
    fulladder FA2(a_rca[1],b_rca[1],w1,sum_rca[1],w2);
    fulladder FA3(a_rca[2],b_rca[2],w2,sum_rca[2],w3);
    fulladder FA4(a_rca[3],b_rca[3],w3,sum_rca[3],cout);
endmodule
