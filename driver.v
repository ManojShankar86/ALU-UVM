class alu_driver extends uvm_driver#(seq_item);
  `uvm_component_utils(alu_driver)
  //create interface inst and seq item inst
  virtual alu_interface vif;
  seq_item item;
  
  //constructor 
  function new(string name="alu_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("DRIVER_CLASS","Inside Constructor",UVM_HIGH)
  endfunction
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS","Inside Build Phase",UVM_HIGH)
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif)))
      begin
        `uvm_error("DRIVER CLASS","FAILED TO GET VIF from config db")
      end
  endfunction
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS","Inside connect Phase",UVM_HIGH)
  endfunction
  
  //Run Phase
  task run_phase();
     super.run_phase(phase);
    `uvm_info("DRIVER_CLASS","Inside run Phase",UVM_HIGH)
    
    forever begin
      iten = seq_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  endtask:run_phase
  
  
  //Method drive
  task drive(seq_item item);
    @(posedge vif.clk);
    vif.rst<=item.rst;
    vif.a<=item.a;
    vif.b<=item.b;
    vif.ALU_Sel<=item.ALU_Sel;
  endtask:drive
endclass:alu_driver