# Single-Cycle RISC-V Processor

## Block Diagram
The block diagram below illustrates the design of the single-cycle RISC-V processor:

![RISC-V Processor Block Diagram](RISC-V%20Processor%20Layout.PNG)

## Project Overview
This repository contains the implementation of a single-cycle RISC-V processor, designed and developed as part of the Advanced Processor Systems course (ECE4612/5612). The project showcases a fully functional processor capable of executing a variety of instructions, including:

- **Arithmetic Operations**: Addition, Subtraction, Multiplication, and Division
- **Logical Operations**: AND, OR
- **Memory Operations**: Load and Store
- **Branching Instructions**: BEQ (Branch if Equal) and BNE (Branch if Not Equal)

The processor is implemented in Verilog and tested using **Vivado 2022.2**, adhering to the structured and behavioral modeling principles outlined in the project requirements.

---

## Objectives
- Design and implement a single-cycle processor based on a simplified block diagram.
- Create modular components (e.g., ALU, Control Unit, Data Memory) and verify their functionality through rigorous simulation.
- Demonstrate step-by-step execution of RISC-V instructions for a given test expression.

---

## Tools and Equipment
- **Hardware**: 
  - None (Simulation-based)
- **Software**:
  - Vivado 2022.2 for Verilog development and simulation

---

## Components Used
The single-cycle processor consists of the following key components:

1. **Program Counter (PC)**: Tracks the current instruction address.
2. **Instruction Memory**: Stores the program instructions.
3. **Registers**: Holds temporary data and provides operands for computations.
4. **Arithmetic Logic Unit (ALU)**: Performs arithmetic and logical operations.
5. **ALU Control Unit**: Determines the operation to be performed by the ALU.
6. **Control Unit**: Generates control signals for other components.
7. **Data Memory**: Stores data accessed by load and store instructions.
8. **Immediate Generator**: Extends immediate values to 64 bits.
9. **Multiplexer (MUX)**: Selects between different data sources.
10. **Branch Logic**: Handles branching operations like BEQ and BNE.
11. **Shift Left One**: Shifts binary values for address calculation.

---

## Design Highlights
### Structural Modeling
- The Arithmetic Logic Unit (ALU) adder was constructed using a bottom-up approach:
  - Half Adder → 1-bit Adder → 4-bit Adder → 16-bit Adder → 32-bit Adder → 64-bit Adder
- The subtractor was designed using the adder: `A - B = A + (-B)`.

### Behavioral Modeling
- Logical unit, shifter, and sign extension modules were modeled behaviorally using Verilog operators.

### Multiplication and Division
- Algorithms for multiplication and division were carefully selected and implemented, ensuring efficient operation, and both unsigned and signed capabilities.

---

## Testing and Validation
- Comprehensive test benches were created for each module, with waveforms and explanations included in the project documentation.
- A final integration test validated the full processor using a provided RISC-V instruction expression.

---

## Results
- The processor successfully executed all assigned instructions and passed rigorous simulations.
- Step-by-step execution for the given test expression demonstrated accurate functionality, verified through detailed waveforms.

---

## Conclusion
This project highlights a robust implementation of a single-cycle RISC-V processor, emphasizing modular design, structured modeling, and thorough testing. The successful execution of arithmetic, logical, memory, and branching instructions showcases the processor's reliability and adherence to the RISC-V architecture principles.
