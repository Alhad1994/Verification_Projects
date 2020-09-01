class c_32_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_32_4;
    c_32_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x110x1x0z00z1z0zz01zzz0xx000xxxxzxzzxzzzxxzxxxzzzzxzxxzxzxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
