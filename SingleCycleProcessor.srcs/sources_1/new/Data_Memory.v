`timescale 1ns / 1ps

module Data_Memory(
    input wire clk, // Clock signal
    input wire memWrite, // Write enable signal
    input wire memRead, // Read enable signal
    input wire [63:0] address, // 64-bit address input
    input wire [63:0] writeData, // Data to be written
    output reg [63:0] readData // Data output
    );
    integer i;
    reg [63:0] memory [0:1023]; // 1024 locations of 64-bit memory
    // Initialize memory
    initial begin
        readData <= 0;
        for (i = 0; i < 1024; i = i + 1) begin
            memory[i] = 64'b0;
        end
        // Initialize specific values for testing
        memory[0] = 1000; // a
        memory[1] = 200; // b
        memory[2] = -300; // c
        memory[3] = 800; // d
        memory[4] = -100; // e
        memory[5] = 3;  // f
    end
    always @(*) begin
        if (memRead) 
            readData = memory[address[9:0]];
        else
            readData = 64'b0;
    end
    always @(posedge clk) begin
        if (memWrite)
            memory[address[9:0]] <= writeData;
    end    
endmodule
