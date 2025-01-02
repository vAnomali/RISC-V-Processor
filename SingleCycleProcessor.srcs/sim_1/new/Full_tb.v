`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 05:24:03 PM
// Design Name: 
// Module Name: Full_tb
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


module Full_tb();
    reg a, b, c_in;
    wire sum, c_out;
    
    Full F1(.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));
    
    initial
        begin
            #10 a = 0; b = 0; c_in = 0;
            #10 a = 0; b = 0; c_in = 1;
            #10 a = 0; b = 1; c_in = 0;
            #10 a = 0; b = 1; c_in = 1;
            #10 a = 1; b = 0; c_in = 0;
            #10 a = 1; b = 0; c_in = 1;
            #10 a = 1; b = 1; c_in = 0;
            #10 a = 1; b = 1; c_in = 1;
            #10 $finish ;
        end
endmodule
