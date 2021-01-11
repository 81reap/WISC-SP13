// Prayag Bhakar [bhakar@wisc.edu]
module fetch (newPC, halt, clk, rst, nextPC, instr);
  // --- Inputs ---
  input [15:0] newPC;
  input halt;
  input clk, rst;

  // --- Outputs ---
  output [15:0] nextPC;
  output [15:0] instr;

  // --- Wires ---
  wire [15:0] pcCurrent; // current PC

  // --- Code ---
  // PC Reg
  //  We need an enable so that we can stop the CPU when we are dumping
  reg16b PC_REG (.clk(clk), .rst(rst), .en(~halt), .in(newPC), .out(pcCurrent));

  // Instruction Memory
  //  Get the instruction from mem. We never write to this (i think)
  memory2c INSTR_MEM (.data_out(instr), .data_in(16'h0000), .addr(pcCurrent), .enable(1'b1), .wr(1'b0), .createdump(halt), .clk(clk), .rst(rst));

  // PC Increment
  //  Get the PC ready for the next cycle by adding 2
  cla16 PC_INC (.A(pcCurrent), .B(16'h0002), .Cin(1'b0), .sum(nextPC), .Cout(), .Pout(), .Gout());
endmodule
