`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 11:21:04 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input [7:0] mem_write_data,
    input [7:0] address,
    input memwrite,
    input memread,
    output reg [7:0] mem_read_data
    );
    
    reg [7:0] memory [255:0];
    initial 
        begin
            for(integer i =0; i<=255; i=i+1)
                begin
                    memory[i] <= 'b00000000;
                end
                
        end
    
    always@(*)
        begin
            if (memwrite == 1'b1) 
                begin
                    memory[address] <= mem_write_data ;
                end
            
            
            if (memread == 1'b1) 
                begin
                    mem_read_data = memory[address];
                end
    end
    
endmodule
