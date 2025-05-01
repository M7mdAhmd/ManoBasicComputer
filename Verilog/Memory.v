module Memory (
    input clk,
    input read,
    input write,
    input [11:0] address,
    input [15:0] data_in,
    output reg [15:0] data_out
);
    reg [15:0] mem [0:4095]; // 4K memory

    // Preload memory with some instructions
    initial begin
        mem[0] = 16'b0110000000000010; // Example instruction (e.g., STA 2)
        mem[1] = 16'b1110000000000000; // HLT
    end

    always @(posedge clk) begin
        if (read)
            data_out <= mem[address];
        else if (write)
            mem[address] <= data_in;
    end
endmodule

