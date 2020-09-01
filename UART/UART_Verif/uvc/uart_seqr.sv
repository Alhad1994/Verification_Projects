class uart_seqr extends uvm_sequencer #(uart_tr);
   
   `uvm_component_utils (uart_seqr) //factory registration
 
 //constructor
   function new (string name = "uart_seqr", uvm_component parent = null);
      super.new (name, parent);
   endfunction
 
endclass : uart_seqr