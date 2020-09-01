class alu_seqr extends uvm_sequencer #(alu_tr);
   
   `uvm_component_utils (alu_seqr) //factory registration
 
 //constructor
   function new (string name = "alu_seqr", uvm_component parent = null);
      super.new (name, parent);
   endfunction
 
endclass : alu_seqr