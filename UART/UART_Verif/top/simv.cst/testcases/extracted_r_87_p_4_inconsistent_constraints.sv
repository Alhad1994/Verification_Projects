class c_87_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_87_4;
    c_87_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00zx1xz01x0xx0xx10zzxz0110x1011zzzzzxzzxzzxzxzxxxxzzzxzxxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
