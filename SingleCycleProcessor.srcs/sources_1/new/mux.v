`timescale 1ns / 1ps

module mux(
    input wire [63:0] a,
    input wire [63:0] b,
    input wire signal,
    output reg [63:0] muxOut
    );
    
    always @(*) begin
        case (signal)
            1'b0: muxOut = b;
            1'b1: muxOut = a;
            default: muxOut = 64'b0; 
        endcase
    end
endmodule
