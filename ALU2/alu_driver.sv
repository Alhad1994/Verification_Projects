//Driver class UVM

class alu_driver extends uvm_driver #(alu_tr);

//factory registration
  `uvm_component_utils(alu_driver)
  
  
  alu_tr alu_it; //declare the object handle
  
  virtual alu_if vif; //virtual inertface dec

//constuctor
  function new (string name = "alu_driver", uvm_component parent=null);
    super.new(name,parent);
    
  endfunction
  
  //Build phase 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
     alu_it = alu_tr::type_id::create("alu_it");
        if(!uvm_config_db#(virtual alu_if)::get(null, "bob", "vif", vif)) begin
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
       end
  endfunction : build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

   endfunction : connect_phase
  
  //Run Phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase (phase);
    `uvm_info("Driver","Run phase has started",UVM_MEDIUM)
    reset();
    forever 
      begin
    
	// get next item from the sequencer
	seq_item_port.get_next_item(alu_it);
    
	 @(posedge vif.clk);
	#1;
	// Inputs to the DUT using virual interface
	vif.a <= alu_it.a;
	vif.b <= alu_it.b;
	vif.ci <= alu_it.ci;
	vif.pushin <= alu_it.pushin;
	vif.stopin <= alu_it.stopin;
	vif.ctl <= alu_it.ctl;
	
	
	seq_item_port.item_done();
	
	 //$display("a=%b, b=%h ctl=%b pushin=%b",alu_it.a,alu_it.b,alu_it.ctl,alu_it.pushin);
      end
    endtask : run_phase
    
  
  virtual task reset();
    vif.rst = 1'b1;
   vif.pushin = 1'b0;
   vif.ctl = 'b0;
   vif.a = 'b0;
   vif.b = 'b0;
   vif.ci = 'b0;
   vif.stopin = 'b0;
   #100;
   vif.rst = 1'b0;
  
  endtask: reset
  
  
endclass : alu_driver
