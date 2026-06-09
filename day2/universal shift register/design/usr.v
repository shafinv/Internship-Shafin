`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:55:37
// Design Name: 
// Module Name: usr
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




module usr(
    input clk,
    input rst,
    input sin,
    input [3:0] pin,
    input shift,
    input load,
    input [1:0] mode,

    output wire sout,      
    output wire [3:0] pout
);

reg [3:0] temp=4'b0000;
assign pout = temp;
assign sout = temp[0]; 

always @(posedge clk)
begin
    if(rst)
    begin
        temp <= 4'b0000;
    end
    else
    begin
        case(mode)
            2'b00, 2'b01:
            begin
                if(shift)
                begin
                    temp <= {sin, temp[3:1]};
                end
            end
            2'b10:
            begin
                if(load)
                begin
                    temp <= pin;
                end
                else if(shift)
                begin.
                    temp <= {1'b0, temp[3:1]}; 
                end
            end
            2'b11:
            begin
                if(load)
                begin
                    temp <= pin;
                end
            end
            default: temp <= temp; 

        endcase
    end
end

endmodule
