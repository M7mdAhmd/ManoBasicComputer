`timescale 1ns/1ps
module tb_ALU;
    reg [15:0] a, b;     // 16-bit input operands
    reg [1:0] op;        // 2-bit operation code (00: ADD, 01: SUB, 10: AND, 11: OR)
    wire [15:0] result;  // 16-bit result output
    wire zero_flag;      // Zero flag output
    wire sign_flag;      // Sign flag output

    // Instantiate ALU module
    ALU uut (
        .A(a),            // Connect testbench signal 'a' to port 'A'
        .B(b),            // Connect 'b' to 'B'
        .operation(op),   // Connect 'op' to 'operation'
        .result(result),  // Connect 'result' to 'result'
        .zero_flag(zero_flag),  // Connect 'zero_flag' to 'zero_flag'
        .sign_flag(sign_flag)   // Connect 'sign_flag' to 'sign_flag'
    );

    initial begin
        // Initial input values
        a = 16'h000F;  // a = 15 in hexadecimal
        b = 16'h0001;  // b = 1 in hexadecimal

        // Test various operations
        op = 2'b00; #10; // ADD (A + B)
        $display("ADD Result: %h, Zero Flag: %b, Sign Flag: %b", result, zero_flag, sign_flag);
        
        op = 2'b01; #10; // SUB (A - B)
        $display("SUB Result: %h, Zero Flag: %b, Sign Flag: %b", result, zero_flag, sign_flag);
        
        op = 2'b10; #10; // AND (A & B)
        $display("AND Result: %h, Zero Flag: %b, Sign Flag: %b", result, zero_flag, sign_flag);
        
        op = 2'b11; #10; // OR  (A | B)
        $display("OR Result: %h, Zero Flag: %b, Sign Flag: %b", result, zero_flag, sign_flag);

        // Test a zero result
        a = 16'h0001; b = 16'h0001; op = 2'b01; #10; // SUB (A - B)
        $display("SUB (Zero Test) Result: %h, Zero Flag: %b, Sign Flag: %b", result, zero_flag, sign_flag);

        // Test negative result
        a = 16'h0001; b = 16'h0010; op = 2'b01; #10; // SUB (A - B)
        $display("SUB (Negative Test) Result: %h, Zero Flag: %b, Sign Flag: %b", result, zero_flag, sign_flag);

        $stop; // Stop simulation
    end
endmodule