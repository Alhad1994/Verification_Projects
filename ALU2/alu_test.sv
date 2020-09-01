class alu_test extends uvm_test;

  `uvm_component_utils(alu_test)
  
  alu_environment env;
  
  
  //constructor
  function new (string name = "alu_test", uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = alu_environment::type_id::create("env",this);
  endfunction: build_phase
    
  //End of elaboration Phase
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("ALU TOPOLOGY","This is End of elaboration Phase - ALU", UVM_LOW)
    uvm_top.print_topology();
  endfunction : end_of_elaboration_phase
  
  
  //Task Run
  task run_phase(uvm_phase phase);
  alu_sequence seq;
  seq = alu_sequence::type_id::create("seq",this);
    phase.raise_objection(this,"Starting sequence main phase");
    seq.start(env.ag.seqr);
    #100ns;
    phase.drop_objection(this,"Ending the seq");
  endtask: run_phase
    
  
endclass: alu_test
