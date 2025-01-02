`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 08:41:52 PM
// Design Name: 
// Module Name: shift_left_one_tb
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


module shift_left_one_tb();

    reg [63:0] unshifted;
    wire [63:0] shifted;

    shift_left_one uut (
        .shifted(shifted),
        .unshifted(unshifted)
    );
    
    initial begin
        unshifted = 64'h0000000000000000;
        #10;
        
        unshifted = 64'h7FFFFFFFFFFFFFFF;
        #10;
        
        unshifted = 64'hFFFFFFFFFFFFFFFF;
        #10;
        
        unshifted = 64'h123456789ABCDEF0;
        #10;
        
        $finish;
    end

endmodule
