`timescale 1ns / 1ps

module SingleCycleProcessor_tb();
    reg clk;
    reg rst;

    // Instantiate the processor
    SingleCycleProcessor uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Debugging variables
    integer cycle_count;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        cycle_count = 0;

        // Apply reset
        #10 rst = 0;

        // Run for exactly 31 cycles
        forever begin
            @(posedge clk);
            cycle_count = cycle_count + 1;

            // Halt condition: Stop simulation after 32 cycles
            if (cycle_count >= 12) begin
                $display("Simulation halted after 32 cycles.");
                $finish; // Stop simulation
            end
        end
    end

    // Continuous monitoring of signals
    initial begin
        $monitor("Cycle: %0d | PC: %h | Instruction: %b | ALU Inputs: A=%0d, B=%0d | ALU Control: %b | ALU Result: %0d", 
         cycle_count, 
         uut.pc.pc_out, 
         uut.imem.instruction, 
         uut.read_data_1,         // ALU input A
         uut.alu_operand2,        // ALU input B
         uut.alu_control,         // ALU control signals
         uut.alu_result);         // ALU output
    end

endmodule
