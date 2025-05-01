module MANO_Computer (
    input clk,
    input reset
);
    wire [15:0] mem_data_out;
    wire [15:0] ac_out, dr_out, ir_out;
    wire [11:0] pc_out;
    wire [2:0] opcode;
    wire e_out;

    wire load_ac, load_dr, load_ir, load_pc, inc_pc, load_e, read_mem, write_mem, halt;

    // Correct assignment of opcode from IR
    assign opcode = ir_out[14:12];

    ProgramCounter pc (
        .clk(clk), .reset(reset), .load(load_pc), .inc(inc_pc),
        .in(ir_out[11:0]), .out(pc_out)
    );

    Memory mem (
        .clk(clk), .read(read_mem), .write(write_mem),
        .address(pc_out), .data_in(dr_out), .data_out(mem_data_out)
    );

    InstructionRegister ir (
        .clk(clk), .load(load_ir),
        .instruction_in(mem_data_out), .instruction_out(ir_out)
    );

    DataRegister dr (
        .clk(clk), .reset(reset), .load(load_dr),
        .data_in(mem_data_out), .data_out(dr_out)
    );

    Accumulator ac (
        .clk(clk), .reset(reset), .load(load_ac),
        .data_in(dr_out), .data_out(ac_out)
    );

    ExtendedAccumulator e (
        .clk(clk), .reset(reset), .load(load_e),
        .data_in(1'b0), .data_out(e_out)
    );

    ControlUnit cu (
        .clk(clk), .reset(reset),
        .opcode(opcode),
        .indirect(ir_out[15]),
        .fetch_done(1'b1), // Assumes fetch always completes for now
        .load_ac(load_ac), .load_dr(load_dr), .load_ir(load_ir),
        .load_pc(load_pc), .inc_pc(inc_pc), .load_e(load_e),
        .read_mem(read_mem), .write_mem(write_mem), .halt(halt)
    );
endmodule

