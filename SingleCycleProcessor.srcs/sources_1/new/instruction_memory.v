`timescale 1ns / 1ps

module instruction_memory(
    input [63:0] pc,             // Program counter input
    output reg [31:0] instruction // Instruction output
    );

    reg [31:0] memory [0:31]; // Memory array for 32 instructions

    // Use PC bits [6:2] as the address (since PC increments by 4, lower 2 bits are always zero)
    initial begin
        // Load instructions into memory
        
        // Load instructions into x1, x2, ..., x6
        memory[0] = 32'b000000000000_00000_000_00001_0000011; // lw x1, 0(x0)
        memory[1] = 32'b000000000001_00000_000_00010_0000011; // lw x2, 4(x0)
        memory[2] = 32'b000000000010_00000_000_00011_0000011; // lw x3, 8(x0)
        memory[3] = 32'b000000000011_00000_000_00100_0000011; // lw x4, 12(x0)
        memory[4] = 32'b000000000100_00000_000_00101_0000011; // lw x5, 16(x0)
        memory[5] = 32'b000000000101_00000_000_00110_0000011; // lw x6, 20(x0)

        // Perform arithmetic operations
        memory[6] = 32'b0000001_00010_00001_000_00111_0110011; // mul x7, x1, x2
        memory[7] = 32'b0000001_00100_00011_000_01000_0110011; // mul x8, x3, x4
        memory[8] = 32'b0000000_01000_00111_000_01001_0110011; // add x9, x7, x8
        memory[9] = 32'b0100000_00101_01001_000_01010_0110011; // sub x10, x9, x5
        memory[10] = 32'b0000001_00110_01010_100_01011_0110011; // div x11, x9, x6

        // Set remaining instructions to NOP (no operation)
        for (integer i = 11; i < 32; i = i + 1) begin
            memory[i] = 32'b0; // NOP
        end
    end

    always @(*) begin
        instruction <= memory[pc[6:2]]; // Fetch instruction from memory
    end

endmodule
