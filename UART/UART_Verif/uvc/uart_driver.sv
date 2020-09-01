//Driver class UVM

class uart_driver extends uvm_driver #(uart_tr);

//factory registration
  `uvm_component_utils(uart_driver)
  
  
  uart_tr uart_it; //declare the object handle
  
  virtual uart_intf vif; //virtual inertface dec

//constuctor
  function new (string name = "uart_driver", uvm_component parent=null);
    super.new(name,parent);
    
  endfunction
  
  //Build phase 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
     uart_it = uart_tr::type_id::create("uart_it");
        if(!uvm_config_db#(virtual uart_intf)::get(null, "top", "vif", vif)) begin
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
       end
  endfunction : build_phase
  
  //connect phase
  function void connect_phase(uvm_phase phase);
  
  //Run Phase
    super.connect_phase(phase);

   endfunction : connect_phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase (phase);
    `uvm_info("Driver","Run phase has started",UVM_MEDIUM)
    vif.TX_DV <= 0;
    
    forever 
      begin
    
	// get next item from the sequencer
	seq_item_port.get_next_item(uart_it);
	  #10000; // delay while fetching else it gets bytes after bytes with no spaces in time
	  // First byte 
// 	  $display("baud=%p",uart_it.uart_baud);
	  case (uart_it.uart_baud)
	  
	  2400: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #416666; 
		end
	4800: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #208333; 
		end
	9600: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #104166; 
		end
	14400: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #69444; 
		end
	19200: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #52083; 
		end
	38400: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #26041; 
		end
	57600: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #17361; 
		end
	115200: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #86000; 
		end
	128000: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #7812; 
		end
	256000: begin
		  @(posedge vif.clk);
		  @(posedge vif.clk);
		    vif.TX_DV <= 1;
		    vif.clk_freq <= uart_it.clk_freq;
		    vif.uart_baud <= uart_it.uart_baud;
		    vif.data_bits_tx <= uart_it.data_bits_tx;
		    vif.stop_bits_tx <= uart_it.stop_bits_tx;
		    vif.TX_BYTE <= uart_it.TX_BYTE;
// 		    $display("uart_baud=%p",uart_it.uart_baud);
		    @(posedge vif.clk);
		    vif.TX_DV <= 0;
		    #3906; 
		end
	  endcase
	seq_item_port.item_done();
	 //$display("------------Inside Driver ----------");
// 	 $display("TX_DV = %h , TX_BYTE = %h",vif.TX_DV,vif.TX_BYTE);
      end
       
    endtask : run_phase
   
   

endclass : uart_driver
