class static_seq extends uvm_sequence#(seq_item);
    `uvm_object_utils(static_seq)
    seq_item itm;
    bit [6:0] addr;
    bit [15:0] data;
    bit wr;
    int i;
    bit [7:0] align;
    rand bit [10:0] per, duty;
    //Constructor
    function new(string name = "static_seq");
        super.new(name);
    endfunction
    
    virtual task reg_wr(bit [6:0] addr,bit [15:0] data,bit wr);    
        start_item(itm);
        if (wr) 
          itm.randomize() with {itm.qaddr==addr;itm.qdatain==data;itm.wr_en==1;};
        else
          itm.randomize() with {itm.qaddr==addr;itm.wr_en==0;};
        finish_item(itm);
    endtask : reg_wr
    
    virtual task per_wr(bit [10:0] per_v);
        reg_wr(0,per_v,1);
        for(i=0;i<=11;i++) begin
          if($urandom()%2) 
            align=8'h10;
          else
            align=8'h20;
          reg_wr((7'h10+i),align,1);
          std::randomize(duty) with {duty < per;};
          reg_wr(7'h20+(i*2),duty,1);
          `uvm_info("body",$sformatf("Programming Align=%h  DutyCycle=%d  Channel=%d",align,duty,i),UVM_LOW);
        end
        #(per_v*1000ns);
    endtask : per_wr

    virtual task body();
        int i;
        super.body();
        itm = seq_item::type_id::create("itm");

        `uvm_info("body",$sformatf("Starting static sequence"),UVM_LOW);
        repeat (10) begin
          // Write PER register with value with random static and duty cycle
          std::randomize(per);     
          //std::randomize(duty) with {duty < per;};
          `uvm_info("body",$sformatf("Programming Period=%h  ",per),UVM_LOW);
          per_wr(per);
        end  
      
        `uvm_info("body",$sformatf("Done static sequence"),UVM_LOW);
    endtask : body
endclass : static_seq
