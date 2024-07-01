class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
  //Instantiate 
  alu_env env;
  seq_item reset_seq;
  alu_test_seq test_seq;
  
  //Constructor
  function new(string name = "alu_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("TEST_CLASS","INSIDE CONSTRUCTOR",UVM_HIGH)
    endfunction
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS","INSIDE Build phase",UVM_HIGH)
    
    env = alu_env::type_id::create("env",this);
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS","INSIDE Connect phase",UVM_HIGH)
  endfunction
  
  //run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS","INSIDE Connect phase",UVM_HIGH)
    phase.raise_objection(this);
    
    reset_seq = base_seq::type_id::create("reset_seq");
    reset_seq.start(env.agent.seqr);
    #10;
    
    repeat(100) begin
      test_seq = alu_test_seq::type_id::create("test_seq");
      test_seq.start(env.agent.seqr);
      #10;
    end
    
    phase.raise_objection(this);
  endtask
endclass