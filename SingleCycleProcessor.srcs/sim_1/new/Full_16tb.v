`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 05:51:12 PM
// Design Name: 
// Module Name: Full_16tb
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


module Full_16tb();
    reg[15:0] a;
    reg[15:0] b;
    reg c_in;   
    wire[15:0] sum;
    wire c_out; 

Full_16 tFl (.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));

initial
    begin
        #10 a = 0; b = 0; c_in = 0;
        #10 a = 16'b0111_1111_1111_1111; b = 16'b0111_1111_1111_1111; c_in = 1;
        #10 a = 16'b0110_1111_1111_1110; b = 16'b0001_0000_0000_0000; c_in = 1;
        #10 a = 16'b0111_1111_1111_1111; b = 16'b1000_0000_0000_0000; c_in = 1;
        #10 $finish;
   end


endmodule
