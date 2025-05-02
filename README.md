# Mano Basic Computer Implementation

A complete implementation of M. Morris Mano's Basic Computer architecture in both Proteus and Verilog HDL. This project includes full simulation of the computer's instruction set, memory operations, and I/O functionality.

## Project Overview
This project implements the complete Mano Basic Computer architecture, featuring:
- Full instruction set implementation (Memory-Reference, Register-Reference, and I/O instructions)
- Timing and control unit simulation
- Register transfers and micro-operations
- Interrupt handling capability

## Architecture Components
The computer architecture consists of:
- **Registers**: AC, PC, DR, AR, IR, TR, INPR, OUTR
- **Memory Unit**: RAM
- **Common Bus System**
- **Arithmetic Logic Unit (ALU)**
- **Control Unit**:
  - Sequence Counter
  - Instruction Decoder
  - Control Logic
- **Timing Circuit**
- **Input/Output System**

## Implementations
### Proteus Implementation
- Complete digital circuit design
- Carefully selected ICs for proper functionality
- Timing-optimized using delay circuits
- Successfully simulated and tested

### Verilog HDL Implementation
- Full hardware description of the architecture
- Synthesizable code
- Verified through simulation

## Instruction Set
The computer implements the complete Mano instruction set including:
- Memory-reference instructions (AND, ADD, LDA, STA, BUN, BSA, ISZ)
- Register-reference instructions (CLA, CLE, CMA, CME, CIR, CIL, INC, SPA, SNA, SZA, SZE, HLT)
- Input-output instructions (INP, OUT, SKI, SKO, ION, IOF)

## Test Programs
See [TestPrograms.md](Docs/ManoBasicComputer_TestPrograms.md) for detailed examples and test cases used to verify the computer's functionality.

## Tutorial
[Watch the Proteus and Verilog Simulation Tutorial](tutorial_link_placeholder)

## Technical Challenges & Solutions
### Proteus Implementation
- **IC Selection**: Carefully selected integrated circuits to properly emulate theoretical components
- **Timing & Synchronization**: Implemented custom delay circuits using NOT gates for precise micro-operation timing
- **Register Control**: Optimized data latching and register transfer timing

## Team
Project developed by **The Ohmies** Team                                                                           
Faculty of Engineering                                                                                    
Kafrelsheikh University                                                                                           