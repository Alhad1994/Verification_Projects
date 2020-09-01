class c_36_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_36_4;
    c_36_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1110xz0zxz010x0xzz0zzxz1zx1zzzxxxxxzxxzzzzxzzxxzzxxzzzzzxxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
