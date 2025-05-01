`timescale 1ns / 1ps  // Time unit = 1ns, Time precision = 1ps

module tb_ProgramCounter;
    reg clk, reset, load, inc;
    reg [11:0] in;
    wire [11:0] out;

    // Instantiate the ProgramCounter module
    ProgramCounter uut(
        .clk(clk),
        .reset(reset),
        .load(load),
        .inc(inc),
        .in(in),
        .out(out)
    );

    // Clock generation (period = 10ns, so clock frequency = 100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5ns, clock period = 10ns
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1; load = 0; inc = 0; in = 12'hABC;
        
        // Apply reset and load signal
        #10 reset = 0; load = 1;  // Apply reset for 10ns, then load value
        #10 load = 0; inc = 1;    // After load, enable increment
        #50 $finish;              // Finish simulation after 50ns
    end

    // Display output for debugging
    initial begin
        $monitor("Time = %0t ns, reset = %b, load = %b, inc = %b, in = %h, out = %h",
                 $time, reset, load, inc, in, out);
    end
endmodule

