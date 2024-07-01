class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  
   alu_agent agent;
  alu_sb sb;
  
  //constructor
  function new(string name = "alu_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV CLASS","Inside the constructor",UVM_HIGH)
  endfunction
  
  //Build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV CLASS","Inside the Build Phase",UVM_HIGH)
    
    agent = alu_agent::type_id::create("agent",this);
    sb = alu_sb::type_id::create("sb",this);
    
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV CLASS","Inside the Connect Phase",UVM_HIGH)
  endfunction
  
  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
endclass
    