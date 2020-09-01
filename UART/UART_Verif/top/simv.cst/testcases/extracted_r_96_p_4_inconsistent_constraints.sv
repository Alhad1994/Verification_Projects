class c_96_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_96_4;
    c_96_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z1zzz1zx1zx0xxzz11x1x1z00zzxz1xxxxxzxzzzxzxzxxzzzxzxxxzxxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
