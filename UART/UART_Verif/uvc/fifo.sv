module fifo (clk,rst,datain,dataout,rd,wr,emp,full);
input reg clk,rst;
input reg [7:0] datain;
input reg wr,rd;
output reg [7:0] dataout;
output emp,full;
reg [2:0] wr_ptr,rd_ptr;
reg [7:0] memory [7:0]; // the mem is 8X8 deep and wide


assign full = ((wr_ptr == 3'b111) & (rd_ptr == 3'b000) ? 1:0);
assign emp = (rd_ptr == wr_ptr) ? 1:0;

  always @ (posedge clk or posedge rst)
  begin
    if(rst)
	  begin
	    wr_ptr <=0;
	    rd_ptr<=0;
	    //memory[7:0] <= 0;
	  end
	else if(wr & !full)
	  begin
	    memory[wr_ptr] <= datain;
	    wr_ptr <= wr_ptr + 1;
	  end
	else if(rd & !emp)
	  begin
	    dataout <= memory[rd_ptr];
	    rd_ptr <= rd_ptr + 1;
	  end
  end
 
endmodule : fifo