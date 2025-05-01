module ALU(
    input [15:0] A,          // First input operand
    input [15:0] B,          // Second input operand
    input [1:0] operation,   // 00: ADD, 01: SUB, 10: AND, 11: OR
    output reg [15:0] result, // Output result
    output reg zero_flag,     // Flag for zero result
    output reg sign_flag      // Flag for negative result
);
    always @(*) begin
        // Perform ALU operation based on the 'operation' code
        case (operation)
            2'b00: result = A + B;  // Addition
            2'b01: result = A - B;  // Subtraction
            2'b10: result = A & B;  // AND
            2'b11: result = A | B;  // OR
            default: result = 16'b0;
        endcase
        
        // Set zero_flag if result is 0
        zero_flag = (result == 16'b0);

        // Set sign_flag if result is negative (MSB is 1 for negative values in 2's complement)
        sign_flag = result[15];
    end
endmodule
