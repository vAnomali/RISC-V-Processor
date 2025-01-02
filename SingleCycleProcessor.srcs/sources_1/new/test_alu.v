`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2024 03:05:19 PM
// Design Name: 
// Module Name: ALU
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


module test_alu (
    input [63:0] a,
    input [63:0] b,
    input [3:0] opcode,
    input c_in,
    output reg [127:0] result,
    output reg branch
    );
    
    wire [63:0] add_sum, sub_diff, quotient, remainder;
    wire [127:0] product;
    wire add_cout, sub_b_out;
    
    Full_64 adder (.sum(add_sum), .c_out(add_cout), .a(a), .b(b), .c_in(c_in));
    subtractor sub (.diff(sub_diff), .borrow_out(sub_b_out), .a(a), .b(b));
    multiplier mul (.multiplicand(a), .multiplier(b), .product(product));
    divider div (.dividend(a), .divisor(b), .quotient(quotient), .remainder(remainder));
     
    always @(*) begin
        result = 128'b0;
        case (opcode)
            4'b0010: result = {64'b0, add_sum}; // Addition, lower 64 bits
            4'b0110: result = {64'b0, sub_diff}; // Subtraction, lower 64 bits
            4'b1000: result = product; // Multiplication, full 128 bits
            4'b1100: result = {remainder, quotient}; // Division, remainder in upper 64 bits, quotient in lower 64 bits
            4'b0000: result = a & b; // Bitwise AND
            4'b0001: result = a | b; // Bitwise OR
            4'b0111: begin
                result = 128'b0;
                branch = (result == 128'b0);
           end
            default: result = 128'b00; // Default to 0 for invalid operations
        endcase
    end  
endmodule