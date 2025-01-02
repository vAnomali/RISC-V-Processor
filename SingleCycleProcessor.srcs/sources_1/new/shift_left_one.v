`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 08:40:02 PM
// Design Name: 
// Module Name: shift_left_one
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


module shift_left_one(
    output reg [63:0] shifted,
    input [63:0] unshifted
    );
    always @(*) begin
        shifted = unshifted << 1;
    end
endmodule
