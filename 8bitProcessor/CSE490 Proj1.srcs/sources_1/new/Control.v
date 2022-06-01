`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 10:20:01 PM
// Design Name: 
// Module Name: Control
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


module Control(
    input [2:0] opcode,
    output reg jump,
    output reg memread,
    output reg memtoreg,
    output reg aluop,
    output reg memwrite,
    output reg alusrc,
    output reg regwrite,
    output reg regdst
    );
    
    always @(opcode)
        begin
            case(opcode)
                3'b001: //lw
                    begin 
                        jump = 1'b0;
                        memwrite = 1'b0;
                        regdst = 1'b0;
                        aluop = 1'b1;
                        memtoreg = 1'b1;
                        memread = 1'b1; 
                        alusrc = 1'b1;
                        regwrite = 1'b1;
                    end
                3'b010: //sw
                    begin
                        jump = 1'b0;
                        memread = 1'b0;
                        regdst = 1'b0;
                        regwrite = 1'b0;
                        memtoreg = 1'b0;
                        aluop = 1'b1; 
                        memwrite = 1'b1; 
                        alusrc = 1'b1;
                    end
                3'b011: //jmp
                    begin
                        jump = 1'b1;
                        memread = 1'b0;
                        regdst = 1'b0;
                        regwrite = 1'b0;
                        memtoreg = 1'b0;
                        aluop = 1'b0; 
                        memwrite = 1'b0; 
                        alusrc = 1'b0;
                    end
                3'b100: //add
                    begin
                        regdst = 1'b1;
                        regwrite = 1'b1;
                        jump = 1'b0;
                        memread = 1'b0;
                        memtoreg = 1'b0;
                        aluop = 1'b1; 
                        memwrite = 1'b0; 
                        alusrc = 1'b0;
                    end
                3'b101: //addi
                    begin
                        aluop = 1'b1;
                        alusrc = 1'b1;
                        regwrite = 1'b1;
                        regdst = 1'b1;
                        jump = 1'b0;
                        memread = 1'b0;
                        memtoreg = 1'b0;
                        memwrite = 1'b0; 
                    end
                3'b110: //sub
                    begin
                        regdst = 1'b1;
                        regwrite = 1'b1;
                        jump = 1'b0;
                        memread = 1'b0;
                        memtoreg = 1'b0;
                        aluop = 1'b0; 
                        memwrite = 1'b0; 
                        alusrc = 1'b0;
                    end
            endcase
        end
endmodule
