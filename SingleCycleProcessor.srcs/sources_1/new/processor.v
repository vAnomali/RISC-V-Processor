`timescale 1ns / 1ps

module processor (
    input wire clk,
    input wire rst,
    output reg [63:0] result
    );

     // Wires for Program Counter
    wire [63:0] pc_in;
    wire [63:0] pc_out;
    wire [63:0] increment;
    wire c_out; // Carry-out from adder, unused here

    // Set increment value to 4
    assign increment = 64'd4;

    // Program Counter (PC)
    PC pc (
        .clk(clk),
        .rst(rst), // Corrected signal name here
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Adder to calculate next PC value
    Full_64 adder (
        .sum(pc_in),  // Connect the result to pc_in
        .c_out(c_out), // Carry out, not used here
        .a(pc_out),
        .b(increment),
        .c_in(1'b0) // No initial carry-in
    );
    
    // Instruction Memory
    instruction_memory imem (
        .pc(pc_out[31:0]),  // Connect the PC output as the address
        .instruction(instruction) // Fetch the instruction
    );

//    // Optional: Store PC output in result for observation
//    always @(posedge clk or posedge rst) begin
//        if (rst)
//            result <= 64'b0;
//        else
//            result <= pc_out;
//    end
    
    

endmodule