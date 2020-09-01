/* This test tests only the smc
 * Program various values in smc and make sure
 * the detected smc is as expected
 */
class smc_test extends uvm_test; 
  
    `uvm_component_utils(smc_test)

    smc_env env;
    smc_seq seq;
    int i;
    function new(string name="smc_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("REG_TEST","This is Build Phase - smc test", UVM_LOW)
        env = smc_env::type_id::create("env",this);
        seq = smc_seq::type_id::create("seq",this);
    endfunction
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        uvm_config_db #(smc_env)::set(null, "*", "env" , env);
        `uvm_info("REG_TEST","This is Connect Phase - smc test", UVM_LOW)
    endfunction
 
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this, "SMC test");
        `uvm_info("REG_TEST","This is Run Phase - SMC test", UVM_LOW)
        #10ns;
        
        seq.start(env.agt.seqr);
         
        phase.drop_objection(this, "I should be done now!!");
    endtask : run_phase

endclass : smc_test 
