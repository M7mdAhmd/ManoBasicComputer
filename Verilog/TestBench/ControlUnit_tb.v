`timescale 1ns/1ps

module tb_ControlUnit;
    reg clk, reset, indirect, fetch_done;
    reg [2:0] opcode;
    wire load_ac, load_dr, load_ir, load_pc, inc_pc, load_e, read_mem, write_mem, halt;

    // Instantiate the Control Unit
    ControlUnit uut(
        .clk(clk),
        .reset(reset),
        .opcode(opcode),
        .indirect(indirect),
        .fetch_done(fetch_done),
        .load_ac(load_ac),
        .load_dr(load_dr),
        .load_ir(load_ir),
        .load_pc(load_pc),
        .inc_pc(inc_pc),
        .load_e(load_e),
        .read_mem(read_mem),
        .write_mem(write_mem),
        .halt(halt)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Stimulus
    initial begin
        // Initial state
        reset = 1;
        opcode = 3'b000;
        indirect = 0;
        fetch_done = 0;

        // Release reset
        #10 reset = 0;

        // Trigger fetch complete
        #10 fetch_done = 1;

        // Simulate opcode transition
        #10 fetch_done = 0; opcode = 3'b001;

        // Wait for output response
        #40 $finish;
    end
endmodule