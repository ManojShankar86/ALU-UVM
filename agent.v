class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)
  
   alu_driver drv;
   alu_sequencer seqr;
   alu_monitor mon;
  
  //constructor
  function new(string name="alu_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT CLASS","Inside constructor",UVM_HIGH)
  endfunction
  
  //build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT CLASS","Inside build phase",UVM_HIGH)
     drv = alu_driver::type_id::create("drv",this);
    seqr =  alu_sequencer::type_id::create("seqr",this);
    mon = alu_monitor::type_id::create("mon",this);
  endfunction
  
  //connect_phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT CLASS","Inside connect phase",UVM_HIGH)
    drv.seq_item_port.connect(seqr.seq_item_export)
  endfunction
  
  //run_phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask:run_phase
  
endclass:agent
    
    
    
    