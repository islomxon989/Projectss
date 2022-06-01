`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 03:11:57 PM
// Design Name: 
// Module Name: datamem
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


module datamem(
    input memwrite,
    input [4:0] address,
    input [4:0] writedata,
    output reg [4:0] readdata,
    input memread
    );
    
    reg [4:0] mem [31:0];
    initial 
        begin
            for (integer i=0; i<32; i=i+1)
                begin
                    mem[i] = 5'b00000;
                end
        end
        
     always@(*)
        begin
            if (memwrite == 1)
                begin
                    mem[address] = writedata;
                end
                
            if (memread == 1)
                begin
                    readdata = mem[address];
                end
        end
endmodule
