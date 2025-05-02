module InstructionRegister (
    input clk,
    input load,
    input [15:0] instruction_in,
    output reg [15:0] instruction_out
);
    always @(posedge clk) begin
        if (load)
            instruction_out <= instruction_in;
    end
endmodule
