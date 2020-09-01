class c_161_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_161_4;
    c_161_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz11x0x011zx1x10xz1zx10000010zzxzzzxzzxzzxxzxzxzxxxzxxzzxxzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
