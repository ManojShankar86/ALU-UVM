class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  
  //Instantiate interfaces
  rand bit rst;
  rand logic [7:0]A,B;
  rand logic [3:0] ALU_Sel;
  rand logic [15:0] ALU_out;
  rand bit carryout;
  
  //Constraint 
  constraint inp1 {a inside {[10:20]};}
  constraint inp2 {b inside {[1:10]};}
  constraint sel {ALU_Sel inside {0,1,2,3};}
  
  
  //Constructor
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
 
  
endclass