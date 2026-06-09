`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 16:52:24
// Design Name: 
// Module Name: usr_tb
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


module usr_tb;
reg clk_tb;
reg rst_tb;
reg sin_tb;
reg [3:0] pin_tb;
reg shift_tb;
reg load_tb;
reg [1:0] mode_tb;

wire sout_tb;
wire [3:0] pout_tb;

usr uut(
    .clk(clk_tb),
    .rst(rst_tb),
    .sin(sin_tb),
    .pin(pin_tb),
    .shift(shift_tb),
    .load(load_tb),
    .mode(mode_tb),
    .sout(sout_tb),
    .pout(pout_tb)
);

initial
begin
    {clk_tb, rst_tb, sin_tb, shift_tb, load_tb, mode_tb, pin_tb} = 0;
end

always #5 clk_tb = ~clk_tb;

initial
begin
    $dumpfile("usr_tb.vcd");
    $dumpvars(0, usr_tb);

    rst_tb = 1;
    #10;
    rst_tb = 0;

    mode_tb = 2'b00;
    shift_tb = 1;
    load_tb = 0;

    sin_tb = 1; #10;
    sin_tb = 0; #10;
    sin_tb = 1; #10;
    sin_tb = 1; #10;

    mode_tb = 2'b01;
    shift_tb = 1;
    load_tb = 0;

    sin_tb = 1; #10;
    sin_tb = 0; #10;
    sin_tb = 1; #10;
    sin_tb = 0; #10;

    mode_tb = 2'b10;
    shift_tb = 0;
    pin_tb = 4'b1101;
    load_tb = 1;
    #10;

    load_tb = 0;
    shift_tb = 1;
    #40;      
    mode_tb = 2'b11;
    shift_tb = 0;
    pin_tb = 4'b1010;
    load_tb = 1;
    #10;

    load_tb = 0;
    #20;
end
endmodule
