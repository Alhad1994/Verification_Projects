class c_42_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_42_4;
    c_42_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1zxx010zxx0xz0z1x1zxxz11zzzz1zxxxxxzxzxzxzzxzxzxzxzzxxxzzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
