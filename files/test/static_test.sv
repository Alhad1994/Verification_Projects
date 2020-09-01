/* This test tries to verify the statically invalid
 * conditions. These conditions include 
 *      1. All channels disabled
 *      2. Individual channels disabled
 *      3. Values of MNM/MNP when disabled
 *      4. 
 */      
class static_test extends uvm_test; 
  
    `uvm_component_utils(static_test)

    smc_env env;
    static_seq seq;
    int i;
    function new(string name="static_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("REG_TEST","This is Build Phase - static test", UVM_LOW)
        env = smc_env::type_id::create("env",this);
        seq = static_seq::type_id::create("seq",this);
    endfunction
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        uvm_config_db #(smc_env)::set(null, "*", "env" , env);
        `uvm_info("REG_TEST","This is Connect Phase - static test", UVM_LOW)
    endfunction
 
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this, "static test");
        `uvm_info("REG_TEST","This is Run Phase - static test", UVM_LOW)
        #10ns;
        
        seq.start(env.agt.seqr);
         
        phase.drop_objection(this, "I should be done now!!");
    endtask : run_phase

endclass : static_test 
