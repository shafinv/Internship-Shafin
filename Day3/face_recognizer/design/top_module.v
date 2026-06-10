`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 16:35:14
// Design Name: 
// Module Name: top_module
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


module top_module (
    input wire clk,
    input wire rst,
    input wire [7:0] system_data_in,   
    output wire [7:0] system_data_out, 
    output wire system_data_valid      
);

    wire [7:0] facetofifo_data;
    wire facetofifo_wren;
    wire wfifo_full;
    wire wfifo_empty;
    wire [7:0] fifotofsm_data;
    wire fsm_rden;

    input_facedetection m1(
        .P_in(system_data_in),
        .clk(clk),
        .rst(rst),
        .fifo_full(wfifo_full),
        .P_out(facetofifo_data),
        .wrenabler(facetofifo_wren)
    );

    fifo m2 (
        .clk(clk),
        .rst(rst),
        .wrenb(facetofifo_wren),
        .rdenb(fsm_rden),
        .data_in(facetofifo_data),
        .data_out(fifotofsm_data),
        .full(wfifo_full),
        .empty(wfifo_empty)
    );

    third_module_fsm m3(
        .clk(clk),
        .rst(rst),
        .fifo_empty(wfifo_empty),
        .data_in(fifotofsm_data),
        .fifo_rd_en(fsm_rden),
        .data_out(system_data_out),
        .data_valid(system_data_valid)
    );

endmodule