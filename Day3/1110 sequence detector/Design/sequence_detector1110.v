`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:18:07
// Design Name: 
// Module Name: sequence_detector1110
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

 module sequence_detector1110(input rst,din,clk,output reg detected

    );
    parameter idle=2'b00;
    parameter s1=2'b01;
    parameter s2=2'b10;
    parameter s3=2'b11;
    reg [1:0] ps,ns;
     // present State Logic
     always @(posedge clk) begin
        if (rst)
            ps <= idle;
        else
            ps <= ns;
    end
     // Next State Logic 
always @(*) begin

 
    ns = ps;
    detected = 1'b0;
    
    case (ps)

        idle: begin
            if (din == 1)
                ns = s1;
            else
                ns = idle;
        end

        s1: begin
            if (din == 1)
                ns = s2;
            else
                ns = idle;
        end

        s2: begin
            if (din == 1)
                ns = s3;
            else
                ns = idle;
        end

        s3: begin
            if (din == 0) begin
                ns = idle;      
                detected = 1'b1;
            end
            else begin
                ns = s3;        
            end
        end

        default: begin
            ns = idle;
            detected = 1'b0;
        end

    endcase

end

         
    
endmodule
