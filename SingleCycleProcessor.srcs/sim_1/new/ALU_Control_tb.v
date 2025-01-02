`timescale 1ns / 1ps

module ALU_Control_tb();
    reg [1:0] ALUop;
    reg [6:0] funct7;
    reg [2:0] funct3;
    wire [3:0] alu_control;

    // Instantiate the ALU Control module
    ALU_Control uut (
        .alu_control(alu_control),
        .ALUop(ALUop),
        .funct7(funct7),
        .funct3(funct3)
    );

    initial begin
        $display("Time(ns) | ALUop | funct7     | funct3 | alu_control");
        $display("----------------------------------------------------");
        $monitor("%0dns | %b  | %b | %b   | %b", 
            $time, ALUop, funct7, funct3, alu_control);

        // Test 1: Load/Store (ALUop = 00)
        ALUop = 2'b00; funct7 = 7'b0000000; funct3 = 3'b000; #10;

        // Test 2: Branch (ALUop = 01)
        ALUop = 2'b01; funct7 = 7'b0000000; funct3 = 3'b000; #10;

        // Test 3: R-Type Add (ALUop = 10, funct7 = 0000000, funct3 = 000)
        ALUop = 2'b10; funct7 = 7'b0000000; funct3 = 3'b000; #10;

        // Test 4: R-Type Sub (ALUop = 10, funct7 = 0100000, funct3 = 000)
        ALUop = 2'b10; funct7 = 7'b0100000; funct3 = 3'b000; #10;

        // Test 5: R-Type AND (ALUop = 10, funct7 = 0000000, funct3 = 111)
        ALUop = 2'b10; funct7 = 7'b0000000; funct3 = 3'b111; #10;

        // Test 6: R-Type OR (ALUop = 10, funct7 = 0000000, funct3 = 110)
        ALUop = 2'b10; funct7 = 7'b0000000; funct3 = 3'b110; #10;

        // Test 7: R-Type MUL (ALUop = 10, funct7 = 0000001, funct3 = 000)
        ALUop = 2'b10; funct7 = 7'b0000001; funct3 = 3'b000; #10;

        // Test 8: R-Type DIV (ALUop = 10, funct7 = 0000001, funct3 = 100)
        ALUop = 2'b10; funct7 = 7'b0000001; funct3 = 3'b100; #10;

        $finish;
    end
endmodule
