import uvm_pkg::*;
`include "interface.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "sequenceitem.sv"
`include "Driver.sv"
`include "agent.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "Environment.sv"
`include "test.sv"
module top;
  bit clk;
  
  alu_interface intf(.clk(clk));
  ALU dut(.clk(intf.clk),.rst(intf.rst),.A(intf.A),.B(intf.B),.ALU_Sel(intf.ALU_Sel),.ALU_out(intf.ALU_out),.carryout(intf.carryout));
  
  //interface
  initial begin
    uvm_config_db #(virtual alu_interface)::set(null,"*","vif",intf);
  end
  
  //Start The Test
  initial begin
    run_test("alu_test");
  end
  
  //Clock
  initial begin
    clk = 0;
    #5;
    forever begin
      clk = ~clk;
    #2;
    end
  end
  
  //Maximun Simulation 
  initial begin
    #5000;
    $display("SORRY RAN OUT OF CYCLES");
    $finish();
  end
  
  //Generate Waveforms
  initial begin
    $dumpfile("d.vcd");
    $dumpvars;
  end
  
endmodule