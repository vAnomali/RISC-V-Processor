`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 06:21:46 PM
// Design Name: 
// Module Name: Full_32tb
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


module Full_32tb();
    reg [31:0] a;
    reg [31:0] b;
    reg c_in;
    wire [31:0] sum;
    wire c_out;

    Full_32 F32(.a(a), .b(b), .sum(sum), .c_in(c_in), .c_out(c_out));
    initial
        begin
            #10 a = 32'h00000000; b = 32'h00000000; c_in = 0;
            #10 a = 32'hFFFFFFFF; b = 32'h00000001; c_in = 0;
            #10 a = 32'h7FFFFFFF; b = 32'h00000001; c_in = 0;  
            #10 a = 32'h6FFFFFFF; b = 32'h10000000; c_in = 0;  
            #10 a = 32'hAAAAAAAA; b = 32'h55555555; c_in = 1; 
            #10 a = 32'h12345678; b = 32'h87654321; c_in = 1;
            #10 $finish;
        end
endmodule
