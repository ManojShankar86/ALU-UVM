class seq_item extends uvm_sequence;
  `uvm_object_utils(seq_item)
  
  seq_item s1;
  
  //Constructor
  function new(string name = "base_seq");
    super.new(name);
    `uvm_info("BASE_SEQ","Inside constructor",UVM_HIGH);
  endfunction
  
  //body
  task body();
    `uvm_info("BASE_SEQ","Inside body",UVM_HIGH);
    s1 = seq_item::type_id::create("s1");
    start_item(s1);
    s1.randomize();
    finish_item(s1);
  endtask:body
  
endclass

class alu_test_seq extends seq_item;
  `uvm_object_utils(alu_test_seq)
  
  seq_item s2;
  
  //constructor
  function new(string name = "alu_test_seq");
    super.new(name);
    `uvm_info("TEST_SEQ","Inside constructor",UVM_HIGH)
  endfunction
  
  //body task
  task body();
    `uvm_info("TEST_SEQ","Inside Body",UVM_HIGH)
    s2 = seq_item::type_id::create("s2");
    start_item(s2);
    s2.randomize();
    finish_item(s2);
  endtask:body
  
endclass
  
  
  
  