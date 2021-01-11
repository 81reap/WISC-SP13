// Write your assembly program for Problem 2 (a) here.
lbi r2, 0
addi r3, r2, 1
seq r4, r3, r2
bnez r4, .equal
addi r3, r2, 0
nop
halt
.equal:
nop
halt
