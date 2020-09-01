
class uart_seq extends uvm_sequence #(uart_tr); // Passing parameter as seq_item
     
     `uvm_object_utils(uart_seq) //UVM_factory register
 
 
 //constructor
     function new(string name = "uart_seq",uvm_component parent = null);
          super.new(name);
     endfunction: new
     

 // main_body
     task body();
     
     //step 1: creation
	  uart_tr uart_it;//declaration handle
   
	  uart_it = uart_tr::type_id::create("uart_it");//factory method 
          
         	`uvm_info (get_type_name (), $sformatf ("Sequence %s is starting", this.get_name()), UVM_MEDIUM)
		  
		  // Trans side 
		  repeat (50) 
		  begin
			start_item (uart_it);
			assert (uart_it.randomize() with {data_bits_tx inside{[5:8]};stop_bits_tx inside {[1:2]};clk_freq=='h17D7840;uart_baud==115200;
			});
			finish_item(uart_it);end
		 
		 
		
		 `uvm_info (get_type_name (), $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
     endtask: body
endclass: uart_seq


//clk_freq inside {'hF4240,'h4C4B40,'h989680,'hE4E1C0,'h1312D00,'h17D7840,
// 				  'h1C9C380,'h2160EC0,'h2625A00,'h2AEA540,'h2FAF080};uart_baud inside {2400,4800,9600,14400,19200,38400,57600,115200,128000,256000};