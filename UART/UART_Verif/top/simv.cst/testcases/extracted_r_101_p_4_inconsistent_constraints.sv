class c_101_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_101_4;
    c_101_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xxz100z101z10z0xxzxxz10xz10z01zzxxzxxxzzzxzzxzzzxxxzxxxxzzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
