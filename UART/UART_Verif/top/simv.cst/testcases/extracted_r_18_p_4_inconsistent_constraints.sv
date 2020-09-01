class c_18_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_18_4;
    c_18_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz1110x0x011xxz11zz0000110x1xx0xzxzzzxzxxxxxxzxxzzxzxzzxzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
