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

module ALU_TB;
    reg [7:0] data1, data2;
    reg selector;
    wire [7:0] result;
    
    localparam period = 20;
    
    ALU UUT (.data1(data1), .data2(data2), .selector(selector), .result(result));
    
    initial 
        begin
            data1=1;
            data2=1;
            selector = 0;
            #period;
            
            data1=1;
            data2=3;
            selector = 1;
            #period;
           
        end
    
endmodule


module MainMux_TB;
    reg selector; 
    reg [7:0] a, b;
    wire [7:0] selection;
    
    localparam period = 20;
    
    mux UUT (.a(a), .b(b), .selector(selector), .selection(selection));
    
    initial
        begin
            a = 'b01010101;
            b = 'b10101010;
            selector = 1;
            #period;
            
            a = 'b01010101;
            b = 'b10101010;
            selector = 0;
            #period;
        end
endmodule

module Registers_TB;
    reg read_reg1, read_reg2, write_reg, regwrite;
    reg [7:0] write_data;
    wire [7:0] read_data1,read_data2;
    
    localparam period = 20;
    
    registers UUT (.read_reg1(read_reg1), .read_reg2(read_reg2), .write_reg(write_reg), .regwrite(regwrite), .write_data(write_data), .read_data1(read_data1), .read_data2(read_data2));
    
    initial
        begin
            regwrite = 1;
            write_data = 'b10001000;
            write_reg = 0;
            #period
            
            regwrite = 1;
            write_data = 'b00100010;
            write_reg = 1;
            #period
            
            read_reg1 = 1;
            read_reg2 = 1;
            #period;
        end
endmodule

module PCadder_TB;
    reg [7:0] in;
    wire [7:0] out;
    
    localparam period = 20;
    pc_adder UUT (.in(in), .out(out));
    initial 
        begin
            in = 'b10000000;
            #period;
        end
endmodule

module sign_extension_TB;
    reg [2:0] in;
    wire [7:0] out;
    
    localparam period = 20;
    
    sign_extension UUT (.in(in), .out(out));
    
    initial 
        begin
            in = 110;
            #period;
        end
endmodule

module data_mem_TB;
    reg [7:0] mem_write_data, address;
    reg memwrite, memread;
    wire [7:0] mem_read_data;
    
    localparam period = 20;
    
    data_mem UUT (.mem_write_data(mem_write_data), .address(address), .memwrite(memwrite), .memread(memread), .mem_read_data(mem_read_data));
    
    initial 
        begin
            memwrite = 1;
            address = 'b00000111;
            mem_write_data = 'b10101010;
            #period;
            
            memread = 1;
            address = 'b00000111;
            #period;    
        end
endmodule

module Control_TB;
    reg [2:0] opcode;
    wire jump, memread, memtoreg, aluop, memwrite,alusrc, regwrite, regdst;
    
    localparam period = 20;
    
    Control UUT (.opcode(opcode), .jump(jump), .memread(memread), .memtoreg(memtoreg), .aluop(aluop), .memwrite(memwrite), .alusrc(alusrc), .regwrite(regwrite), .regdst(regdst));
    
    initial 
        begin
            opcode = 1;
            #period;
            opcode = 2;
            #period;
            opcode = 3;
            #period;
            opcode = 4;
            #period;
            opcode = 5;
            #period;
            opcode = 6;
            #period;
        end
endmodule 

module main_TB;
    reg clock = 0;
    
    localparam period = 20;
    
    main UUT (.clock(clock));
  
        always begin
            clock = ~clock;
            #period;
        end
endmodule