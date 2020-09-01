class c_154_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_154_4;
    c_154_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "010zzz10101x101101x11x101100x1z1xxxxzxxzxzzxzxzxzzxxzzxxzxzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
