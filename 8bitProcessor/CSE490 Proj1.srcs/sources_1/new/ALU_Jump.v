`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 06:25:30 PM
// Design Name: 
// Module Name: ALU_Jump
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


module ALU_Jump(
    input [7:0] j_addr,
    input [7:0] pc_addr,
    output [7:0] addr
    );
    
    assign addr = {pc_addr[7:5], j_addr[4:0]};
endmodule
