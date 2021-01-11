// jalr with zero reg and non zero imm
// R6 = 0x08
// R7 = 0x04
// PC = 0x0A
lbi r6, 0
jalr r6, 8
nop
halt
nop
halt

