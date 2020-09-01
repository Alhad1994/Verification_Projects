//There is no connection with seq_item just passing the parameter with seq...
class alu_sequence extends uvm_sequence#(alu_tr); // Passing parameter as seq_item
     
     `uvm_object_utils(alu_sequence) //UVM_factory register
 
 
 //constructor
     function new(string name = "alu_sequence",uvm_component parent = null);
          super.new(name);
     endfunction: new
     

 // main_body
     task body();
     
     //step 1: creation
	  alu_tr alu_it;//declaration handle
   
	  alu_it = alu_tr::type_id::create("alu_it");//factory method 
          
         	`uvm_info (get_type_name (), $sformatf ("Sequence %s is starting", this.get_name()), UVM_MEDIUM)
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b00;alu_it.stopin==1'b0;alu_it.pushin==1'b1;});//will return the assertion error on randomization failure
		alu_it.rst=1;
		finish_item(alu_it);
		
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b01;alu_it.stopin==1'b0;alu_it.pushin==1'b1;});
		alu_it.rst=0;
		finish_item(alu_it);
		
		repeat(2000) begin	
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b00;alu_it.stopin==1'b0;alu_it.pushin==1'b1;});
		finish_item(alu_it);
		end
	
		repeat(2000) begin	
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b01;alu_it.stopin==1'b0;alu_it.pushin==1'b1;});
		finish_item(alu_it);
		end
	
		repeat(2000) begin	
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b10;alu_it.stopin==1'b0;alu_it.pushin==1'b1;});
		finish_item(alu_it);
		end
		
		repeat(2000) begin	
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b11;alu_it.stopin==1'b0;alu_it.pushin==1'b1;});
		finish_item(alu_it);
		end
	
		repeat(2000) begin	
		start_item(alu_it);
		assert(alu_it.randomize() with {alu_it.ctl==2'b11;alu_it.stopin==1'b0;alu_it.pushin==1'b0;});
		finish_item(alu_it);
		end
          `uvm_info (get_type_name (), $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
     endtask: body
endclass: alu_sequence
