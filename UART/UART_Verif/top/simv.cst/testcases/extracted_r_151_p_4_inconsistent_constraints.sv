class c_151_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_151_4;
    c_151_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xzzxz0zz1x1z111xx11z1z0zz1zxz01zzxzzzzxxzzxzxzxxxxzzzxzxzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
