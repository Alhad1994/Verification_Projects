class alu_agent extends uvm_agent;
  
  `uvm_component_utils(alu_agent)//Factory registartion
  
  alu_seqr seqr;
  alu_monitor_in mon_in;
  alu_driver driver;
  
  
  uvm_analysis_port #(alu_tr) agent_op;
  
  //constructor
  function new (string name = "alu_agent",uvm_component parent= null);
    super.new(name,parent);
  endfunction : new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_op = new("agent_op",this);
    driver = alu_driver::type_id::create("driver",this);
    seqr = alu_seqr::type_id::create("seqr",this);
    mon_in = alu_monitor_in::type_id::create("mon_in",this);// Just build monitor
   
    
  endfunction : build_phase
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(seqr.seq_item_export); // Driver to seqr connection
    `uvm_info("Connect Phase:","Connection to driver via seqr is successful",UVM_LOW)
    mon_in.mon_in_port.connect(agent_op);
    `uvm_info("Connect Phase:","Connection to monitor  via agent is successful",UVM_LOW)
  endfunction: connect_phase
endclass: alu_agent
