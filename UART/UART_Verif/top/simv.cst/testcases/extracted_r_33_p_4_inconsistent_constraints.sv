class c_33_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_33_4;
    c_33_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1zx01zzz10x010zzz0xx111x1xz000xzzzxxzxzxzzxzzxzzzxzzxxxxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
