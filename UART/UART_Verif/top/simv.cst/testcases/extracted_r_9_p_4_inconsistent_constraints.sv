class c_9_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_9_4;
    c_9_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz011011zxxxx00zx00xzx01xx1x11x0zxxxzzzzzzxzxzxzzxxzxzzzzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
