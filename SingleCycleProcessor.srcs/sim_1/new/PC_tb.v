`timescale 1ns / 1ps

module PC_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg [63:0] pc_in;
    wire [63:0] pc_out;

    // Instantiate the PC module
    PC uut (
        .clk(clk),
        .rst(rst),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        pc_in = 64'b0;

        // Apply reset
        #10;
        rst = 0;

        // Test: Count up to 64 incrementing by 4
        repeat (16) begin
            pc_in = pc_out + 4;
            #10;
        end

        // Assert reset and check output
        rst = 1;
        #10;
        $display("Reset Triggered: rst = %b, pc_in = %h, pc_out = %h", rst, pc_in, pc_out);
        rst = 0;

        // Verify reset operation
        pc_in = pc_out + 4;
        #10;
        $display("After Reset: rst = %b, pc_in = %h, pc_out = %h", rst, pc_in, pc_out);

        // End of simulation
        $stop;
    end

endmodule
