`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 06:58:09 PM
// Design Name: 
// Module Name: main
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


module main(
    input clock, 
    output wire [7:0] instruction, PCout, ReadData1, ReadData2, ReadData, WriteData_Reg, jump_address, sign_extension_out, ALU_input2, ALU_Out,
    output wire RegDst, RegWrite, Jump, ALUOp, ALUSrc, MemtoReg, MemRead, MemWrite
);

//PC
PC pc_0(
       clock, PCout
    );


//Instruction Memory    
Instruction_mem instruction_Mem(
    PCout, instruction
);
    
//Control Unit
Control ControlUnit(
    instruction[7:5],
    Jump, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, RegDst
);
    
//Jump ALU
ALU_Jump Alu_Jump(
    instruction[7:0], PCout[7:0],
    jump_address
);
    
//Jump Mux
Mux_Jump Mux_jump(
    PCout, jump_address, Jump,
    PCin
);
    
//Registers
registers register_file(
    instruction[3], instruction[4], instruction[4], WriteData_Reg, RegWrite,
    ReadData1, ReadData2
);
    
//sign extension
sign_extension sign_extension(
    instruction[2:0],
    sign_extension_out
);
    
//ALU Mux
mux alu_mux(
    ReadData2, sign_extension_out, ALUSrc,
    ALU_input2
);
   
//ALU
ALU alu(
    ReadData1, ALU_input2, ALUOp,
    ALU_Out
);
   
//Data Memory
data_mem data_memory(
    ReadData2, ALU_Out, MemWrite, MemRead,   
    ReadData
);
   
//Data Memory MUX
data_mem_Mux data_mem_mux(
    ALU_Out, ReadData, MemtoReg,
    WriteData_Reg
);
endmodule