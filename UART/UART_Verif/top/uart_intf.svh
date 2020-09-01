interface uart_intf(input clk);
  //reciever side 
  logic rx_serial;
  logic [7:0] rx_parallel;
  logic rx_data_valid;
  logic [3:0] data_bits_rx;
  logic [1:0] stop_bits_rx;
  //trans side
  logic TX_DV;
  logic [7:0] TX_BYTE;
  logic TX_serial;
  logic TX_Done;
  logic TX_Active;
  logic [3:0] data_bits_tx;
  logic [1:0] stop_bits_tx;
  reg [25:0] clk_freq;
  reg [19:0] uart_baud;

    modport uart_rx (input clk,
		     input rx_serial,
		     output rx_data_valid,
		     output rx_parallel,
		     input data_bits_rx,
		     input stop_bits_rx,
		     input clk_freq,
		     input uart_baud);
    
    modport uart_trans (input clk,
			input TX_DV,
			input TX_BYTE,
			output TX_serial,
			output TX_Active,
			output TX_Done,
			input data_bits_tx,
			input stop_bits_tx,
			input clk_freq,
			input uart_baud);
			

endinterface : uart_intf







