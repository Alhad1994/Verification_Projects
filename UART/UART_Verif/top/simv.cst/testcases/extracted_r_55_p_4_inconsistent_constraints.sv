class c_55_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_55_4;
    c_55_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01xx0110zzxxz1zx0zzzz1z0x11xxzz0xzxzzxzzzxxxzzzxzxxxxzxzxzxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
