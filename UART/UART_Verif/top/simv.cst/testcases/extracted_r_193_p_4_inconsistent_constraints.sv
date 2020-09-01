class c_193_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_193_4;
    c_193_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxx0xxxzz0x10zx01x010zzxxz10zz10xzzzxzzzxzzxzxzzxzxzxzxzxxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
