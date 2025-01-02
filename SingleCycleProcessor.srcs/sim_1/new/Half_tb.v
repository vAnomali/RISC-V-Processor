`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 04:55:45 PM
// Design Name: 
// Module Name: Half_tb
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


module Half_tb();
    reg a,b;
    wire sum, c_out;
    
    Half AH (.sum(sum), .c_out(c_out), .a(a), .b(b));
    
    initial
        begin
            #10 a = 0; b = 0;
            #10 a = 0; b = 1;
            #10 a = 1; b = 0;
            #10 a = 1; b = 1;
            #10 $finish ;
        end
endmodule
