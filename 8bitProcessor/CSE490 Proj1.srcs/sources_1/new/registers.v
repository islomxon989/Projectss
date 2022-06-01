`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 11:21:04 AM
// Design Name: 
// Module Name: registers
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


module registers(
    input read_reg1,
    input read_reg2,
    input write_reg,
    input [7:0] write_data,
    input regwrite,
    output reg [7:0] read_data1,
    output reg [7:0] read_data2
    );
    
    reg [7:0] registers [0:1];
	
	initial begin
		registers[0] = 'b00000000 ; //   s0
		registers[1] = 'b00000000 ; //   s1
	end
	
	always @(write_data, regwrite, write_reg)
	begin
		
		if (regwrite == 1) 
		  begin
			 registers[write_reg] <= write_data;
		  end
	end
	
	always @(read_reg1, read_reg2)
		  begin
		      case(read_reg1)
		          1'b0: read_data1 = registers[0];
		          1'b1: read_data1 = registers[1];
		      endcase
		      case(read_reg2)
                  1'b0: read_data2 = registers[0];
		          1'b1: read_data2 = registers[1];
              endcase
	      end
endmodule
