`timescale 1ns / 1ps
module divider (
    input [63:0] dividend,  // 64-bit dividend
    input [63:0] divisor,   // 64-bit divisor
    output reg [63:0] quotient, // 64-bit quotient
    output reg [63:0] remainder // 64-bit remainder
);

    reg [127:0] rem;            // 128-bit remainder register to accommodate shifts
    reg [63:0] abs_dividend, abs_divisor;
    reg dividend_sign, divisor_sign, final_sign;
    integer i;

    always @(*) begin
        // Initialize remainder and quotient
        quotient = 64'b0;
        remainder = 64'b0;
        rem = 128'b0;

        // Detect signs and calculate absolute values
        dividend_sign = dividend[63];
        divisor_sign = divisor[63];
        final_sign = dividend_sign ^ divisor_sign;

        abs_dividend = dividend_sign ? (~dividend + 1) : dividend;
        abs_divisor = divisor_sign ? (~divisor + 1) : divisor;

        // Check for division by zero
        if (divisor == 0) begin
            quotient = 64'bZ; // Error indication
            remainder = 64'bZ; // Error indication
        end else begin
            // Perform the shift-subtract algorithm
            rem = {64'b0, abs_dividend};
            quotient = 64'b0;
            for (i = 63; i >= 0; i = i - 1) begin
                // Shift remainder left by 1 bit
                rem = rem << 1;

                // Subtract divisor from the upper 64 bits of rem
                rem[127:64] = rem[127:64] - abs_divisor;

                if (rem[127] == 1) begin
                    // If result is negative, restore the value and set quotient bit to 0
                    rem[127:64] = rem[127:64] + abs_divisor;
                    quotient[i] = 0;
                end else begin
                    // If result is non-negative, set quotient bit to 1
                    quotient[i] = 1;
                end
            end

            // Final remainder is in the upper 64 bits of rem
            remainder = rem[127:64];

            // Apply two's complement for signed division if necessary
            if (final_sign) begin
                quotient = ~quotient + 1;
            end

            if (dividend_sign) begin
                remainder = ~remainder + 1;
            end
        end
    end
endmodule

