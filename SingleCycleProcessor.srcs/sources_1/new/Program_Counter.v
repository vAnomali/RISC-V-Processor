`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 04:40:13 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input rst,
    input [63:0] pc_in,
    output reg [63:0] pc_out
    );
    
    initial begin
        pc_out = 64'b0;
    end
    
    always @(posedge clk) begin
        if (rst == 1) begin
            pc_out = 64'b0;
        end
        else begin
            pc_out = pc_in;
        end     
    end  
endmodule
