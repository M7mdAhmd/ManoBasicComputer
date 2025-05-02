module ControlUnit(
    input clk,
    input reset,
    input [2:0] opcode,
    input indirect,
    input fetch_done,
    output reg load_ac,
    output reg load_dr,
    output reg load_ir,
    output reg load_pc,
    output reg inc_pc,
    output reg load_e,
    output reg read_mem,
    output reg write_mem,
    output reg halt
);
    reg [1:0] state;

    localparam FETCH = 2'b00, DECODE = 2'b01, EXECUTE = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= FETCH;
            {load_ac, load_dr, load_ir, load_pc, inc_pc, load_e, read_mem, write_mem, halt} <= 9'b0;
        end else begin
            case (state)
                FETCH: begin
                    load_ir <= 1;
                    read_mem <= 1;
                    inc_pc <= 1;
                    if (fetch_done) state <= DECODE;
                end
                DECODE: begin
                    load_ir <= 0;
                    read_mem <= 0;
                    inc_pc <= 0;
                    case (opcode)
                        3'b000: begin load_ac <= 1; read_mem <= 1; state <= EXECUTE; end
                        3'b001: begin load_ac <= 1; read_mem <= 1; state <= EXECUTE; end
                        3'b010: begin write_mem <= 1; state <= EXECUTE; end
                        3'b111: begin halt <= 1; state <= FETCH; end
                        default: state <= EXECUTE;
                    endcase
                end
                EXECUTE: begin
                    {load_ac, load_dr, load_pc, inc_pc, load_e, read_mem, write_mem} <= 7'b0;
                    state <= FETCH;
                end
            endcase
        end
    end
endmodule