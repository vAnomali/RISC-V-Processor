`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 08:33:47 PM
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
    input [6:0] Instruction,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    
    always @(*) begin
        case (Instruction) // Chapter 4 Slide 31
            7'b0110011: begin // R-Type -- Add, Sub, Mult, Div, AND, OR
                ALUSrc <= 0;
                MemtoReg <= 0;
                RegWrite <= 1;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                ALUOp <= 2'b10;  
            end
            7'b0000011: begin // Load
                ALUSrc <= 1;
                MemtoReg <= 1;
                RegWrite <= 1;
                MemRead <= 1;
                MemWrite <= 0;
                Branch <= 0;
                ALUOp <= 2'b00;
            end
            7'b0100011: begin // Store
                ALUSrc <= 1;
                MemtoReg <= 1'bx;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 1;
                Branch <= 0;
                ALUOp <= 2'b00;
            end
            7'b1100011: begin // Branch -- BEQ, BNE
                ALUSrc <= 0;
                MemtoReg <= 1'bx;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 1;
                ALUOp <= 2'b01;
            end
        endcase  
    end
    
endmodule
