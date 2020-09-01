class reg_seq extends uvm_sequence#(seq_item);
    `uvm_object_utils(reg_seq)
    seq_item itm;
    bit [15:0] data;
    int i;
    //Constructor
    function new(string name = "reg_seq");
        super.new(name);
    endfunction
    
    virtual task body();
        int i;
        super.body();
        itm = seq_item::type_id::create("itm");

        `uvm_info("body",$sformatf("Starting register sequence"),UVM_LOW);
      
        `uvm_info("body",$sformatf("Writing all registers with : FFFF"),UVM_LOW);
       
        repeat (26) begin
            start_item(itm);
            itm.randomize() with {itm.qdatain==16'hffff;itm.wr_en==1;};
            finish_item(itm);
            #1;
        end   
        #1;  
        repeat (26) begin
            start_item(itm);
            itm.randomize() with {itm.wr_en==0;};
            finish_item(itm);
            #1;
        end  
        #1;
 
        `uvm_info("body",$sformatf("Writing and read random data"),UVM_LOW);
        repeat (500) begin
          repeat (26) begin
            start_item(itm);
            itm.randomize() with {itm.wr_en==1;};
            finish_item(itm);
            #1;
          end   
          #1;  
          repeat (26) begin
            start_item(itm);
            itm.randomize() with {itm.wr_en==0;};
            finish_item(itm);
            #1;
          end   
        end  
    endtask : body
endclass : reg_seq
