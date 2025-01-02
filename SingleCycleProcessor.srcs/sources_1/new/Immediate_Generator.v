`timescale 1ns / 1ps

module Immediate_Generator(
    input [31:0] instruction,
    output reg [63:0] extended_instruction
    );

    always @(*) begin
        case (instruction[6:0])
            7'b0010011: extended_instruction = {{52{instruction[31]}}, instruction[31:20]}; // I-Type
            7'b0100011: extended_instruction = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]}; // Store
            7'b0000011: extended_instruction = {{52{instruction[31]}}, instruction[31:20]}; // Load
            7'b1100011: extended_instruction = {{52{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};// B-type (BEQ, BNE) 
        endcase
    end
endmodule



