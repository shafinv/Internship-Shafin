`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 16:37:11
// Design Name: 
// Module Name: top_module_tb
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

module top_module_tb;

    reg clk;
    reg rst;
    reg [7:0] system_data_in;

    wire [7:0] system_data_out;
    wire system_data_valid;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .system_data_in(system_data_in),
        .system_data_out(system_data_out),
        .system_data_valid(system_data_valid)
    );

    always #5 clk = ~clk;

    integer i;

    initial begin
      
        clk = 0;
        rst = 1;
        system_data_in = 0;

        
        #20;        
        rst = 0;    

       
        for (i = 1; i <= 7; i = i + 1) begin
            @(negedge clk);
            system_data_in = i;
        end

        @(negedge clk);
        system_data_in = 8'h00;
        #300; 
        $finish;
    end
    
    initial begin
        $monitor("Time=%0t | rst=%b | Data IN=%3d | Valid OUT=%b | Data OUT=%3d", 
                 $time, rst, system_data_in, system_data_valid, system_data_out);
    end

endmodule