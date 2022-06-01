`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 02:41:51 PM
// Design Name: 
// Module Name: register
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


module register(
    input readreg1,
    input readreg2,
    input writereg,
    input [4:0] writedata,
    output reg readdata1,
    output reg readdata2,
    input regwrite
    );
    
    reg [4:0] registers [0:1];
    
    initial
        begin
            registers[0] = 5'b10000; //s0
            registers[1] = 5'b10001; //s1
        end
    always @(writedata)
        begin
            if (regwrite == 1)
                begin
                    registers[writereg] = writedata;
                end
        end
    always @(readreg1 or readdata2)
        begin
            readdata1 = registers[writereg];
            readdata2 = resisters[readreg1];
        end
endmodule
