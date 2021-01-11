// jalr with max pos reg and neg imm
// R6 = 0xAA
// R7 = 0x04
// PC = 0x08
libi r6, 127
jalr r6, -121
halt
nop
halt

