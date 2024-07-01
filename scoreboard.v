class alu_sb extends uvm_test;
  `uvm_component_utils(alu_sb)
  
  uvm_analysis_imp #(seq_item,alu_sb) sb_port;
  
  seq_item transactions[$];
  
  //constructor
  function new(string name="alu_sb",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SB_CLASS","Inside constructor",UVM_HIGH)
  endfunction
  
  //build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SB CLASS","Inside build phase",UVM_HIGH)
    
    sb_port = new("sb_port",this);
  endfunction
  
  //connect_phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SB CLASS","Inside connect phase",UVM_HIGH)
  endfunction
  
  //write method from mon to sb
  function void write(seq_item item);
    transactions.push_back(item);
  endfunction
  
  //run_phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SB CLASS","Inside Run phase",UVM_HIGH)
    
    forever begin
      seq_item curr_item;
      wait((transactions.size()!=0));
      curr_item = transactions.pop_front();
      compare(curr_item);
    end
  endtask
  
 
  //compare function
  task compare(seq_item curr_item);
    logic [15:0] expected;
    logic [15:0] actual;
    case(curr_item.ALU_Sel)
      0:begin
        expected = curr_item.a + curr_item.b;
      end
       1:begin
        expected = curr_item.a - curr_item.b;
      end
       2:begin
        expected = curr_item.a * curr_item.b;
      end
       3:begin
        expected = curr_item.a / curr_item.b;
      end
    endcase
    
    actual = curr_item.ALU_out;
    
    if(actual != expected) begin
      `uvm_error("COMPARE",$sformatf("Transaction failed! ACTUAL = %d,EXPECTED = %d",actual,expected))
    end else begin
      `uvm_info("COMPARE",$sformatf("Transaction Passed! ACTUAL = %d,EXPECTED = %d",actual,expected),UVM_LOW)
    end 
  endtask
endclass

      
      
    
    