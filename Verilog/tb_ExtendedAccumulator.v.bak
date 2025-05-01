`timescale 1ns/1ps

module tb_InstructionRegister;
    reg clk, load;
    reg [15:0] instruction_in;
    wire [15:0] instruction_out;

    InstructionRegister uut (
        .clk(clk),
        .load(load),
        .instruction_in(instruction_in),
        .instruction_out(instruction_out)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Initial values
        load = 0;
        instruction_in = 16'h1234;

        // Wait for a few clock cycles
        #8 load = 1;       // Set load just before rising edge (at 10ns)
        #10 load = 0;      // Clear load after rising edge

        #10 instruction_in = 16'h5678; // Change input
        #10 load = 1;      // Load new instruction
        #10 load = 0;

        #20 $finish;
    end
endmodule

