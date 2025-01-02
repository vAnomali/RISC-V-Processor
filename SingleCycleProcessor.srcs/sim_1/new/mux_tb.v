`timescale 1ns / 1ps

module mux_tb;
    reg [63:0] a, b;
    reg signal;
    wire [63:0] muxOut;

    // Instantiate the mux
    mux uut (
        .a(a),
        .b(b),
        .signal(signal),
        .muxOut(muxOut)
    );

    initial begin
        $monitor("Time: %0dns | a = %h | b = %h | signal = %b | muxOut = %h",
                 $time, a, b, signal, muxOut);

        // Test cases
        a = 64'hAAAAAAAAAAAAAAAA; b = 64'h5555555555555555; signal = 0; #10;
        a = 64'hAAAAAAAAAAAAAAAA; b = 64'h5555555555555555; signal = 1; #10;
        a = 64'hFFFFFFFFFFFFFFFF; b = 64'h0000000000000000; signal = 0; #10;
        a = 64'hFFFFFFFFFFFFFFFF; b = 64'h0000000000000000; signal = 1; #10;

        $finish;
    end
endmodule
