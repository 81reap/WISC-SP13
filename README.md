# WISC-SP13
Term project for [CS 552](http://pages.cs.wisc.edu/~karu/courses/cs552/fall2020/wiki/index.php/Main/HomePage). Complete functional design of a microprocessor called the WISC-SP13 and cache modules written in Verilog. Project information provide by the instructors of this class was adapted and changed to make this readme.

In order to run the processor, you will need a deveoplent enviroment simmilar to the CS Lab machines at UW Madison. Unfortunatly I do not know how set this up, and cannot distrubute a Docker image as a paid licence is needed to run some of the programs used.

## Micro architecture Specifications
The WISC-SP13 architecture is similar to the MIPS R2000 in the way it includes a load/store architecture and three fixed-length instruction formats. WISC-SP13 is diffrent from MIPS R2000 due to the smaller instruction set and use 16-bit words.

## demo 1: Unpiplined Design
Demo 1 uses a single cycle perfect memory to create an unpiplined implemetnation of our microprocessor. We use two indivendual memory modules, one for instruction and one for data, to achive instruction fetched and data reads/writes in the same cycle.

## demo 2

## cache

## WISC-SP13 ISA
note: I was unable to implement the extra credit sciic instruction.

| Instr Format     | Syntax            | Description                  |
| :--              | :--               | :--                          |
| 00000xxxxxxxxxxx | HALT              | Cease instruction issue,     |
|                  |                   | dump memory state to file    |
| 00001xxxxxxxxxxx | NOP               |                              |
| 01000sssdddiiiii | ADDI Rd, Rs, imm  | Rd <- Rs + I(sign ext.)      |
| 01001sssdddiiiii | SUBI Rd, Rs, imm  | Rd <- I(sign ext.) - Rs      |
| 01010sssdddiiiii | XORI Rd, Rs, imm  | Rd <- Rs XOR I(zero ext.)    |
| 01011sssdddiiiii | ANDNI Rd, Rs, imm | Rd <- Rs AND ~I(zero ext.)   |
| 10100sssdddiiiii | ROLI Rd, Rs, imm  | Rd <- Rs << I(lowest 4 bits) |
| 10101sssdddiiiii | SLLI Rd, Rs, imm  | Rd <- Rs << I(lowest 4 bits) |
| 10110sssdddiiiii | RORI Rd, Rs, imm  | Rd <- Rs >> I(lowest 4 bits) |
| 10111sssdddiiiii | SRLI Rd, Rs, imm  | Rd <- Rs >> I(lowest 4 bits) |
| 10000sssdddiiiii | ST Rd, Rs, imm    | Mem[Rs + I(sign ext.)] <- Rd |
| 10001sssdddiiiii | LD Rd, Rs, imm    | Rd <- Mem[Rs + I(sign ext.)] |
| 10011sssdddiiiii | STU Rd, Rs, imm   | Mem[Rs + I(sign ext.)] <- Rd |
|                  |                   | Rs <- Rs + I(sign ext.)      |
| 11001sssxxxdddxx | BTR Rd, Rs        | Rd[bit i] <- Rs[bit 15-i]    |
|                  |                   | for i=0..15                  |
| 11011ssstttddd00 | ADD Rd, Rs, Rt    | Rd <- Rs + Rt                |
| 11011ssstttddd01 | SUB Rd, Rs, Rt    | Rd <- Rt - Rs                |
| 11011ssstttddd10 | XOR Rd, Rs, Rt    | Rd <- Rs XOR Rt              |
| 11011ssstttddd11 | ANDN Rd, Rs, Rt   | Rd <- Rs AND ~Rt             |
| 11010ssstttddd00 | ROL Rd, Rs, Rt    | Rd <- Rs << Rt(lowest 4 bits)|
| 11010ssstttddd01 | SLL Rd, Rs, Rt    | Rd <- Rs << Rt(lowest 4 bits)|
| 11010ssstttddd10 | ROR Rd, Rs, Rt    | Rd <- Rs >> Rt(lowest 4 bits)|
| 11010ssstttddd11 | SRL Rd, Rs, Rt    | Rd <- Rs >> Rt(lowest 4 bits)|
| 11100ssstttdddxx | SEQ Rd, Rs, Rt    | if (Rs == Rt) then Rd <- 1   |
|                  |                   | else Rd <- 0                 |
| 11101ssstttdddxx | SLT Rd, Rs, Rt    | if (Rs < Rt) then Rd <- 1    |
|                  |                   | else Rd <- 0                 |
| 11110ssstttdddxx | SLE Rd, Rs, Rt    | if (Rs <= Rt) then Rd <- 1   | |                  |                   | else Rd <- 0                 |
| 11111ssstttdddxx | SCO Rd, Rs, Rt    | if (Rs + Rt) generates c_out |
|                  |                   | then Rd <- 1 else Rd <- 0    |
| 01100sssiiiiiiii | BEQZ Rs, imm.     | if (Rs == 0) then            | |                  |                   | PC <- PC + 2 + I(sign ext.)  |
| 01101sssiiiiiiii | BNEZ Rs, imm.     | if (Rs != 0) then            |
|                  |                   | PC <- PC + 2 + I(sign ext.)  |
| 01110sssiiiiiiii | BLTZ Rs, imm      | if (Rs < 0) then             |
|                  |                   | PC <- PC + 2 + I(sign ext.)  |
| 01111sssiiiiiiii | BGEZ Rs, imm.     | if (Rs >= 0) then            |
|                  |                   | PC <- PC + 2 + I(sign ext.)  |
| 11000sssiiiiiiii | LBI Rs, imm.      | Rs <- I(sign ext.)           |
| 10010sssiiiiiiii | SLBI Rs, imm.     | Rs <- (Rs << 8)              |
| 00100ddddddddddd | J displacement    | PC <- PC + 2 + D(sign ext.)  |
| 00101sssiiiiiiii | JR Rs, imm.       | PC <- Rs + I(sign ext.)      |
| 00110ddddddddddd | JAL displacement  | R7 <- PC + 2                 | 
|                  |                   | PC <- PC + 2 + D(sign ext.)  |
| 00111sssiiiiiiii | JALR Rs, imm.     | R7 <- PC + 2                 |
|                  |                   | PC <- Rs + I(sign ext.)      |
| 00010sssxxxxxxxx | NOP / RTI         |                              |