`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 03:12:09 PM
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb;

    // Inputs
    reg [63:0] a, b;
    reg [2:0] opcode;
    reg c_in;

    // Outputs
    wire [127:0] result;

    // Instantiate the ALU
    ALU uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .c_in(c_in),
        .result(result)
    );

    initial begin
        // Initialize carry input
        c_in = 0;

        // Test Case 1: Unsigned Addition (5 + 3)
        a = 64'd5;
        b = 64'd3;
        opcode = 3'b000;
        #10;
        $display("Unsigned Addition: %0d + %0d = %0d (Expected: 8)", a, b, result[63:0]);

        // Test Case 2: Signed Addition (-10 + 20)
        a = -64'sd10;
        b = 64'sd20;
        opcode = 3'b000;
        #10;
        $display("Signed Addition: %0d + %0d = %0d (Expected: 10)", $signed(a), $signed(b), $signed(result[63:0]));

        // Test Case 3: Unsigned Subtraction (9 - 4)
        a = 64'd9;
        b = 64'd4;
        opcode = 3'b001;
        #10;
        $display("Unsigned Subtraction: %0d - %0d = %0d (Expected: 5)", a, b, result[63:0]);

        // Test Case 4: Signed Subtraction (-30 - 20)
        a = -64'sd30;
        b = 64'sd20;
        opcode = 3'b001;
        #10;
        $display("Signed Subtraction: %0d - %0d = %0d (Expected: -50)", $signed(a), $signed(b), $signed(result[63:0]));

        // Test Case 5: Unsigned Multiplication (3 * 4)
        a = 64'd3;
        b = 64'd4;
        opcode = 3'b010;
        #10;
        $display("Unsigned Multiplication: %0d * %0d = %0d (Expected: 12)", a, b, result);

        // Test Case 6: Signed Multiplication (-6 * 7)
        a = -64'sd6;
        b = 64'sd7;
        opcode = 3'b010;
        #10;
        $display("Signed Multiplication: %0d * %0d = %0d (Expected: -42)", $signed(a), $signed(b), $signed(result));

        // Test Case 7: Unsigned Division (20 / 5)
        a = 64'd20;
        b = 64'd5;
        opcode = 3'b011;
        #10;
        $display("Unsigned Division: %0d / %0d = Quotient: %0d, Remainder: %0d (Expected Quotient: 4, Remainder: 0)", 
                 a, b, result[63:0], result[127:64]);

        // Test Case 8: Signed Division (-20 / 5)
        a = -64'sd20;
        b = 64'sd5;
        opcode = 3'b011;
        #10;
        $display("Signed Division: %0d / %0d = Quotient: %0d, Remainder: %0d (Expected Quotient: -4, Remainder: 0)", 
                 $signed(a), $signed(b), $signed(result[63:0]), $signed(result[127:64]));
        $finish;
    end
endmodule


