class smc_driver extends uvm_driver#(seq_item); 
  
    `uvm_component_utils(smc_driver)
    virtual smc_intf v_if;
    bit exp_int;
    seq_item itm;

    function new(string name="smc_driver", uvm_component parent=null);
        super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("SMC_DRIVER","This is Build Phase - smc wr driver", UVM_LOW)
    endfunction 
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("SMC_DRIVER","This is Connect Phase - smc wr driver", UVM_LOW)
        uvm_config_db #(bit)::get(null, "*", "exp_int" , exp_int);
        if (!uvm_config_db #(virtual smc_intf)::get(null, "uvm_test_top",
            "vif", this.v_if)) begin
            `uvm_error("connect", "smc_intf not found")
        end 
    endfunction
  
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        #10 
        `uvm_info("SMC_DRIVER","This is Run Phase - smc wr driver", UVM_LOW)
        forever begin
	    @(posedge v_if.qclk)
            // If the Scoreboard requests interrupt check, read the interrupt
            // register. A better method is to connect the register directly
            // as a wire in TB top, but this works!
            if(
            ) begin
              v_if.qaddr=7'h3;
              v_if.qwrite=0;
              v_if.qsel=1;
            end else begin
      	    seq_item_port.get_next_item(itm);
	    @(posedge v_if.qclk)
            v_if.qaddr=itm.qaddr;
            v_if.qsel=1;
            if (itm.wr_en) begin
                v_if.qwrite=1;
                v_if.qdatain=itm.qdatain;      
                repeat(3) @(v_if.qclk) #1;
            end else begin
                v_if.qwrite=0;
                repeat(3) @(v_if.qclk) #1;
                itm.qdataout=v_if.qdataout;
            end
            v_if.qsel=0;
            v_if.qwrite=0;
      	    seq_item_port.item_done();
            end
    end

    endtask : run_phase

endclass: smc_driver
