`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 16:05:49
// Design Name: 
// Module Name: third_module_fsm
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


module third_module_fsm (
    input wire clk,
    input wire rst,
    input wire fifo_empty,      
    input wire [7:0] data_in,   
    output reg fifo_rd_en,      
    output reg [7:0] data_out,  
    output reg data_valid       
);
    reg [1:0] state;

    always @(posedge clk) begin
        if (rst) begin
            state <= 2'b00;
            fifo_rd_en <= 1'b0;
            data_out <= 8'b0;
            data_valid <= 1'b0;
        end else begin
            case (state)
                2'b00: begin 
                    data_valid <= 1'b0; 
                    if (fifo_empty == 1'b0) begin
                        fifo_rd_en <= 1'b1; 
                        state <= 2'b01;     
                    end else begin
                        fifo_rd_en <= 1'b0; 
                    end
                end
                2'b01: begin 
                    fifo_rd_en <= 1'b0; 
                    state <= 2'b10;     
                end
                2'b10: begin 
                    data_out <= data_in; 
                    data_valid <= 1'b1;  
                    state <= 2'b00;      
                end
                default: begin
                    state <= 2'b00;
                    fifo_rd_en <= 1'b0;
                end
            endcase
          end
         end
endmodule