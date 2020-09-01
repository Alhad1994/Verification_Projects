class alu_agent_op extends uvm_agent;
  
  `uvm_component_utils(alu_agent_op)//Factory registartion
  
  
  alu_monitor mon;
  
  uvm_analysis_port #(alu_tr) agent_out;
  
  //constructor
  function new (string name = "alu_agent_op",uvm_component parent= null);
    super.new(name,parent);
  endfunction : new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_out = new("agent_out",this);
   // Just build monitor
    mon = alu_monitor::type_id::create("mon",this);
    
  endfunction : build_phase
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   
      mon.mon_op.connect(agent_out);
    `uvm_info("Connect Phase:","Connection to monitor  via agent is successful",UVM_LOW)
    
  endfunction: connect_phase
endclass: alu_agent_op
