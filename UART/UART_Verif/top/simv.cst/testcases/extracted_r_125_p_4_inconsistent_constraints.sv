class c_125_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_125_4;
    c_125_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzxxx0x1zzz1101x1zxz0zz11x0z00xxxxzzzxzzzxxzzxxzzxxxxxzxzxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
