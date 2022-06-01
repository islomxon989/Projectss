`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 03:22:01 PM
// Design Name: 
// Module Name: sign_extension
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


module sign_extension(
    input [2:0] in,
    output reg [7:0] out
    );
    always @(in)
        begin
            out[2:0] = in[2:0];
            for (integer i = 3; i < 8; i = i + 1) begin
                out[i] = in[2];
            end            
        end
endmodule
