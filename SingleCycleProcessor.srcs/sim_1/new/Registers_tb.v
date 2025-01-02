`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 06:28:07 PM
// Design Name: 
// Module Name: Registers_tb
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

module Registers_tb();
    reg clk;
    reg [4:0] read_register_1;
    reg [4:0] read_register_2;
    reg [4:0] write_register;
    reg [63:0] write_data;
    reg RegWrite;
    wire [63:0] read_data_1;
    wire [63:0] read_data_2;
    
    Registers uut (
        .clk(clk),
        .read_register_1(read_register_1),
        .read_register_2(read_register_2),
        .write_register(write_register),
        .write_data(write_data),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .RegWrite(RegWrite)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        RegWrite = 0;
        write_register = 0;
        write_data = 0;
        read_register_1 = 0;
        read_register_2 = 0;

        #10;

        write_register = 5'd1;
        write_data = 64'hAAAAAAAAAAAAAAAA;
        RegWrite = 1;
        #10;

        RegWrite = 0;
        read_register_1 = 5'd1;
        read_register_2 = 5'd2;
        #10;

        write_register = 5'd2;
        write_data = 64'h5555555555555555;
        RegWrite = 1;
        #10;

        RegWrite = 0;
        read_register_1 = 5'd1;
        read_register_2 = 5'd2;
        #10;

        write_register = 5'd31;
        write_data = 64'hFFFFFFFFFFFFFFFF;
        RegWrite = 1;
        #10;

        RegWrite = 0;
        read_register_1 = 5'd31;
        #10;

        $finish;
    end

endmodule

