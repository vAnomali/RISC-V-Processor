`timescale 1ns / 1ps
module PC(
    input clk,
    input rst,
    input [63:0] pc_in,
    output reg [63:0] pc_out
    );
    
    initial begin
        pc_out = 64'b0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_out <= 64'b0;
        end else begin
            pc_out <= pc_in;
        end
    end
endmodule