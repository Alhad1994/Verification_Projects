class uart_comb extends uvm_scoreboard;

  `uvm_component_utils(uart_comb)
  
  uvm_tlm_analysis_fifo #(uart_tr) scbd_port_monin;
  
  uvm_tlm_analysis_fifo #(uart_tr) scbd_port_monout;
  
  uvm_tlm_analysis_fifo #(comb_msg) ein;
  
  comb_msg e1;
  uart_tr uart_it_monin;
  uart_tr preval,nextval;
  
  
  function new (string name = "uart_comb",uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    scbd_port_monin = new("scbd_port_moin",this);
    scbd_port_monout = new("scbd_port_monout",this);
    ein = new ("ein",this);
    preval = new (0);
  endfunction: build_phase
  
  task run_phase(uvm_phase phase);
    forever 
    begin
    fork
    ein.get(e1);
    
    join
      $display("e1=%p",e1.t);
       scbd_port_monin.get(uart_it_monin);
       scbd_port_monout.get(nextval);
         
         $display(" rx_parallel=%h ",nextval.rx_parallel);
        
	if (preval.rx_data_valid == 0 && nextval.rx_data_valid  == 1) // posedge of active
	    begin
// 	    $display("%t Rising rx_valid=%h ",nextval.tim,nextval.rx_data_valid);   
	    end
	 else if (preval.rx_data_valid  ==1 && nextval.rx_data_valid ==0) //Negedge of active
	    begin
//  	    `uvm_info("5 bits found",$sformatf("expected=%p actual=%p",uart_it_monin.TX_BYTE,nextval.rx_parallel),UVM_LOW)
//  	      $display("%t Falling rx_valid=%h",nextval.tim,nextval.rx_data_valid);
	    end
	  preval = nextval;// keep fetching the new values and detect edges
      end
      
  endtask: run_phase
endclass: uart_comb
