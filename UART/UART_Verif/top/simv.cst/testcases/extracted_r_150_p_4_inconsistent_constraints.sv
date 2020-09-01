class c_150_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_150_4;
    c_150_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x000zxxzxz00x0zzz0xz10x00z1xx1x1zzzxxxxxxzxxxxzxxxzxzxxzzxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
