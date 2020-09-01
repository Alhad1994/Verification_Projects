class smc_sequencer extends uvm_sequencer#(seq_item);
`uvm_component_utils(smc_sequencer)
//Constructor
function new(string name = "smc_seqr",uvm_component parent);
    super.new(name,parent);
endfunction : new

endclass : smc_sequencer
