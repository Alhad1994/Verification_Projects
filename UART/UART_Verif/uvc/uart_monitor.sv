class uart_monitor_in extends uvm_monitor;


  `uvm_component_utils (uart_monitor_in) // Factory registration method
  
  uvm_analysis_port #(uart_tr) mon_in_port; // this analysis port is for scoreboard to get the inputs 
  
  virtual uart_intf vif;// declaration of virtual iterface
  
  uart_tr uart_it;
  
  //constructor 
  function new (string name = "uart_monitor_in",uvm_component parent= null);
    super.new(name,parent);
  endfunction : new
  
  //Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_in_port = new("mon_in_port",this);
      if(!uvm_config_db#(virtual uart_intf)::get(null,"top","vif",vif))
      begin
	`uvm_fatal("UART MON:NOVIF","virtual interface not successful")
      end
  endfunction: build_phase
  
 //Run Phase
  task run_phase(uvm_phase phase);
      forever begin
      uart_it = uart_tr::type_id::create("uart_it",this);
      @ (posedge vif.clk);
      
      //trans side
      uart_it.TX_DV = vif.TX_DV;
      uart_it.TX_BYTE = vif.TX_BYTE;
      uart_it.data_bits_tx = vif.data_bits_tx;
      uart_it.stop_bits_tx = vif.stop_bits_tx;
      uart_it.clk_freq = vif.clk_freq;
      uart_it.uart_baud = vif.uart_baud;
      mon_in_port.write(uart_it);//analysis port writes the seq_item
//         $display("TX_BYTE = %h",uart_it.TX_BYTE,$time);
      end
   endtask: run_phase
endclass : uart_monitor_in


class uart_monitor_out extends uvm_monitor;

  `uvm_component_utils(uart_monitor_out)
  
  uvm_analysis_port #(uart_tr) mon_op;
  
  virtual uart_intf vif;
  uart_tr uart_it;
  
  //constructor 
  function new(string name = "uart_monitor_out",uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_op = new("mon_op",this);
    
    if(!uvm_config_db#(virtual uart_intf)::get(null,"top","vif",vif))
      begin
	`uvm_fatal("UART MON:NOVIF","virtual interface not successful")
      end
  
  endfunction : build_phase

  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
    uart_it = uart_tr::type_id::create("uart_it",this);
    @ (posedge vif.clk);
      
	uart_it.TX_serial = vif.TX_serial;
	uart_it.TX_Done = vif.TX_Done ;
	uart_it.TX_Active = vif.TX_Active;
	uart_it.rx_data_valid = vif.rx_data_valid;
	uart_it.rx_parallel = vif.rx_parallel;
	mon_op.write(uart_it);//analysis port writes the seq_item
//        $display("----------------Inside Monitor --------------------");
//               $display("rx_parallel=%p",uart_it.rx_parallel);
    end
  endtask: run_phase
endclass: uart_monitor_out


