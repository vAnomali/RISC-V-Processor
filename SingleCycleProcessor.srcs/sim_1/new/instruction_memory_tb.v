`timescale 1ns / 1ps

module instruction_memory_tb;
    // Inputs
    reg [63:0] pc;

    // Outputs
    wire [31:0] instruction;

    // Instantiate the Unit Under Test (UUT)
    instruction_memory uut (
        .pc(pc),
        .instruction(instruction)
    );

    integer i;

    initial begin
        // Initialize PC and display header
        $display("Address\tTime\tPC\tInstruction");
        $display("-------------------------------------");

        // Loop through all the instruction addresses in memory
        for (i = 0; i < 11; i = i + 1) begin
            pc = i * 4; // Increment PC by 4 (since instructions are word-aligned)
            #10; // Wait for some time to simulate memory access
            $display("%0d\t%0dns\t%h\t%b", i, $time, pc, instruction);
        end

        // Finish simulation
        $finish;
    end
endmodule
