
 //seq_item
class uart_tr extends uvm_sequence_item;
     //receiver side
     reg rx_serial;
     reg [7:0] rx_parallel;
     reg rx_data_valid;
      logic [3:0] data_bits_rx;
      logic [1:0] stop_bits_rx;
      
     //trans side
     rand reg TX_DV;
     rand reg [7:0] TX_BYTE;
     reg TX_serial;
     reg TX_Done;
     reg TX_Active;
     rand logic [3:0] data_bits_tx;
     rand logic [1:0] stop_bits_tx;
     realtime tim;
     reg rx_dv;
     randc logic [25:0] clk_freq ; 
     randc logic [19:0] uart_baud ;
     
     //Factory registration
     `uvm_object_utils(uart_tr)
     
 //constructor
     function new(string name = "uart_tr");
          super.new(name);
          this.tim=$realtime;
     endfunction: new
     
    
endclass: uart_tr