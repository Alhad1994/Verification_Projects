// This is the uvm test for the system

class mons extends uvm_monitor;
`uvm_component_utils(mons)
uvm_analysis_port #(mm_msg) mm;
virtual pi p;

function new(string name="mons",uvm_component par=null);
	super.new(name,par);
endfunction : new

function void build_phase(uvm_phase phase);
	mm=new("mm",this);
	if(uvm_config_db#(virtual pi)::get(null,"bob","intf", p)); else begin
		`uvm_fatal("config","Didn't get bob intf")
	end
	
endfunction : build_phase


task run_phase(uvm_phase phase);
	forever @(posedge(p.clk)) begin
		mm_msg mx=new(p.s);
//		// $display("%t %b",mx.t,mx.s);
		mm.write(mx);
	end

endtask : run_phase
		

endclass : mons

class edgexx extends uvm_test;
`uvm_component_utils(edgexx)
pulsew pw;
mons mx;
uvm_analysis_imp #(pdata,edgexx) mres;


function new(string name="edge",uvm_component par=null);
	super.new(name,par);
endfunction : new

function void build_phase(uvm_phase phase);
	pw=pulsew::type_id::create("pw0",this);
	mx=mons::type_id::create("mons",this);
	mres=new("mres",this);
endfunction : build_phase

function void connect_phase(uvm_phase phase);
	mx.mm.connect(pw.msgin);
	pw.pout.connect(mres);

endfunction : connect_phase

function void write(pdata x);
	// $display(" tb got %5t period %5t width",x.pp,x.pw);
endfunction : write


task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	#600;
	phase.drop_objection(this);

endtask : run_phase



endclass : edgexx

