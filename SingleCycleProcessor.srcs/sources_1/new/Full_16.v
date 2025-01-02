`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 05:49:51 PM
// Design Name: 
// Module Name: Full_16
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


module Full_16(
    output [15:0] sum,
    output c_out,
    input [15:0] a,
    input [15:0] b,
    input c_in
    );
    
    wire c_in1, c_in2, c_in3;
    
    Full4 u0 (.sum(sum[3:0]), .c_out(c_in1), .a(a[3:0]), .b(b[3:0]), .c_in(c_in));
    Full4 u1 (.sum(sum[7:4]), .c_out(c_in2), .a(a[7:4]), .b(b[7:4]), .c_in(c_in1));
    Full4 u2 (.sum(sum[11:8]), .c_out(c_in3), .a(a[11:8]), .b(b[11:8]), .c_in(c_in2));
    Full4 u3 (.sum(sum[15:12]), .c_out(c_out), .a(a[15:12]), .b(b[15:12]), .c_in(c_in3));
    
endmodule
