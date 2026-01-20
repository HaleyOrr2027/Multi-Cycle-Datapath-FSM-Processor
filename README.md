This project implements a custom multi-cycle datapath and finite state machine (FSMD) in Verilog and deploys it on a DE1-SoC FPGA board. 
The system behaves like a small processor: users enter an opcode and operands using on-board switches and buttons, and the controller 
sequences micro-operations through a hardware datapath to compute and display results on the seven-segment HEX displays.

The design integrates operand registers, a result register, ALU logic, and shift logic coordinated by a centralized FSM controller.
Most operations execute as single-cycle micro-operations once operands are available, while multiplication is implemented as a true multi-cycle serial 
shift-and-add algorithm spanning multiple clock cycles. All arithmetic and shifting behavior is implemented structurally without relying on built-in multiply, divide, modulus, or arithmetic shift operators.

The system supports signed arithmetic, bitwise logic, circular and arithmetic shifts, and internal debug modes for observing signal behavior during development.
The design was simulated and validated in ModelSim and synthesized using Quartus before deployment to physical FPGA hardware, reinforcing strong verification and hardware bring-up practices.
