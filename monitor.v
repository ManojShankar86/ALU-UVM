class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor)
   
  virtual alu_interface vif;
  seq_item item;
  
  uvm_analysis_port #(seq_item) monitor_port;
  
  //constructor
  function new(string name="alu_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MON_CLASS","Inside constructor",UVM_HIGH)
  endfunction
  
  //build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MON_CLASS","Inside build_phase",UVM_HIGH)
    
    monitor_port = new("monitor_port",this);
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif)))
      begin 
        `uvm_error("MONITOR_CLASS","FAILED TO GET VIF from DB")
      end
  endfunction
  
  //connect_Phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MON_CLASS","Inside connect_phase",UVM_HIGH)
  endfunction
  
  //run_phase
  task body();
    super.run_phase(phase);
    `uvm_info("MON_CLASS","Inside run_phase",UVM_HIGH)
    
    forever begin
      item=seq_item::type_id::create("item");
      wait(!vif.rst);
      
      //inputs
      @(posedge vif.clk);
      item.a = vif.a;
      item.b = vif.b;
      item.ALU_Sel = vif.ALU_Sel;
      
      //outputs
      @(posedge vif.clk);
      item.ALU_out = vif.ALU_out;
      
      //send item to scoreboard
      monitor_port.write(item);
      
    end
  endtask:run_phase
endclass:monitor
    