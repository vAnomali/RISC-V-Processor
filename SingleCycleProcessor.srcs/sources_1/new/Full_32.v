`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 06:20:37 PM
// Design Name: 
// Module Name: Full_32
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


module Full_32(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    input c_in,
    output c_out
    );
    
    wire c_in1, c_in2, c_in3;
    
    Full_16 u0 (.sum(sum[15:0]), .c_out(c_in1), .a(a[15:0]), .b(b[15:0]), .c_in(c_in));
    Full_16 u1 (.sum(sum[31:16]), .c_out(c_out), .a(a[31:16]), .b(b[31:16]), .c_in(c_in1));
endmodule
