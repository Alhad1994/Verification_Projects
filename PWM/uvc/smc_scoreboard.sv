class reg_bank;
    bit [15:0] reg_arr [54:0]; 
endclass : reg_bank

class reg_sb extends uvm_scoreboard; 
    seq_item req,resp;
    int i;
    `uvm_component_utils(reg_sb)
    uvm_tlm_analysis_fifo #(seq_item) s_inp;
    uvm_tlm_analysis_fifo #(seq_item) s_res;
    reg_bank regs;
    bit exp_int; 
    bit [15:0] expected_op,actual_op;

    function new(string name="reg_sb", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("REG_SB","This is Build Phase - reg scoreboard", UVM_LOW)
        regs = new();
        uvm_config_db #(reg_bank)::set(null, "*", "regs" , regs);
        s_inp=new("s_inp",this); 
        s_res=new("s_res",this); 
    endfunction 
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("REG_SB","This is Connect Phase - reg scoreboard", UVM_LOW)
        uvm_config_db #(bit)::get(null, "*", "exp_int" , exp_int);
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        #10 
        `uvm_info("REG_SB","This is Run Phase - reg scoreboard", UVM_LOW)
        forever begin
            s_inp.get(req);
            if(req.wr_en==1) begin
            case (req.qaddr)
	      7'h00: expected_op = {5'b0,req.qdatain[10:0]}; // 
	      7'h02: expected_op = {8'b0,req.qdatain[7],6'b0,req.qdatain[0]}; // 
	      7'h03: expected_op = {9'b0,req.qdatain[6:4],1'b0,req.qdatain[2],1'b0,req.qdatain[0]}; // 
	      7'h10: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h11: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h12: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h13: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h14: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h15: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h16: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h17: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h18: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h19: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h1A: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h1B: expected_op = {8'b0,req.qdatain[7:4],2'b0,req.qdatain[1:0]}; // 
	      7'h20: expected_op = {req.qdatain}; // 
	      7'h22: expected_op = {req.qdatain}; // 
	      7'h26: expected_op = {req.qdatain}; // 
	      7'h24: expected_op = {req.qdatain}; // 
	      7'h28: expected_op = {req.qdatain}; // 
	      7'h2E: expected_op = {req.qdatain}; // 
	      7'h2C: expected_op = {req.qdatain}; // 
	      7'h32: expected_op = {req.qdatain}; // 
	      7'h30: expected_op = {req.qdatain}; // 
	      7'h36: expected_op = {req.qdatain}; // 
	      7'h34: expected_op = {req.qdatain}; //
            default: expected_op = {req.qdatain}; //
            endcase
            regs.reg_arr[req.qaddr]=expected_op;
	    `uvm_info("REG_SB",$sformatf("qaddr=%h, expected_op=%h reg_bank: %h",req.qaddr,expected_op,regs.reg_arr[req.qaddr]),UVM_HIGH)
            end else begin
              s_res.get(resp);
              // If timer counter overflows, expect an interrupt
              if(exp_int)
                regs.reg_arr[7'h3][0]=1;
              else
                regs.reg_arr[7'h3][0]=0;
              expected_op=regs.reg_arr[req.qaddr];
	      actual_op = {resp.qdataout}; 
	      if(expected_op == actual_op) begin
		`uvm_info("REG_SB",$sformatf("qaddr=%h, expected_op=%h, actual_op =%h",req.qaddr,expected_op,actual_op),UVM_LOW)
	      end else begin
		`uvm_error("REG_SB", $sformatf("qaddr=%h, expected_op=%h, actual_op =%h",req.qaddr,expected_op,actual_op))
	      end          
            end
        end
    endtask : run_phase

endclass: reg_sb


class per_sb extends uvm_scoreboard; 
    seq_item resp;
    int i;
    bit [1:0] [11:0] init_pm;
    bit [1:0] [11:0] init_nm;
    bit [1:0] [11:0] init_pp;
    bit [1:0] [11:0] init_np;
    bit sb_en, dith, recirc, err;
    bit [11:0] mnm_prev,mnm,pos_m,neg_m; 
    bit [11:0] mnp_prev,mnp,pos_p,neg_p; 
    bit [63:0] [11:0] pos_dm;
    bit [63:0] [11:0] neg_dm;
    bit [63:0] [11:0] pos_dp;
    bit [63:0] [11:0] neg_dp;
    bit [63:0] al_cnt [11:0];
    bit [63:0] ap_cnt [11:0];
    bit [31:0] per, per_prev, actual_per;
    bit [31:0] sc_per,exp_per;
    bit [31:0] actual_duty,exp_duty;
    bit [3:0] scale;
    bit [1:0] align [11:0]; 
    bit sign [11:0]; 
    bit [1:0] out_mode [11:0]; 
    bit [1:0] out_delay [11:0]; 
    bit [10:0] duty [11:0]; 
    bit duty_m [11:0]; 
    bit [11:0] al; 
    bit [11:0] ap;
    bit exp_int, int_en; 
    `uvm_component_utils(per_sb)
    uvm_tlm_analysis_fifo #(seq_item) p_edge;
    uvm_tlm_analysis_fifo #(seq_item) n_edge;
    reg_bank regs;

    function new(string name="per_sb", uvm_component parent=null);
        super.new(name, parent);
        mnm_prev=0;
        init_pm='{default:'0};
        init_nm='{default:'0};
        init_pp='{default:'0};
        init_np='{default:'0};
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("PER_SB","This is Build Phase - per scoreboard", UVM_LOW)
        p_edge=new("p_edge",this); 
        uvm_config_db #(bit)::set(null, "*", "exp_int" , exp_int);
        if (!uvm_config_db #(bit)::get(null, "*",
            "sb_en", this.sb_en)) begin
            sb_en=1;
        end else begin
            sb_en=0;
        end 
    endfunction 
 
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("PER_SB","This is Connect Phase - PER scoreboard", UVM_LOW)
        if (!uvm_config_db #(reg_bank)::get(null, "*",
            "regs", this.regs)) begin
            `uvm_error("connect", "Need registers handle for scoreboard")
        end 
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        #10 
        `uvm_info("PER_SB","This is Run Phase - PER scoreboard", UVM_LOW)
        if(sb_en) begin
          forever begin
              p_edge.get(resp);
              // Detect changes
              exp_int=0;
              mnm=resp.mnm^mnm_prev;
              mnp=resp.mnp^mnp_prev;
              // Filter out the posedges and negedges
              pos_m=mnm&resp.mnm;
              neg_m=mnm&(~resp.mnm);
              pos_p=mnp&resp.mnp;
              neg_p=mnp&(~resp.mnp);
              // Loop through the previous entries. If it is the first time
              // then add the entry and do no checks. If the period count is
              // not what is expected, raise and error. 
              if(per!=regs.reg_arr[0]) begin
                per=regs.reg_arr[0];
                init_pm='{default:'0};
                init_nm='{default:'0};
                init_pp='{default:'0};
                init_np='{default:'0};
              end
              scale=2**regs.reg_arr[7'h3][6:5];
              recirc=regs.reg_arr[7'h2][7];
              dith=regs.reg_arr[7'h3][2];
              int_en=regs.reg_arr[7'h2][0];
              // Scaled period = programmed period * pre_scaler
              sc_per=per*scale;
              foreach (pos_dm[i]) begin
                // Get per channel registers info
                out_delay[i]=regs.reg_arr[7'h10+(4*(i/4))+(3-i%4)][1:0];
                align[i]=regs.reg_arr[7'h10+(4*(i/4))+(3-i%4)][5:4];
                out_mode[i]=regs.reg_arr[7'h10+(4*(i/4))+(3-i%4)][7:6];
                duty[i]= regs.reg_arr[7'h20+(4*(i/2))+(2-2*(i%2))][10:0];
                sign[i]= regs.reg_arr[7'h20+(4*(i/2))+(2-2*(i%2))][15];
                // If the alignment is center aligned, edges happen
                // 2 periods apart. Can disable channel from alignment so
                // if a channel is disabled period is 0
                
                // For left aligned channels all negedges will happen together
                // accounted for delay. For right aligned channels all
                // posedges will happen together at period counter overflow.
                // For center aligned channels it is not necessary that any
                // edge happens concurrently.
                if(align[i]==2 && (pos_m[i]|| pos_p[i])) begin 
                    al[i]=1;
                    exp_int=int_en;
                end else if (align[i]==1 && (neg_m[i] || neg_p[i])) begin
                    ap[i]=1;
                    exp_int=int_en;
                end else if (align[i]==1 && (pos_m[i]|| pos_p[i])) begin
                    ap[i]=0;
                    exp_int=0;
                end else if (align[i]==2 && (neg_m[i] || neg_p[i])) begin
                    al[i]=0;
                    exp_int=0;
                end

                if(align[i]==1) begin
                  ap_cnt[i]=resp.cnt-out_delay[i];
                end else if (align[i]==2) begin
                  al_cnt[i]=resp.cnt-out_delay[i];
                end
                err=0;
                if(al==0 && ap==0 && (init_pp[i]>2)) begin
                  foreach(ap_cnt[i]) begin
                    if(ap_cnt[i]!=ap_cnt[0] || al_cnt[i]!=al_cnt[0])  begin
                      err=1;
                    end
                  end
                end
                if(err) begin
		  `uvm_error("PER_SB", $sformatf("All edges didn't happen where expected as per alignment accounting for delay al_cnt:%h ap_cnt=%h align:%d channel: %d",al_cnt[0],ap_cnt[0],align[i],i))
                end
                exp_per=sc_per;
                if(out_mode[i] == 1 && (pos_m[i] || neg_m[i]) && init_pp[i] > 2) begin
		      `uvm_error("PER_SB", $sformatf("Output is expected on MNP, not expecting MNM edge on channel : %d pos: %d neg: %d",i, pos_dm[i],neg_dm[i]))
                end
                if(out_mode[i] == 0 && (pos_p[i] || neg_p[i]) && init_pp[i] > 2) begin
		      `uvm_error("PER_SB", $sformatf("Output is expected on MNM, not expecting MNP edge on channel : %d pos: %d neg: %d",i, pos_dp[i],neg_dp[i]))
                end
                err=0;
                if(out_mode[i] > 1) begin
                  if(recirc) begin 
                    duty_m[i]=1;
                  end
                  if(recirc^sign[i]) begin
                    err=(init_pp[i] > 2)?(pos_m[i] || neg_m[i]):0;
                  end else begin
                    err=(init_pm[i] > 2)?(pos_p[i] || neg_p[i]):0 ;
                  end
                  if(err) begin 
		      `uvm_error("PER_SB", $sformatf("Unexpected output in Full H Bridge mode : %d pos: %b %b neg: %b %b, recir=%b, sign=%b",i, pos_m[i],pos_p[i],neg_m[i],neg_p[i],recirc,sign[i]))
                  end
                end
                if(align[i]==3) begin 
                  exp_per=2*sc_per;
                end else if (align[i]==0) begin
                  exp_per=0;
                end 
                err=0;
                if(exp_per==0 || duty[i]==0) begin
                  err=(init_pp[i] > 2)?((out_mode[i]==0)?(recirc^resp.mnm[i]):((out_mode[i]==1)?(recirc^resp.mnp[i]):0)):0; 
                end
                if(err) begin 
		  `uvm_error("PER_SB", $sformatf("Output not driven as per recirc : %d out_mode: %d output: %b %b channel: exp_per:%h duty=%h",recirc, out_mode[i],mnp[i],mnp[i], exp_per, duty[i]))
                end
                if(pos_m[i] == 1) begin
                  `uvm_info("PER_SB",$sformatf("m1 %h pos %h",i,pos_m), UVM_LOW)
                    
                  if(init_pm[i]<2) begin
                    pos_dm[i]=resp.cnt;
                    init_pm[i]=init_pm[i]+1;
                  end else begin
                  `uvm_info("PER_SB",$sformatf("m11 %h pos %h",i,pos_m), UVM_LOW)
                    actual_per=resp.cnt-pos_dm[i];
                    if(duty_m[i]==1) begin
                      exp_duty=duty[i]*scale;
                    end else begin
                      exp_duty=exp_per-(duty[i]*scale);
                    end
                    if (actual_per != exp_per) begin       
		      `uvm_error("PER_SB", $sformatf("Posedge period! actual=%h, expected=%h, channel =%h align=%h per=%h scale=%h, cnt_now=%h cnt_prev=%h",actual_per,exp_per,i, align[i], per, scale, resp.cnt, pos_dm[i]))
                    end else begin
                      `uvm_info("PER_SB",$sformatf("Posedge period looks ok! actual=%h, expected=%h, channel =%h",actual_per,exp_per,i), UVM_HIGH)
                    end
                    actual_duty=resp.cnt-neg_dm[i];
                    if (actual_duty != exp_duty) begin       
		      `uvm_error("PER_SB", $sformatf("Posedge duty! actual=%h, expected=%h, channel =%0h scale=%h",actual_duty,exp_duty,i,scale))
                    end else begin
                      `uvm_info("PER_SB","Duty cycle check looks ok for high time!", UVM_HIGH)
                    end
                    pos_dm[i]=resp.cnt;
                  end
                end
                // Replicate logic for mnp
                if(pos_p[i] == 1) begin
                  if(init_pp[i]<2) begin
                    pos_dp[i]=resp.cnt;
                    init_pp[i]=init_pp[i]+1;
                  end else begin
                    actual_per=resp.cnt-pos_dp[i];
                    if(duty_m[i]==1)  begin
                      exp_duty=duty[i]*scale;
                    end else begin
                      exp_duty=exp_per-(duty[i]*scale);
                    end
                    if (actual_per != exp_per) begin       
		      `uvm_error("PER_SB", $sformatf("Posedge period! actual=%h, expected=%h, channel =%h align=%h per=%h scale=%h, cnt_now=%h cnt_prev=%h",actual_per,exp_per,i, align[i], per, scale, resp.cnt, pos_dp[i]))
                    end else begin
                      `uvm_info("PER_SB",$sformatf("Posedge period looks ok! actual=%h, expected=%h, channel =%h",actual_per,exp_per,i), UVM_HIGH)
                    end
                    actual_duty=resp.cnt-neg_dp[i];
                    if (actual_duty != exp_duty) begin       
		      `uvm_error("PER_SB", $sformatf("Posedge duty! actual=%h, expected=%h, channel =%0h scale=%h",actual_duty,exp_duty,i,scale))
                    end else begin
                      `uvm_info("PER_SB","Duty cycle check looks ok for high time!", UVM_HIGH)
                    end
                    pos_dp[i]=resp.cnt;
                  end
                end
                // Check negedges - replicate the posedge logic
                if(neg_m[i] == 1) begin
                  if(init_nm[i]<2) begin
                    neg_dm[i]=resp.cnt;
                    init_nm[i]=init_nm[i]+1;
                  end else begin
                    actual_per=resp.cnt-neg_dm[i];
                    if(duty_m[i]==0) begin
                      exp_duty=duty[i]*scale;
                    end else begin
                      exp_duty=exp_per-(duty[i]*scale);
                    end
                    if (actual_per != exp_per) begin       
		      `uvm_error("PER_SB", $sformatf("Negedge period! actual=%h, expected=%h, channel =%0h align=%h per=%h scale=%h",actual_per,exp_per,i, align[i], per, scale))
                    end else begin
                      `uvm_info("PER_SB","Period check looks ok!", UVM_HIGH)
                    end
                    actual_duty=resp.cnt-pos_dm[i];
                    if (actual_duty != exp_duty) begin       
		      `uvm_error("PER_SB", $sformatf("Negedge duty! actual=%h, expected=%h, channel =%0h scale=%h",actual_duty,exp_duty,i,scale))
                    end else begin
                      `uvm_info("PER_SB","Duty cycle check looks ok for low time!", UVM_HIGH)
                    end
                    neg_dm[i]=resp.cnt;
                  end
                end
                
                // Replicate logic for mnp
                if(neg_p[i] == 1) begin
                  if(init_np[i]<2) begin
                    neg_dp[i]=resp.cnt;
                    init_np[i]=init_np[i]+1;
                  end else begin
                    actual_per=resp.cnt-neg_dp[i];
                    if(duty_m[i]==0) begin
                      exp_duty=duty[i]*scale;
                    end else begin
                      exp_duty=exp_per-(duty[i]*scale);
                    end
                    if (actual_per != exp_per) begin       
		      `uvm_error("PER_SB", $sformatf("Negedge period! actual=%h, expected=%h, channel =%0h align=%h per=%h scale=%h",actual_per,exp_per,i, align[i], per, scale))
                    end else begin
                      `uvm_info("PER_SB","Period check looks ok!", UVM_HIGH)
                    end
                    actual_duty=resp.cnt-pos_dp[i];
                    if (actual_duty != exp_duty) begin       
		      `uvm_error("PER_SB", $sformatf("Negedge duty! actual=%h, expected=%h, channel =%0h scale=%h",actual_duty,exp_duty,i,scale))
                    end else begin
                      `uvm_info("PER_SB","Duty cycle check looks ok for low time!", UVM_HIGH)
                    end
                    neg_dp[i]=resp.cnt;
                  end
                end 
                //Store the current mnm/mnp state
                mnm_prev=resp.mnm;
                mnp_prev=resp.mnp;
              end
          end
        end else begin
            `uvm_info("PER_SB","Scoreboard disabled!", UVM_LOW)
        end
    endtask : run_phase

endclass: per_sb
