class c_28_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_28_4;
    c_28_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0z100x010z0z1z00x1x0xz00xzzz0xzzzxzxzxzxzzxzxxzxzxxxxxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
