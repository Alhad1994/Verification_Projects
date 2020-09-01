class uart_agent extends uvm_agent;
  
  `uvm_component_utils(uart_agent)//Factory registartion
  
  uart_seqr seqr;
  uart_driver driver;
  
  
  uvm_analysis_port #(uart_tr) agent_op;
  
  //constructor
  function new (string name = "uart_agent",uvm_component parent= null);
    super.new(name,parent);
  endfunction : new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_op = new("agent_op",this);
    driver = uart_driver::type_id::create("driver",this);
    seqr = uart_seqr::type_id::create("seqr",this);
    
  endfunction : build_phase
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(seqr.seq_item_export); // Driver to seqr connection
    `uvm_info("Connect Phase:","Connection to driver via seqr is successful",UVM_LOW)
  endfunction: connect_phase
endclass: uart_agent


class uart_agent_op extends uvm_agent;
  
  `uvm_component_utils(uart_agent_op)//Factory registartion
  
  
  uart_monitor_out mon;
  uart_monitor_in mon_in;
  uart_edge_det edg;
  uart_pw pw;
  uart_comb uc;
  
  
  //constructor
  function new (string name = "uart_agent_op",uvm_component parent= null);
    super.new(name,parent);
  endfunction : new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = uart_monitor_out::type_id::create("mon",this);
    mon_in = uart_monitor_in::type_id::create("mon_in",this);
    edg = uart_edge_det::type_id::create("edg",this);
    pw = uart_pw::type_id::create("pw",this);
    uc= uart_comb::type_id::create("uc",this);
  endfunction : build_phase
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  
      edg.mout.connect(pw.ein.analysis_export);
      `uvm_info("EDGE:PW"," Connection between edge scbd and is done",UVM_LOW)
      pw.eout.connect(uc.ein.analysis_export);
      `uvm_info("PW:COMB"," Connection between edge scbd and is done",UVM_LOW)
      
       mon.mon_op.connect(edg.mon_dv.analysis_export);
      `uvm_info("MON_OUT:EDGE"," Connection between monitor and edge scbd is done",UVM_LOW)
      
       mon.mon_op.connect(uc.scbd_port_monout.analysis_export);
      `uvm_info("MON_OUT:COMB"," Connection between monitor and pw is done",UVM_LOW)
	mon_in.mon_in_port.connect(uc.scbd_port_monin.analysis_export);
      `uvm_info("MON_IN:COMB"," Connection between monitor & pw is done",UVM_LOW)
      
      
  endfunction: connect_phase
endclass: uart_agent_op
