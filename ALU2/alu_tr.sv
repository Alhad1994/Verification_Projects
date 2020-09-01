
 //seq_item
class alu_tr extends uvm_sequence_item;
     //Request data properties are rand
     rand bit[7:0] a; // 8 bit input for ALU
     rand bit[7:0] b; // 8 bit input for ALU
     rand bit pushin,stopin,ci;
     logic[7:0] z; // 8 bit output
     rand logic [1:0] ctl; // 2 bit control
     logic stopout,pushout,cout;
     //rand defs::opcode_enum opcode;
     bit rst;
     
     //Factory registration
     `uvm_object_utils(alu_tr)
 
 //constructor
     function new(string name = "alu_tr");
          super.new(name);
     endfunction: new
    
    //to display the output (printing)
     function string convert2string();
		return $sformatf(" a = %b b=%b pushin = %b stopin = %b ci= %b ctl=%h",a,b,pushin,stopin,ci,ctl);
	endfunction: convert2string 
 

endclass: alu_tr