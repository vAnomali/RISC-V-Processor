`timescale 1ns / 1ps

module processor_tb();
    reg clk;
    reg rst;
    wire [63:0] pc_out;        // Program Counter output
    wire [31:0] instruction;  // Current instruction being executed
    wire [63:0] result;

    // Instantiate the processor
    processor uut (
        .clk(clk),
        .rst(rst),
        .result(result)
    );

    // Expose signals for waveform observation
    assign pc_out = uut.pc.pc_out;          // Observe PC output
    assign instruction = uut.imem.instruction; // Observe fetched instruction

    // Clock generation: Toggle every 5 ns
    always #5 clk = ~clk;

    initial begin
        // Display header for easier reading
        $display("Time (ns) | PC (bin)      | Instruction (dec)");
        $display("---------------------------------------------");

        // Monitor the PC and instruction signals
        $monitor("%0dns | %0b | %0b", $time, pc_out, instruction);

        // Initialize signals
        clk = 0;
        rst = 1;

        // Apply reset
        #10 rst = 0;

        // Let the processor run for a few cycles
        #160;

        // End simulation
        $finish;
    end
endmodule
