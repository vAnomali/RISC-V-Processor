`timescale 1ns / 1ps

module SingleCycleProcessor (
    input wire clk,
    input wire rst,
    output reg [127:0] result
    );

    // Wires for Program Counter
    wire [63:0] pc_in;
    wire [63:0] pc_out;
    wire [63:0] increment;
    wire c_out; // Carry-out from adder, unused here
    wire [31:0] instruction;
    wire [63:0] shifted_immediate;
    wire [63:0] extended_immediate;
    wire [63:0] pc_adder_out; // Branch target address
    wire [63:0] next_pc;      // Selected next PC value

    // Set increment value to 4
    assign increment = 64'd4;
    
    // Program Counter (PC)
    PC pc (
        .clk(clk),
        .rst(rst), 
        .pc_in(next_pc), // Fixed: PC takes `next_pc` for branching
        .pc_out(pc_out)
    );

    // Adder to calculate PC + 4
    Full_64 pc_incrementer (
        .sum(pc_in),  
        .c_out(c_out), // Carry out, not used here
        .a(pc_out),
        .b(increment),
        .c_in(1'b0) 
    );
    
    // Instruction Memory
    instruction_memory imem (
        .pc(pc_out),  
        .instruction(instruction) 
    );
    
    // Immediate Generator
    Immediate_Generator imm_gen (
        .instruction(instruction),
        .extended_instruction(extended_immediate)
    );
    
    // Shift-left operation for branch target calculation
    shift_left_one shift_left (
        .shifted(shifted_immediate),
        .unshifted(extended_immediate)
    );
    
    // Conditional PC Adder (PC + branch offset)
    Full_64 branch_adder (
        .sum(pc_adder_out),
        .c_out(),        
        .a(pc_out),
        .b(shifted_immediate),
        .c_in(1'b0)
    );

    // Multiplexer to select between PC + 4 and branch target
    wire zero; // Fixed: Define `zero` as ALU result comparison
    mux pc_mux (
        .a(pc_adder_out), 
        .b(pc_in),        
        .signal(zero & Branch), 
        .muxOut(next_pc)
    );
    
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;

    // Control Unit
    Control control_unit (
        .Instruction(instruction[6:0]), 
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );
    
    // Register File Signals
    wire [4:0] read_register_1 = instruction[19:15];
    wire [4:0] read_register_2 = instruction[24:20];
    wire [4:0] write_register = instruction[11:7];
    wire [63:0] read_data_1;
    wire [63:0] read_data_2;
    wire [63:0] write_data;

    // Register File
    Registers register_unit (
        .clk(clk),
        .read_register_1(read_register_1),
        .read_register_2(read_register_2),
        .write_register(write_register),
        .write_data(write_data),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .RegWrite(RegWrite) 
    );
    
    // ALU Control Signals
    wire [3:0] alu_control;
    wire [6:0] funct7 = instruction[31:25];
    wire [2:0] funct3 = instruction[14:12];
    // ALU Control
    ALU_Control alu_control_unit (
        .alu_control(alu_control),
        .ALUop(ALUOp),
        .funct7(funct7),
        .funct3(funct3)
    );
    // MUX for ALU operand 2
    wire [63:0] alu_operand2;
    mux alu_operand_mux (
        .a(extended_immediate), 
        .b(read_data_2),        
        .signal(ALUSrc),        
        .muxOut(alu_operand2)
    );

    // ALU
    wire [63:0] alu_result;
    wire alu_branch;
    assign zero = (alu_result == 64'd0); // Fixed: Set `zero` signal based on ALU result
    test_alu alu_unit (
        .a(read_data_1),         
        .b(alu_operand2),        
        .opcode(alu_control),    
        .c_in(1'b0),             
        .result(alu_result),  
        .branch(alu_branch)  
    );
    
    assign need_to_branch = Branch & alu_branch;

    // Handles branching
    assign where_to_branch = pc_out + extended_immediate;
    assign pcInput = (need_to_branch & where_to_branch) | (~need_to_branch & where_to_branch);

    
    // Data Memory Signals
    wire [63:0] data_memory_read; 

    // Data Memory
    Data_Memory data_memory (
        .clk(clk),
        .memWrite(MemWrite),        
        .memRead(MemRead),          
        .address(alu_result),       
        .writeData(read_data_2),    
        .readData(data_memory_read) 
    );

    // Write-Back Multiplexer
    mux write_back_mux (
        .a(data_memory_read),      
        .b(alu_result),            
        .signal(MemtoReg),         
        .muxOut(write_data)        
    );

    // Final Result for Testing
    always @(posedge clk or posedge rst) begin
        if (rst)
            result <= 64'd0;
        else
            result <= write_data; 
    end

endmodule

