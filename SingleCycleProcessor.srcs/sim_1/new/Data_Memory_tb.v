`timescale 1ns / 1ps

module Data_Memory_tb;

    // Testbench signals
    reg clk;
    reg memWrite;
    reg memRead;
    reg [63:0] address;
    reg [63:0] writeData;
    wire [63:0] readData;

    // Instantiate the Data_Memory module
    Data_Memory uut (
        .clk(clk),
        .memWrite(memWrite),
        .memRead(memRead),
        .address(address),
        .writeData(writeData),
        .readData(readData)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        memWrite = 0;
        memRead = 0;
        address = 64'b0;
        writeData = 64'b0;

        // Test Case 1: Read all preloaded memory values
        #10;
        memRead = 1;

        address = 64'd0; // Read memory[0]
        #10;
        $display("Read memory[0]: Expected = 1000, Actual = %d", readData);

        address = 64'd1; // Read memory[1]
        #10;
        $display("Read memory[1]: Expected = 200, Actual = %d", readData);

        address = 64'd2; // Read memory[2]
        #10;
        $display("Read memory[2]: Expected = -300, Actual = %d", readData);

        address = 64'd3; // Read memory[3]
        #10;
        $display("Read memory[3]: Expected = 800, Actual = %d", readData);

        address = 64'd4; // Read memory[4]
        #10;
        $display("Read memory[4]: Expected = -100, Actual = %d", readData);

        address = 64'd5; // Read memory[5]
        #10;
        $display("Read memory[5]: Expected = 3, Actual = %d", readData);

        // Test Case 2: Write to a memory location
        memRead = 0;
        memWrite = 1;
        address = 64'd10; // Write to memory[10]
        writeData = 64'd12345;
        #10;

        // Test Case 3: Read back written value
        memWrite = 0;
        memRead = 1;
        address = 64'd10; // Read memory[10]
        #10;
        $display("Read memory[10]: Expected = 12345, Actual = %d", readData);

        // Test Case 4: Attempt to read from an uninitialized memory location
        address = 64'd20; // Read memory[20]
        #10;
        $display("Read memory[20]: Expected = 0, Actual = %d", readData);

        // Test Case 5: Attempt to write and read back multiple locations
        memRead = 0;
        memWrite = 1;
        address = 64'd30;
        writeData = 64'd555;
        #10;

        address = 64'd31;
        writeData = 64'd777;
        #10;

        memWrite = 0;
        memRead = 1;
        address = 64'd30; // Read memory[30]
        #10;
        $display("Read memory[30]: Expected = 555, Actual = %d", readData);

        address = 64'd31; // Read memory[31]
        #10;
        $display("Read memory[31]: Expected = 777, Actual = %d", readData);

        // End of simulation
        $stop;
    end

endmodule
