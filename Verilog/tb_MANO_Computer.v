`timescale 1ns/1ps

module tb_MANO_Computer;
    reg clk, reset;

    // Instantiate the MANO_Computer
    MANO_Computer uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation: 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset and simulation flow
    initial begin
        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Run long enough to allow fetch/decode
        #100;

        // Finish simulation
        $finish;
    end

    // Dump waveform for ModelSim
    initial begin
        $dumpfile("MANO_Computer.vcd");
        $dumpvars(0, tb_MANO_Computer);
    end
endmodule

