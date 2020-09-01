class smc_agent extends uvm_agent;
  
  `uvm_component_utils(smc_agent)

  smc_driver drv;
  reg_sb sb1;
  per_sb sb2;
  smc_sequencer seqr;

  req_mon r_mon;
  resp_mon rsp_mon;
  edge_mon e_mon;

  function new(string name="smc_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = smc_driver::type_id::create("drv",this);
    r_mon = req_mon::type_id::create("r_mon",this);
    rsp_mon = resp_mon::type_id::create("rsp_mon",this);
    e_mon = edge_mon::type_id::create("e_mon",this);
    sb1 = reg_sb::type_id::create("sb1",this);
    sb2 = per_sb::type_id::create("sb2",this);
    seqr = smc_sequencer::type_id::create("seqr",this);
    `uvm_info("SMC_AGENT","This is Build Phase - smc agent", UVM_LOW)
  endfunction
 
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
    r_mon.req_port.connect(sb1.s_inp.analysis_export);
    rsp_mon.resp_port.connect(sb1.s_res./*analysis_export*/);
    e_mon.edge_port.connect(sb2.p_edge.analysis_export);
    `uvm_info("SMC_AGENT","This is Connect Phase - smc agent", UVM_LOW)
  endfunction
 
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    #10 
    `uvm_info("SMC_AGENT","This is Run Phase - smc agent", UVM_LOW)
  endtask : run_phase

endclass : smc_agent 
