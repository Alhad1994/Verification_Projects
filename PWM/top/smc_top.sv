`timescale 1ns/10ps
`include "smc_intf.svh"
`include "smc_ref_model/smc_csr.sv"

`include "smc_ref_model/smc_ref_model.sv"

//`include "smc_ref_model/smc_ref_model_err.sv"

module smc_top();
import uvm_pkg::*;
`include "./../package/smc_pkg.sv";

reg qclk,qreset;
smc_intf smcx(qclk,qreset);

initial begin
    qclk=0;
    #10ns; 
    qclk=1;
    qreset=1;
    #10ns; 
    qclk=0;
    qreset=0;
    repeat(1000000) begin
        #10ns; 
        qclk=1;
        #10ns; 
        qclk=0;
    end
    $display("\n\n\nRan out of clocks\n\n\n");
    $finish;
end

initial begin
    uvm_config_db #(virtual smc_intf)::set(null, "*", "vif" , smcx);
    run_test("");
end

initial begin
  $dumpfile("output.vpd");
  $dumpvars();

end

smc_ref_model s(smcx.qclk, smcx.qreset, smcx.qwrite,
            smcx.qsel, smcx.qaddr, smcx.qdatain,
            smcx.qdataout, smcx.mnm, smcx.mnp); 

endmodule : smc_top

