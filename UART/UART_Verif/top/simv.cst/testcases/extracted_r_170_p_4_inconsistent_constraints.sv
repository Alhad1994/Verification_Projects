class c_170_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_170_4;
    c_170_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z0000zx1100x1x1010xx0111xz010zzzzxxxxxxxzzxxxzxzzzzxxxzzxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
