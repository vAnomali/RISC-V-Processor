`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 08:07:40 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    output [63:0] diff,
    output borrow_out,
    input [63:0] a,
    input [63:0] b
    );
    
    wire [63:0] b_complement;

    // Invert all bits of b
    assign b_complement = ~b;

    // Use the Full_64 module to add a and (b_complement + 1)
    Full_64 subtractor_adder (
        .sum(diff),
        .c_out(borrow_out),
        .a(a),
        .b(b_complement),
        .c_in(1'b1)  // c_in = 1 to complete the two's complement of b
    );
endmodule
