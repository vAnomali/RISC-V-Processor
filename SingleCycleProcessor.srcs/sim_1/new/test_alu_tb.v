`timescale 1ns / 1ps

module test_alu_tb;

    // Testbench variables
    reg [63:0] a;
    reg [63:0] b;
    reg [3:0] opcode;
    reg c_in;
    wire [127:0] result;
    wire branch;

    // Instantiate the ALU module
    test_alu uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .c_in(c_in),
        .result(result),
        .branch(branch)
    );

    initial begin
        // Initialize inputs
        a = 64'd10;
        b = 64'd2;
        c_in = 1'b0;
        opcode = 4'b0000; // Default opcode

        // Test addition
        #10 opcode = 4'b0010;
        #10 $display("Addition: a=%d, b=%d, result=%d", a, b, result[63:0]);

        // Test subtraction
        #10 opcode = 4'b0110;
        #10 $display("Subtraction: a=%d, b=%d, result=%d", a, b, result[63:0]);

        // Test multiplication
        #10 opcode = 4'b1000;
        #10 $display("Multiplication: a=%d, b=%d, result=%d", a, b, result);

        // Test division
        #10 opcode = 4'b1100;
        #10 $display("Division: a=%d, b=%d, quotient=%d, remainder=%d", a, b, result[63:0], result[127:64]);

        // Test bitwise AND
        #10 opcode = 4'b0000;
        #10 $display("Bitwise AND: a=%h, b=%h, result=%h", a, b, result[63:0]);

        // Test bitwise OR
        #10 opcode = 4'b0001;
        #10 $display("Bitwise OR: a=%h, b=%h, result=%h", a, b, result[63:0]);

        // Test branch (assumes branch flag is set correctly)
        #10 opcode = 4'b0111;
        #10 $display("Branch Test: result=%d, branch=%b", result, branch);

        // Finish simulation
        #10 $finish;
    end

endmodule
