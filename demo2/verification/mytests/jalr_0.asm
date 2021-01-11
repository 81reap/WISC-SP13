// jalr with non zero reg and zero imm
// R6 = 0x08
// R7 = 0x04
// PC = 0x0A
lbi r6, 8
jalr r6, 0
nop
halt
nop
halt

