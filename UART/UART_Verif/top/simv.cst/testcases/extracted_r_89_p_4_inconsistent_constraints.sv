class c_89_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_89_4;
    c_89_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzz11x0x001xz0zzx10z11zzz1xx01xxzzzxxzxzzxxzzxxxxzzzxzzxxzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
