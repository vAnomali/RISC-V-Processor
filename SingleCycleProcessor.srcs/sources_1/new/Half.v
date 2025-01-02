`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 04:48:44 PM
// Design Name: 
// Module Name: Half
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


module Half(
    input a,
    input b,
    output c_out,
    output sum
    );
    
    xor M1 (sum, a, b);
    and M2 (c_out, a, b);
endmodule
