class mm_msg;
	realtime t;
	reg s;
	function new(reg sx);
		this.t=$realtime;
		this.s=sx;
	endfunction : new
endclass : mm_msg

typedef enum { Rising, Falling } RF;

class rf_msg;
	realtime t;
	RF edg;
	function new(realtime tm, RF e);
		this.t=tm;
		this.edg=e;
	endfunction : new
endclass : rf_msg

class pdata ;
	realtime pp;
	realtime pw;
	function new(realtime pp,realtime pw);
		this.pp=pp;
		this.pw=pw;
	endfunction : new
endclass : pdata


class edgedet extends uvm_scoreboard;
`uvm_component_utils(edgedet)
uvm_tlm_analysis_fifo #(mm_msg) min;
uvm_analysis_port #(rf_msg) mout;
mm_msg i;
mm_msg old;
rf_msg x1;

function new(string name="edgedet",uvm_component par=null);
	super.new(name,par);
endfunction : new

function void build_phase(uvm_phase phase);
	min = new("min",this);
	mout = new("mout",this);
	old=new(0);
endfunction : build_phase

task run_phase(uvm_phase phase);
	forever begin
		min.get(i);
		if( old.s==0 && i.s==1) begin
//			// $display("%t Rising",i.t);
			x1=new(i.t,Rising);
			mout.write(x1);
		end else if (old.s==1 && i.s==0) begin
//			// $display("%t Falling",i.t);
			x1=new(i.t,Falling);
			mout.write(x1);
		end 
		old=i;
	end

endtask : run_phase

endclass : edgedet

class pw extends uvm_scoreboard;
`uvm_component_utils(pw)
uvm_tlm_analysis_fifo #(rf_msg) ein;
uvm_analysis_port #(realtime) pwidth
;
realtime oldt,delta;
rf_msg rf1;

function new(string name="pw",uvm_component par=null);
        super.new(name,par);
	oldt=0.0;
endfunction : new

function void build_phase(uvm_phase phase);
	ein=new("ein",this);
	pwidth=new("pwidth",this);
endfunction : build_phase

task run_phase(uvm_phase phase);
	forever begin
		ein.get(rf1);
		if(rf1.edg==Rising) begin
			oldt=rf1.t;
		end else if(rf1.edg==Falling) begin
			delta=rf1.t-oldt;
			pwidth.write(delta);
//			// $display("Pulse width %t",delta);	
		end
	end
endtask : run_phase

endclass : pw

class fperiod extends uvm_scoreboard;
`uvm_component_utils(fperiod)
uvm_tlm_analysis_fifo #(rf_msg) msgin;
uvm_analysis_port #(realtime) mout;
rf_msg rf1;
realtime oldt,delta;

function new(string name="fperiod",uvm_component par=null);
	super.new(name,par);
endfunction : new

function void build_phase(uvm_phase phase);
	msgin=new("msgin",this);
	mout =new("mout",this);
	oldt=0.0;
endfunction : build_phase

task run_phase(uvm_phase phase);
	forever begin
		msgin.get(rf1);
		if(rf1.edg==Rising) begin
			delta=rf1.t-oldt;
			if(oldt!=0.0) begin
				mout.write(delta);
//				// $display("pulse period %t",delta);
			end
			oldt=rf1.t;
		end
	end
endtask : run_phase

endclass : fperiod

class comb extends uvm_scoreboard;
`uvm_component_utils(comb)
uvm_tlm_analysis_fifo #(realtime) wfifo;
uvm_tlm_analysis_fifo #(realtime) pfifo;
uvm_analysis_port #(pdata) mout;
realtime ww,pp;
pdata ot;

function new(string name="comb",uvm_component par=null);
	super.new(name,par);
endfunction : new

function void build_phase(uvm_phase phase);
	wfifo=new("wfifo",this);
	pfifo=new("pfifo",this);
	mout=new("mout",this);
endfunction : build_phase

task run_phase(uvm_phase phase);
	forever begin
		wfifo.get(ww);
		pfifo.get(pp);
		ot=new(pp,ww);
		mout.write(ot);
//		// $display("Period %t width %t",ww,pp);	
	end
endtask : run_phase


endclass : comb











class pulsew extends uvm_env;
`uvm_component_utils(pulsew)
//mons m;
edgedet e;
pw p;
fperiod fp;
comb c;
uvm_analysis_export #(mm_msg) msgin;
uvm_analysis_port #(pdata) pout;

function new(string name="pulsew",uvm_component par=null);
	super.new(name,par);
endfunction : new

function void build_phase(uvm_phase phase);
//	m=mons::type_id::create("m",this);
	e=edgedet::type_id::create("e",this);
	p=pw::type_id::create("p",this);
	fp=fperiod::type_id::create("fp",this);
	c=comb::type_id::create("comb",this);
	pout=new("pout",this);
	msgin=new("msgin",this);
endfunction : build_phase

function void connect_phase(uvm_phase phase);
	msgin.connect(e.min.analysis_export);
	e.mout.connect(p.ein.analysis_export);
	e.mout.connect(fp.msgin.analysis_export);
	fp.mout.connect(c.pfifo.analysis_export);
	p.pwidth.connect(c.wfifo.analysis_export);
	c.mout.connect(pout);
endfunction : connect_phase

task run_phase(uvm_phase phase);


endtask : run_phase









endclass : pulsew
