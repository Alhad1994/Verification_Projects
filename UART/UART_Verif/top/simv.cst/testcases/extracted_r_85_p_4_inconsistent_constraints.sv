class c_85_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_85_4;
    c_85_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x10z000xz1x011x10z11110z0xx1zzxzxxzzxzzzxxzxxzxzxzxzxzxzzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
