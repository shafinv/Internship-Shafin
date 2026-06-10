`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 10:57:50
// Design Name: 
// Module Name: seqdet_1010_tb
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


module sequence_detector1110_tb;

reg clk_tb, rst_tb, din_tb;
wire detected_tb;

sequence_detector1110 dut (
    .rst(rst_tb),
    .din(din_tb),
    .clk(clk_tb),
    .detected(detected_tb)
);

initial begin
    clk_tb = 0;
    forever #5 clk_tb = ~clk_tb;
end

initial begin
    rst_tb = 1;
    din_tb = 0;

    #12 rst_tb = 0;

    // Sequence: 11101110
    #10 din_tb = 1;
    #10 din_tb = 1;
    #10 din_tb = 1;
    #10 din_tb = 0; 

    #10 din_tb = 1;
    #10 din_tb = 1;
    #10 din_tb = 1;
    #10 din_tb = 0;

    #20 $finish;
end

endmodule
