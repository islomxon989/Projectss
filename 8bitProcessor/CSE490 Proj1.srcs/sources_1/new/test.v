`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 11:11:07 AM
// Design Name: 
// Module Name: test
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
`timescale 1 ns/10 ps

module ALU_TB;
    reg [7:0] data1, data2;
    reg selector;
    wire [7:0] result;
    
    localparam period = 20;
    
    ALU UUT (.data1(data1), .data2(data2), .selector(selector));
    
    initial 
        begin
            data1 = 00000001;
            data2 = 00000001;
            selector = 1;
            #period;
    end
    
endmodule
