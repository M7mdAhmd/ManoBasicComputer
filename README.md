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
[Watch the Full Project Tutorial](Demo/ManoBasicComputer_Tutorial.mp4)                                                                          
[Watch better-Quality Proteus Simulation part Only](https://www.dropbox.com/scl/fi/rxdu7n5w9o54xw3m3owwj/ManoBasicComputer_Proteus_Simulation.mp4?rlkey=0m4mr01xgb6fwlp0qcw7tkj4b&st=4smkh11h&dl=0)                                                                    
[Access All Videos on Dropbox](https://www.dropbox.com/scl/fo/wqrinby4qogfchosa22pg/ANOOoK2gy8DY_sf6qFQXBpU?rlkey=nc0vnfz6sollcoaq4ermz9zxr&st=r9my3lly&dl=0)

## Technical Challenges
- **IC Selection**: Carefully selected integrated circuits to properly emulate theoretical components
- **Timing & Synchronization**: Implemented custom delay circuits using NOT gates for precise micro-operation timing
- **Register Control**: Optimized data latching and register transfer timing

##
For detailed information about the design and implementation, please refer to the documentation in the [docs directory](Docs).

## Team
Project developed by **The Ohmies** Team   
- [Mohamed Elshoraky](http://www.linkedin.com/in/mohamed-elshoraky)                                                                                              
- [Ahmed Masoud](http://www.linkedin.com/in/ahmed-masoud12)                                                                                              
- [Abdulrahman Fayed](https://www.linkedin.com/in/abdulrahman-fayed/)                                                                                              
- Reem Elbanna                                                                                            
- Shahd Elsawy                                                                                                                                           
- Malak Makky 

Faculty of Engineering                                                                                    
Kafrelsheikh University                                                                                           