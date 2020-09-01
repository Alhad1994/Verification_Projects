class smc_env extends uvm_env;
  
  `uvm_component_utils(smc_env)

  // Declare Agent class handle here. 
  // Usage:  Agent_ClassName   Agent_HandleName; 
  smc_agent agt;
  
  function new(string name="smc_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = smc_agent::type_id::create("agt",this);
    `uvm_info("SMC_ENV","This is Build Phase - FIFO env", UVM_LOW)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SMC_ENV","This is build phase - FIfo env",UVM_LOW)
  endfunction
  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    #10 
    `uvm_info("SMC_ENV","This is Run Phase - FIFO env", UVM_LOW)
  endtask : run_phase


endclass : smc_env 
