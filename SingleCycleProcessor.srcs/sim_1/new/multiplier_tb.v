`timescale 1ns / 1ps

module multiplier_tb;

    // Testbench signals
    reg [63:0] multiplicand;
    reg [63:0] multiplier;
    wire [127:0] product;

    // Instantiate the multiplier module
    multiplier uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Test logic
    initial begin
        // Display header for readability
        $display("Time | Multiplicand | Multiplier | Product");

        multiplicand = 64'd100;
        multiplier = 64'd25;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);

        // Signed multiplication: positive x negative
        multiplicand = -64'd15;
        multiplier = 64'd10;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);

        // Signed multiplication: negative x negative
        multiplicand = -64'd25;
        multiplier = -64'd4;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);

        // Signed multiplication: positive x positive
        multiplicand = 64'd12;
        multiplier = 64'd11;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);

        // Large unsigned multiplication
        multiplicand = 64'hFFFFFFFFFFFFFFF; // Largest unsigned 64-bit number
        multiplier = 64'd2;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);

        // Large signed multiplication
        multiplicand = -64'd100000;
        multiplier = 64'd5000;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);
        
        multiplicand = -64'hFFFF0000;
        multiplier = 64'hFFFF0000;
        #10;
        $display("%4t | %d | %d | %d", $time, multiplicand, multiplier, product);

        // Explicitly unsigned multiplication
        multiplicand = $unsigned(64'd200);
        multiplier = $unsigned(64'd300);
        #10;
        $display("%4t | %d (unsigned) | %d (unsigned) | %d", $time, multiplicand, multiplier, product);

        // Explicitly signed multiplication
        multiplicand = $signed(-64'd100);
        multiplier = $signed(64'hFF);
        #10;
        $display("%4t | %d (signed) | %d (signed) | %d", $time, multiplicand, multiplier, product);

        // Terminate simulation
        $finish;
    end
endmodule