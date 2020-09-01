class c_84_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_84_4;
    c_84_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011z011x00x11x00001xzxzz01xzxzxxxxzxxzzxxxzxxxxzzxzzxzzxxzzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
