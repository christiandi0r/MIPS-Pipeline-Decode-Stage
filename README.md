# MIPS Pipeline - Instruction Decode (ID) Stage

## Overview
Implementation of the ID stage of a MIPS 5-stage pipeline in Verilog.

## Modules
- `sign_extend.v` - Sign extends 16-bit immediate to 32 bits
- `regfile.v` - 32 general purpose registers with read/write
- `control.v` - Generates control signals from opcode
- `idExLatch.v` - Pipeline register between ID and EX stages
- `decode.v` - Top-level ID stage wiring all modules together

## How to Run
1. Open project in Vivado
2. Set `tb_decode.v` as simulation top
3. Run Behavioral Simulation
4. Add output signals to waveform window

## ID Stage Timing Diagram
![Decode Stage Waveform](decode_waveform.png)
