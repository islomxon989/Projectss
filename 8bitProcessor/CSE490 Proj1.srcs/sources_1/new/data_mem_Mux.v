`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 06:22:07 PM
// Design Name: 
// Module Name: data_mem_Mux
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


module data_mem_Mux(
    input [7:0] ALU_result,
    input [7:0] read_data,
    input selector,
    output reg [7:0] selection
    );
    always @(*)
        begin
            case(selector)
                1'b1: selection = read_data; 
                1'b0: selection = ALU_result; 
            endcase 
        end
endmodule
