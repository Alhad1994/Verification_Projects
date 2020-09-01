class reg_test extends uvm_test; 
  
    `uvm_component_utils(reg_test)

    smc_env env;
    reg_seq seq;
    int i;
    function new(string name="reg_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("REG_TEST","This is Build Phase - reg_test", UVM_LOW)
        uvm_config_db #(bit)::set(null, "*", "sb_en" , 1'b0);
        env = smc_env::type_id::create("env",this);
        seq = reg_seq::type_id::create("seq",this);
    endfunction
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        uvm_config_db #(smc_env)::set(null, "*", "env" , env);
        `uvm_info("REG_TEST","This is Connect Phase - reg test", UVM_LOW)
    endfunction
 
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this, "Register test");
        `uvm_info("REG_TEST","This is Run Phase - Register test", UVM_LOW)
        #10ns;
        
        seq.start(env.agt.seqr);
         
        phase.drop_objection(this, "I should be done now!!");
    endtask : run_phase

endclass : reg_test 
