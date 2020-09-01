class per_seq extends uvm_sequence#(seq_item);
    `uvm_object_utils(per_seq)
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
    function new(string name = "per_seq");
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
    
    virtual task per_wr();
        `uvm_info("body",$sformatf("Programming Period=%h  Per_scale=%h",cfg.per,cfg.pre_scale),UVM_LOW);
        reg_wr(0,cfg.per,1);
        mccc_1[7:6]=cfg.pre_scale;
        reg_wr(7'h3,mccc_1,1);
        for(i=0;i<=11;i++) begin
          mccc_d[i][6:5]=cfg.align[i];
          reg_wr(7'h10+(4*(i/4))+(3-(i%4)),mccc_d[i],1);
          `uvm_info("body",$sformatf("Programming addr: %h ",7'h10+(4*(i/4))+(3-(i%4))),UVM_LOW);
          mcdc_d[i][10:0]=cfg.duty[i];
          reg_wr(7'h20+(4*(i/2))+(2-2*(i%2)),mcdc_d[i],1);
          `uvm_info("body",$sformatf("Programming Align=%h  Addr=%h DutyCycle=%d  Channel=%d",cfg.align[i],7'h20+(4*(i/2))+(2-2*(i%2)),cfg.duty[i],i),UVM_LOW);
        end
        #(cfg.per*100ns);
    endtask : per_wr

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

/* 
    virtual task do_halt();
    endtask : do_halt

    virtual task do_stop();

    endtask : do_stop
*/

    virtual task body();
        int i;
        super.body();
        itm = seq_item::type_id::create("itm");

        `uvm_info("body",$sformatf("Starting period sequence"),UVM_LOW);

        cfg=new();
        cfg.randomize();
        do_init();

        repeat (20) begin
          // Write PER register with value with random period and duty cycle
          cfg=new();
          cfg.randomize();     
          per_wr();
        end
        // Do random halt with/without ignore bit
        // Do random stop 
        /* How to do halt? Not supported in the current DUT REF model, may
        * need an extra signal to get it to work, the testbench will work as
        * is
        repeat (10) begin
          halt_s=$urandom()%10;
          if(halt_s==1) begin
            do_halt();
          end else if(halt_s==2) begin
            do_stop();
          end 
        end  
      */
        `uvm_info("body",$sformatf("Done period sequence"),UVM_LOW);
    endtask : body
endclass : per_seq
