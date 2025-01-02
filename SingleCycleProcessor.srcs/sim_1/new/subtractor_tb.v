module subtractor_tb();

    // Inputs
    reg [63:0] a;
    reg [63:0] b;

    // Outputs
    wire [63:0] diff;
    wire borrow_out;

    // Instantiate the Unit Under Test (UUT)
    subtractor uut (
        .diff(diff),
        .borrow_out(borrow_out),
        .a(a),
        .b(b)
    );

    // Testbench logic
    initial begin
        // Test case 1: Subtraction without borrow
        a = 64'h00000000_00000005;
        b = 64'h00000000_00000003;
        #10;
        $display("TC1: a = %h, b = %h, diff = %h, borrow_out = %b", a, b, diff, borrow_out);

        // Test case 2: Subtraction with borrow propagation
        a = 64'h00000000_00000003;
        b = 64'h00000000_00000005;
        #10;
        $display("TC2: a = %h, b = %h, diff = %h, borrow_out = %b", a, b, diff, borrow_out);

        // Test case 3: Subtraction of large numbers
        a = 64'h12345678_9ABCDEF0;
        b = 64'h0FEDCBA9_87654321;
        #10;
        $display("TC3: a = %h, b = %h, diff = %h, borrow_out = %b", a, b, diff, borrow_out);

        // End simulation
        $finish;
    end

endmodule
