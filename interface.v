interface alu_interface(input bit clk);
  bit rst;
  logic [7:0]A,B;
  logic [3:0] ALU_Sel;
  logic [15:0] ALU_out;
  bit carryout;
endinterface
  