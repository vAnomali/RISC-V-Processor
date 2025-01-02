`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 05:37:58 PM
// Design Name: 
// Module Name: Full4_tb
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


module Full4_tb();
    reg [3:0]    a, b;
    reg          c_in;
    wire [3:0]   sum;
    wire         c_out;
    
    Full4 tFl (.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));
    
    initial
        begin
            #10 a = 0; b = 0; c_in = 0;
            #10 a = 7; b = 7; c_in = 1;
            #10 a = 7; b = 8; c_in = 1;
            #10 a = 5; b = 5; c_in = 1;
            #10 $finish ;
        end
endmodule
