class c_81_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_81_4;
    c_81_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1zxx1z0xz0zxxz1zxzzzxxz1zx10z11xxxzzzzxzxxxzzxxzxxxxzzzxzzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
