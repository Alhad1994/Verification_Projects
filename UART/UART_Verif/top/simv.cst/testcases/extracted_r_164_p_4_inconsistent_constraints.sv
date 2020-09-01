class c_164_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_164_4;
    c_164_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx01zxxxzxz1xx0xxz110x011zzxx11zxxzzxzzzxzxxxxzzzxzxzxzxzzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
