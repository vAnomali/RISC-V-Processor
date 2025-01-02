`timescale 1ns / 1ps

module Full_64_tb();

    // Inputs
    reg [63:0] a;
    reg [63:0] b;
    reg c_in;

    // Outputs
    wire [63:0] sum;
    wire c_out;

    // Instantiate the Unit Under Test (UUT)
    Full_64 uut (
        .sum(sum),
        .c_out(c_out),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    // Testbench logic
    initial begin
        // Test case 1: Simple addition without carry
        a = 64'h00000000_00000001; // 1
        b = 64'h00000000_00000002; // 2
        c_in = 1'b0;
        #10;
        $display("Case: a = %h, b = %h, c_in = %b, sum = %h, c_out = %b", a, b, c_in, sum, c_out);

        // Test case 2: Addition with carry propagation
        a = 64'hFFFFFFFF_FFFFFFFF; // Max value (all 1s)
        b = 64'h00000000_00000001; // 1
        c_in = 1'b0;
        #10;
        $display("Case: a = %h, b = %h, c_in = %b, sum = %h, c_out = %b", a, b, c_in, sum, c_out);

        // Test case 3: Addition with initial carry-in
        a = 64'h12345678_9ABCDEF0;
        b = 64'h0FEDCBA9_87654321;
        c_in = 1'b1;
        #10;
        $display("Case: a = %h, b = %h, c_in = %b, sum = %h, c_out = %b", a, b, c_in, sum, c_out);

        // End simulation
        $finish;
    end

endmodule
