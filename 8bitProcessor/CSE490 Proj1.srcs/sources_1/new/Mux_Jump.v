`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 06:41:58 PM
// Design Name: 
// Module Name: Mux_Jump
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


module Mux_Jump(

input [7:0] PC_addr,
input [7:0] Jump_addr,
input selector,
output reg [7:0] addr
 );
always @(PC_addr, Jump_addr, selector)
    begin
        case(selector)
            1'b0: 
                addr = PC_addr;
            1'b1: 
                addr = Jump_addr;
        endcase
    end
endmodule
