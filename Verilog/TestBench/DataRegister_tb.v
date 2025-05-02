`timescale 1ns/1ps
module tb_DataRegister;
    reg clk, reset, load;
    reg [15:0] data_in;
    wire [15:0] data_out;

    // Instantiate the DataRegister module
    DataRegister uut(.clk(clk), .reset(reset), .load(load), .data_in(data_in), .data_out(data_out));

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clk every 5 ns
    end

    // Test Stimulus
    initial begin
        // Reset the Data Register
        reset = 1; load = 0; data_in = 16'hDEAD;  
        #10 reset = 0;  // Release reset after 10 ns
        
        // Load the first value (DEAD)
        load = 1; data_in = 16'hDEAD;
        #10 load = 0;  // Stop loading after 10 ns
        
        // Load the second value (BEEF)
        #10 load = 1; data_in = 16'hBEEF;  // Change data_in to BEEF
        #10 load = 0;  // Stop loading
        
        #10 $finish;   // End the simulation
    end
endmodule
