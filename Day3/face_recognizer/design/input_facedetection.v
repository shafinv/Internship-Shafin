`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 15:26:42
// Design Name: 
// Module Name: input_facedetection
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


module input_facedetection(
    input wire [7:0] P_in,
    input wire clk,
    input wire rst,         
    input wire fifo_full,
    output reg [7:0] P_out,
    output reg wrenabler
);
    
    always @(posedge clk) begin 
        if (rst) begin
           P_out <= 8'b0;
           wrenabler <= 1'b0;
           end
       else if (fifo_full) begin
             wrenabler <= 1'b0;
        end else begin   
             P_out <= P_in;
             wrenabler <= 1'b1;
        end   
    end 
endmodule