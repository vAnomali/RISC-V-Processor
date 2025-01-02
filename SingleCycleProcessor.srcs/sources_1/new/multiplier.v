`timescale 1ns / 1ps
module multiplier(
    input [63:0] multiplicand,
    input [63:0] multiplier,
    output reg [127:0] product
);

    reg [127:0] temp_product;
    reg [127:0] temp_multiplicand;
    reg [127:0] temp_multiplier;
    reg [63:0] abs_multiplicand;
    reg [63:0] abs_multiplier;
    reg sign_a, sign_b;
    integer i;

    always @(*) begin
        // Initialize
        sign_a = multiplicand[63];
        sign_b = multiplier[63];
        
        // Compute absolute values for two's complement handling
        abs_multiplicand = sign_a ? (~multiplicand + 1) : multiplicand;
        abs_multiplier = sign_b ? (~multiplier + 1) : multiplier;

        // Prepare operands for multiplication
        temp_multiplicand = {64'b0, abs_multiplicand};
        temp_multiplier = {64'b0, abs_multiplier};
        temp_product = 128'b0;

        // Perform multiplication using shift-and-add
        for (i = 0; i < 64; i = i + 1) begin
            if (temp_multiplier[0] == 1'b1) begin
                temp_product = temp_product + temp_multiplicand;
            end
            temp_multiplicand = temp_multiplicand << 1;
            temp_multiplier = temp_multiplier >> 1;
        end

        // Apply final sign adjustment
        if (sign_a ^ sign_b) begin
            temp_product = ~temp_product + 1;
        end

        // Assign result to output
        product = temp_product;
    end

endmodule
