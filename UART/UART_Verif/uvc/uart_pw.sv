class comb_msg;
  realtime t;
  function new (realtime tm);
    this.t =tm;
  endfunction : new

endclass: comb_msg

class uart_pw extends uvm_scoreboard;

  `uvm_component_utils(uart_pw)
 
  uvm_tlm_analysis_fifo #(rf_msg) ein;
  uvm_analysis_port #(comb_msg) eout;
  time oldt,delta;
  rf_msg rf1;
  comb_msg msg;
  uart_tr m_in,m_out;

  function new (string name ="uart_pw",uvm_component parent=null);
    super.new(name,parent);
    oldt=0.0;
  endfunction: new
  
  function void build_phase (uvm_phase phase);
    ein=new("ein",this);
    eout=new("eout",this);
  endfunction : build_phase
  
  task run_phase (uvm_phase phase);
    forever begin
	      ein.get(rf1);

	      if(rf1.ed==Rising)
		begin
		  oldt=rf1.t;
		end
	      else if (rf1.ed==Falling)
		begin
		  delta=rf1.t-oldt;
		  msg = new(delta);
		  eout.write(msg);
//  		  $display("msg=%p",msg);
		end
	    end
  endtask: run_phase

endclass : uart_pw