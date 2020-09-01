
module uart_trans (clk,TX_DV,TX_BYTE,TX_serial,TX_Active,TX_Done,data_bits_tx,stop_bits_tx,clk_freq,uart_baud);

  input reg [25:0] clk_freq;
  input reg [19:0] uart_baud;
  reg [13:0] CLKS_PER_BITS; // This is clk / uart frequency 
  parameter IDLE = 3'b000;
  parameter START_BIT = 3'b001;
  parameter DATA_BITS = 3'b010;
  parameter STOP_BITS = 3'b011;
  parameter CLEAN_UP = 3'b100;
  
  
  input TX_DV ;
  input clk;
  input reg [3:0] data_bits_tx; // select the no of data b its : 5,6,7,8
  input reg [1:0] stop_bits_tx;
  input reg [7:0] TX_BYTE;
  output reg TX_serial ;
  output reg TX_Active ;
  output reg TX_Done ;
 
  reg [8:0] tx_counter = 0;
  reg [2:0] bit_index = 0;
  reg [2:0] State = 0;
  
  assign CLKS_PER_BITS = clk_freq/uart_baud;
  
  always @ (posedge clk)
    begin
//       $display("CLKS_PER_BITS=%d clk_freq=%g uart_baud=%d",CLKS_PER_BITS,clk_freq,uart_baud);
      case (State)
      
      IDLE : begin
		if (TX_DV==1'b1) // if data valid found jump to start_bit state and make active high
		  begin
		    TX_Active <= 1'b1;
		    State <= START_BIT;
		  end
		else  // reset every signal 
		  begin
		    TX_serial <= 1'b1; // keep serial line active high (default)
		    TX_Active <= 1'b0;
		    tx_counter <= 1'b0;
		    TX_Done <= 1'b0;
		    bit_index <= 1'b0;
		    State <= IDLE;
		  end
	     end
    
      START_BIT : begin
		    TX_serial <= 1'b0; // start bit condition active low
		    
		    if(tx_counter == CLKS_PER_BITS-1) //wait for one bit period 
		      begin
			tx_counter <= 1'b0; // reset counter 
//    			$display("Start_bit = %h",TX_serial);
			State <= DATA_BITS; // goto next state
		      end
		    else // else stay in same state and incremnent counter
		      begin
			tx_counter <= tx_counter + 1'b1;
			State <= START_BIT;
		      end
		  end
      
      DATA_BITS: begin
		  TX_serial <= TX_BYTE [bit_index]; // parallel to serial  conversion
		  
		  if (tx_counter == CLKS_PER_BITS-1) // wait for one bit period 
		    begin
		      tx_counter <= 1'b0; // counter reset
		       
		      case (data_bits_tx)
		     
		      4'd5: begin
			      if (bit_index < 4) // Data is shifted out LSB first
				begin
				  bit_index <= bit_index + 1;
				  State <= DATA_BITS;
//   				  $display ("5 bits are selected :X_byte = %h, TX_serial = %h",TX_BYTE, TX_serial);
				end
			      else 
				begin
				  bit_index <= 0;
				  State <= STOP_BITS;
				end
			    //$display("5 bits are selected :tx_parallel = %h , tx_serial = %h",TX_BYTE,TX_serial);
			    end
		      4'd6: begin
			  if (bit_index < 5) // Data is shifted out LSB first
			    begin
			      bit_index <= bit_index + 1;
			      State <= DATA_BITS;
//    			      $display ("6 bits are selected: TX_byte = %h, TX_serial = %h",TX_BYTE, TX_serial);
			    end
			  else 
			    begin
			      bit_index <= 0;
			      State <= STOP_BITS;
			    end
//   		        $display("tx_parallel = %h , tx_serial = %h",TX_BYTE,TX_serial);
			end
		      4'd7: begin
			  if (bit_index < 6) // Data is shifted out LSB first
			    begin
			      bit_index <= bit_index + 1;
			      State <= DATA_BITS;
//    			      $display ("7 bits are selected: TX_byte = %h, TX_serial = %h",TX_BYTE, TX_serial);
			    end
			  else 
			    begin
			      bit_index <= 0;
			      State <= STOP_BITS;
			    end
//  		        $display("tx_parallel = %h , tx_serial = %h",TX_BYTE,TX_serial);
			end
		      4'd8: begin
			  if (bit_index < 7) // Data is shifted out LSB first
			    begin
			      bit_index <= bit_index + 1;
			      State <= DATA_BITS;
//   			      $display ("8 bits are selected :TX_byte = %h, TX_serial = %h",TX_BYTE, TX_serial);
			    end
			  else 
			    begin
			      bit_index <= 0;
			      State <= STOP_BITS;
			    end
//  		        $display("tx_parallel = %h , tx_serial = %h",TX_BYTE,TX_serial);
			end
		      endcase
		     end
		  else 
		    begin
		      tx_counter <= tx_counter + 1'b1; // else increase the counter
		      State <= DATA_BITS;// stay in same state 
		    end
		  
		end 
      STOP_BITS: begin
		  if(stop_bits_tx==1)
		    begin
		      TX_serial <= 1'b1; // stop bit is active high
		    
		      if(tx_counter == CLKS_PER_BITS-1)
			begin
			  tx_counter <= 1'b0;
			  TX_Active <= 1'b0;
			  TX_Done <= 1'b1;
//    				$display("1 stop bit sent : Stop_bit = %g",stop_bits_tx);
			  State <= CLEAN_UP;
			end
		      else 
			begin
			  tx_counter <= tx_counter + 1;
			  State <= STOP_BITS; 
			end
		    end
		    
		  else if (stop_bits_tx==2)
		    begin
		      TX_serial <= 1'b1; // stop bit is active high
		    
		      if(tx_counter == 2*CLKS_PER_BITS-1)
			begin
			  tx_counter <= 1'b0;
			  TX_Active <= 1'b0;
			  TX_Done <= 1'b1;
//    		      $display(" 2 stop bits sent : Stop_bit = %g",stop_bits_tx);
			  State <= CLEAN_UP;
			end
		      else 
			begin
			  tx_counter <= tx_counter + 1;
			  State <= STOP_BITS; 
			end
		    end
		  end
      CLEAN_UP: begin
		  TX_Done <= 1'b0;
		  State <= IDLE;
// 		  $display("TX_serial = %h",TX_serial);
		end
      default : State <= IDLE;
      
      endcase
    end

endmodule : uart_trans