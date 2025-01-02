`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 06:07:48 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    output reg [3:0] alu_control,
    input [1:0] ALUop,
    input [6:0] funct7,
    input [2:0] funct3
);

    always @(*) begin
        case (ALUop) 
            2'b00: alu_control = 4'b0010; // Load/Store
            2'b01: alu_control = 4'b0111; // Branch
            2'b10: begin
                case ({funct7, funct3}) 
                    10'b0000000_000: alu_control = 4'b0010; // Add
                    10'b0100000_000: alu_control = 4'b0110; // Sub
                    10'b0000000_111: alu_control = 4'b0000; // AND
                    10'b0000000_110: alu_control = 4'b0001; // OR
                    10'b0000001_000: alu_control = 4'b1000; // Multiply
                    10'b0000001_100: alu_control = 4'b1100; // Divide
                    default: alu_control = 4'b0000;         // Default to no-op
                endcase
            end
        endcase
    end

endmodule
