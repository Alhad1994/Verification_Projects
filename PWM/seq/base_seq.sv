class seq_item extends uvm_sequence_item;

    randc reg [6:0]   qaddr;
    rand reg [15:0]  qdatain;
    
    rand bit wr_en;
    reg [15:0]  qdataout;
    reg [11:0]  mnm;
    reg [11:0]  mnp;
    bit [63:0] cnt;

`uvm_object_utils_begin(seq_item)
`uvm_object_utils_end
//Constructor
  function new(string name = "seq_item");
    super.new(name);
  endfunction  
  
  constraint range
  {
    qaddr inside {7'h0,7'h2,7'h3,[7'h10:7'h1B],7'h20,7'h22,7'h24,7'h26,7'h28,
                    7'h2A, 7'h2C, 7'h2E,
                    7'h30,7'h32,7'h34,7'h36,7'h2C,7'h2E};
 }
 
endclass :seq_item

class smc_config;

    bit neg_test=0;
    rand reg [10:0]             per ;
    rand reg                    recirc;
    rand reg                    int_en;
    rand reg                    halt_en;
    rand reg [1:0]              pre_scale; 
    rand reg                    halt;
    rand reg                    dither;
    
    rand reg [10:0]             duty [11:0];
    rand reg                    sign [11:0];
    rand reg [1:0]              out_mode [11:0];
    rand reg [1:0]              align [11:0];
    rand reg [1:0]              delay [11:0];

    constraint duty_c {
        foreach(duty[i])
          duty[i] < per;
    }


endclass : smc_config

class smc_sequence extends uvm_sequence#(seq_item);
    int i;

    seq_item itm;
    `uvm_object_utils(smc_sequence)
    //Constructor
    function new(string name = "vend_seq");
        super.new(name);
    endfunction

    virtual task body();
        #10ns;
        `uvm_info("body",$sformatf("Well we seem all set!"),UVM_LOW);
    endtask : body
endclass :smc_sequence

class write_sequence extends uvm_sequence#(seq_item);
    reg [6:0] addr;
    reg [15:0] qdata;
    seq_item itm;

    `uvm_object_utils(write_sequence)
     
    function new(string name = "write_sequence");
        super.new(name);
    endfunction
      
    virtual task body();
        itm = seq_item::type_id::create("itm");
        start_item(itm);
        `uvm_info("body",$sformatf("qaddr, itm.qaddr : %h    %h",addr,itm.qaddr),UVM_FULL);
        itm.randomize() with {itm.wr_en==1;itm.qaddr==addr;itm.qdatain==qdata;};
        finish_item(itm);
    endtask
endclass

class read_sequence extends uvm_sequence#(seq_item);
    reg [6:0] addr;
    reg [15:0] data;
    seq_item itm, rsp;  
    uvm_tlm_analysis_fifo #(seq_item) rddat;
    `uvm_object_utils(read_sequence)
  
    function new(string name = "read_sequence");
        super.new(name);
    endfunction
   
    virtual task body();
        itm = seq_item::type_id::create("itm");
        start_item(itm);
        itm.randomize() with {itm.wr_en==0;itm.qaddr==addr;};
        finish_item(itm);
        rddat.get(rsp);
        data=rsp.qdataout;
    endtask

endclass : read_sequence

