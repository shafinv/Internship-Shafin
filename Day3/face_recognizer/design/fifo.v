`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 12:05:49
// Design Name: 
// Module Name: fifo
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


module fifo(
    input wire clk,
    input wire rst,
    input wire wrenb,
    input wire rdenb,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output wire full,      
    output wire empty      
);
            
    reg [7:0] mem [0:7];
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr; 
    integer i;

    assign empty = (wr_ptr == rd_ptr);
    assign full = ((wr_ptr + 3'b001) == rd_ptr);
    
    always @(posedge clk) begin
        if (rst) begin
            wr_ptr <= 3'b000;  
            rd_ptr <= 3'b000;  
            data_out <= 8'b0;
            for(i=0; i<8; i=i+1) begin
                mem[i] <= 8'b0;
            end
        end
         else begin         
            if(wrenb == 1 && full == 0) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 3'b001;
            end 
            if(rdenb == 1 && empty == 0) begin 
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 3'b001;
            end
          end
        end
endmodule