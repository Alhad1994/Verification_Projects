class alu_monitor extends uvm_monitor;

  `uvm_component_utils(alu_monitor)
  
  uvm_analysis_port #(alu_tr) mon_op;
  
  virtual alu_if vif;
  alu_tr alu_it;
  
  //constructor 
  function new(string name = "alu_monitor",uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_op = new("mon_op",this);
    
    if(!uvm_config_db#(virtual alu_if)::get(null,"bob","vif",vif))
      begin
	`uvm_fatal("ALU MON:NOVIF","virtual interface not successful")
      end
  
  endfunction : build_phase

  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
    alu_it = alu_tr::type_id::create("alu_it",this);
    @ (posedge vif.clk);
      
      alu_it.z = vif.z; //connection of virtual outputs to dut outputs
      alu_it.stopout = vif.stopout;
      alu_it.cout = vif.cout;
      alu_it.pushout = vif.pushout;
      mon_op.write(alu_it);//analysis port writes the seq_item
      //`uvm_info("MON OP:","check below",UVM_LOW)
      //$display("z=%b, cout=%b stopout=%b pushout=%b z=%b ",alu_it.z,alu_it.cout,alu_it.stopout,alu_it.pushout,vif.z);
    end
  endtask: run_phase
endclass: alu_monitor
