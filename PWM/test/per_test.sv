/* This test tests only the period
 * Program various values in period and make sure
 * the detected period is as expected
 */
class per_test extends uvm_test; 
  
    `uvm_component_utils(per_test)

    smc_env env;
    per_seq seq;
    int i;
    function new(string name="per_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("REG_TEST","This is Build Phase - period test", UVM_LOW)
        env = smc_env::type_id::create("env",this);
        seq = per_seq::type_id::create("seq",this);
    endfunction
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        uvm_config_db #(smc_env)::set(null, "*", "env" , env);
        `uvm_info("REG_TEST","This is Connect Phase - period test", UVM_LOW)
    endfunction
 
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this, "Period test");
        `uvm_info("REG_TEST","This is Run Phase - Period test", UVM_LOW)
        #10ns;
        
        seq.start(env.agt.seqr);
         
        phase.drop_objection(this, "I should be done now!!");
    endtask : run_phase

endclass : per_test 
