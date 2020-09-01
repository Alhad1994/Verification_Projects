class alu_environment extends uvm_env;

  `uvm_component_utils(alu_environment);
  
  alu_agent ag;
  alu_scoreboard scbd;//handle points to memory location where the object is stored
  alu_agent_op ag_op;
  //constructor
  function new (string name = "alu_environment",uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  
  //Build Phase
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    ag = alu_agent::type_id::create("ag",this);
    scbd= alu_scoreboard::type_id::create("scbd",this);// value of pointer
    ag_op = alu_agent_op::type_id::create("ag_op",this);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     ag.agent_op.connect(scbd.scbd_port_monin.analysis_export);
    `uvm_info("AGNT:MON:SCBD","All three connected as Input",UVM_LOW)
     ag_op.agent_out.connect(scbd.scbd_port_monout.analysis_export);
      `uvm_info("AGNT:MON:SCBD","All three connected as output",UVM_LOW)
  endfunction: connect_phase
 
  
endclass  : alu_environment
