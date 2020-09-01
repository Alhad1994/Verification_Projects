import uvm_pkg::*;
`include "uart_intf.svh"
`include "./../package/uart_pkg.sv";
`include "./../UART_Design/UART_Transmitter/uart_trans.sv" 
`include "./../UART_Design/UART_Receiver/uart.svp" 
`include "uart_wrapper.sv"
 module top();

  reg clk,reset;
   
   uart_intf vif(clk); // uart_interface ..  to include all components so as to avoid too fewer connections error

 // the qclk,qreset is defined as reg and used for clock generation externally
  initial begin
    clk=0;
    #20 clk=1;
    reset=1;
    #20 clk=0;
    reset=0;
    repeat(3000000) begin
        #20 clk=1;
        #20 clk=0;
    end
    $display("\n\n\nRan out of clocks\n\n\n");
    $finish;
end
    
  
   initial 
    begin
    uvm_config_db #(virtual uart_intf)::set (null,"top","vif",vif);
      run_test("uart_test");// give the test name //
      #100;
      $finish;
    end
    
    initial begin
    
    $dumpvars(0,top);
    $dumpfile("output.vcd");
    
    end
uart_wrapper wrap (vif);
endmodule : top
