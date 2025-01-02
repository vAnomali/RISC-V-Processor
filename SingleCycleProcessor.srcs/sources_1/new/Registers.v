`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 07:23:20 PM
// Design Name: 
// Module Name: Registers
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


module Registers(
    input clk,
    input [4:0] read_register_1,
    input [4:0] read_register_2,
    input [4:0] write_register,
    input [128:0] write_data,
    output reg [63:0] read_data_1,
    output reg [63:0] read_data_2,
    input RegWrite // From Control Module
    );
    
    reg [63:0] registers [31:0]; // 32 registers of length 64 each
    
    initial begin 
        for (integer i = 0; i < 32; i = i + 1) begin
            registers[i] = 64'b0; // Default all registers to 0
        end
    end
    
    
    // Writes
    always @(posedge clk) begin
        if (RegWrite == 1) begin // Does Control enable RegWrite and it is not register 0
               registers[write_register] <= write_data; // Write data into the given register
        end
    end
    
    // Reads
    always @(read_register_1, read_register_2) begin
        read_data_1 <= $signed(registers[read_register_1]); // Read data from register at index read_regiser_1
        read_data_2 <= $signed(registers[read_register_2]); // Read data from register at index read_regiser_2
    end
    
endmodule
