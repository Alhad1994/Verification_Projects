class c_165_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_165_4;
    c_165_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z1011z1z1x11zz0z1z11zzx0xz000x0xzzzxzzxzxzxzzxzxxzzxzxxxxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
