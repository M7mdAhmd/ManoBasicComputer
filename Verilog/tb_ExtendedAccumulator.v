`timescale 1ns/1ps

module tb_ExtendedAccumulator;
    reg clk, reset, load, data_in;  // Assuming 1-bit data input for the accumulator
    wire data_out;

    // Instantiate the ExtendedAccumulator
    ExtendedAccumulator uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation: toggles every 5ns (period = 10ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10ns
    end

    // Stimulus
    initial begin
        // Initial state with reset = 1
        reset = 1; load = 0; data_in = 1;

        // Apply reset for 10ns
        #10 reset = 0;   // Release reset after 10ns

        // Set load high and apply data_in = 1 at 20ns
        #10 load = 1; data_in = 1;

        // Change data_in to 0 after 10ns
        #10 data_in = 0;

        // Disable load at 30ns
        #10 load = 0;

        // Finish the simulation after a total of 40ns
        #20 $finish;
    end
endmodule

