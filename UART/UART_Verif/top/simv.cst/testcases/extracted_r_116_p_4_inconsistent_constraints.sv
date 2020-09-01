class c_116_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_116_4;
    c_116_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00z001z11zx10101zz1z1z00zzz0000xxxxzxzzzxzxzxzzzxxxzxzzxxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
