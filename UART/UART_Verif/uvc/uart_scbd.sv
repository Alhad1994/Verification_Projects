class uart_scbd extends uvm_scoreboard;

  
  `uvm_component_utils(uart_scbd)
  
  uvm_tlm_analysis_fifo #(uart_tr) mon_in; // rx_data_valid
  uvm_tlm_analysis_fifo #(uart_tr) mon_dv;
  
  uart_tr trin;
  uart_tr tro;
  
  
  function new (string name ="uart_scbd",uvm_component parent=null);
    super.new(name,parent);
  endfunction: new
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    mon_dv = new("mon_dv",this); 
    mon_in = new("mon_in",this);
    
  endfunction: build_phase
  
  task run_phase (uvm_phase phase);
  mon_in.get(trin);
  mon_dv.get(tro);
    forever begin
	
	mon_in.get(trin);
	mon_dv.get(tro);
//   	$display("e1=%p",e1);
//     	$display("TX_BYTE=%g",trin.TX_BYTE);
    end
  endtask: run_phase

endclass: uart_scbd
