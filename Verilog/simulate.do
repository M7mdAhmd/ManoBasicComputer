vlib work
vmap work work

# Compile all source files
vlog Accumulator.v
vlog ALU.v
vlog DataRegister.v
vlog ExtendedAccumulator.v
vlog InstructionRegister.v
vlog ProgramCounter.v
vlog Memory.v
vlog ControlUnit.v
vlog MANO_Computer.v

# Compile all testbenches
#vlog tb_Accumulator.v
#vlog tb_ALU.v
#vlog tb_DataRegister.v
#vlog tb_ExtendedAccumulator.v
#vlog tb_InstructionRegister.v
#vlog tb_ProgramCounter.v
#vlog tb_Memory.v
#vlog tb_ControlUnit.v
vlog tb_MANO_Computer.v

# Simulate MANO Computer testbench
vsim tb_MANO_Computer

# Add signals to waveform window
add wave *

# Run the simulation
run -all
