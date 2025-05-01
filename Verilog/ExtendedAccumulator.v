module ExtendedAccumulator(
    input clk,
    input reset,
    input load,
    input data_in,
    output reg data_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) data_out <= 1'b0;
        else if (load) data_out <= data_in;
    end
endmodule