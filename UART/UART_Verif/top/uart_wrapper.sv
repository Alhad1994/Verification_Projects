
module uart_wrapper (uart_intf _if);

    uart_trans utr (.clk(_if.clk),
		    .TX_DV(_if.TX_DV),
		    .TX_BYTE(_if.TX_BYTE),
		    .TX_serial(_if.TX_serial),
		    .TX_Active(_if.TX_Active),
		    .TX_Done(_if.TX_Done),
		    .data_bits_tx(_if.data_bits_tx),
		    .stop_bits_tx(_if.stop_bits_tx),
		    .clk_freq(_if.clk_freq),
		    .uart_baud(_if.uart_baud));
    
    uart_rx utx   ( .clk(_if.clk),
		    .rx_serial(_if.TX_serial),
		    .rx_parallel(_if.rx_parallel),
		    .rx_data_valid(_if.rx_data_valid),
		    .data_bits_rx(_if.data_bits_tx),
		    .stop_bits_rx(_if.stop_bits_tx),
		    .clk_freq(_if.clk_freq),
		    .uart_baud(_if.uart_baud));
    
    
endmodule : uart_wrapper