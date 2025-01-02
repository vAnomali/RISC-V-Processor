`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 05:57:45 PM
// Design Name: 
// Module Name: Immediate_Generator_tb
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
`timescale 1ns / 1ps

module Immediate_Generator_tb;
    reg [31:0] instruction;
    wire [63:0] extended_instruction;

    Immediate_Generator uut (
        .instruction(instruction),
        .extended_instruction(extended_instruction)
    );

    // Test procedure
    initial begin
        $monitor("Time = %0t | Instruction = %b | Extended_Instruction = %b", $time, instruction, extended_instruction);

        instruction = 32'b00000000010000001000000100010011; // I-Type
        #10;

        instruction = 32'b0000000_00100_00010_010_00011_0100011; // Store
        #10;

        instruction = 32'b000000000100_00011_010_00101_0000011; // Load
        #10;

        instruction = 32'b0_000000_00100_00011_000_00001_1100011; // Branch
        #10;

        $finish;
    end

endmodule
