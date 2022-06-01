`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 12:55:16 AM
// Design Name: 
// Module Name: mux
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


module mux(
    input [7:0] a,
    input [7:0] b,
    input selector,
    output reg [7:0] selection
    );
    always @(a, b, selector)
        begin
            case(selector)
                1'b1: selection = b; //select b
                1'b0: selection = a; //select a
            endcase 
        end
endmodule
