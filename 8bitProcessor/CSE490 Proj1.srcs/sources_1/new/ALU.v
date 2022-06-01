`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 09:43:19 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] data1,
    input [7:0] data2,
    input selector,
    output reg [7:0] result
    );
    
    always @(data1,data2, selector)
        begin
            case(selector)
                1'b1: result = data1 + data2; //add
                1'b0: result = data1 - data2; //subtract
            endcase
        end
endmodule
