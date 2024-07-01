class alu_sequencer extends uvm_sequencer#(seq_item);
  `uvm_component_utils(alu_sequencer)
  
  //constructor
  function new(string name="alu_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SEQR_CLASS","Inside constructor",UVM_HIGH)
  endfunction
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQR_BUILD","Inside build phase",UVM_HIGH)
  endfunction
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQR_CONNECT","Inside connect phase",UVM_HIGH)
  endfunction
  
endclass