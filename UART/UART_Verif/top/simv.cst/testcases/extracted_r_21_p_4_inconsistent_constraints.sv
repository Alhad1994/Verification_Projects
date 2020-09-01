class c_21_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_21_4;
    c_21_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz0x0x01xz10010zz1zx100x0z010zxxzxxxxzxxzzxxxxzxxxzxxzxxxzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
