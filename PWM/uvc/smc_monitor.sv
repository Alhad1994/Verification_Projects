class req_mon extends uvm_monitor; 
  
    `uvm_component_utils(req_mon)
    uvm_analysis_port #(seq_item) req_port;
    virtual smc_intf v_if;
    seq_item itm;

    function new(string name="req_mon", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("REQ_MON","This is Build Phase - requests monitor", UVM_LOW)
        req_port=new("req_port",this);
    endfunction 
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("REQ_MON","This is Connect Phase - requests monitor", UVM_LOW)
        if (!uvm_config_db #(virtual smc_intf)::get(null, "uvm_test_top",
            "vif", this.v_if)) begin
            `uvm_error("connect", "smc_intf not found")
        end 
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        #10 
        `uvm_info("REQ_MON","This is Run Phase - requests monitor", UVM_LOW)
        fork
        begin
        forever begin
            @(posedge(v_if.qsel));
            itm = new();
            itm.qaddr=v_if.qaddr;
            itm.qdatain=v_if.qdatain;
            itm.wr_en=v_if.qwrite;
            `uvm_info("REQ_MON",$sformatf("Got req --> WR:%h\tADDR:%h\tDATA:%h",itm.wr_en,itm.qaddr,itm.qdatain), UVM_FULL)
            req_port.write(itm);
        end
        end
        join_none
    endtask : run_phase

endclass: req_mon


class resp_mon extends uvm_monitor; 
  
    `uvm_component_utils(resp_mon)
    uvm_analysis_port #(seq_item) resp_port;
    uvm_tlm_analysis_fifo #(seq_item) dat_port;
    virtual smc_intf v_if;
    seq_item itm;

    function new(string name="resp_mon", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("RESP_MON","This is Build Phase - smc wr monitor", UVM_LOW)
        resp_port=new("resp_port",this);
        dat_port=new("dat_port",this);
    endfunction 
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        resp_port.connect(dat_port.analysis_export);
        `uvm_info("RESP_MON","This is Connect Phase - smc wr monitor", UVM_LOW)
        if (!uvm_config_db #(virtual smc_intf)::get(null, "uvm_test_top",
            "vif", this.v_if)) begin
            `uvm_error("connect", "smc_intf not found")
        end 
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        #10 
        `uvm_info("RESP_MON","This is Run Phase - smc wr monitor", UVM_LOW)
        fork
        begin
        forever begin
            // If qsel is high and qwrite is 0, then a register read was
            // issued and since there is no read_data valid, wait for one
            // clock and use whatever data is on qdataout for read output 
            @(posedge(v_if.qsel));
            if(v_if.qsel==1 && v_if.qwrite==0) begin
              @(posedge(v_if.qclk));
              itm = new();
              itm.qdataout=v_if.qdataout;
              itm.mnm=v_if.mnm;
              itm.mnp=v_if.mnp;
              `uvm_info("RESP_MON",$sformatf("Got resp --> DATA:%h\tMNM:%h\tMNP:%h",itm.qdataout,itm.mnm,itm.mnp), UVM_FULL)
              resp_port.write(itm);
            end
        end
        end
        join_none
        
    endtask : run_phase

endclass: resp_mon

class edge_mon extends uvm_monitor; 
  
    `uvm_component_utils(edge_mon)
    uvm_analysis_port #(seq_item) edge_port;
    virtual smc_intf v_if;
    seq_item itm;
    bit [63:0] cnt;

    function new(string name="edge_mon", uvm_component parent=null);
        super.new(name, parent);
        cnt=0;
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("EDGE_MON","This is Build Phase - smc wr monitor", UVM_LOW)
        edge_port=new("edge_port",this);
    endfunction 
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("EDGE_MON","This is Connect Phase - smc wr monitor", UVM_LOW)
        if (!uvm_config_db #(virtual smc_intf)::get(null, "uvm_test_top",
            "vif", this.v_if)) begin
            `uvm_error("connect", "smc_intf not found")
        end 
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        #10 
        `uvm_info("EDGE_MON","This is Run Phase - smc wr monitor", UVM_LOW)
        fork
        begin
        forever begin
            // Just look for any changes on the output
            // Scoreboard will score the edges/timestamps 
            // Timestamp with the counter running on clock
            @(v_if.mnm or v_if.mnp);
            itm = new();
            itm.cnt=cnt;
            itm.mnm=v_if.mnm;
            itm.mnp=v_if.mnp;
            edge_port.write(itm);
        end
        end

        begin
        forever begin
            @(posedge(v_if.qclk));
            cnt=cnt+1;
        end
        end
        join_none
        
    endtask : run_phase

endclass: edge_mon
