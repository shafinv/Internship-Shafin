`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 14:59:11
// Design Name: 
// Module Name: block_ram_tb
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


module block_ram_tb(

    );
    reg clk_tb;
    reg arst_tb;
    reg wrenb_tb;
    reg [2:0]write_address_tb;
    reg [2:0]read_address_tb;
    reg [7:0]data_in_tb;
    wire [7:0]data_out_tb;
    
    integer i;
     block_ram uut (clk_tb,arst_tb,wrenb_tb,write_address_tb,read_address_tb,data_in_tb,data_out_tb);
     
    always #5 clk_tb=~clk_tb;
    initial
     begin
       
        clk_tb = 0;
        arst_tb = 0; 
        wrenb_tb = 0;
        write_address_tb = 3'b000;
        read_address_tb = 3'b000;
        data_in_tb = 8'h00;   
        #15; 
        arst_tb = 1; 
        wrenb_tb = 1; 
        for (i = 0; i < 8; i = i + 1)
         begin
            @(negedge clk_tb);
            write_address_tb = i;
            data_in_tb = i + 10;           
        end     
        wrenb_tb = 0;
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk_tb);
            read_address_tb = i;        
        end
     $finish;
    end
endmodule