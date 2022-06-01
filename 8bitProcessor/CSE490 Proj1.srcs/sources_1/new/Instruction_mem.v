`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2022 04:10:20 PM
// Design Name: 
// Module Name: Instruction_mem
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


module Instruction_mem(
    input [7:0] address,
    output [7:0] instruction
    
    );
    reg [7:0] mem [255:0];
    initial
        begin
            mem[1] = 8'b10100010; //addi $s0, $s0, 2           s0 = 2
            mem[2] = 8'b10111011; //addi $s1, $s1, 3           s1 = 3
            mem[3] = 8'b10010000; //add $s1, $s1, $s0          s1 = 5
            mem[4] = 8'b01001000; //sw $s0,0($s1)    store 2 at address 5
            mem[5] = 8'b00111000; //lw $s1, 0($s1)   load address 5 to s1: s1=2
            mem[6] = 8'b01101000; //jmp L1
            mem[8] = 8'b11010000; //L1: sub $s1,$s1,$s0        s1 = 0
        end
        assign instruction = mem[address];
endmodule
