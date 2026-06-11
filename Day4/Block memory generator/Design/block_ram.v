`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 14:23:26
// Design Name: 
// Module Name: block_ram
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


module block_ram(input clk,arst,wrenb,input [2:0]write_address,
             input [2:0]read_address,input [7:0]data_in,output reg [7:0]data_out

    );
    reg [7:0] mem [7:0];
    integer i;
    
    always @(posedge clk or negedge arst)
       begin
           if(!arst)
              begin
                 data_out<=8'b00000000;
                 for(i=0;i<8;i=i+1)
                   begin
                      mem[i]<=8'b00000000;
                   end   
              end
            else 
              begin
                if(wrenb == 1'b1)
                   begin
                     mem[write_address] <= data_in;
                   end  
                else
                   begin
                      data_out <= mem[read_address];
                   end
                end 
       end
endmodule
