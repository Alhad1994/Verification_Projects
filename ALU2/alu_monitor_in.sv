class alu_monitor_in extends uvm_monitor;


  `uvm_component_utils (alu_monitor_in) // Factory registration method
  
  uvm_analysis_port #(alu_tr) mon_in_port; // this analysis port is for scoreboard to get the inputs 
  
  virtual alu_if vif;// declaration of virtual iterface
  
  alu_tr alu_it;
  
  //constructor 
  function new (string name = "alu_monitor_in",uvm_component parent= null);
    super.new(name,parent);
  endfunction : new
  
  //Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_in_port = new("mon_in_port",this);
      if(!uvm_config_db#(virtual alu_if)::get(null,"bob","vif",vif))
      begin
	`uvm_fatal("ALU MON:NOVIF","virtual interface not successful")
      end
  endfunction: build_phase
  
 //Run Phase
  task run_phase(uvm_phase phase);
      forever begin
      alu_it = alu_tr::type_id::create("alu_it",this);
      @ (posedge vif.clk);
      alu_it.a = vif.a; //connection of virtual inputs to dut inputs
      alu_it.b = vif.b;
      alu_it.ci = vif.ci;
      alu_it.ctl = vif.ctl;
      alu_it.pushin = vif.pushin;
      alu_it.stopin = vif.stopin;
      mon_in_port.write(alu_it);//analysis port writes the seq_item
      //`uvm_info("MON_IN:","output",UVM_LOW)
     // $display("a=%b, b=%b ci=%b ctl=%b pushin= %b a=%b",alu_it.a,alu_it.b,alu_it.ci,alu_it.ctl,alu_it.pushin,vif.a);
      end
   endtask: run_phase
endclass : alu_monitor_in
