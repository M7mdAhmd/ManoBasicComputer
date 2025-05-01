`timescale 1ns / 1ps

module tb_Memory;
    reg clk, read, write;
    reg [11:0] address;
    reg [15:0] data_in;
    wire [15:0] data_out;

    Memory uut (
        .clk(clk),
        .read(read),
        .write(write),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Monitor outputs
        $monitor("Time=%0t | address=%h | data_in=%h | data_out=%h | read=%b | write=%b",
                 $time, address, data_in, data_out, read, write);

        // Initial state
        address = 12'h001;
        data_in = 16'h1234;
        read = 0;
        write = 1;

        // Write 0x1234 to address 0x001
        #10 write = 0; read = 1;

        // Read back from address 0x001
        #10 $finish;
    end
endmodule

