//`include "alu9.svp"
   
 import uvm_pkg::*;
  //package hope;
  //Include all the modules
  `include "alu_if.sv"
   `include "alu_tr.sv"
   `include "alu_sequence.sv"
   `include "alu_seqr.sv"
   `include "alu_driver.sv"
   `include "alu_monitor_in.sv"
   `include "alu_monitor.sv"
   `include "alu_agent.sv"
   `include "alu_agent_op.sv"
   `include "alu_scoreboard.sv"
   `include "alu_environment.sv"
   `include "alu_test.sv"
   

 //endpackage : hope

 

 
 module top();
  reg clk,rst;
  
  alu_if vif();
  alu DUT(
.clk     (vif.clk),
.rst     (vif.rst),
.pushin  (vif.pushin),
.stopout (vif.stopout),
.ctl     (vif.ctl),
.a       (vif.a),
.b       (vif.b),
.ci      (vif.ci),
.pushout (vif.pushout),
.cout    (vif.cout),
.z       (vif.z),
.stopin  (vif.stopin)
);
  
  
// Covergroups 
 
  
  covergroup op_cov @(posedge(vif.clk));
  
  ctl: coverpoint vif.ctl {
      bins control [] = {[0:$]};     
      }//this covers the operations with ctl 
      /*
      // Not sure about this (if above do not work consider this)
      bins a_op = {a_op};
      bins add_op = {add_op};
      bins sub_op = {sub_op};
      bins xor_op = {xor_op}; } */
  
  in_a : coverpoint vif.a {
      bins zeros = {'h00};
      bins ones = {'h11};
      bins others = {['h01:'hFE]};
      }
      
  in_b : coverpoint vif.b {
      bins zeros = {'h00};
      bins ones = {'h11};
      bins others = {['h01:'hFE]};
      }
  in_ci : coverpoint vif.ci {
      bins zeros = {1'b0};
      bins ones = {1'b1};
     // bins others = {[2'b01:2'b10]};
      }
  in_pushin : coverpoint vif.pushin {
      bins zeros = {1'b0};
      bins ones = {1'b1};
      //bins others = {[2'b01:2'b10]};
      }
  in_stopin : coverpoint vif.stopin {
      bins zeros = {1'b0};
      bins ones = {1'b1};
      //bins others = {[2'b01:2'b10]};
      }
 
  endgroup
  
  covergroup cross_op @(posedge (vif.clk));
    
    add_00 : cross vif.a,vif.b,vif.ctl;
  
  endgroup
  
  op_cov cov = new;// declare the handle 
  cross_op cros = new;
 
  
    initial 
    begin
    cov.start();
    cros.start();
    #100216;
    $display("\n At the end of run\n");
    cov.stop();
    cros.stop();
    $display("\n\n\n Inputs covered\n\n\n",cov.ctl.get_coverage());
    $display("Time is ",$time);
    end
  /// End Covergroups ..........................  
    
    
   initial 
   begin
    vif.clk =0;
    forever #5 vif.clk = ~ vif.clk;
   end

  
   initial 
    begin
    uvm_config_db #(virtual alu_if)::set (null,"bob","vif",vif);// replaced the name test_top with a * to work (ask morris)
      run_test("alu_test");
      #100;
      $finish;
    end
    
    initial begin
    
    $dumpvars(9,top);
    $dumpfile("output.vcd");
    
    end
endmodule : top
