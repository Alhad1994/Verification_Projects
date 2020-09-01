`include "fifo.sv"
module tb();
  reg clk,rst;
  reg [7:0] datain;
  reg wr,rd;
  wire [7:0] dataout;
  wire emp,full;
  
  fifo dut(.clk(clk),
	   .rst(rst),
	   .datain(datain),
	   .dataout(dataout),
	   .rd(rd),
	   .wr(wr),
	   .emp(emp),
	   .full(full));
	   
  initial begin
    clk =0;
    rst = 1;
    #10;
    rst =0;
    #10;
    rd=0;wr=1;
    datain= 8'h44;
    #5;
    datain= 8'h55;
    #5;
    datain= 8'h22;
    #5;
    datain= 8'h24;
    #5;
    datain= 8'h77;
    #5;
    datain= 8'h56;
    #5;
    datain= 8'h09;
    #5;
    datain= 8'h45;
    #5;
    
    rd=1;wr=0;
    //if()
    
      $finish;
  end

  always #20 clk = ~ clk;
  
  initial begin
  $dumpvars(0,tb);
  $dumpfile ("res.vcd");
  end

endmodule 
