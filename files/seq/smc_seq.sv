class smc_seq extends uvm_sequence#(seq_item);
    `uvm_object_utils(smc_seq)
    seq_item itm;
    smc_config cfg;
    bit [6:0] addr;
    bit [15:0] data;
    bit [15:0] mccc_d [11:0];
    bit [15:0] mcdc_d [11:0];
    bit [15:0] mccc_1, mccc_0;
    bit wr;
    int i;
    
    //Constructor
    function new(string name = "smc_seq");
        super.new(name);
        cfg = new();
    endfunction
    
    virtual task reg_wr(bit [6:0] addr,bit [15:0] data,bit wr);    
        start_item(itm);
        if (wr) 
          itm.randomize() with {itm.qaddr==addr;itm.qdatain==data;itm.wr_en==1;};
        else
          itm.randomize() with {itm.qaddr==addr;itm.wr_en==0;};
        finish_item(itm);
    endtask : reg_wr
    

    virtual task do_init();
      // Initialize all control registers with initial values
      // Some of them will not change throughout the test
      // Eventually all of them will be covered in different targeted tests
      reg_wr(7'h0,cfg.per,1);
      mccc_0={cfg.recirc,6'b0,cfg.int_en};
      reg_wr(7'h2,mccc_0,1);
      mccc_1={cfg.pre_scale,cfg.halt_en,1'b0,cfg.dither,1'b0,cfg.int_en};
      reg_wr(7'h3,mccc_1,1);
      `uvm_info("do_init",$sformatf("PER=%h  MC_CTL0=%h MC_CTL1=%h",cfg.per,mccc_0,mccc_1),UVM_LOW);
      for(i=0;i<=11;i++) begin
        addr=7'h10+(4*(i/4))+(3-(i%4));
        data={cfg.out_mode[i],cfg.align[i],2'b0,cfg.delay[i]};
        mccc_d[i]=data;
        reg_wr(addr,data,1);
        addr=7'h20+(4*(i/2))+(2-2*(i%2));
        data={cfg.sign[i],4'b0,cfg.duty[i]};
        mcdc_d[i]=data;
        reg_wr(addr,data,1);
      end
     
    endtask : do_init


    virtual task body();
        int i;
        super.body();
        itm = seq_item::type_id::create("itm");

        `uvm_info("body",$sformatf("Starting smc sequence"),UVM_LOW);

        // Write random config to generate more corner cases
        repeat(1000) begin
          cfg=new();
          cfg.randomize();
          do_init();
          #100ns;
        end

        `uvm_info("body",$sformatf("Done smc sequence"),UVM_LOW);
    endtask : body
endclass : smc_seq
