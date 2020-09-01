class c_110_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_110_4;
    c_110_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xx10x1z1zzxxz11101zz0zx000xxx0zzzxzzzxzzzxxxxzzzzzxzzzzxzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
