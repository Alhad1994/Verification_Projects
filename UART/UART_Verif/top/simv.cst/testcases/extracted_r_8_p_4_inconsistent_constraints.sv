class c_8_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_8_4;
    c_8_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00z0zx1xzzzx1z1x0zzzz1x011zx1z1zxxzzzzzxxzzzxxzxxxxzxxzzxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
