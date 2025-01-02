`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 08:48:06 PM
// Design Name: 
// Module Name: Control_tb
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


module Control_tb();
    reg [6:0] Instruction;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    
    Control uut (
        .Instruction(Instruction), 
        .Branch(Branch), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .ALUOp(ALUOp), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite)
    );

    // Test procedure
    initial begin
        // R-Type 
        Instruction = 7'b0110011;
        #10;

        // Load 
        Instruction = 7'b0000011;
        #10;

        // Store 
        Instruction = 7'b0100011;
        #10;

        // Branch 
        Instruction = 7'b1100011;
        #10;
        $finish;
    end
      
endmodule
