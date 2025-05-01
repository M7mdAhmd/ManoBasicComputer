module ProgramCounter(
    input clk,
    input reset,
    input load,
    input inc,
    input [11:0] in,
    output reg [11:0] out
);
    always @(posedge clk or posedge reset) begin
        if (reset) out <= 12'b0;
        else if (load) out <= in;
        else if (inc) out <= out + 1;
    end
endmodule