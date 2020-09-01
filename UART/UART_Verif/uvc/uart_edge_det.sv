  
typedef enum {Rising,Falling} RF;

class rf_msg;
  realtime t;
  RF ed;
   function new (realtime tm,RF e);
    this.t =tm;
    this.ed = e;
  endfunction : new

endclass: rf_msg
 
class uart_edge_det extends uvm_scoreboard;

  `uvm_component_utils(uart_edge_det)
  
  uvm_tlm_analysis_fifo #(uart_tr) mon_dv; // tx_data_valid
  uvm_analysis_port #(rf_msg) mout;
 
  uart_tr oldval,newval; // call the class and use the t from function for realtime values
  rf_msg tr; 
  
  function new (string name = "uart_edge_det",uvm_component parent = null);
    super.new(name,parent);
  endfunction : new

  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    mon_dv = new("mon_dv",this);
    mout = new("mout",this);
    oldval = new(0);
    
    //$display("oldval=%h",oldval);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
      forever 	
	begin
	   mon_dv.get(newval);
	   
	 // For Active line
	 if (oldval.TX_Active ==0 && newval.TX_Active==1) // posedge of active
	    begin
	      //newval.edg();
// 	      $display("%t Rising TX_Active=%h ",newval.tim,newval.TX_Active);
	      tr = new(newval.tim,Rising);
//  	      $display("tr=%p",tr);
	      mout.write(tr);
	    end
	 else if (oldval.TX_Active ==1 && newval.TX_Active==0) //Negedge of active
	    begin
	      //newval.edg();
// 	      $display("%t Falling TX_Active=%h",newval.tim,newval.TX_Active);
	      tr =new(newval.tim,Falling);
// 	      $display("tr=%p",tr);
	      mout.write(tr);
	    end
	  oldval = newval;// keep fetching the new values and detect edges
	end

  endtask: run_phase


endclass : uart_edge_det