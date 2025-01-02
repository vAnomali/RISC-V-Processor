`timescale 1ns / 1ps

module divider_tb();
    reg [63:0] dividend, divisor;
    wire [63:0] quotient, remainder;

    // Instantiate the divider
    divider uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        // Test cases
        $monitor("Time: %0d | Dividend: %d | Divisor: %d | Quotient: %d | Remainder: %d",
                 $time, $signed(dividend), $signed(divisor), $signed(quotient), $signed(remainder));

        // Signed division
        dividend = -100; divisor = 3; #10; // Expect: Quotient = -33, Remainder = -1
        dividend = -100; divisor = -3; #10; // Expect: Quotient = 33, Remainder = -1
        dividend = 100; divisor = -3; #10; // Expect: Quotient = -33, Remainder = 1
        dividend = 100; divisor = 3; #10; // Expect: Quotient = 33, Remainder = 1

        // Unsigned division
        dividend = 100; divisor = 3; #10; // Expect: Quotient = 33, Remainder = 1
        dividend = 0; divisor = 3; #10; // Expect: Quotient = 0, Remainder = 0
        dividend = 100; divisor = 0; #10; // Expect: Quotient = Undefined, Remainder = Undefined

        // Large values
        dividend = 64'hFFFFFFFFFFFFFFF6; divisor = 2; #10; // Expect: Large signed negative result
        dividend = -39900; divisor = 3; #10;

        $finish;
    end
endmodule
