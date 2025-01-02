`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 07:33:24 PM
// Design Name: 
// Module Name: ProgramCounter_tb
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


module Program_Counter_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [63:0] pc_in;

    // Outputs
    wire [63:0] pc_out;

    // Instantiate the Program_Counter module
    Program_Counter uut (
        .clk(clk),
        .rst(rst),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        pc_in = 64'h0000000000000000;
        rst = 0;

        // Apply Reset
        rst = 1;
        #10;
        rst = 0;
        $display("PCResult (after reset, should be 0): %h", pc_out);

        // Test case 1: Check if pc_out remains 0 after reset
        pc_in = 64'h0000000000000004;
        #10;
        $display("PCResult (should be 4): %h", pc_out);

        // Test case 2: Change pc_in, check if pc_out updates
        pc_in = 64'h0000000000000008;
        #10;
        $display("PCResult (should be 8): %h", pc_out);

        // Test case 3: Apply reset, pc_out should reset to 0
        rst = 1;
        #10;
        rst = 0;
        $display("PCResult (after reset, should be 0): %h", pc_out);

        // Test case 4: Update pc_in, check if pc_out updates again
        pc_in = 64'h000000000000000C;
        #10;
        $display("PCResult (should be C): %h", pc_out);

        // End of simulation
        $stop;
    end

endmodule
