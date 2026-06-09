`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 22:15:37
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);

wire [3:0] s1;
wire temp_cout;
wire [3:0] correction;
wire dummy_cout;
wire k;

ripple_carry_adder RCA1(
    a,
    b,
    cin,
    s1,
    temp_cout
);

assign k = temp_cout | (s1[3] & s1[2]) | (s1[3] & s1[1]);

assign correction = {1'b0, k, k, 1'b0};

ripple_carry_adder RCA2(
    s1,
    correction,
    1'b0,
    s,
    dummy_cout
);

assign cout = k;

endmodule
