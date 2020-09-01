class alu_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(alu_scoreboard)
  
  uvm_tlm_analysis_fifo #(alu_tr) scbd_port_monin;
  
  uvm_tlm_analysis_fifo #(alu_tr) scbd_port_monout;
  
  alu_tr alu_it_monin;
  alu_tr alu_it_monout;
  
  logic [8:0] expected_op, actual_op;
  
  function new (string name = "alu_scoreboard",uvm_component parent= null);
    super.new(name,parent);
  endfunction: new
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    alu_it_monin = alu_tr::type_id::create("alu_it_moin",this);
    alu_it_monout = alu_tr::type_id::create("alu_it_monout",this);
    scbd_port_monin = new("scbd_port_moin",this);
    scbd_port_monout = new("scbd_port_monout",this);
  endfunction: build_phase
  
  task run_phase(uvm_phase phase);
  scbd_port_monout.get(alu_it_monout);
   //$display("a=%b, b=%h",alu_it_monout.a,alu_it_monout.b);
    forever 
    begin
      scbd_port_monin.get(alu_it_monin);
      scbd_port_monout.get(alu_it_monout);
      if(alu_it_monout.pushout)
	begin
	  case(alu_it_monin.ctl)
	 
	  0:begin 
	      expected_op = {1'b0,alu_it_monin.a}; // case 0: a (compare monin a with monout)
	      actual_op = {alu_it_monout.cout,alu_it_monout.z}; 
	      if(expected_op == actual_op)
		`uvm_info("SUCCESS",$sformatf("\n ctl=%h, expected_op=%h, actual_op =%h",alu_it_monin.ctl,expected_op,actual_op),UVM_LOW)
	      else
		begin
		  `uvm_error("SCBD Z=A FAIL", $sformatf("FAILED THE CHECK"))
		  `uvm_info("FAILED SCBD", $sformatf("Received Z:: %h, Expected Z:: %h Received COUT:: %h, Expected COUT:: %h", alu_it_monout.z, expected_op[7:0], alu_it_monout.cout, expected_op[8]), UVM_LOW)
		end
	    end 
	  1: 
	    begin
		expected_op = {1'b0,alu_it_monin.a} + {1'b0,alu_it_monin.b} + {7'b0,alu_it_monin.ci};
		actual_op = {alu_it_monout.cout,alu_it_monout.z}; 
		if(expected_op == actual_op)
		`uvm_info("SUCCESS",$sformatf("\n ctl=%h, expected_op=%h, actual_op =%h",alu_it_monin.ctl,expected_op,actual_op),UVM_LOW)
	      else
		begin
		  `uvm_error("SCBD ADD FAIL", $sformatf("FAILED THE CHECK"))
		  `uvm_info("FAILED SCBD", $sformatf("Received Z:: %h, Expected Z:: %h Received COUT:: %h, Expected COUT:: %h", alu_it_monout.z, expected_op[7:0], alu_it_monout.cout, expected_op[8]), UVM_LOW)
		end
	    end
	  2: begin
	      expected_op = {1'b0,alu_it_monin.a} - {1'b0,alu_it_monin.b} + {7'b0,alu_it_monin.ci};
	      actual_op = {alu_it_monout.cout,alu_it_monout.z}; 
	      if(expected_op == actual_op)
		`uvm_info("SUCCESS",$sformatf("\n ctl=%h, expected_op=%h, actual_op =%h",alu_it_monin.ctl,expected_op,actual_op),UVM_LOW)
	      else
		begin
		  `uvm_error("SCBD SUB FAIL", $sformatf("FAILED THE CHECK"))
		  `uvm_info("FAILED SCBD", $sformatf("Received Z:: %h, Expected Z:: %h Received COUT:: %h, Expected COUT:: %h", alu_it_monout.z, expected_op[7:0], alu_it_monout.cout, expected_op[8]), UVM_LOW)
		end
	     end
	  3: begin
		expected_op = {1'b0,alu_it_monin.a ^ alu_it_monin.b}; 
		actual_op = {alu_it_monout.cout,alu_it_monout.z}; 
		if(expected_op == actual_op)
		`uvm_info("SUCCESS",$sformatf("\n ctl=%h, expected_op=%h, actual_op =%h",alu_it_monin.ctl,expected_op,actual_op),UVM_LOW)
		else
		  begin
		  `uvm_error("SCBD XOR FAIL", $sformatf("FAILED THE CHECK"))
		  `uvm_info("FAILED SCBD", $sformatf("Received Z:: %h, Expected Z:: %h Received COUT:: %h, Expected COUT:: %h", alu_it_monout.z, expected_op[7:0], alu_it_monout.cout, expected_op[8]), UVM_LOW)
		  end
	     end
	  default: `uvm_info("EXPECTED OP","Default Output",UVM_LOW)
	  endcase
	end
    
    end
  
  endtask: run_phase
endclass: alu_scoreboard
