class uart_env extends uvm_env;

  `uvm_component_utils(uart_env);
  uart_agent ag;
  uart_agent_op ag_op;
  
  //constructor
  function new (string name = "uart_env",uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  
  //Build Phase
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    ag = uart_agent::type_id::create("ag",this);
    ag_op = uart_agent_op::type_id::create("ag_op",this);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     
  endfunction: connect_phase
 
  
endclass  : uart_env
