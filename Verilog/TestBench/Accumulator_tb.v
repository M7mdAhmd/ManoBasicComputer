`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2025 02:28:27 PM
// Design Name: 
// Module Name: Accumulator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
module tb_Accumulator;
    reg clk, reset, load;
    reg [15:0] data_in;
    wire [15:0] data_out;
    Accumulator uut (.clk(clk), .reset(reset), .load(load), .data_in(data_in), .data_out(data_out));
    initial begin
        clk = 0; forever #5 clk = ~clk;
    end
    initial begin
        reset = 1; load = 0; data_in = 16'hAAAA;
        #10 reset = 0;
        #10 load = 1;
        #10 load = 0;
        #20 $stop;
    end
endmodule
